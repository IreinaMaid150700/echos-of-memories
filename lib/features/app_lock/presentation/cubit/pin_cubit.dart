import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/security/biometric_service.dart';
import 'package:music_app/features/app_lock/app_lock_constants.dart';
import 'package:music_app/features/app_lock/domain/repositories/app_lock_repository.dart';
import 'package:music_app/features/app_lock/presentation/cubit/lock_session_cubit.dart';

part 'pin_state.dart';
part 'pin_cubit.freezed.dart';

/// The flow this cubit is currently driving. Set once via the *startX* methods.
enum PinFlow { setup, unlock, change, recovery }

/// Drives the PIN entry screens: setup, unlock, change, and recovery.
///
/// Created per-screen (`@injectable`, not a singleton) so each flow gets a
/// fresh state. Shares the singleton [LockSessionCubit] to flip the session
/// to unlocked on success.
@injectable
class PinCubit extends Cubit<PinState> {
  final AppLockRepository _repository;
  final BiometricService _biometricService;
  final LockSessionCubit _lockSession;

  PinFlow _flow = PinFlow.unlock;
  Timer? _lockoutTimer;

  PinCubit(
    this._repository,
    this._biometricService,
    this._lockSession,
  ) : super(const PinState());

  // ---------------------------------------------------------------------------
  // Flow entry points
  // ---------------------------------------------------------------------------

  void startSetup() {
    _flow = PinFlow.setup;
    emit(const PinState(stage: PinStage.enter));
  }

  Future<void> startUnlock() async {
    _flow = PinFlow.unlock;
    emit(const PinState(stage: PinStage.verify));
    await _syncLockout();
  }

  void startChange() {
    _flow = PinFlow.change;
    emit(const PinState(stage: PinStage.verify));
  }

  void startRecovery() {
    _flow = PinFlow.recovery;
    // Recovery starts by entering the recovery code (input holds the code).
    emit(const PinState(stage: PinStage.verify));
  }

  // ---------------------------------------------------------------------------
  // Keypad input
  // ---------------------------------------------------------------------------

  void addDigit(String digit) {
    if (state.busy || state.isLockedOut) return;
    final max = _flow == PinFlow.recovery && state.stage == PinStage.verify
        ? 32
        : kPinLength;
    if (state.input.length >= max) return;
    final next = state.input + digit;
    emit(state.copyWith(input: next, error: null));
    if (_flow == PinFlow.recovery && state.stage == PinStage.verify) return;
    if (next.length == kPinLength) {
      unawaited(_onPinComplete());
    }
  }

  void backspace() {
    if (state.input.isEmpty) return;
    emit(
      state.copyWith(
        input: state.input.substring(0, state.input.length - 1),
        error: null,
      ),
    );
  }

  /// Sets the raw recovery-code text (used by the free-text recovery field).
  void setRecoveryInput(String value) {
    if (state.busy) return;
    emit(state.copyWith(input: value, error: null));
  }

  // ---------------------------------------------------------------------------
  // Recovery-code submission (manual submit, variable length)
  // ---------------------------------------------------------------------------

  Future<void> submitRecoveryCode() async {
    if (state.busy) return;
    emit(state.copyWith(busy: true, error: null));
    final ok = await _repository.verifyRecoveryCode(state.input);
    if (!ok) {
      emit(
        state.copyWith(
          busy: false,
          input: '',
          error: 'Mã khôi phục không đúng',
        ),
      );
      return;
    }
    // Move on to set a new PIN.
    emit(const PinState(stage: PinStage.enter));
  }

  // ---------------------------------------------------------------------------
  // Biometric
  // ---------------------------------------------------------------------------

  /// Attempts biometric unlock. Silently no-ops (falls back to PIN) on failure
  /// or unavailability. Only meaningful in the unlock flow.
  Future<bool> tryBiometric() async {
    if (_flow != PinFlow.unlock) return false;
    if (state.isLockedOut) return false;
    if (!await _biometricService.isAvailable()) return false;
    final ok = await _biometricService.authenticate();
    if (ok) {
      await _repository.resetAttempts();
      _lockSession.unlock();
    }
    return ok;
  }

  // ---------------------------------------------------------------------------
  // Internal: 6-digit PIN completion handling per flow/stage
  // ---------------------------------------------------------------------------

  Future<void> _onPinComplete() async {
    final pin = state.input;
    switch (_flow) {
      case PinFlow.setup:
        _handleNewPinEntry(pin);
        break;
      case PinFlow.recovery:
        // After recovery-code verified we reuse setup-style enter/confirm.
        _handleNewPinEntry(pin);
        break;
      case PinFlow.change:
        if (state.stage == PinStage.verify) {
          await _verifyOldPin(pin);
        } else {
          _handleNewPinEntry(pin);
        }
        break;
      case PinFlow.unlock:
        await _verifyUnlockPin(pin);
        break;
    }
  }

  void _handleNewPinEntry(String pin) {
    if (state.stage == PinStage.enter) {
      emit(
        state.copyWith(
          stage: PinStage.confirm,
          firstEntry: pin,
          input: '',
          error: null,
        ),
      );
    } else if (state.stage == PinStage.confirm) {
      if (pin != state.firstEntry) {
        emit(
          state.copyWith(
            stage: PinStage.enter,
            input: '',
            firstEntry: '',
            error: 'PIN không khớp, thử lại',
          ),
        );
        return;
      }
      unawaited(_persistNewPin(pin));
    }
  }

  Future<void> _persistNewPin(String pin) async {
    emit(state.copyWith(busy: true));
    await _repository.setPin(pin);
    await _repository.resetAttempts();

    String? recovery;
    // Generate a recovery code only on first-time setup (none exists yet).
    if (!await _repository.hasRecoveryCode()) {
      recovery = await _repository.generateRecoveryCode();
    }
    _lockSession.unlock();
    emit(
      PinState(
        stage: PinStage.done,
        recoveryCode: recovery,
      ),
    );
  }

  Future<void> _verifyOldPin(String pin) async {
    emit(state.copyWith(busy: true));
    final ok = await _repository.verifyPin(pin);
    if (ok) {
      emit(const PinState(stage: PinStage.enter));
    } else {
      emit(
        state.copyWith(busy: false, input: '', error: 'PIN không đúng'),
      );
    }
  }

  Future<void> _verifyUnlockPin(String pin) async {
    final lockout = await _repository.getLockoutState();
    if (lockout.isLockedOut) {
      emit(state.copyWith(input: '', lockoutRemaining: lockout.remaining));
      _startLockoutTimer();
      return;
    }

    emit(state.copyWith(busy: true));
    final ok = await _repository.verifyPin(pin);
    if (ok) {
      await _repository.resetAttempts();
      _lockSession.unlock();
      emit(state.copyWith(busy: false, stage: PinStage.done));
      return;
    }

    final updated = await _repository.recordFailedAttempt();
    emit(
      state.copyWith(
        busy: false,
        input: '',
        error: 'PIN không đúng',
        lockoutRemaining: updated.remaining,
      ),
    );
    if (updated.isLockedOut) _startLockoutTimer();
  }

  // ---------------------------------------------------------------------------
  // Lockout countdown
  // ---------------------------------------------------------------------------

  Future<void> _syncLockout() async {
    final lockout = await _repository.getLockoutState();
    if (lockout.isLockedOut) {
      emit(state.copyWith(lockoutRemaining: lockout.remaining));
      _startLockoutTimer();
    }
  }

  void _startLockoutTimer() {
    _lockoutTimer?.cancel();
    _lockoutTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      final next = state.lockoutRemaining - const Duration(seconds: 1);
      if (next <= Duration.zero) {
        t.cancel();
        emit(state.copyWith(lockoutRemaining: Duration.zero, error: null));
      } else {
        emit(state.copyWith(lockoutRemaining: next));
      }
    });
  }

  @override
  Future<void> close() {
    _lockoutTimer?.cancel();
    return super.close();
  }
}

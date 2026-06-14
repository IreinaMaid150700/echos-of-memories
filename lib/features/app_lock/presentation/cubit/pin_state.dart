part of 'pin_cubit.dart';

/// Which step of a multi-step PIN flow the user is on.
enum PinStage {
  /// Enter a brand-new PIN (setup / change-new / recovery-new).
  enter,

  /// Re-enter to confirm the new PIN.
  confirm,

  /// Verify an existing PIN (unlock / change-old).
  verify,

  /// New PIN accepted and persisted; recovery code (if any) ready to show.
  done,
}

@freezed
abstract class PinState with _$PinState {
  const factory PinState({
    @Default(PinStage.enter) PinStage stage,

    /// Current digits typed for the active field.
    @Default('') String input,

    /// First entry captured while waiting for confirmation.
    @Default('') String firstEntry,

    /// User-facing error message (wrong PIN, mismatch, lockout, ...).
    String? error,

    /// Remaining lockout time; counts down via [PinCubit.refreshLockout].
    @Default(Duration.zero) Duration lockoutRemaining,

    /// Recovery code to display once after a successful setup.
    String? recoveryCode,

    /// True while an async verify/set is in flight.
    @Default(false) bool busy,
  }) = _PinState;

  const PinState._();

  bool get isLockedOut => lockoutRemaining > Duration.zero;
}

import 'package:music_app/features/app_lock/domain/models/lockout_state.dart';

/// Manages the App Lock secret material (PIN + recovery code) and the
/// escalating-lockout bookkeeping. Implementations store only salted hashes.
abstract class AppLockRepository {
  /// Whether a PIN has been set up.
  Future<bool> hasPin();

  /// Hashes and persists [pin]. Overwrites any existing PIN.
  Future<void> setPin(String pin);

  /// Constant-time compare of [pin] against the stored hash.
  Future<bool> verifyPin(String pin);

  /// Generates a new random recovery code, stores only its hash, and returns
  /// the plaintext ONCE (caller must show it to the user, never persisted).
  Future<String> generateRecoveryCode();

  /// Whether a recovery code has been set up.
  Future<bool> hasRecoveryCode();

  /// Constant-time compare of [code] against the stored recovery hash.
  Future<bool> verifyRecoveryCode(String code);

  /// Current lockout snapshot (fail count + remaining wait).
  Future<LockoutState> getLockoutState();

  /// Records a failed attempt and applies escalating lockout when past the
  /// threshold. Returns the updated lockout state.
  Future<LockoutState> recordFailedAttempt();

  /// Clears the failed-attempt counter and any active lockout.
  Future<void> resetAttempts();

  /// Wipes all App Lock secrets (PIN, recovery, counters).
  Future<void> clearLock();
}

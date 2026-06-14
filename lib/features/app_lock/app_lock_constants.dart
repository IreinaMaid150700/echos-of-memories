/// Shared constants for the App Lock feature.
library;

/// Number of digits in the PIN.
const int kPinLength = 6;

/// After this many consecutive failed attempts, escalating lockout begins.
const int kMaxAttemptsBeforeLockout = 5;

/// Base lockout duration applied at the first lockout. Doubles on each further
/// failed attempt while already past the threshold.
const Duration kBaseLockoutDuration = Duration(seconds: 30);

/// Re-lock the app session when it has been in the background longer than this.
const Duration kAppLockBackgroundTimeout = Duration(seconds: 60);

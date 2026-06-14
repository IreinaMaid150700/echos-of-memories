/// Snapshot of the current escalating-lockout state.
class LockoutState {
  /// Number of consecutive failed attempts recorded so far.
  final int failCount;

  /// Remaining time the user must wait before they can try again.
  /// [Duration.zero] when not currently locked out.
  final Duration remaining;

  const LockoutState({required this.failCount, required this.remaining});

  bool get isLockedOut => remaining > Duration.zero;

  static const none = LockoutState(failCount: 0, remaining: Duration.zero);
}

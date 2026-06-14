part of 'lock_session_cubit.dart';

@freezed
abstract class LockSessionState with _$LockSessionState {
  const factory LockSessionState({
    @Default(false) bool isUnlocked,
  }) = _LockSessionState;
}

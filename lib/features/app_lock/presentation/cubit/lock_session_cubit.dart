import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'lock_session_state.dart';
part 'lock_session_cubit.freezed.dart';

/// Holds the in-memory unlock state for the whole app session.
///
/// "Unlock once = unlocked for the whole session" until [lock] is called
/// (e.g. by the lifecycle observer after the background timeout).
@lazySingleton
class LockSessionCubit extends Cubit<LockSessionState> {
  LockSessionCubit() : super(const LockSessionState());

  bool get isUnlocked => state.isUnlocked;

  void unlock() => emit(const LockSessionState(isUnlocked: true));

  void lock() => emit(const LockSessionState(isUnlocked: false));
}

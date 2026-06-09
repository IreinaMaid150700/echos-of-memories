import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/watch_moments_usecase.dart';

part 'timeline_state.dart';
part 'timeline_cubit.freezed.dart';

class TimelineCubit extends BaseCubit<TimelineState> {
  final WatchMomentsUseCase _watchMomentsUseCase;
  StreamSubscription<List<MomentEntity>>? _sub;

  TimelineCubit({required WatchMomentsUseCase watchMomentsUseCase})
      : _watchMomentsUseCase = watchMomentsUseCase,
        super(const TimelineState());

  void loadMoments() {
    _sub?.cancel();
    emit(state.copyWith(moments: state.moments.toLoading()));
    _sub = _watchMomentsUseCase().listen(
      (moments) => emit(state.copyWith(moments: state.moments.toSuccess(moments))),
      onError: (Object e) =>
          emit(state.copyWith(moments: state.moments.toFailure(e.toString()))),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/get_moments_usecase.dart';

part 'timeline_state.dart';
part 'timeline_cubit.freezed.dart';

class TimelineCubit extends BaseCubit<TimelineState> {
  final GetMomentsUseCase _getMomentsUseCase;

  TimelineCubit({required GetMomentsUseCase getMomentsUseCase})
      : _getMomentsUseCase = getMomentsUseCase,
        super(const TimelineState());

  Future<void> loadMoments() async {
    await execute(
      loadingState: state.copyWith(moments: state.moments.toLoading()),
      action: () => _getMomentsUseCase(),
      onSuccess: (moments) =>
          state.copyWith(moments: state.moments.toSuccess(moments)),
      onFailure: (f) =>
          state.copyWith(moments: state.moments.toFailure(f.message)),
    );
  }
}

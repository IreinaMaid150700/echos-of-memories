import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/moment/domain/models/moment_detail_entity.dart';
import 'package:music_app/features/moment/domain/usecases/delete_moment_usecase.dart';
import 'package:music_app/features/moment/domain/usecases/get_moment_by_id_usecase.dart';
import 'package:music_app/features/moment/domain/usecases/update_moment_flags_usecase.dart';

part 'moment_detail_state.dart';
part 'moment_detail_cubit.freezed.dart';

class MomentDetailCubit extends BaseCubit<MomentDetailState> {
  final GetMomentByIdUseCase _getMomentByIdUseCase;
  final DeleteMomentUseCase _deleteMomentUseCase;
  final UpdateMomentFlagsUseCase _updateMomentFlagsUseCase;

  MomentDetailCubit({
    required GetMomentByIdUseCase getMomentByIdUseCase,
    required DeleteMomentUseCase deleteMomentUseCase,
    required UpdateMomentFlagsUseCase updateMomentFlagsUseCase,
  }) : _getMomentByIdUseCase = getMomentByIdUseCase,
       _deleteMomentUseCase = deleteMomentUseCase,
       _updateMomentFlagsUseCase = updateMomentFlagsUseCase,
       super(const MomentDetailState());

  Future<void> loadMoment(String id) async {
    await execute(
      loadingState: state.copyWith(moment: state.moment.toLoading()),
      action: () => _getMomentByIdUseCase(id),
      onSuccess: (m) => state.copyWith(
        moment: state.moment.toSuccess(m),
        isEnablePinOnTop: m.isPinned,
        isHideFromWidget: m.isHiddenFromWidget,
      ),
      onFailure: (f) =>
          state.copyWith(moment: state.moment.toFailure(f.message)),
    );
  }

  Future<void> deleteMoment(String id) async {
    await execute(
      loadingState: state.copyWith(
        deleteAction: state.deleteAction.toLoading(),
      ),
      action: () => _deleteMomentUseCase(id),
      onSuccess: (_) =>
          state.copyWith(deleteAction: state.deleteAction.toSuccess(unit)),
      onFailure: (f) =>
          state.copyWith(deleteAction: state.deleteAction.toFailure(f.message)),
    );
  }

  void toggleDeleteConfirm() {
    emit(state.copyWith(showDeleteConfirm: !state.showDeleteConfirm));
  }

  void dismissDeleteConfirm() {
    emit(state.copyWith(showDeleteConfirm: false));
  }

  Future<void> togglePinOnTop(bool enablePinOnTop) async {
    final id = state.moment.data?.id;
    if (id == null) return;

    final previousValue = state.isEnablePinOnTop;
    emit(state.copyWith(isEnablePinOnTop: enablePinOnTop));

    final res = await _updateMomentFlagsUseCase(id, isPinned: enablePinOnTop);
    res.fold(
      (f) => emit(state.copyWith(isEnablePinOnTop: previousValue)),
      (_) {},
    );
  }

  Future<void> toggleHideFromWidget(bool isHideFromWidget) async {
    final id = state.moment.data?.id;
    if (id == null) return;

    final previousValue = state.isHideFromWidget;
    emit(state.copyWith(isHideFromWidget: isHideFromWidget));

    final res = await _updateMomentFlagsUseCase(
      id,
      isHiddenFromWidget: isHideFromWidget,
    );
    res.fold(
      (f) => emit(state.copyWith(isHideFromWidget: previousValue)),
      (_) {},
    );
  }
}

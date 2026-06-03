part of 'moment_detail_cubit.dart';

@freezed
abstract class MomentDetailState with _$MomentDetailState {
  const factory MomentDetailState({
    @Default(false) bool showDeleteConfirm,
    @Default(false) bool isEnablePinOnTop,
    @Default(false) bool isHideFromWidget,
    @Default(Loaded<MomentEntity>()) Loaded<MomentEntity> moment,
    @Default(Loaded<Unit>()) Loaded<Unit> deleteAction,
  }) = _MomentDetailState;
}

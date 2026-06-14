part of 'moment_detail_cubit.dart';

@freezed
abstract class MomentDetailState with _$MomentDetailState {
  const factory MomentDetailState({
    @Default(false) bool showDeleteConfirm,
    @Default(false) bool isEnablePinOnTop,
    @Default(false) bool isHideFromWidget,
    @Default(Loaded<MomentDetailEntity>()) Loaded<MomentDetailEntity> moment,
    @Default(Loaded<Unit>()) Loaded<Unit> deleteAction,
  }) = _MomentDetailState;
}

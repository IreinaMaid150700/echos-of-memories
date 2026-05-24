part of 'moment_detail_cubit.dart';

@freezed
abstract class MomentDetailState with _$MomentDetailState {
  const factory MomentDetailState({
    @Default(false) bool showDeleteConfirm,
    @Default(false) bool isEnableFavourite,
    @Default(false) bool isEnablePinOnTop,
    @Default(false) bool isHideFromWidget,
  }) = _MomentDetailState;
}

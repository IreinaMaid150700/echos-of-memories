import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';

part 'moment_detail_state.dart';
part 'moment_detail_cubit.freezed.dart';

class MomentDetailCubit extends BaseCubit<MomentDetailState> {
  MomentDetailCubit() : super(const MomentDetailState());

  void toggleDeleteConfirm() {
    emit(state.copyWith(showDeleteConfirm: !state.showDeleteConfirm));
  }

  void dismissDeleteConfirm() {
    emit(state.copyWith(showDeleteConfirm: false));
  }

  void togglePinOnTop(bool enablePinOnTop) {
    emit(state.copyWith(isEnablePinOnTop: enablePinOnTop));
  }

  void toggleHideFromWidget(bool isHideFromWidget) {
    emit(state.copyWith(isHideFromWidget: isHideFromWidget));
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/features/create_collection/domain/enum/collection_cover.dart';

part 'create_collection_state.dart';
part 'create_collection_cubit.freezed.dart';

class CreateCollectionCubit extends BaseCubit<CreateCollectionState> {
  CreateCollectionCubit() : super(const CreateCollectionState());

  void onChangeTitle(String value) {
    emit(state.copyWith(title: value));
  }

  void onChangeDescription(String value) {
    emit(state.copyWith(description: value));
  }

  void selectCover(CollectionCover cover) {
    if (cover != state.cover) {
      emit(state.copyWith(cover: cover));
    }
  }

  /// Toggle cảm xúc chủ đạo. Chọn lại cái đang chọn sẽ bỏ chọn (-1).
  void toggleMood(int index) {
    emit(state.copyWith(moodIndex: state.moodIndex == index ? -1 : index));
  }

  void togglePrivate(bool value) {
    if (value != state.isPrivate) {
      emit(state.copyWith(isPrivate: value));
    }
  }

  void togglePinned(bool value) {
    if (value != state.isPinned) {
      emit(state.copyWith(isPinned: value));
    }
  }
}

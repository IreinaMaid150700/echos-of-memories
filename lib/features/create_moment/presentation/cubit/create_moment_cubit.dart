import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/features/create_moment/domain/enum/create_moment_direct_enum.dart';
import 'package:image_picker/image_picker.dart';
part 'create_moment_state.dart';
part 'create_moment_cubit.freezed.dart';

class CreateMomentCubit extends BaseCubit<CreateMomentState> {
  CreateMomentCubit() : super(const CreateMomentState());

  void onChangeNote(String? value) {
    emit(state.copyWith(note: value));
  }

  void toggleLockedMoment(bool value) {
    if (value != state.isLockMoment) {
      emit(state.copyWith(isLockMoment: value));
    }
  }

  Future<void> openImagePicker() async {
    final picker = ImagePicker();
    try {
      final List<XFile> pickedFileList = await picker.pickMultiImage();

      if (pickedFileList.isNotEmpty) {
        emit(
          state.copyWith(
            imagePicker: pickedFileList.map((e) => File(e.path)).toList(),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          createMomentDirectEnum:
              CreateMomentDirectEnum.showDialogErrorWhenPicker,
        ),
      );
    }
    // final LostDataResponse response = await picker.retrieveLostData();
    // if (response.isEmpty) {
    //   return;
    // }
    // final List<XFile>? files = response.files;
    // if (files != null) {
    //   _handleLostFiles(files);
    // } else {
    //   _handleError(response.exception);
    // }
  }

  Future<void> selectedLocation() async {
    emit(
      state.copyWith(
        createMomentDirectEnum: CreateMomentDirectEnum.showDialogDevelopment,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> selectedDate() async {
    emit(
      state.copyWith(
        createMomentDirectEnum: CreateMomentDirectEnum.showDialogDevelopment,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> addCollections() async {
    emit(
      state.copyWith(
        createMomentDirectEnum: CreateMomentDirectEnum.showDialogDevelopment,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}

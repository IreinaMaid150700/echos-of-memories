import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/create_moment/domain/enum/create_moment_direct_enum.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/create_moment_usecase.dart';
import 'package:image_picker/image_picker.dart';
part 'create_moment_state.dart';
part 'create_moment_cubit.freezed.dart';

class CreateMomentCubit extends BaseCubit<CreateMomentState> {
  final GetTagsUseCase _getTagsUseCase;
  final CreateMomentUseCase _createMomentUseCase;
  final ImagePicker _imagePicker;

  CreateMomentCubit({
    required GetTagsUseCase getTagsUseCase,
    required CreateMomentUseCase createMomentUseCase,
    required ImagePicker imagePicker,
  }) : _getTagsUseCase = getTagsUseCase,
       _createMomentUseCase = createMomentUseCase,
       _imagePicker = imagePicker,
       super(const CreateMomentState());

  Future<void> initialData() async {
    await loadTagsSuggestions();
  }

  Future<void> loadTagsSuggestions() async {
    await execute(
      loadingState: state.copyWith(
        tagsSuggestions: state.tagsSuggestions.toLoading(),
      ),
      action: () => _getTagsUseCase(),
      onSuccess: (tags) => state.copyWith(
        tagsSuggestions: state.tagsSuggestions.toSuccess(tags),
      ),
      onFailure: (f) => state.copyWith(
        tagsSuggestions: state.tagsSuggestions.toFailure(f.message),
      ),
    );
  }

  void updateInputText(String text) {
    emit(state.copyWith(inputText: text));
  }

  void onChangeNote(String? value) {
    emit(state.copyWith(note: value));
  }

  void toggleLockedMoment(bool value) {
    if (value != state.isLockMoment) {
      emit(state.copyWith(isLockMoment: value));
    }
  }

  void toggleLoved(bool value) {
    if (value != state.isLoved) {
      emit(state.copyWith(isLoved: value));
    }
  }

  void toggleHiddenWidget(bool value) {
    if (value != state.hideFromWidget) {
      emit(state.copyWith(hideFromWidget: value));
    }
  }

  Future<void> openImagePicker() async {
    try {
      final List<XFile> pickedFileList = await _imagePicker.pickMultiImage();

      if (pickedFileList.isNotEmpty) {
        emit(
          state.copyWith(
            imagePicker: pickedFileList.map((e) => File(e.path)).toList(),
          ),
        );
      }
    } catch (_) {
      emit(
        state.copyWith(
          createMomentDirectEnum:
              CreateMomentDirectEnum.showDialogErrorWhenPicker,
        ),
      );
    }
  }

  void showDevelopmentDialog() {
    emit(
      state.copyWith(
        createMomentDirectEnum: CreateMomentDirectEnum.showDialogDevelopment,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void addTag(String tagName) {
    final normalizedName = tagName.trim().toLowerCase().replaceAll('#', '');
    if (normalizedName.isEmpty) return;

    final exists = state.tagsSelected.any(
      (t) => t.normalizedName == normalizedName,
    );
    if (exists) return;

    final newTag = TagEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: normalizedName,
      normalizedName: normalizedName,
    );

    emit(state.copyWith(tagsSelected: [...state.tagsSelected, newTag]));
  }

  void addTagFromSuggestion(TagEntity tag) {
    final exists = state.tagsSelected.any(
      (t) => t.id == tag.id || t.normalizedName == tag.normalizedName,
    );
    if (exists) return;
    emit(state.copyWith(tagsSelected: [...state.tagsSelected, tag]));
  }

  void removeTag(String tagId) {
    final updatedTags = state.tagsSelected.where((t) => t.id != tagId).toList();
    emit(state.copyWith(tagsSelected: updatedTags));
  }

  /// Lấy vị trí hiện tại của thiết bị để gắn vào khoảnh khắc (xin quyền nếu
  /// cần). Lưu lat/long + tên hiển thị dạng toạ độ vào state, sẽ persist khi
  /// [saveMoment].
  Future<void> pickCurrentLocation() async {
    if (state.isPickingLocation) return;
    emit(state.copyWith(isPickingLocation: true, locationMessage: null));
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            isPickingLocation: false,
            locationMessage: 'Dịch vụ vị trí đang tắt. Hãy bật GPS rồi thử lại.',
          ),
        );
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            isPickingLocation: false,
            locationMessage: 'Ứng dụng chưa được cấp quyền vị trí.',
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      final name = await _resolveAddress(position.latitude, position.longitude);
      emit(
        state.copyWith(
          isPickingLocation: false,
          latitude: position.latitude,
          longitude: position.longitude,
          locationName: name,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isPickingLocation: false,
          locationMessage: 'Không lấy được vị trí. Hãy thử lại.',
        ),
      );
    }
  }

  /// Reverse-geocode toạ độ -> tên địa chỉ người đọc được.
  /// Lỗi/không có kết quả -> fallback về toạ độ rút gọn.
  Future<String> _resolveAddress(double lat, double long) async {
    final fallback =
        '${lat.toStringAsFixed(5)}, ${long.toStringAsFixed(5)}';
    try {
      final placemarks = await placemarkFromCoordinates(lat, long);
      if (placemarks.isEmpty) return fallback;
      final p = placemarks.first;
      final parts = <String?>[
        p.street,
        p.subAdministrativeArea,
        p.administrativeArea,
        p.country,
      ].where((e) => e != null && e.trim().isNotEmpty).toList();
      if (parts.isEmpty) return fallback;
      return parts.join(', ');
    } catch (_) {
      return fallback;
    }
  }

  Future<void> saveMoment() async {
    final trimmedNote = state.note?.trim();
    final params = CreateMomentParams(
      note: (trimmedNote?.isEmpty ?? true) ? null : trimmedNote,
      momentDate: state.momentDate ?? DateTime.now(),
      tags: state.tagsSelected,
      isFavorite: state.isLoved,
      isHiddenFromWidget: state.hideFromWidget,
      isLocked: state.isLockMoment,
      latitude: state.latitude,
      longitude: state.longitude,
      locationName: state.locationName,
    );
    await execute(
      loadingState: state.copyWith(saveAction: state.saveAction.toLoading()),
      action: () => _createMomentUseCase(params),
      onSuccess: (moment) => state.copyWith(saveAction: state.saveAction.toSuccess(moment)),
      onFailure: (f) => state.copyWith(saveAction: state.saveAction.toFailure(f.message)),
    );
  }
}

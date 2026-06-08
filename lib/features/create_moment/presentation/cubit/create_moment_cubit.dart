import 'dart:io';
import 'dart:ui' as ui;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/create_moment/domain/enum/create_moment_direct_enum.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_moods_usecase.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_tones_usecase.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_entity.dart';
import 'package:music_app/features/moment/domain/usecases/create_moment_usecase.dart';
import 'package:image_picker/image_picker.dart';
part 'create_moment_state.dart';
part 'create_moment_cubit.freezed.dart';

class CreateMomentCubit extends BaseCubit<CreateMomentState> {
  final GetTagsUseCase _getTagsUseCase;
  final CreateMomentUseCase _createMomentUseCase;
  final GetMoodsUseCase _getMoodsUseCase;
  final GetTonesUseCase _getTonesUseCase;
  final ImagePicker _imagePicker;

  CreateMomentCubit({
    required GetTagsUseCase getTagsUseCase,
    required CreateMomentUseCase createMomentUseCase,
    required GetMoodsUseCase getMoodsUseCase,
    required GetTonesUseCase getTonesUseCase,
    required ImagePicker imagePicker,
  }) : _getTagsUseCase = getTagsUseCase,
       _createMomentUseCase = createMomentUseCase,
       _getMoodsUseCase = getMoodsUseCase,
       _getTonesUseCase = getTonesUseCase,
       _imagePicker = imagePicker,
       super(const CreateMomentState());

  Future<void> initialData({List<File> initialImages = const []}) async {
    seedInitialImages(initialImages);
    await Future.wait([
      loadTagsSuggestions(),
      loadMoods(),
      loadTones(),
      pickCurrentLocation(),
    ]);
  }

  /// Seeds photos handed over from the camera capture screen. Pure (no I/O) so
  /// it is unit-testable; file persistence still happens in [saveMoment].
  void seedInitialImages(List<File> images) {
    if (images.isEmpty) return;
    emit(state.copyWith(imagePicker: [...state.imagePicker, ...images]));
  }

  Future<void> loadMoods() async {
    await execute(
      loadingState: state.copyWith(moods: state.moods.toLoading()),
      action: () => _getMoodsUseCase(),
      onSuccess: (moods) => state.copyWith(moods: state.moods.toSuccess(moods)),
      onFailure: (f) => state.copyWith(moods: state.moods.toFailure(f.message)),
    );
  }

  Future<void> loadTones() async {
    await execute(
      loadingState: state.copyWith(tones: state.tones.toLoading()),
      action: () => _getTonesUseCase(),
      onSuccess: (tones) => state.copyWith(tones: state.tones.toSuccess(tones)),
      onFailure: (f) => state.copyWith(tones: state.tones.toFailure(f.message)),
    );
  }

  void selectMood(String moodId) {
    final next = state.moodIdSelected == moodId ? null : moodId;
    emit(state.copyWith(moodIdSelected: next));
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
      if (pickedFileList.isEmpty) return;

      final existingPaths = state.imagePicker.map((f) => f.path).toSet();
      final added = pickedFileList
          .map((e) => File(e.path))
          .where((f) => existingPaths.add(f.path))
          .toList();
      if (added.isEmpty) return;

      emit(state.copyWith(imagePicker: [...state.imagePicker, ...added]));
    } catch (_) {
      emit(
        state.copyWith(
          createMomentDirectEnum:
              CreateMomentDirectEnum.showDialogErrorWhenPicker,
        ),
      );
    }
  }

  void removeImageAt(int index) {
    final list = [...state.imagePicker];
    if (index < 0 || index >= list.length) return;
    list.removeAt(index);
    emit(state.copyWith(imagePicker: list));
  }

  void showDevelopmentDialog() {
    emit(
      state.copyWith(
        createMomentDirectEnum: CreateMomentDirectEnum.showDialogDevelopment,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void selectTone(String toneId) {
    final next = state.toneIdSelected == toneId ? null : toneId;
    emit(state.copyWith(toneIdSelected: next));
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
    final assets = await _persistPickedImages(state.imagePicker);
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
      moodId: state.moodIdSelected,
      toneId: state.toneIdSelected,
      assets: assets,
    );
    await execute(
      loadingState: state.copyWith(saveAction: state.saveAction.toLoading()),
      action: () => _createMomentUseCase(params),
      onSuccess: (moment) => state.copyWith(saveAction: state.saveAction.toSuccess(moment)),
      onFailure: (f) => state.copyWith(saveAction: state.saveAction.toFailure(f.message)),
    );
  }

  /// Copies picked images into persistent app storage (image_picker returns
  /// temp cache paths) and probes each file's dimensions + size so they can be
  /// written into `moment_assets`.
  Future<List<MomentAssetInput>> _persistPickedImages(List<File> files) async {
    if (files.isEmpty) return const [];
    final docsDir = await getApplicationDocumentsDirectory();
    final assetsDir = Directory(p.join(docsDir.path, 'moment_assets'));
    if (!await assetsDir.exists()) {
      await assetsDir.create(recursive: true);
    }

    final result = <MomentAssetInput>[];
    for (var i = 0; i < files.length; i++) {
      final source = files[i];
      final ext = p.extension(source.path);
      final fileName = '${DateTime.now().microsecondsSinceEpoch}_$i$ext';
      final copied = await source.copy(p.join(assetsDir.path, fileName));
      final bytes = await copied.readAsBytes();

      var width = 0;
      var height = 0;
      try {
        final codec = await ui.instantiateImageCodec(bytes);
        final frame = await codec.getNextFrame();
        width = frame.image.width;
        height = frame.image.height;
        frame.image.dispose();
        codec.dispose();
      } catch (_) {
        // Leave dimensions at 0 if the image can't be decoded.
      }

      result.add(MomentAssetInput(
        path: copied.path,
        width: width,
        height: height,
        fileSize: bytes.length,
        mimeType: _mimeFromExtension(ext),
        sortOrder: i,
      ));
    }
    return result;
  }

  String _mimeFromExtension(String ext) {
    switch (ext.toLowerCase()) {
      case '.png':
        return 'image/png';
      case '.gif':
        return 'image/gif';
      case '.webp':
        return 'image/webp';
      case '.heic':
        return 'image/heic';
      case '.jpg':
      case '.jpeg':
      default:
        return 'image/jpeg';
    }
  }
}

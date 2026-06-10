import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/create_moment/domain/enum/create_moment_direct_enum.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/usecases/cleanup_moment_assets_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_current_moment_location_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/persist_moment_assets_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/pick_moment_images_usecase.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';
import 'package:music_app/features/moment/domain/models/moment_detail_entity.dart';
import 'package:music_app/features/moment/domain/usecases/create_moment_usecase.dart';
import 'package:music_app/features/mood_tone/domain/models/mood_entity.dart';
import 'package:music_app/features/mood_tone/domain/models/tone_entity.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_moods_usecase.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_tones_usecase.dart';
import 'package:uuid/uuid.dart';
part 'create_moment_state.dart';
part 'create_moment_cubit.freezed.dart';

class CreateMomentCubit extends BaseCubit<CreateMomentState> {
  final GetTagsUseCase _getTagsUseCase;
  final CreateMomentUseCase _createMomentUseCase;
  final GetMoodsUseCase _getMoodsUseCase;
  final GetTonesUseCase _getTonesUseCase;
  final PickMomentImagesUseCase _pickMomentImagesUseCase;
  final GetCurrentMomentLocationUseCase _getCurrentMomentLocationUseCase;
  final PersistMomentAssetsUseCase _persistMomentAssetsUseCase;
  final CleanupMomentAssetsUseCase _cleanupMomentAssetsUseCase;

  CreateMomentCubit({
    required GetTagsUseCase getTagsUseCase,
    required CreateMomentUseCase createMomentUseCase,
    required GetMoodsUseCase getMoodsUseCase,
    required GetTonesUseCase getTonesUseCase,
    required PickMomentImagesUseCase pickMomentImagesUseCase,
    required GetCurrentMomentLocationUseCase getCurrentMomentLocationUseCase,
    required PersistMomentAssetsUseCase persistMomentAssetsUseCase,
    required CleanupMomentAssetsUseCase cleanupMomentAssetsUseCase,
  }) : _getTagsUseCase = getTagsUseCase,
       _createMomentUseCase = createMomentUseCase,
       _getMoodsUseCase = getMoodsUseCase,
       _getTonesUseCase = getTonesUseCase,
       _pickMomentImagesUseCase = pickMomentImagesUseCase,
       _getCurrentMomentLocationUseCase = getCurrentMomentLocationUseCase,
       _persistMomentAssetsUseCase = persistMomentAssetsUseCase,
       _cleanupMomentAssetsUseCase = cleanupMomentAssetsUseCase,
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

  void onChangeTitle(String? value) {
    emit(state.copyWith(title: value));
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
    final result = await _pickMomentImagesUseCase(state.imagePicker);
    result.fold(
      (_) => emit(
        state.copyWith(
          createMomentDirectEnum:
              CreateMomentDirectEnum.showDialogErrorWhenPicker,
          timeStamp: state.timeStamp + 1,
        ),
      ),
      (added) {
        if (added.isEmpty) return;
        emit(
          state.copyWith(
            imagePicker: [...state.imagePicker, ...added],
            createMomentDirectEnum: null,
          ),
        );
      },
    );
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
      id: const Uuid().v4(),
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

  Future<void> pickCurrentLocation() async {
    if (state.isPickingLocation) return;
    emit(state.copyWith(isPickingLocation: true, locationMessage: null));

    final result = await _getCurrentMomentLocationUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isPickingLocation: false,
          locationMessage: failure.message,
        ),
      ),
      (location) => emit(
        state.copyWith(
          isPickingLocation: false,
          latitude: location.latitude,
          longitude: location.longitude,
          locationName: location.name,
        ),
      ),
    );
  }

  Future<void> saveMoment() async {
    if (state.saveAction.isLoading) return;
    emit(state.copyWith(saveAction: state.saveAction.toLoading()));

    final assetsResult = await _persistMomentAssetsUseCase(state.imagePicker);
    final assets = assetsResult.fold<List<MomentAssetInput>?>((failure) {
      emit(
        state.copyWith(saveAction: state.saveAction.toFailure(failure.message)),
      );
      return null;
    }, (assets) => assets);
    if (assets == null) return;

    final trimmedNote = state.note?.trim();
    final trimmedTitle = state.title?.trim();
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
      title: (trimmedTitle?.isEmpty ?? true) ? null : trimmedTitle,
    );

    final result = await _createMomentUseCase(params);
    await result.fold(
      (failure) async {
        await _cleanupMomentAssetsUseCase(assets);
        emit(
          state.copyWith(
            saveAction: state.saveAction.toFailure(failure.message),
          ),
        );
      },
      (moment) async =>
          emit(state.copyWith(saveAction: state.saveAction.toSuccess(moment))),
    );
  }
}

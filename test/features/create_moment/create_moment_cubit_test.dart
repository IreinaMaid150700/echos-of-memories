import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/enum/create_moment_direct_enum.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/usecases/cleanup_moment_assets_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_current_moment_location_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/persist_moment_assets_usecase.dart';
import 'package:music_app/features/create_moment/domain/usecases/pick_moment_images_usecase.dart';
import 'package:music_app/features/create_moment/presentation/cubit/create_moment_cubit.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';
import 'package:music_app/features/moment/domain/models/moment_detail_entity.dart';
import 'package:music_app/features/moment/domain/usecases/create_moment_usecase.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_moods_usecase.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_tones_usecase.dart';

class _MockGetTags extends Mock implements GetTagsUseCase {}

class _MockCreateMoment extends Mock implements CreateMomentUseCase {}

class _MockGetMoods extends Mock implements GetMoodsUseCase {}

class _MockGetTones extends Mock implements GetTonesUseCase {}

class _MockPickMomentImagesUseCase extends Mock
    implements PickMomentImagesUseCase {}

class _MockGetCurrentMomentLocationUseCase extends Mock
    implements GetCurrentMomentLocationUseCase {}

class _MockPersistMomentAssetsUseCase extends Mock
    implements PersistMomentAssetsUseCase {}

class _MockCleanupMomentAssetsUseCase extends Mock
    implements CleanupMomentAssetsUseCase {}

CreateMomentCubit _build({
  GetTagsUseCase? getTagsUseCase,
  CreateMomentUseCase? createMomentUseCase,
  GetMoodsUseCase? getMoodsUseCase,
  GetTonesUseCase? getTonesUseCase,
  PickMomentImagesUseCase? pickMomentImagesUseCase,
  GetCurrentMomentLocationUseCase? getCurrentMomentLocationUseCase,
  PersistMomentAssetsUseCase? persistMomentAssetsUseCase,
  CleanupMomentAssetsUseCase? cleanupMomentAssetsUseCase,
}) => CreateMomentCubit(
  getTagsUseCase: getTagsUseCase ?? _MockGetTags(),
  createMomentUseCase: createMomentUseCase ?? _MockCreateMoment(),
  getMoodsUseCase: getMoodsUseCase ?? _MockGetMoods(),
  getTonesUseCase: getTonesUseCase ?? _MockGetTones(),
  pickMomentImagesUseCase:
      pickMomentImagesUseCase ?? _MockPickMomentImagesUseCase(),
  getCurrentMomentLocationUseCase:
      getCurrentMomentLocationUseCase ?? _MockGetCurrentMomentLocationUseCase(),
  persistMomentAssetsUseCase:
      persistMomentAssetsUseCase ?? _MockPersistMomentAssetsUseCase(),
  cleanupMomentAssetsUseCase:
      cleanupMomentAssetsUseCase ?? _MockCleanupMomentAssetsUseCase(),
);

CreateMomentParams _fallbackParams() => CreateMomentParams(
  momentDate: DateTime(2026),
  tags: const [],
  isFavorite: false,
  isHiddenFromWidget: false,
  isLocked: false,
);

MomentDetailEntity _moment() {
  final now = DateTime(2026);
  return MomentDetailEntity(
    id: 'moment-1',
    momentDate: now,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  setUpAll(() {
    registerFallbackValue(<File>[]);
    registerFallbackValue(<MomentAssetInput>[]);
    registerFallbackValue(_fallbackParams());
  });

  group('CreateMomentCubit image seeding', () {
    test('seedInitialImages appends camera photos', () {
      final cubit = _build();
      addTearDown(cubit.close);

      cubit.seedInitialImages([File('/cam1.jpg'), File('/cam2.jpg')]);

      expect(cubit.state.imagePicker.map((f) => f.path), [
        '/cam1.jpg',
        '/cam2.jpg',
      ]);
    });

    test('seedInitialImages with empty list is a no-op', () {
      final cubit = _build();
      addTearDown(cubit.close);

      cubit.seedInitialImages(const []);

      expect(cubit.state.imagePicker, isEmpty);
    });

    test('removeImageAt removes the photo at the index', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.seedInitialImages([File('/a.jpg'), File('/b.jpg')]);

      cubit.removeImageAt(0);

      expect(cubit.state.imagePicker.map((f) => f.path), ['/b.jpg']);
    });

    test('removeImageAt with negative index is no-op', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.seedInitialImages([File('/a.jpg')]);

      cubit.removeImageAt(-1);

      expect(cubit.state.imagePicker, hasLength(1));
    });

    test('removeImageAt with out-of-bounds index is no-op', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.seedInitialImages([File('/a.jpg')]);

      cubit.removeImageAt(5);

      expect(cubit.state.imagePicker, hasLength(1));
    });
  });

  group('CreateMomentCubit openImagePicker enum lifecycle', () {
    _MockPickMomentImagesUseCase pickUseCase() =>
        _MockPickMomentImagesUseCase();

    test('picker failure sets showDialogErrorWhenPicker enum', () async {
      final useCase = pickUseCase();
      when(() => useCase(any())).thenAnswer(
        (_) async =>
            const Left<Failure, List<File>>(UnknownFailure(message: 'denied')),
      );
      final cubit = _build(pickMomentImagesUseCase: useCase);
      addTearDown(cubit.close);

      await cubit.openImagePicker();

      expect(
        cubit.state.createMomentDirectEnum,
        CreateMomentDirectEnum.showDialogErrorWhenPicker,
      );
    });

    test(
      'repeated picker failures update timestamp for listener replay',
      () async {
        final useCase = pickUseCase();
        when(() => useCase(any())).thenAnswer(
          (_) async => const Left<Failure, List<File>>(
            UnknownFailure(message: 'denied'),
          ),
        );
        final cubit = _build(pickMomentImagesUseCase: useCase);
        addTearDown(cubit.close);

        await cubit.openImagePicker();
        final firstTimestamp = cubit.state.timeStamp;
        await cubit.openImagePicker();

        expect(
          cubit.state.createMomentDirectEnum,
          CreateMomentDirectEnum.showDialogErrorWhenPicker,
        );
        expect(cubit.state.timeStamp, firstTimestamp + 1);
      },
    );

    test('success after error clears error enum', () async {
      final useCase = pickUseCase();
      when(() => useCase(any())).thenAnswer(
        (_) async =>
            const Left<Failure, List<File>>(UnknownFailure(message: 'fail')),
      );
      final cubit = _build(pickMomentImagesUseCase: useCase);
      addTearDown(cubit.close);
      await cubit.openImagePicker();

      when(() => useCase(any())).thenAnswer(
        (_) async => Right<Failure, List<File>>([File('/photo.jpg')]),
      );
      await cubit.openImagePicker();

      expect(cubit.state.createMomentDirectEnum, isNull);
    });

    test('cancel (empty list) is a no-op', () async {
      final useCase = pickUseCase();
      when(
        () => useCase(any()),
      ).thenAnswer((_) async => const Right<Failure, List<File>>(<File>[]));
      final cubit = _build(pickMomentImagesUseCase: useCase);
      addTearDown(cubit.close);

      await cubit.openImagePicker();

      expect(cubit.state.createMomentDirectEnum, isNull);
      expect(cubit.state.imagePicker, isEmpty);
    });

    test('picked files are appended to imagePicker state', () async {
      final useCase = pickUseCase();
      when(() => useCase(any())).thenAnswer(
        (_) async =>
            Right<Failure, List<File>>([File('/a.jpg'), File('/b.jpg')]),
      );
      final cubit = _build(pickMomentImagesUseCase: useCase);
      addTearDown(cubit.close);

      await cubit.openImagePicker();

      expect(cubit.state.imagePicker.map((f) => f.path), ['/a.jpg', '/b.jpg']);
    });

    test('picker usecase receives current imagePicker as existing', () async {
      final useCase = pickUseCase();
      final captured = <List<File>>[];
      when(() => useCase(any())).thenAnswer((inv) {
        captured.add(inv.positionalArguments.single as List<File>);
        return Future.value(Right<Failure, List<File>>([File('/new.jpg')]));
      });
      final cubit = _build(pickMomentImagesUseCase: useCase);
      addTearDown(cubit.close);
      cubit.seedInitialImages([File('/seed.jpg')]);

      await cubit.openImagePicker();

      expect(captured.single.map((f) => f.path), ['/seed.jpg']);
    });
  });

  group('CreateMomentCubit saveMoment', () {
    test('asset persistence failure stops before create usecase', () async {
      final persist = _MockPersistMomentAssetsUseCase();
      final create = _MockCreateMoment();
      when(() => persist(any())).thenAnswer(
        (_) async => const Left<Failure, List<MomentAssetInput>>(
          CacheFailure(message: 'persist failed'),
        ),
      );
      final cubit = _build(
        createMomentUseCase: create,
        persistMomentAssetsUseCase: persist,
      );
      addTearDown(cubit.close);

      await cubit.saveMoment();

      expect(cubit.state.saveAction.isFailure, isTrue);
      expect(cubit.state.saveAction.error, 'persist failed');
      verifyNever(() => create(any()));
    });

    test('create failure cleans up persisted assets', () async {
      final persist = _MockPersistMomentAssetsUseCase();
      final create = _MockCreateMoment();
      final cleanup = _MockCleanupMomentAssetsUseCase();
      const assets = [
        MomentAssetInput(
          path: '/persisted.jpg',
          width: 10,
          height: 10,
          fileSize: 100,
          sortOrder: 0,
        ),
      ];
      when(() => persist(any())).thenAnswer(
        (_) async => const Right<Failure, List<MomentAssetInput>>(assets),
      );
      when(() => create(any())).thenAnswer(
        (_) async => const Left<Failure, MomentDetailEntity>(
          CacheFailure(message: 'create failed'),
        ),
      );
      when(() => cleanup(assets)).thenAnswer((_) async {});
      final cubit = _build(
        createMomentUseCase: create,
        persistMomentAssetsUseCase: persist,
        cleanupMomentAssetsUseCase: cleanup,
      );
      addTearDown(cubit.close);

      await cubit.saveMoment();

      verify(() => cleanup(assets)).called(1);
      expect(cubit.state.saveAction.isFailure, isTrue);
      expect(cubit.state.saveAction.error, 'create failed');
    });

    test('create success completes without cleanup', () async {
      final persist = _MockPersistMomentAssetsUseCase();
      final create = _MockCreateMoment();
      final cleanup = _MockCleanupMomentAssetsUseCase();
      when(() => persist(any())).thenAnswer(
        (_) async =>
            const Right<Failure, List<MomentAssetInput>>(<MomentAssetInput>[]),
      );
      when(
        () => create(any()),
      ).thenAnswer((_) async => Right<Failure, MomentDetailEntity>(_moment()));
      final cubit = _build(
        createMomentUseCase: create,
        persistMomentAssetsUseCase: persist,
        cleanupMomentAssetsUseCase: cleanup,
      );
      addTearDown(cubit.close);

      await cubit.saveMoment();

      expect(cubit.state.saveAction.isSuccess, isTrue);
      verifyNever(() => cleanup(any()));
    });
  });

  group('CreateMomentCubit mood and tone selection', () {
    test('selectMood selects given id', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.selectMood('m1');
      expect(cubit.state.moodIdSelected, 'm1');
    });

    test('selectMood deselects when same id tapped twice', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.selectMood('m1');
      cubit.selectMood('m1');
      expect(cubit.state.moodIdSelected, isNull);
    });

    test('selectMood switches to a different id', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.selectMood('m1');
      cubit.selectMood('m2');
      expect(cubit.state.moodIdSelected, 'm2');
    });

    test('selectTone deselects when same id tapped twice', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.selectTone('t1');
      cubit.selectTone('t1');
      expect(cubit.state.toneIdSelected, isNull);
    });
  });

  group('CreateMomentCubit tag management', () {
    test('addTag strips leading hash', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('#summer');
      expect(cubit.state.tagsSelected.single.normalizedName, 'summer');
    });

    test('addTag strips ALL hashes including mid-word ones', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('hello#world');
      expect(cubit.state.tagsSelected.single.normalizedName, 'helloworld');
    });

    test('addTag is no-op for whitespace-only input', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('   ');
      expect(cubit.state.tagsSelected, isEmpty);
    });

    test('addTag is no-op for hash-only input', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('###');
      expect(cubit.state.tagsSelected, isEmpty);
    });

    test('addTag deduplicates case-insensitively', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('Summer');
      cubit.addTag('SUMMER');
      expect(cubit.state.tagsSelected, hasLength(1));
    });

    test('addTag deduplicates hash-prefixed vs plain variant', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('#summer');
      cubit.addTag('summer');
      expect(cubit.state.tagsSelected, hasLength(1));
    });

    test('addTag assigns unique IDs across rapid additions', () {
      final cubit = _build();
      addTearDown(cubit.close);
      for (var i = 0; i < 20; i++) {
        cubit.addTag('tag$i');
      }
      final ids = cubit.state.tagsSelected.map((t) => t.id).toSet();
      expect(ids.length, cubit.state.tagsSelected.length);
    });

    test('removeTag removes only the target tag', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('alpha');
      cubit.addTag('beta');
      final alphaId = cubit.state.tagsSelected.first.id;

      cubit.removeTag(alphaId);

      expect(cubit.state.tagsSelected, hasLength(1));
      expect(cubit.state.tagsSelected.single.normalizedName, 'beta');
    });

    test('removeTag with unknown id is no-op', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.addTag('alpha');
      cubit.removeTag('no-such-id');
      expect(cubit.state.tagsSelected, hasLength(1));
    });

    test('addTagFromSuggestion deduplicates by id', () {
      final cubit = _build();
      addTearDown(cubit.close);
      const tag = TagEntity(
        id: 'sg1',
        name: 'summer',
        normalizedName: 'summer',
      );
      cubit.addTagFromSuggestion(tag);
      cubit.addTagFromSuggestion(tag);
      expect(cubit.state.tagsSelected, hasLength(1));
    });

    test('addTagFromSuggestion deduplicates against manually typed tag', () {
      final cubit = _build();
      addTearDown(cubit.close);
      const tag = TagEntity(
        id: 'sg1',
        name: 'summer',
        normalizedName: 'summer',
      );
      cubit.addTagFromSuggestion(tag);
      cubit.addTag('summer');
      expect(cubit.state.tagsSelected, hasLength(1));
    });
  });

  group('CreateMomentCubit privacy toggles', () {
    test('toggleLockedMoment sets isLockMoment to true', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.toggleLockedMoment(true);
      expect(cubit.state.isLockMoment, isTrue);
    });

    test('toggleLockedMoment is no-op when same value passed', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.toggleLockedMoment(false);
      expect(cubit.state.isLockMoment, isFalse);
    });

    test('toggleLoved sets isLoved to true', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.toggleLoved(true);
      expect(cubit.state.isLoved, isTrue);
    });

    test('toggleHiddenWidget sets hideFromWidget to true', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.toggleHiddenWidget(true);
      expect(cubit.state.hideFromWidget, isTrue);
    });
  });

  group('CreateMomentCubit note and inputText', () {
    test('onChangeNote updates note', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.onChangeNote('my memory');
      expect(cubit.state.note, 'my memory');
    });

    test('onChangeNote accepts null to clear note', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.onChangeNote('something');
      cubit.onChangeNote(null);
      expect(cubit.state.note, isNull);
    });

    test('updateInputText updates inputText', () {
      final cubit = _build();
      addTearDown(cubit.close);
      cubit.updateInputText('vac');
      expect(cubit.state.inputText, 'vac');
    });
  });
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_moods_usecase.dart';
import 'package:music_app/features/mood_tone/domain/usecases/get_tones_usecase.dart';
import 'package:music_app/features/moment/domain/usecases/create_moment_usecase.dart';
import 'package:music_app/features/create_moment/presentation/cubit/create_moment_cubit.dart';

class _MockGetTags extends Mock implements GetTagsUseCase {}

class _MockCreateMoment extends Mock implements CreateMomentUseCase {}

class _MockGetMoods extends Mock implements GetMoodsUseCase {}

class _MockGetTones extends Mock implements GetTonesUseCase {}

class _MockImagePicker extends Mock implements ImagePicker {}

CreateMomentCubit _build() => CreateMomentCubit(
      getTagsUseCase: _MockGetTags(),
      createMomentUseCase: _MockCreateMoment(),
      getMoodsUseCase: _MockGetMoods(),
      getTonesUseCase: _MockGetTones(),
      imagePicker: _MockImagePicker(),
    );

void main() {
  group('CreateMomentCubit image seeding', () {
    test('seedInitialImages appends camera photos', () {
      final cubit = _build();
      addTearDown(cubit.close);

      cubit.seedInitialImages([File('/cam1.jpg'), File('/cam2.jpg')]);

      expect(cubit.state.imagePicker.map((f) => f.path),
          ['/cam1.jpg', '/cam2.jpg']);
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
  });
}

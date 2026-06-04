import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';
import 'package:music_app/features/create_moment/domain/usecases/create_tag_usecase.dart';

class MockTagRepository extends Mock implements TagRepository {}

void main() {
  late MockTagRepository mockRepository;
  late CreateTagUseCase useCase;

  setUp(() {
    mockRepository = MockTagRepository();
    useCase = CreateTagUseCase(mockRepository);
  });

  const tTagName = 'rock';
  const tCreatedTag = TagEntity(
    id: '123',
    name: 'rock',
    normalizedName: 'rock',
  );

  group('CreateTagUseCase', () {
    test('delegates call to repository.createTag() with given name', () async {
      when(() => mockRepository.createTag(tTagName))
          .thenAnswer((_) async => const Right(tCreatedTag));

      await useCase(tTagName);

      verify(() => mockRepository.createTag(tTagName)).called(1);
    });

    test('returns Right(TagEntity) when repository succeeds', () async {
      when(() => mockRepository.createTag(tTagName))
          .thenAnswer((_) async => const Right(tCreatedTag));

      final result = await useCase(tTagName);

      expect(result, const Right<Failure, TagEntity>(tCreatedTag));
    });

    test('passes the exact tag name to repository without modification', () async {
      const rawName = '  Jazz  ';
      when(() => mockRepository.createTag(rawName))
          .thenAnswer((_) async => const Right(tCreatedTag));

      await useCase(rawName);

      // Use case is a thin delegate; normalization happens in repository impl
      verify(() => mockRepository.createTag(rawName)).called(1);
    });

    test('returns Left(CacheFailure) when repository fails', () async {
      const failure = CacheFailure(message: 'Failed to create tag');
      when(() => mockRepository.createTag(any()))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(tTagName);

      expect(result.isLeft(), isTrue);
      result.fold(
        (f) => expect(f, isA<CacheFailure>()),
        (_) => fail('Expected Left but got Right'),
      );
    });

    test('returns the exact Failure message from repository on error', () async {
      const failure = CacheFailure(message: 'Duplicate tag error');
      when(() => mockRepository.createTag(any()))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(tTagName);

      result.fold(
        (f) => expect(f.message, 'Duplicate tag error'),
        (_) => fail('Expected Left but got Right'),
      );
    });

    test('verifies no other repository methods are called', () async {
      when(() => mockRepository.createTag(tTagName))
          .thenAnswer((_) async => const Right(tCreatedTag));

      await useCase(tTagName);

      verifyNever(() => mockRepository.getTags());
      verifyNever(() => mockRepository.deleteTag(any()));
    });
  });
}
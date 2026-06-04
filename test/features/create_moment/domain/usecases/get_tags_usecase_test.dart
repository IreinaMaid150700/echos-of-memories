import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';

class MockTagRepository extends Mock implements TagRepository {}

void main() {
  late MockTagRepository mockRepository;
  late GetTagsUseCase useCase;

  setUp(() {
    mockRepository = MockTagRepository();
    useCase = GetTagsUseCase(mockRepository);
  });

  const tTags = [
    TagEntity(id: '1', name: 'rock', normalizedName: 'rock'),
    TagEntity(id: '2', name: 'jazz', normalizedName: 'jazz'),
  ];

  group('GetTagsUseCase', () {
    test('delegates call to repository.getTags()', () async {
      when(() => mockRepository.getTags())
          .thenAnswer((_) async => const Right(tTags));

      await useCase();

      verify(() => mockRepository.getTags()).called(1);
    });

    test('returns Right(tags) when repository succeeds', () async {
      when(() => mockRepository.getTags())
          .thenAnswer((_) async => const Right(tTags));

      final result = await useCase();

      expect(result, const Right<Failure, List<TagEntity>>(tTags));
    });

    test('returns Right with empty list when no tags exist', () async {
      when(() => mockRepository.getTags())
          .thenAnswer((_) async => const Right([]));

      final result = await useCase();

      expect(result, const Right<Failure, List<TagEntity>>([]));
    });

    test('returns Left(CacheFailure) when repository fails', () async {
      const failure = CacheFailure(message: 'Failed to fetch tags');
      when(() => mockRepository.getTags())
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase();

      expect(result.isLeft(), isTrue);
      result.fold(
        (f) => expect(f, isA<CacheFailure>()),
        (_) => fail('Expected Left but got Right'),
      );
    });

    test('returns the exact Failure from repository on error', () async {
      const failure = CacheFailure(message: 'DB connection error');
      when(() => mockRepository.getTags())
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase();

      result.fold(
        (f) => expect(f.message, 'DB connection error'),
        (_) => fail('Expected Left but got Right'),
      );
    });
  });
}
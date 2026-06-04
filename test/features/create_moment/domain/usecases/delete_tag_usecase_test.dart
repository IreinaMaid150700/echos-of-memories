import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/repositories/tag_repository.dart';
import 'package:music_app/features/create_moment/domain/usecases/delete_tag_usecase.dart';

class MockTagRepository extends Mock implements TagRepository {}

void main() {
  late MockTagRepository mockRepository;
  late DeleteTagUseCase useCase;

  setUp(() {
    mockRepository = MockTagRepository();
    useCase = DeleteTagUseCase(mockRepository);
  });

  const tTagId = 'tag-id-123';

  group('DeleteTagUseCase', () {
    test('delegates call to repository.deleteTag() with given id', () async {
      when(() => mockRepository.deleteTag(tTagId))
          .thenAnswer((_) async => const Right(unit));

      await useCase(tTagId);

      verify(() => mockRepository.deleteTag(tTagId)).called(1);
    });

    test('returns Right(unit) when repository succeeds', () async {
      when(() => mockRepository.deleteTag(tTagId))
          .thenAnswer((_) async => const Right(unit));

      final result = await useCase(tTagId);

      expect(result, const Right<Failure, Unit>(unit));
    });

    test('returns Left(CacheFailure) when repository fails', () async {
      const failure = CacheFailure(message: 'Failed to delete tag');
      when(() => mockRepository.deleteTag(tTagId))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(tTagId);

      expect(result.isLeft(), isTrue);
      result.fold(
        (f) => expect(f, isA<CacheFailure>()),
        (_) => fail('Expected Left but got Right'),
      );
    });

    test('returns the exact Failure message from repository on error', () async {
      const failure = CacheFailure(message: 'Tag not found');
      when(() => mockRepository.deleteTag(any()))
          .thenAnswer((_) async => const Left(failure));

      final result = await useCase(tTagId);

      result.fold(
        (f) => expect(f.message, 'Tag not found'),
        (_) => fail('Expected Left but got Right'),
      );
    });

    test('passes the exact id string to repository without modification', () async {
      const specificId = 'some-uuid-value';
      when(() => mockRepository.deleteTag(specificId))
          .thenAnswer((_) async => const Right(unit));

      await useCase(specificId);

      verify(() => mockRepository.deleteTag(specificId)).called(1);
    });

    test('verifies no other repository methods are called', () async {
      when(() => mockRepository.deleteTag(tTagId))
          .thenAnswer((_) async => const Right(unit));

      await useCase(tTagId);

      verifyNever(() => mockRepository.getTags());
      verifyNever(() => mockRepository.createTag(any()));
    });
  });
}
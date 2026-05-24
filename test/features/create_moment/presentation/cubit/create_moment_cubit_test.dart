import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/create_moment/domain/enum/create_moment_direct_enum.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';
import 'package:music_app/features/create_moment/domain/usecases/get_tags_usecase.dart';
import 'package:music_app/features/create_moment/presentation/cubit/create_moment_cubit.dart';

class MockGetTagsUseCase extends Mock implements GetTagsUseCase {}

const tTags = [
  TagEntity(id: '1', name: 'rock', normalizedName: 'rock'),
  TagEntity(id: '2', name: 'jazz', normalizedName: 'jazz'),
];

const tCacheFailure = CacheFailure(message: 'DB error');

void main() {
  late MockGetTagsUseCase mockGetTagsUseCase;

  setUp(() {
    mockGetTagsUseCase = MockGetTagsUseCase();
  });

  CreateMomentCubit buildCubit() =>
      CreateMomentCubit(getTagsUseCase: mockGetTagsUseCase);

  group('CreateMomentCubit', () {
    test('initial state has correct defaults', () {
      when(() => mockGetTagsUseCase()).thenAnswer((_) async => const Right([]));
      final cubit = buildCubit();

      expect(cubit.state.tagsSelected, isEmpty);
      expect(cubit.state.tagsSuggestions.isInitial, isTrue);
      expect(cubit.state.inputText, '');
      expect(cubit.state.hideFromWidget, isFalse);
      expect(cubit.state.isLockMoment, isFalse);
      expect(cubit.state.isLoved, isFalse);
      expect(cubit.state.note, isNull);
      expect(cubit.state.momentDate, isNull);
      expect(cubit.state.timeStamp, 0);
    });

    group('loadTagsSuggestions', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'emits loading then success when use case returns Right',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right(tTags));
        },
        act: (cubit) => cubit.loadTagsSuggestions(),
        expect: () => [
          isA<CreateMomentState>().having(
            (s) => s.tagsSuggestions.isLoading,
            'tagsSuggestions.isLoading',
            isTrue,
          ),
          isA<CreateMomentState>().having(
            (s) => s.tagsSuggestions.isSuccess,
            'tagsSuggestions.isSuccess',
            isTrue,
          ),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'emits loading then failure when use case returns Left',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Left(tCacheFailure));
        },
        act: (cubit) => cubit.loadTagsSuggestions(),
        expect: () => [
          isA<CreateMomentState>().having(
            (s) => s.tagsSuggestions.isLoading,
            'tagsSuggestions.isLoading',
            isTrue,
          ),
          isA<CreateMomentState>().having(
            (s) => s.tagsSuggestions.isFailure,
            'tagsSuggestions.isFailure',
            isTrue,
          ),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'success state contains the returned tag list',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right(tTags));
        },
        act: (cubit) => cubit.loadTagsSuggestions(),
        verify: (cubit) {
          expect(cubit.state.tagsSuggestions.data, tTags);
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'failure state contains the error message',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Left(tCacheFailure));
        },
        act: (cubit) => cubit.loadTagsSuggestions(),
        verify: (cubit) {
          expect(cubit.state.tagsSuggestions.error, 'DB error');
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'success state contains empty list when repository returns no tags',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.loadTagsSuggestions(),
        verify: (cubit) {
          expect(cubit.state.tagsSuggestions.isSuccess, isTrue);
          expect(cubit.state.tagsSuggestions.data, isEmpty);
        },
      );
    });

    group('updateInputText', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'updates inputText in state',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.updateInputText('hello'),
        expect: () => [
          isA<CreateMomentState>()
              .having((s) => s.inputText, 'inputText', 'hello'),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'updates inputText to empty string',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.updateInputText(''),
        expect: () => [
          isA<CreateMomentState>()
              .having((s) => s.inputText, 'inputText', ''),
        ],
      );
    });

    group('toggleHiddenWidget', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'sets hideFromWidget to true when toggled on',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.toggleHiddenWidget(true),
        expect: () => [
          isA<CreateMomentState>()
              .having((s) => s.hideFromWidget, 'hideFromWidget', isTrue),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'emits no state when value is same as current',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        // Initial value is false, toggling false again should not emit
        act: (cubit) => cubit.toggleHiddenWidget(false),
        expect: () => <CreateMomentState>[],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'sets hideFromWidget back to false after being true',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.toggleHiddenWidget(true);
          cubit.toggleHiddenWidget(false);
        },
        expect: () => [
          isA<CreateMomentState>()
              .having((s) => s.hideFromWidget, 'hideFromWidget', isTrue),
          isA<CreateMomentState>()
              .having((s) => s.hideFromWidget, 'hideFromWidget', isFalse),
        ],
      );
    });

    group('toggleLoved', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'sets isLoved to true when toggled on',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.toggleLoved(true),
        expect: () => [
          isA<CreateMomentState>()
              .having((s) => s.isLoved, 'isLoved', isTrue),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'emits no state when value is same as current',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.toggleLoved(false),
        expect: () => <CreateMomentState>[],
      );
    });

    group('toggleLockedMoment', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'sets isLockMoment to true when toggled on',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.toggleLockedMoment(true),
        expect: () => [
          isA<CreateMomentState>()
              .having((s) => s.isLockMoment, 'isLockMoment', isTrue),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'emits no state when value is same as current',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.toggleLockedMoment(false),
        expect: () => <CreateMomentState>[],
      );
    });

    group('addTag', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'adds a normalized tag to tagsSelected',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.addTag('Rock'),
        expect: () => [
          isA<CreateMomentState>().having(
            (s) => s.tagsSelected.length,
            'tagsSelected.length',
            1,
          ),
        ],
        verify: (cubit) {
          expect(cubit.state.tagsSelected.first.normalizedName, 'rock');
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'does not add duplicate tag with same normalized name',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.addTag('rock');
          cubit.addTag('ROCK');
          cubit.addTag('#rock');
        },
        verify: (cubit) {
          expect(cubit.state.tagsSelected.length, 1);
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'ignores empty tag name after trimming',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.addTag('   '),
        expect: () => <CreateMomentState>[],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'ignores tag name that is only hash symbols',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.addTag('#'),
        expect: () => <CreateMomentState>[],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'normalizes tag name: trims, lowercases, removes hash',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.addTag('  #Jazz  '),
        verify: (cubit) {
          expect(cubit.state.tagsSelected.first.normalizedName, 'jazz');
          expect(cubit.state.tagsSelected.first.name, 'jazz');
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'can add multiple distinct tags',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.addTag('rock');
          cubit.addTag('jazz');
          cubit.addTag('pop');
        },
        verify: (cubit) {
          expect(cubit.state.tagsSelected.length, 3);
        },
      );
    });

    group('addTagFromSuggestion', () {
      const suggestedTag = TagEntity(
        id: 'suggested-1',
        name: 'blues',
        normalizedName: 'blues',
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'adds a suggested tag to tagsSelected',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.addTagFromSuggestion(suggestedTag),
        verify: (cubit) {
          expect(cubit.state.tagsSelected, contains(suggestedTag));
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'does not add duplicate tag with same id',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.addTagFromSuggestion(suggestedTag);
          cubit.addTagFromSuggestion(suggestedTag);
        },
        verify: (cubit) {
          expect(cubit.state.tagsSelected.length, 1);
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'does not add suggestion if same normalizedName already exists in tagsSelected',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          // Add via addTag first (creates a different id but same normalizedName)
          cubit.addTag('blues');
          // Then try suggestion with same normalizedName
          cubit.addTagFromSuggestion(suggestedTag);
        },
        verify: (cubit) {
          expect(cubit.state.tagsSelected.length, 1);
        },
      );
    });

    group('removeTag', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'removes a tag by id',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.addTag('rock');
          final tagId = cubit.state.tagsSelected.first.id;
          cubit.removeTag(tagId);
        },
        verify: (cubit) {
          expect(cubit.state.tagsSelected, isEmpty);
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'only removes the targeted tag, leaving others intact',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.addTag('rock');
          cubit.addTag('jazz');
          final rockId = cubit.state.tagsSelected
              .firstWhere((t) => t.normalizedName == 'rock')
              .id;
          cubit.removeTag(rockId);
        },
        verify: (cubit) {
          expect(cubit.state.tagsSelected.length, 1);
          expect(cubit.state.tagsSelected.first.normalizedName, 'jazz');
        },
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'does nothing when tag id does not exist',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.addTag('rock');
          cubit.removeTag('nonexistent-id');
        },
        verify: (cubit) {
          expect(cubit.state.tagsSelected.length, 1);
        },
      );
    });

    group('showDevelopmentDialog', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'emits state with showDialogDevelopment enum',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.showDevelopmentDialog(),
        expect: () => [
          isA<CreateMomentState>().having(
            (s) => s.createMomentDirectEnum,
            'createMomentDirectEnum',
            CreateMomentDirectEnum.showDialogDevelopment,
          ),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'updates timeStamp when showing development dialog',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.showDevelopmentDialog(),
        verify: (cubit) {
          expect(cubit.state.timeStamp, isNot(0));
        },
      );
    });

    group('onChangeNote', () {
      blocTest<CreateMomentCubit, CreateMomentState>(
        'updates note in state',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) => cubit.onChangeNote('my note'),
        expect: () => [
          isA<CreateMomentState>()
              .having((s) => s.note, 'note', 'my note'),
        ],
      );

      blocTest<CreateMomentCubit, CreateMomentState>(
        'allows clearing note with null',
        build: buildCubit,
        setUp: () {
          when(() => mockGetTagsUseCase())
              .thenAnswer((_) async => const Right([]));
        },
        act: (cubit) async {
          cubit.onChangeNote('some note');
          cubit.onChangeNote(null);
        },
        verify: (cubit) {
          expect(cubit.state.note, isNull);
        },
      );
    });
  });
}

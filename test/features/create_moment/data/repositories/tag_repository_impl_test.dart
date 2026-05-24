import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/create_moment/data/repositories/tag_repository_impl.dart';
import 'package:music_app/features/create_moment/domain/models/tag_entity.dart';

void main() {
  late AppDatabase db;
  late TagRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repository = TagRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  /// Helper to insert a tag directly into the database for test setup.
  Future<void> insertTag({
    required String id,
    required String name,
    required String normalizedName,
    String? colorHex,
    String? groupKey,
    int usageCount = 0,
  }) async {
    final now = DateTime.now();
    await db.into(db.momentTags).insert(
          MomentTagsCompanion.insert(
            id: id,
            name: name,
            normalizedName: normalizedName,
            colorHex: Value(colorHex),
            groupKey: Value(groupKey),
            usageCount: Value(usageCount),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  group('TagRepositoryImpl', () {
    group('getTags', () {
      test('returns Right with empty list when no tags exist', () async {
        final result = await repository.getTags();

        expect(result.isRight(), isTrue);
        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tags) => expect(tags, isEmpty),
        );
      });

      test('returns Right with all tags when tags exist', () async {
        await insertTag(id: '1', name: 'rock', normalizedName: 'rock');
        await insertTag(id: '2', name: 'jazz', normalizedName: 'jazz');

        final result = await repository.getTags();

        expect(result.isRight(), isTrue);
        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tags) {
            expect(tags.length, 2);
            expect(tags.map((t) => t.id), containsAll(['1', '2']));
          },
        );
      });

      test('maps database row to TagEntity correctly', () async {
        final now = DateTime.now();
        await db.into(db.momentTags).insert(
              MomentTagsCompanion.insert(
                id: 'tag-1',
                name: 'Pop Music',
                normalizedName: 'pop music',
                colorHex: const Value('#FF5733'),
                groupKey: const Value('genre'),
                usageCount: const Value(7),
                createdAt: now,
                updatedAt: now,
              ),
            );

        final result = await repository.getTags();

        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tags) {
            final tag = tags.first;
            expect(tag.id, 'tag-1');
            expect(tag.name, 'Pop Music');
            expect(tag.normalizedName, 'pop music');
            expect(tag.colorHex, '#FF5733');
            expect(tag.groupKey, 'genre');
            expect(tag.usageCount, 7);
          },
        );
      });

      test('maps null optional fields in TagEntity correctly', () async {
        await insertTag(id: '1', name: 'rock', normalizedName: 'rock');

        final result = await repository.getTags();

        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tags) {
            final tag = tags.first;
            expect(tag.colorHex, isNull);
            expect(tag.groupKey, isNull);
          },
        );
      });
    });

    group('createTag', () {
      test('returns Right(TagEntity) for a new tag name', () async {
        final result = await repository.createTag('rock');

        expect(result.isRight(), isTrue);
        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) {
            expect(tag, isA<TagEntity>());
            expect(tag.name, 'rock');
            expect(tag.normalizedName, 'rock');
          },
        );
      });

      test('normalizes tag name: trims whitespace', () async {
        final result = await repository.createTag('  jazz  ');

        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) {
            expect(tag.normalizedName, 'jazz');
            expect(tag.name, 'jazz');
          },
        );
      });

      test('normalizes tag name: converts to lowercase', () async {
        final result = await repository.createTag('ROCK');

        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) {
            expect(tag.normalizedName, 'rock');
          },
        );
      });

      test('normalizes tag name: removes hash symbols', () async {
        final result = await repository.createTag('#pop');

        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) {
            expect(tag.normalizedName, 'pop');
          },
        );
      });

      test('normalizes tag: trims, lowercases, and removes hash together', () async {
        final result = await repository.createTag('  #Jazz  ');

        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) {
            expect(tag.normalizedName, 'jazz');
          },
        );
      });

      test('returns existing tag when normalized name already exists', () async {
        // Insert an existing tag
        final firstResult = await repository.createTag('rock');
        late String firstId;
        firstResult.fold(
          (_) => fail('First creation failed'),
          (tag) => firstId = tag.id,
        );

        // Try creating with same name again
        final secondResult = await repository.createTag('rock');

        secondResult.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) => expect(tag.id, firstId),
        );
      });

      test('returns existing tag when name matches after normalization', () async {
        // Create initial tag
        final firstResult = await repository.createTag('rock');
        late String firstId;
        firstResult.fold(
          (_) => fail('First creation failed'),
          (tag) => firstId = tag.id,
        );

        // Try with #ROCK (normalizes to 'rock')
        final secondResult = await repository.createTag('#ROCK');

        secondResult.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) => expect(tag.id, firstId),
        );
      });

      test('persists the new tag so it can be retrieved via getTags', () async {
        await repository.createTag('blues');

        final tagsResult = await repository.getTags();
        tagsResult.fold(
          (_) => fail('Expected Right but got Left'),
          (tags) {
            expect(tags.any((t) => t.normalizedName == 'blues'), isTrue);
          },
        );
      });

      test('assigns a non-empty id to the created tag', () async {
        final result = await repository.createTag('metal');

        result.fold(
          (_) => fail('Expected Right but got Left'),
          (tag) => expect(tag.id, isNotEmpty),
        );
      });
    });

    group('deleteTag', () {
      test('returns Right(unit) when tag exists and is deleted', () async {
        await insertTag(id: 'del-1', name: 'rock', normalizedName: 'rock');

        final result = await repository.deleteTag('del-1');

        expect(result.isRight(), isTrue);
      });

      test('removes the tag from database after deletion', () async {
        await insertTag(id: 'del-1', name: 'rock', normalizedName: 'rock');

        await repository.deleteTag('del-1');

        final tagsResult = await repository.getTags();
        tagsResult.fold(
          (_) => fail('Expected Right but got Left'),
          (tags) => expect(tags.any((t) => t.id == 'del-1'), isFalse),
        );
      });

      test('returns Right(unit) even when tag id does not exist', () async {
        // Drift delete with where clause silently does nothing if no row matches
        final result = await repository.deleteTag('nonexistent-id');

        expect(result.isRight(), isTrue);
      });

      test('only deletes the targeted tag, leaving others intact', () async {
        await insertTag(id: '1', name: 'rock', normalizedName: 'rock');
        await insertTag(id: '2', name: 'jazz', normalizedName: 'jazz');

        await repository.deleteTag('1');

        final tagsResult = await repository.getTags();
        tagsResult.fold(
          (_) => fail('Expected Right but got Left'),
          (tags) {
            expect(tags.length, 1);
            expect(tags.first.id, '2');
          },
        );
      });
    });
  });
}
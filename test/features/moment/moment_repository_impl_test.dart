import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/moment/data/repositories/moment_repository_impl.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/tag_entity.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('AppDatabase', () {
    test('fresh in-memory db is seeded with basic mood and tone packs', () async {
      final moods = await db.select(db.momentMoods).get();
      final tones = await db.select(db.momentTones).get();
      expect(moods, isNotEmpty);
      expect(tones, isNotEmpty);
    });
  });

  group('createMoment tags', () {
    late MomentRepositoryImpl repo;

    setUp(() {
      repo = MomentRepositoryImpl(db);
    });

    test('reuses active tag and ignores soft-deleted tag with same normalized name', () async {
      final now = DateTime.now();

      // Insert a soft-deleted tag with normalizedName='trip'
      await db.into(db.momentTags).insert(
        MomentTagsCompanion.insert(
          id: 'deleted-1',
          name: 'trip',
          normalizedName: 'trip',
          createdAt: now,
          updatedAt: now,
          deletedAt: Value(now),
        ),
      );

      // Insert an active tag with normalizedName='trip'
      await db.into(db.momentTags).insert(
        MomentTagsCompanion.insert(
          id: 'active-1',
          name: 'Trip',
          normalizedName: 'trip',
          createdAt: now,
          updatedAt: now,
        ),
      );

      final params = CreateMomentParams(
        momentDate: now,
        tags: [const TagEntity(id: '', name: 'Trip', normalizedName: 'trip')],
        isFavorite: false,
        isHiddenFromWidget: false,
        isLocked: false,
      );

      final result = await repo.createMoment(params);

      expect(result.isRight(), true);
      final entity = result.getOrElse(() => throw StateError('expected Right'));
      expect(entity.tags.single.id, 'active-1');
    });

    test('new tag keeps original display casing', () async {
      final now = DateTime.now();

      final params = CreateMomentParams(
        momentDate: now,
        tags: [const TagEntity(id: '', name: 'Summer Trip', normalizedName: 'summer trip')],
        isFavorite: false,
        isHiddenFromWidget: false,
        isLocked: false,
      );

      final result = await repo.createMoment(params);

      expect(result.isRight(), true);
      final entity = result.getOrElse(() => throw StateError('expected Right'));
      expect(entity.tags.single.name, 'Summer Trip');
      expect(entity.tags.single.normalizedName, 'summer trip');
    });
  });
}

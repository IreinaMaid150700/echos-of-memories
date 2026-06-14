import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/features/moment/data/repositories/moment_repository_impl.dart';
import 'package:music_app/features/moment/domain/models/create_moment_params.dart';
import 'package:music_app/features/moment/domain/models/moment_asset_input.dart';
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

  group('read models', () {
    late MomentRepositoryImpl repo;

    setUp(() {
      repo = MomentRepositoryImpl(db);
    });

    Future<({String moodId, String toneId})> seededIds() async {
      final mood = await (db.select(db.momentMoods)..limit(1)).getSingle();
      final tone = await (db.select(db.momentTones)..limit(1)).getSingle();
      return (moodId: mood.id, toneId: tone.id);
    }

    test('createMoment returns detail with resolved mood, tone, assets, cover', () async {
      final ids = await seededIds();
      final now = DateTime.now();

      final params = CreateMomentParams(
        title: 'Chuyến đi',
        momentDate: now,
        tags: [],
        isFavorite: false,
        isHiddenFromWidget: false,
        isLocked: false,
        moodId: ids.moodId,
        toneId: ids.toneId,
        assets: [
          const MomentAssetInput(path: '/a/1.jpg', width: 100, height: 100, fileSize: 1000, sortOrder: 0),
          const MomentAssetInput(path: '/a/2.jpg', width: 200, height: 200, fileSize: 2000, sortOrder: 1),
        ],
      );

      final result = await repo.createMoment(params);
      expect(result.isRight(), true);
      final detail = result.getOrElse(() => throw StateError('expected Right'));

      expect(detail.mood?.id, ids.moodId);
      expect(detail.mood?.emoji, isNotEmpty);
      expect(detail.tone?.id, ids.toneId);
      expect(detail.assets.length, 2);
      expect(detail.assets.first.path, '/a/1.jpg');
    });

    test('watchMomentSummaries emits summary with mood, tone, coverAssetPath, tags', () async {
      final ids = await seededIds();
      final now = DateTime.now();

      final params = CreateMomentParams(
        title: 'Chuyến đi',
        momentDate: now,
        tags: [const TagEntity(id: '', name: 'trip', normalizedName: 'trip')],
        isFavorite: false,
        isHiddenFromWidget: false,
        isLocked: false,
        moodId: ids.moodId,
        toneId: ids.toneId,
        assets: [
          const MomentAssetInput(path: '/a/1.jpg', width: 100, height: 100, fileSize: 1000, sortOrder: 0),
        ],
      );

      await repo.createMoment(params);

      final summaries = await repo.watchMomentSummaries().first;
      expect(summaries.length, 1);
      final s = summaries.first;
      expect(s.mood?.id, ids.moodId);
      expect(s.tone?.id, ids.toneId);
      expect(s.coverAssetPath, '/a/1.jpg');
      expect(s.tags.single.normalizedName, 'trip');
    });

    test('getMomentDetail returns assets sorted', () async {
      final ids = await seededIds();
      final now = DateTime.now();

      final params = CreateMomentParams(
        momentDate: now,
        tags: [],
        isFavorite: false,
        isHiddenFromWidget: false,
        isLocked: false,
        moodId: ids.moodId,
        toneId: ids.toneId,
        assets: [
          const MomentAssetInput(path: '/a/1.jpg', width: 100, height: 100, fileSize: 1000, sortOrder: 0),
          const MomentAssetInput(path: '/a/2.jpg', width: 200, height: 200, fileSize: 2000, sortOrder: 1),
        ],
      );

      final createResult = await repo.createMoment(params);
      final id = createResult.getOrElse(() => throw StateError('expected Right')).id;

      final result = await repo.getMomentDetail(id);
      expect(result.isRight(), true);
      final detail = result.getOrElse(() => throw StateError('expected Right'));
      expect(detail.assets.map((a) => a.sortOrder).toList(), [0, 1]);
      expect(detail.mood?.id, ids.moodId);
    });

    test('watchMomentSummaries excludes soft-deleted moments', () async {
      final ids = await seededIds();
      final now = DateTime.now();

      final params = CreateMomentParams(
        momentDate: now,
        tags: [],
        isFavorite: false,
        isHiddenFromWidget: false,
        isLocked: false,
        moodId: ids.moodId,
        toneId: ids.toneId,
        assets: [],
      );

      final createResult = await repo.createMoment(params);
      final id = createResult.getOrElse(() => throw StateError('expected Right')).id;

      await repo.deleteMoment(id);

      final summaries = await repo.watchMomentSummaries().first;
      expect(summaries, isEmpty);
    });
  });
}

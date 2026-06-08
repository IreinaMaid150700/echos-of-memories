import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/app_settings_table.dart';
import 'tables/moment_assets_table.dart';
import 'tables/moment_collection_items_table.dart';
import 'tables/moment_collections_table.dart';
import 'tables/moment_mood_packs_table.dart';
import 'tables/moment_moods_table.dart';
import 'tables/moment_tag_links_table.dart';
import 'tables/moment_tags_table.dart';
import 'tables/moment_tone_packs_table.dart';
import 'tables/moment_tones_table.dart';
import 'tables/moment_widget_configs_table.dart';
import 'tables/moments_table.dart';
import 'seed/default_packs_seed_data.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Moments,
  MomentAssets,
  MomentMoodPacks,
  MomentMoods,
  MomentTags,
  MomentTagLinks,
  MomentCollections,
  MomentCollectionItems,
  MomentWidgetConfigs,
  MomentTonePacks,
  MomentTones,
  AppSettings,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
        await _seedDefaultPacks();
      },
      onCreate: (Migrator m) async {
        await m.createAll();

        // Partial index for timeline — covers both deleted filter and date sort
        await m.createIndex(
          Index('idx_moments_timeline',
              'CREATE INDEX idx_moments_timeline ON moments(moment_date DESC) WHERE deleted_at IS NULL'),
        );
        await m.createIndex(
          Index('idx_moments_deleted_at',
              'CREATE INDEX idx_moments_deleted_at ON moments(deleted_at)'),
        );
        // Partial index — plain bool index has near-zero cardinality benefit
        await m.createIndex(
          Index('idx_moments_is_favorite',
              'CREATE INDEX idx_moments_is_favorite ON moments(moment_date DESC) WHERE deleted_at IS NULL AND is_favorite = 1'),
        );

        await m.createIndex(
          Index('idx_moment_assets_moment_id',
              'CREATE INDEX idx_moment_assets_moment_id ON moment_assets(moment_id)'),
        );
        await m.createIndex(
          Index('idx_moment_assets_moment_sort_order',
              'CREATE INDEX idx_moment_assets_moment_sort_order ON moment_assets(moment_id, sort_order)'),
        );

        await m.createIndex(
          Index('idx_moment_tag_links_moment_id',
              'CREATE INDEX idx_moment_tag_links_moment_id ON moment_tag_links(moment_id)'),
        );
        await m.createIndex(
          Index('idx_moment_tag_links_tag_id',
              'CREATE INDEX idx_moment_tag_links_tag_id ON moment_tag_links(tag_id)'),
        );

        await m.createIndex(
          Index('idx_moment_collection_items_collection_id',
              'CREATE INDEX idx_moment_collection_items_collection_id ON moment_collection_items(collection_id)'),
        );
        await m.createIndex(
          Index('idx_moment_collection_items_moment_id',
              'CREATE INDEX idx_moment_collection_items_moment_id ON moment_collection_items(moment_id)'),
        );

        await m.createIndex(
          Index('idx_moment_tones_tone_pack_id',
              'CREATE INDEX idx_moment_tones_tone_pack_id ON moment_tones(tone_pack_id)'),
        );

        // Unique partial index — prevents duplicate normalized tags (ignores soft-deleted)
        await m.createIndex(
          Index('idx_moment_tags_normalized_name_unique',
              'CREATE UNIQUE INDEX idx_moment_tags_normalized_name_unique ON moment_tags(normalized_name) WHERE deleted_at IS NULL'),
        );
      },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }

  /// Seeds the built-in "Basic" mood & tone packs. Idempotent — runs on every
  /// open and inserts only rows that don't already exist (keyed by id), so it
  /// self-heals if a user/dev deletes seeded rows.
  Future<void> _seedDefaultPacks() async {
    await transaction(() async {
      final now = DateTime.now();

      await into(momentMoodPacks).insert(
        MomentMoodPacksCompanion.insert(
          id: kBasicMoodPackId,
          code: kBasicMoodPackCode,
          name: kBasicMoodPackName,
          isBuiltIn: const Value(true),
          isEnabled: const Value(true),
          createdAt: now,
          updatedAt: now,
        ),
        mode: InsertMode.insertOrIgnore,
      );
      for (final mood in kBasicMoods) {
        await into(momentMoods).insert(
          MomentMoodsCompanion.insert(
            id: mood.id,
            code: mood.code,
            moodPackId: kBasicMoodPackId,
            name: mood.name,
            emoji: mood.emoji,
            key: mood.key,
            colorHex: Value(mood.colorHex),
            createdAt: now,
            updatedAt: now,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      }

      await into(momentTonePacks).insert(
        MomentTonePacksCompanion.insert(
          id: kBasicTonePackId,
          code: kBasicTonePackCode,
          name: kBasicTonePackName,
          isBuiltIn: const Value(true),
          isEnabled: const Value(true),
          createdAt: now,
          updatedAt: now,
        ),
        mode: InsertMode.insertOrIgnore,
      );
      for (final tone in kBasicTones) {
        await into(momentTones).insert(
          MomentTonesCompanion.insert(
            id: tone.id,
            code: tone.code,
            tonePackId: kBasicTonePackId,
            name: tone.name,
            key: tone.key,
            lightColorHex: tone.lightColorHex,
            darkColorHex: Value(tone.darkColorHex),
            sortOrder: Value(tone.sortOrder),
            createdAt: now,
            updatedAt: now,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'save_your_memories.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

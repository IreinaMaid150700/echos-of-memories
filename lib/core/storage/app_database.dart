import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/app_settings_table.dart';
import 'tables/app_themes_table.dart';
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

@DriftDatabase(
  tables: [
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
    AppThemes,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// In-memory or arbitrary executor for testing. Do NOT use in production.
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
        if (details.wasCreated) {
          await _seedDefaultPacks();
          await _seedDefaultThemes();
        }
      },
      onCreate: (Migrator m) async {
        await m.createAll();

        // Partial index for timeline — covers both deleted filter and date sort
        await m.createIndex(
          Index(
            'idx_moments_timeline',
            'CREATE INDEX idx_moments_timeline ON moments(moment_date DESC) WHERE deleted_at IS NULL',
          ),
        );
        await m.createIndex(
          Index(
            'idx_moments_deleted_at',
            'CREATE INDEX idx_moments_deleted_at ON moments(deleted_at)',
          ),
        );
        // Partial index — plain bool index has near-zero cardinality benefit
        await m.createIndex(
          Index(
            'idx_moments_is_favorite',
            'CREATE INDEX idx_moments_is_favorite ON moments(moment_date DESC) WHERE deleted_at IS NULL AND is_favorite = 1',
          ),
        );

        await m.createIndex(
          Index(
            'idx_moment_assets_moment_id',
            'CREATE INDEX idx_moment_assets_moment_id ON moment_assets(moment_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_moment_assets_moment_sort_order',
            'CREATE INDEX idx_moment_assets_moment_sort_order ON moment_assets(moment_id, sort_order)',
          ),
        );

        await m.createIndex(
          Index(
            'idx_moment_tag_links_moment_id',
            'CREATE INDEX idx_moment_tag_links_moment_id ON moment_tag_links(moment_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_moment_tag_links_tag_id',
            'CREATE INDEX idx_moment_tag_links_tag_id ON moment_tag_links(tag_id)',
          ),
        );

        await m.createIndex(
          Index(
            'idx_moment_collection_items_collection_id',
            'CREATE INDEX idx_moment_collection_items_collection_id ON moment_collection_items(collection_id)',
          ),
        );
        await m.createIndex(
          Index(
            'idx_moment_collection_items_moment_id',
            'CREATE INDEX idx_moment_collection_items_moment_id ON moment_collection_items(moment_id)',
          ),
        );

        await m.createIndex(
          Index(
            'idx_moment_tones_tone_pack_id',
            'CREATE INDEX idx_moment_tones_tone_pack_id ON moment_tones(tone_pack_id)',
          ),
        );

        // Unique partial index — prevents duplicate normalized tags (ignores soft-deleted)
        await m.createIndex(
          Index(
            'idx_moment_tags_normalized_name_unique',
            'CREATE UNIQUE INDEX idx_moment_tags_normalized_name_unique ON moment_tags(normalized_name) WHERE deleted_at IS NULL',
          ),
        );
      },
      // MIGRATION WORKFLOW — required when changing schema:
      // 1. Edit table definition + increment schemaVersion.
      // 2. Dump new schema:
      //    fvm dart run drift_dev schema dump lib/core/storage/app_database.dart drift_schemas/drift_schema_vN.json
      // 3. Write migration steps here (m.addColumn / m.alterTable / ...).
      // 4. Write migration test using drift_dev schema steps + verify old data preserved.
      // Leaving onUpgrade empty when schemaVersion increases = user update causes crash or data loss.
      onUpgrade: (Migrator m, int from, int to) async {
        // v1 -> v2: app lock for collections. Existing rows default to unlocked.
        if (from < 2) {
          await m.addColumn(momentCollections, momentCollections.isLocked);
        }
        if (from < 3) {
          await m.createTable(appThemes);
          await _seedDefaultThemes();
        }
      },
    );
  }

  /// Seeds the built-in selectable themes. Runs on first DB creation and on
  /// upgrade to schema v3. Idempotent via insertOrIgnore by id.
  Future<void> _seedDefaultThemes() async {
    await transaction(() async {
      final now = DateTime.now();
      for (final theme in kDefaultThemes) {
        await into(appThemes).insert(
          AppThemesCompanion.insert(
            id: theme.id,
            name: theme.name,
            sortOrder: Value(theme.sortOrder),
            isBuiltIn: Value(theme.isBuiltIn),
            lightColors: jsonEncode(theme.light.toJson()),
            darkColors: jsonEncode(theme.dark.toJson()),
            updatedAt: now,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      }
    });
  }

  /// Seeds the built-in "Basic" mood & tone packs. Runs once when the database
  /// file is first created (`details.wasCreated`). Idempotent via
  /// insertOrIgnore as a safety net.
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

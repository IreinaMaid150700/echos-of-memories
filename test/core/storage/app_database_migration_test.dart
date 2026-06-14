import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/storage/app_database.dart';

import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('AppDatabase migration v1 -> v2', () {
    test(
      'adds isLocked to moment_collections (default false) and preserves data',
      () async {
        // Seed a v1 database with a collection row via raw SQL (the generated
        // v1 schema tables have no typed companions).
        final schema = await verifier.schemaAt(1);
        final v1Db = v1.DatabaseAtV1(schema.newConnection());
        final epoch = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        await v1Db.customStatement(
          'INSERT INTO moment_collections '
          '(id, name, sort_order, is_pinned, created_at, updated_at) '
          'VALUES (?, ?, 0, 0, ?, ?)',
          ['col-1', 'Kỷ niệm cũ', epoch, epoch],
        );
        await v1Db.close();

        // Run the real migration against the seeded v1 db.
        final db = AppDatabase.forTesting(schema.newConnection());
        await verifier.migrateAndValidate(db, 2);

        final row = await (db.select(
          db.momentCollections,
        )..where((t) => t.id.equals('col-1'))).getSingle();
        expect(row.name, 'Kỷ niệm cũ');
        expect(row.isLocked, isFalse);
        await db.close();
      },
    );

    test('isLocked column is writable after migration', () async {
      final schema = await verifier.schemaAt(1);
      final v1Db = v1.DatabaseAtV1(schema.newConnection());
      final epoch = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await v1Db.customStatement(
        'INSERT INTO moment_collections '
        '(id, name, sort_order, is_pinned, created_at, updated_at) '
        'VALUES (?, ?, 0, 0, ?, ?)',
        ['col-2', 'Album', epoch, epoch],
      );
      await v1Db.close();

      final db = AppDatabase.forTesting(schema.newConnection());
      await verifier.migrateAndValidate(db, 2);

      await (db.update(db.momentCollections)
            ..where((t) => t.id.equals('col-2')))
          .write(const MomentCollectionsCompanion(isLocked: Value(true)));

      final row = await (db.select(
        db.momentCollections,
      )..where((t) => t.id.equals('col-2'))).getSingle();
      expect(row.isLocked, isTrue);
      await db.close();
    });
  });

  group('AppDatabase migration v2 -> v3', () {
    test('creates app_themes and seeds 6 built-in themes', () async {
      final schema = await verifier.schemaAt(2);
      final v2Db = v2.DatabaseAtV2(schema.newConnection());
      // Touch the v2 db so the file exists with the v2 schema.
      await v2Db.customStatement('SELECT 1');
      await v2Db.close();

      final db = AppDatabase.forTesting(schema.newConnection());
      await verifier.migrateAndValidate(db, 3);

      final rows = await db.select(db.appThemes).get();
      expect(rows.length, 6);
      expect(rows.map((r) => r.id), contains('warm_sand'));
      await db.close();
    });
  });
}

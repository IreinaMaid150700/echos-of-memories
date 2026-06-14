import 'package:drift/drift.dart';

import 'moment_moods_table.dart';
import 'moment_tones_table.dart';

class Moments extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().nullable()();
  TextColumn get note => text().nullable()();
  // No FK to MomentAssets: assets already FK back to Moments (cascade) —
  // adding this direction creates a circular reference; SQLite requires
  // table rebuild to add FK via ALTER TABLE. Integrity is enforced in
  // MomentRepositoryImpl: coverAssetId is always an asset id inserted
  // in the same createMoment transaction.
  TextColumn get coverAssetId => text().nullable()();
  TextColumn get moodId => text().nullable().references(
    MomentMoods,
    #id,
    onDelete: KeyAction.setNull,
  )();
  DateTimeColumn get momentDate => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get locationName => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get country => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isHiddenFromWidget =>
      boolean().withDefault(const Constant(false))();
  TextColumn get deviceId => text()();
  IntColumn get schemaVersion => integer().withDefault(const Constant(1))();
  BoolColumn get isLocked => boolean().withDefault(const Constant(false))();
  BoolColumn get isSensitive => boolean().withDefault(const Constant(false))();
  TextColumn get toneId => text().nullable().references(
    MomentTones,
    #id,
    onDelete: KeyAction.setNull,
  )();

  @override
  Set<Column> get primaryKey => {id};
}

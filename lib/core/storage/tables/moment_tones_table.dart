import 'package:drift/drift.dart';

import 'moment_tone_packs_table.dart';

class MomentTones extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get tonePackId => text().references(MomentTonePacks, #id)();
  TextColumn get name => text()();
  TextColumn get key => text()();
  TextColumn get lightColorHex => text()();
  TextColumn get darkColorHex => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {tonePackId, key},
    {tonePackId, code},
  ];
}

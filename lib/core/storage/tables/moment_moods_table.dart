import 'package:drift/drift.dart';

import 'moment_mood_packs_table.dart';

class MomentMoods extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get moodPackId => text().references(MomentMoodPacks, #id)();
  TextColumn get name => text()();
  TextColumn get emoji => text()();
  TextColumn get key => text()();
  TextColumn get colorHex => text().nullable()();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {moodPackId, key},
    {moodPackId, code},
  ];
}

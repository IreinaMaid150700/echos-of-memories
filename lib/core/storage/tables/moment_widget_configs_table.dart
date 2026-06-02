import 'package:drift/drift.dart';

import 'moments_table.dart';

class MomentWidgetConfigs extends Table {
  TextColumn get id => text()();
  TextColumn get mode => text()();
  TextColumn get fixedMomentId => text().nullable().references(Moments, #id, onDelete: KeyAction.setNull)();
  BoolColumn get excludeSensitive => boolean().withDefault(const Constant(true))();
  BoolColumn get excludeHiddenFromWidget => boolean().withDefault(const Constant(true))();
  BoolColumn get includeDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

import 'package:drift/drift.dart';

class MomentWidgetConfigs extends Table {
  TextColumn get id => text()();
  TextColumn get mode => text()();
  TextColumn get fixedMomentId => text().nullable()();
  BoolColumn get excludeSensitive => boolean().withDefault(const Constant(true))();
  BoolColumn get excludeHiddenFromWidget => boolean().withDefault(const Constant(true))();
  BoolColumn get includeDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

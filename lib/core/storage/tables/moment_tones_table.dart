import 'package:drift/drift.dart';

class MomentTones extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get tonePackId => text()();
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
}
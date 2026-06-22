import 'package:drift/drift.dart';

/// Selectable color themes. `lightColors` / `darkColors` hold the serialized
/// `ThemePaletteColors` JSON (a `{fieldName: "#RRGGBB"}` map).
class AppThemes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isBuiltIn => boolean().withDefault(const Constant(true))();
  TextColumn get lightColors => text()();
  TextColumn get darkColors => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

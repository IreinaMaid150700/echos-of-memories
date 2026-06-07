import 'package:music_app/core/storage/app_database.dart';

/// Metadata describing a single table in the Drift database.
class TableMeta {
  final String name;
  final List<String> columns;

  const TableMeta({required this.name, required this.columns});
}

/// A single row read from a table, paired with its SQLite `rowid` so it can be
/// deleted unambiguously regardless of the table's primary key shape.
class DbRow {
  final int rowid;
  final Map<String, dynamic> data;

  const DbRow({required this.rowid, required this.data});
}

/// Dev-only thin wrapper over [AppDatabase] that introspects every table
/// generically (via `allTables`) and runs raw read/delete statements.
///
/// Table names are always validated against the live `allTables` whitelist
/// before being interpolated into SQL — callers pick from that list, so there
/// is no free-text SQL surface here.
class DevDbInspector {
  final AppDatabase _db;

  DevDbInspector(this._db);

  /// All tables, alphabetically sorted, with their column names.
  List<TableMeta> tables() {
    final metas = _db.allTables
        .map(
          (t) => TableMeta(
            name: t.actualTableName,
            columns: t.$columns.map((c) => c.name).toList(),
          ),
        )
        .toList();
    metas.sort((a, b) => a.name.compareTo(b.name));
    return metas;
  }

  Future<int> count(String table) async {
    _assertKnown(table);
    final row = await _db
        .customSelect('SELECT COUNT(*) AS c FROM "$table"')
        .getSingle();
    return row.read<int>('c');
  }

  /// Reads a page of rows. `rowid` is selected alongside `*` for safe deletes
  /// and stripped from the displayed [DbRow.data].
  Future<List<DbRow>> rows(
    String table, {
    required int limit,
    required int offset,
  }) async {
    _assertKnown(table);
    final result = await _db
        .customSelect(
          'SELECT rowid AS __rowid__, * FROM "$table" LIMIT $limit OFFSET $offset',
        )
        .get();
    return result.map((r) {
      final data = Map<String, dynamic>.from(r.data)..remove('__rowid__');
      return DbRow(rowid: r.read<int>('__rowid__'), data: data);
    }).toList();
  }

  Future<void> deleteRow(String table, int rowid) async {
    _assertKnown(table);
    await _db.customStatement('DELETE FROM "$table" WHERE rowid = ?', [rowid]);
  }

  Future<void> clearTable(String table) async {
    _assertKnown(table);
    await _db.customStatement('DELETE FROM "$table"');
  }

  void _assertKnown(String table) {
    final known = _db.allTables.any((t) => t.actualTableName == table);
    if (!known) {
      throw ArgumentError('Unknown table: $table');
    }
  }
}

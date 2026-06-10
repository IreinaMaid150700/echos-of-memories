import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/features/dev_db_viewer/data/dev_db_inspector.dart';
import 'package:music_app/features/dev_db_viewer/presentation/cubit/dev_db_viewer_state.dart';

class DevDbViewerCubit extends BaseCubit<DevDbViewerState> {
  final DevDbInspector _inspector;

  static const int pageSize = 100;

  DevDbViewerCubit(this._inspector) : super(const DevDbViewerState());

  /// Loads the table list and auto-selects the first table.
  void init() {
    final tables = _inspector.tables();
    emit(state.copyWith(tables: tables));
    if (tables.isNotEmpty) {
      selectTable(tables.first.name);
    }
  }

  Future<void> selectTable(String table) async {
    final meta = state.tables.firstWhere((t) => t.name == table);
    emit(
      state.copyWith(
        selectedTable: table,
        columns: meta.columns,
        rows: const [],
        totalCount: 0,
        isLoading: true,
        error: null,
      ),
    );
    try {
      final total = await _inspector.count(table);
      final rows = await _inspector.rows(table, limit: pageSize, offset: 0);
      emit(state.copyWith(totalCount: total, rows: rows, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadMore() async {
    final table = state.selectedTable;
    if (table == null ||
        state.isLoadingMore ||
        state.rows.length >= state.totalCount) {
      return;
    }
    emit(state.copyWith(isLoadingMore: true, error: null));
    try {
      final more = await _inspector.rows(
        table,
        limit: pageSize,
        offset: state.rows.length,
      );
      emit(
        state.copyWith(rows: [...state.rows, ...more], isLoadingMore: false),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false, error: e.toString()));
    }
  }

  Future<void> deleteRow(DbRow row) async {
    final table = state.selectedTable;
    if (table == null) return;
    try {
      await _inspector.deleteRow(table, row.rowid);
      await selectTable(table);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> clearTable() async {
    final table = state.selectedTable;
    if (table == null) return;
    try {
      await _inspector.clearTable(table);
      await selectTable(table);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> refresh() async {
    final table = state.selectedTable;
    if (table != null) {
      await selectTable(table);
    }
  }
}

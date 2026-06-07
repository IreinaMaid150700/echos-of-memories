import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/features/dev_db_viewer/data/dev_db_inspector.dart';

part 'dev_db_viewer_state.freezed.dart';

@freezed
abstract class DevDbViewerState with _$DevDbViewerState {
  const factory DevDbViewerState({
    @Default(<TableMeta>[]) List<TableMeta> tables,
    String? selectedTable,
    @Default(<String>[]) List<String> columns,
    @Default(<DbRow>[]) List<DbRow> rows,
    @Default(0) int totalCount,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? error,
  }) = _DevDbViewerState;
}

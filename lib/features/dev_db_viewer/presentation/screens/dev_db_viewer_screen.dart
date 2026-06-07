import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/dev_db_viewer/data/dev_db_inspector.dart';
import 'package:music_app/features/dev_db_viewer/presentation/cubit/dev_db_viewer_cubit.dart';
import 'package:music_app/features/dev_db_viewer/presentation/cubit/dev_db_viewer_state.dart';

@RoutePage()
class DevDbViewerScreen extends StatelessWidget {
  const DevDbViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DevDbViewerCubit(DevDbInspector(getIt<AppDatabase>()))..init(),
      child: const _DevDbViewerView(),
    );
  }
}

class _DevDbViewerView extends StatelessWidget {
  const _DevDbViewerView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database (dev)'),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<DevDbViewerCubit>().refresh(),
          ),
          BlocBuilder<DevDbViewerCubit, DevDbViewerState>(
            buildWhen: (a, b) => a.selectedTable != b.selectedTable,
            builder: (context, state) {
              return IconButton(
                tooltip: 'Clear table',
                icon: const Icon(Icons.delete_sweep_outlined),
                onPressed: state.selectedTable == null
                    ? null
                    : () => _confirmClear(context, state.selectedTable!),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<DevDbViewerCubit, DevDbViewerState>(
          builder: (context, state) {
            if (state.tables.isEmpty) {
              return const Center(child: Text('No tables'));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TablePicker(state: state),
                const Divider(height: 1),
                Expanded(child: _Body(state: state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _confirmClear(BuildContext context, String table) async {
    final cubit = context.read<DevDbViewerCubit>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear table?'),
        content: Text('Delete ALL rows from "$table"? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (ok == true) cubit.clearTable();
  }
}

class _TablePicker extends StatelessWidget {
  final DevDbViewerState state;

  const _TablePicker({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              initialValue: state.selectedTable,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Table',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
              ),
              items: state.tables
                  .map((t) => DropdownMenuItem(value: t.name, child: Text(t.name)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  context.read<DevDbViewerCubit>().selectTable(value);
                }
              },
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            '${state.rows.length}/${state.totalCount}',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.themeColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final DevDbViewerState state;

  const _Body({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: Text(
            state.error!,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.themeColors.dangerText,
            ),
          ),
        ),
      );
    }
    if (state.rows.isEmpty) {
      return const Center(child: Text('No rows'));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: AppSpacing.lg,
              columns: [
                ...state.columns.map((c) => DataColumn(label: Text(c))),
                const DataColumn(label: Text('')),
              ],
              rows: state.rows.map((row) => _dataRow(context, row)).toList(),
            ),
          ),
          if (state.rows.length < state.totalCount)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: state.isLoadingMore
                  ? const CircularProgressIndicator()
                  : OutlinedButton(
                      onPressed: () => context.read<DevDbViewerCubit>().loadMore(),
                      child: Text(
                        'Load more (${state.rows.length}/${state.totalCount})',
                      ),
                    ),
            ),
        ],
      ),
    );
  }

  DataRow _dataRow(BuildContext context, DbRow row) {
    return DataRow(
      cells: [
        ...state.columns.map((c) => DataCell(_valueText(context, row.data[c]))),
        DataCell(
          IconButton(
            icon: Icon(Icons.delete_outline, color: context.themeColors.dangerText),
            tooltip: 'Delete row',
            onPressed: () => _confirmDelete(context, row),
          ),
        ),
      ],
    );
  }

  Widget _valueText(BuildContext context, dynamic value) {
    final text = value == null ? 'NULL' : value.toString();
    final display = text.length > 80 ? '${text.substring(0, 80)}…' : text;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 240),
      child: Text(
        display,
        overflow: TextOverflow.ellipsis,
        style: value == null
            ? context.textTheme.bodySmall?.copyWith(
                color: context.themeColors.textMuted,
                fontStyle: FontStyle.italic,
              )
            : context.textTheme.bodySmall,
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, DbRow row) async {
    final cubit = context.read<DevDbViewerCubit>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete row?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (ok == true) cubit.deleteRow(row);
  }
}

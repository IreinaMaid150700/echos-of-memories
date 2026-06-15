import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:music_app/features/theme/presentation/cubit/theme_state.dart';
import 'package:music_app/features/theme/presentation/widgets/theme_option_tile.dart';

@RoutePage()
class ThemePickerScreen extends StatefulWidget {
  const ThemePickerScreen({super.key});

  @override
  State<ThemePickerScreen> createState() => _ThemePickerScreenState();
}

class _ThemePickerScreenState extends State<ThemePickerScreen> {
  @override
  void initState() {
    super.initState();
    // Reuse the app-root ThemeCubit; load the selectable list lazily.
    context.read<ThemeCubit>().loadAvailableThemes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: SafeArea(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final available = state.available;
            if (available.isLoading && !available.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (available.isFailure && !available.hasData) {
              return Center(
                child: Text(
                  available.error ?? 'Không tải được theme',
                  style: context.textTheme.bodyMedium,
                ),
              );
            }
            final themes = available.data ?? const [];
            final selectedId = state.palette.data?.id;
            return GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 0.78,
              ),
              itemCount: themes.length,
              itemBuilder: (context, index) {
                final palette = themes[index];
                return ThemeOptionTile(
                  palette: palette,
                  isSelected: palette.id == selectedId,
                  onTap: () => context.read<ThemeCubit>().selectTheme(palette),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

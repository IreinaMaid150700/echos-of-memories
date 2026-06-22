import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_colors.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/entities/theme_palette_colors.dart';

/// A small static mock of the app UI rendered in [palette]'s [brightness]
/// variant, so the user can see the look before applying it.
class ThemePreviewCard extends StatelessWidget {
  final AppThemePalette palette;
  final Brightness brightness;

  const ThemePreviewCard({
    super.key,
    required this.palette,
    required this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    final ThemePaletteColors c =
        brightness == Brightness.dark ? palette.dark : palette.light;

    return Container(
      key: const ValueKey('theme_preview_surface'),
      width: 132,
      height: 116,
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: c.background,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: c.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar line.
          Container(
            width: 60,
            height: 8,
            decoration: BoxDecoration(
              color: c.textPrimary,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          // A card with a primary accent + mood chips.
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.xs),
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: c.borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _dot(c.primary),
                      const SizedBox(width: 4),
                      _chip(c.tagChipBackground),
                      const SizedBox(width: 4),
                      _chip(c.moodCalmBackground),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(width: 80, height: 6, color: c.textMuted),
                  const Spacer(),
                  // Bottom-nav strip.
                  Container(
                    height: 18,
                    decoration: BoxDecoration(
                      color: c.bottomNavBackground,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _dot(c.primary, size: 8),
                        _dot(c.bottomNavInactiveIcon, size: 8),
                        _dot(c.bottomNavInactiveIcon, size: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color, {double size = 12}) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );

  Widget _chip(Color bg) => Container(
        width: 22,
        height: 10,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
      );
}

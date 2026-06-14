import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/entities/theme_palette_colors.dart';

void main() {
  test('AppThemePalette holds id, name and two variants', () {
    const colors = ThemePaletteColors(
      background: Color(0xFF000000),
      surface: Color(0xFF000000),
      surfaceElevated: Color(0xFF000000),
      surfaceLowest: Color(0xFF000000),
      primary: Color(0xFF111111),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF000000),
      tertiary: Color(0xFF000000),
      textPrimary: Color(0xFF000000),
      textSecondary: Color(0xFF000000),
      textMuted: Color(0xFF000000),
      borderSubtle: Color(0xFF000000),
      borderDefault: Color(0xFF000000),
      dangerBackground: Color(0xFF000000),
      dangerText: Color(0xFF000000),
      successBackground: Color(0xFF000000),
      successText: Color(0xFF000000),
      warningBackground: Color(0xFF000000),
      warningText: Color(0xFF000000),
      moodCalmBackground: Color(0xFF000000),
      moodCalmText: Color(0xFF000000),
      moodWarmBackground: Color(0xFF000000),
      moodWarmText: Color(0xFF000000),
      moodFocusedBackground: Color(0xFF000000),
      moodFocusedText: Color(0xFF000000),
      moodPeacefulBackground: Color(0xFF000000),
      moodPeacefulText: Color(0xFF000000),
      bottomNavBackground: Color(0xFF000000),
      bottomNavActiveBackground: Color(0xFF000000),
      bottomNavInactiveIcon: Color(0xFF000000),
      bottomNavInactiveLabel: Color(0xFF000000),
      tagChipBackground: Color(0xFF000000),
      privacyChipBackground: Color(0xFF000000),
      privacyChipForeground: Color(0xFF000000),
      privacyChipBorder: Color(0xFF000000),
    );
    const palette = AppThemePalette(
      id: 'demo',
      name: 'Demo',
      sortOrder: 3,
      isBuiltIn: true,
      light: colors,
      dark: colors,
    );
    expect(palette.id, 'demo');
    expect(palette.name, 'Demo');
    expect(palette.sortOrder, 3);
    expect(palette.isBuiltIn, isTrue);
    expect(palette.light.primary, const Color(0xFF111111));
    expect(palette == palette, isTrue);
  });
}

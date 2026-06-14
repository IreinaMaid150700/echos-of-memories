import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/theme/domain/entities/theme_palette_colors.dart';

void main() {
  group('hex codec', () {
    test('hexToColor parses #RRGGBB to opaque Color', () {
      expect(hexToColor('#D67D61'), const Color(0xFFD67D61));
      expect(hexToColor('#000000'), const Color(0xFF000000));
      expect(hexToColor('#FFFFFF'), const Color(0xFFFFFFFF));
    });

    test('colorToHex emits uppercase #RRGGBB', () {
      expect(colorToHex(const Color(0xFFD67D61)), '#D67D61');
      expect(colorToHex(const Color(0xFF0AB1CD)), '#0AB1CD');
    });

    test('round trips', () {
      const c = Color(0xFF123456);
      expect(hexToColor(colorToHex(c)), c);
    });
  });

  group('ThemePaletteColors', () {
    ThemePaletteColors sample() => const ThemePaletteColors(
          background: Color(0xFFF9F6F1),
          surface: Color(0xFFFFFCF8),
          surfaceElevated: Color(0xFFFFFFFF),
          surfaceLowest: Color(0xFFFFFFFF),
          primary: Color(0xFFD67D61),
          onPrimary: Color(0xFFFFF8F3),
          secondary: Color(0xFF8A9A84),
          tertiary: Color(0xFFE8D9C5),
          textPrimary: Color(0xFF2A211E),
          textSecondary: Color(0xFF6B5A54),
          textMuted: Color(0xFF9A8D86),
          borderSubtle: Color(0xFFE8DDD5),
          borderDefault: Color(0xFFE8DDD5),
          dangerBackground: Color(0xFFFEE2E2),
          dangerText: Color(0xFF991B1B),
          successBackground: Color(0xFFE3EEDB),
          successText: Color(0xFF3F5733),
          warningBackground: Color(0xFFF8ECCF),
          warningText: Color(0xFF7A5A1B),
          moodCalmBackground: Color(0xFFDCEBD5),
          moodCalmText: Color(0xFF40523B),
          moodWarmBackground: Color(0xFFF4C3B2),
          moodWarmText: Color(0xFF6B2D1F),
          moodFocusedBackground: Color(0xFFE6D4DE),
          moodFocusedText: Color(0xFF5A3F52),
          moodPeacefulBackground: Color(0xFFE8D9C5),
          moodPeacefulText: Color(0xFF5C4A3A),
          bottomNavBackground: Color(0xFFFFF9F1),
          bottomNavActiveBackground: Color(0xFFF3DDD3),
          bottomNavInactiveIcon: Color(0xFF6F625C),
          bottomNavInactiveLabel: Color(0xFF6F625C),
          tagChipBackground: Color(0xFFF1ECE6),
          privacyChipBackground: Color(0xFFEAF0E4),
          privacyChipForeground: Color(0xFF6B705C),
          privacyChipBorder: Color(0xFFDDE6D6),
        );

    test('toJson/fromJson round trips all 35 colors', () {
      final json = sample().toJson();
      expect(json.length, 35);
      expect(json['primary'], '#D67D61');
      final restored = ThemePaletteColors.fromJson(json);
      expect(restored, sample());
    });

    test('toAppCustomColors maps fields 1:1', () {
      final c = sample().toAppCustomColors();
      expect(c.primary, const Color(0xFFD67D61));
      expect(c.background, const Color(0xFFF9F6F1));
      expect(c.privacyChipBorder, const Color(0xFFDDE6D6));
    });
  });
}

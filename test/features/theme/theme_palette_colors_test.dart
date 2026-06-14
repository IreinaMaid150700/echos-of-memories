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
}

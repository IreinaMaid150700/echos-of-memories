import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/theme/app_theme.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';

/// Mirrors the selection logic used in main.dart: a theme id + brightness
/// resolves to the matching palette variant's ThemeData.
ThemeData themeFor(String id, Brightness brightness) {
  final palette = kDefaultThemes.firstWhere((t) => t.id == id);
  final variant = brightness == Brightness.dark ? palette.dark : palette.light;
  return AppTheme.build(
    colors: variant.toAppCustomColors(),
    onPrimary: variant.onPrimary,
    brightness: brightness,
  );
}

// Runs [body] absorbing async google_fonts font-load exceptions that fire after
// the synchronous assertions complete (fonts aren't bundled in the test env).
void _test(String name, void Function() body) {
  test(name, () {
    runZonedGuarded(body, (e, _) {
      if (e.toString().contains('google_fonts') ||
          e.toString().contains('allowRuntimeFetching') ||
          e.toString().contains('was not found in the application assets')) {
        return;
      }
      fail('Unexpected error: $e');
    });
  });
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  _test('selected palette id maps to its AppCustomColors (light + dark)', () {
    final lightExt =
        themeFor('ocean', Brightness.light).extension<AppCustomColors>();
    expect(lightExt, isNotNull);
    expect(lightExt!.primary, const Color(0xFF2E7D8E));

    final darkExt =
        themeFor('ocean', Brightness.dark).extension<AppCustomColors>();
    expect(darkExt, isNotNull);
    expect(darkExt!.primary, const Color(0xFF7FC8D6));
  });

  _test('default (warm_sand) keeps the original primary', () {
    final ext =
        themeFor('warm_sand', Brightness.light).extension<AppCustomColors>();
    expect(ext!.primary, const Color(0xFFD67D61));
  });
}

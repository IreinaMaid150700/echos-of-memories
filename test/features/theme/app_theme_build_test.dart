import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';
import 'package:music_app/core/theme/app_theme.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';

// Runs [body] absorbing any async google_fonts font-load exceptions that fire
// after the synchronous assertions complete (a known test-env limitation).
void _test(String name, void Function() body) {
  test(name, () {
    runZonedGuarded(body, (e, _) {
      if (e.toString().contains('google_fonts') ||
          e.toString().contains('allowRuntimeFetching') ||
          e.toString().contains('was not found in the application assets')) {
        return; // expected in test environment — fonts not bundled
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

  _test('build() produces ThemeData carrying the palette as AppCustomColors', () {
    final ocean = kDefaultThemes.firstWhere((t) => t.id == 'ocean');
    final theme = AppTheme.build(
      colors: ocean.light.toAppCustomColors(),
      onPrimary: ocean.light.onPrimary,
      brightness: Brightness.light,
    );
    final ext = theme.extension<AppCustomColors>();
    expect(ext, isNotNull);
    expect(ext!.primary, ocean.light.primary);
    expect(theme.scaffoldBackgroundColor, ocean.light.background);
    expect(theme.colorScheme.onPrimary, ocean.light.onPrimary);
  });

  _test('legacy lightTheme/darkTheme getters still build', () {
    expect(AppTheme.lightTheme.extension<AppCustomColors>(), isNotNull);
    expect(AppTheme.darkTheme.extension<AppCustomColors>(), isNotNull);
  });
}

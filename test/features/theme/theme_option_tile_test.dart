import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/presentation/widgets/theme_option_tile.dart';

// context.themeColors asserts an AppCustomColors theme extension is present, so
// wrap with a ThemeData carrying it. Using a plain ThemeData (not AppTheme.build)
// keeps the default Roboto text theme and avoids google_fonts fetches in tests.
Widget _host(Widget child, {required AppThemePalette themePalette}) => MaterialApp(
      theme: ThemeData(extensions: [themePalette.light.toAppCustomColors()]),
      home: Scaffold(body: child),
    );

void main() {
  testWidgets('shows name, check when selected, and fires onTap', (tester) async {
    final rose = kDefaultThemes.firstWhere((t) => t.id == 'rose');
    var tapped = 0;
    await tester.pumpWidget(
      _host(
        ThemeOptionTile(
          palette: rose,
          isSelected: true,
          onTap: () => tapped++,
        ),
        themePalette: rose,
      ),
    );

    expect(find.text('Rose'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    await tester.tap(find.byType(ThemeOptionTile));
    expect(tapped, 1);
  });

  testWidgets('hides check when not selected', (tester) async {
    final mono = kDefaultThemes.firstWhere((t) => t.id == 'mono');
    await tester.pumpWidget(
      _host(
        ThemeOptionTile(palette: mono, isSelected: false, onTap: () {}),
        themePalette: mono,
      ),
    );
    expect(find.byIcon(Icons.check_circle), findsNothing);
  });
}

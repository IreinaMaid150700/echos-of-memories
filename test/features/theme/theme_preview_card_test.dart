import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';
import 'package:music_app/features/theme/presentation/widgets/theme_preview_card.dart';

void main() {
  testWidgets('renders a preview for a palette without throwing', (tester) async {
    final forest = kDefaultThemes.firstWhere((t) => t.id == 'forest');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ThemePreviewCard(palette: forest, brightness: Brightness.light),
          ),
        ),
      ),
    );
    expect(find.byType(ThemePreviewCard), findsOneWidget);
    // The preview surface paints the palette background.
    final container = tester.widget<Container>(
      find.byKey(const ValueKey('theme_preview_surface')),
    );
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, forest.light.background);
  });

  testWidgets('dark brightness uses the dark variant background', (tester) async {
    final ocean = kDefaultThemes.firstWhere((t) => t.id == 'ocean');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ThemePreviewCard(palette: ocean, brightness: Brightness.dark),
          ),
        ),
      ),
    );
    final container = tester.widget<Container>(
      find.byKey(const ValueKey('theme_preview_surface')),
    );
    expect((container.decoration as BoxDecoration).color, ocean.dark.background);
  });
}

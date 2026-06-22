import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';

void main() {
  test('exactly 6 built-in themes with unique ids', () {
    expect(kDefaultThemes.length, 6);
    final ids = kDefaultThemes.map((t) => t.id).toSet();
    expect(ids.length, 6);
    expect(ids, containsAll(<String>{
      'warm_sand',
      'ocean',
      'forest',
      'lavender',
      'rose',
      'mono',
    }));
  });

  test('default palette is warm_sand and sortOrder starts at 0', () {
    expect(kDefaultThemePalette.id, 'warm_sand');
    expect(kDefaultThemes.first.sortOrder, 0);
  });

  test('every variant serializes to 35 colors and round trips', () {
    for (final t in kDefaultThemes) {
      expect(t.light.toJson().length, 35, reason: '${t.id} light');
      expect(t.dark.toJson().length, 35, reason: '${t.id} dark');
    }
  });

  test('all built-ins are flagged isBuiltIn', () {
    expect(kDefaultThemes.every((t) => t.isBuiltIn), isTrue);
  });
}

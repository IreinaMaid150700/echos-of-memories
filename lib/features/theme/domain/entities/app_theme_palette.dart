import 'package:music_app/features/theme/domain/entities/theme_palette_colors.dart';

/// A selectable theme: a named palette with a light and a dark variant.
class AppThemePalette {
  final String id;
  final String name;
  final int sortOrder;
  final bool isBuiltIn;
  final ThemePaletteColors light;
  final ThemePaletteColors dark;

  const AppThemePalette({
    required this.id,
    required this.name,
    required this.sortOrder,
    required this.isBuiltIn,
    required this.light,
    required this.dark,
  });

  @override
  bool operator ==(Object other) =>
      other is AppThemePalette &&
      other.id == id &&
      other.name == name &&
      other.sortOrder == sortOrder &&
      other.isBuiltIn == isBuiltIn &&
      other.light == light &&
      other.dark == dark;

  @override
  int get hashCode => Object.hash(id, name, sortOrder, isBuiltIn, light, dark);
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeMode>> getThemeMode();
  Future<Either<Failure, Unit>> setThemeMode(ThemeMode mode);

  /// All selectable themes, ordered by sortOrder.
  Future<Either<Failure, List<AppThemePalette>>> getAvailableThemes();

  /// The currently selected theme (defaults to the first built-in).
  Future<Either<Failure, AppThemePalette>> getSelectedTheme();

  /// Persists the selected theme id.
  Future<Either<Failure, Unit>> setSelectedTheme(String themeId);
}

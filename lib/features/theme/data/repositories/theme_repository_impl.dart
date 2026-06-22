import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/core/storage/preferences_service.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/entities/theme_palette_colors.dart';
import 'package:music_app/features/theme/domain/repositories/theme_repository.dart';

const _kSelectedThemeKey = 'selected_theme_id';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final PreferencesService _preferencesService;
  final AppDatabase _db;

  ThemeRepositoryImpl(this._preferencesService, this._db);

  @override
  Future<Either<Failure, ThemeMode>> getThemeMode() async {
    try {
      final themeStr = _preferencesService.themeMode;
      final mode = ThemeMode.values.firstWhere(
        (e) => e.name == themeStr,
        orElse: () => ThemeMode.system,
      );
      return Right(mode);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to access theme preferences'));
    }
  }

  @override
  Future<Either<Failure, Unit>> setThemeMode(ThemeMode mode) async {
    try {
      await _preferencesService.setThemeMode(mode.name);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to save theme preferences'));
    }
  }

  @override
  Future<Either<Failure, List<AppThemePalette>>> getAvailableThemes() async {
    try {
      final rows = await (_db.select(_db.appThemes)
            ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]))
          .get();
      if (rows.isEmpty) return Right(kDefaultThemes);
      return Right(rows.map(_rowToPalette).toList());
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to load themes'));
    }
  }

  @override
  Future<Either<Failure, AppThemePalette>> getSelectedTheme() async {
    try {
      final setting = await (_db.select(_db.appSettings)
            ..where((t) => t.key.equals(_kSelectedThemeKey)))
          .getSingleOrNull();
      final id = setting?.value ?? kDefaultThemePalette.id;
      final row = await (_db.select(_db.appThemes)
            ..where((t) => t.id.equals(id)))
          .getSingleOrNull();
      if (row == null) return Right(kDefaultThemePalette);
      return Right(_rowToPalette(row));
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to load selected theme'));
    }
  }

  @override
  Future<Either<Failure, Unit>> setSelectedTheme(String themeId) async {
    try {
      await _db.into(_db.appSettings).insertOnConflictUpdate(
            AppSettingsCompanion.insert(
              key: _kSelectedThemeKey,
              value: themeId,
              updatedAt: DateTime.now(),
            ),
          );
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to save selected theme'));
    }
  }

  AppThemePalette _rowToPalette(AppTheme row) => AppThemePalette(
        id: row.id,
        name: row.name,
        sortOrder: row.sortOrder,
        isBuiltIn: row.isBuiltIn,
        light: ThemePaletteColors.fromJson(
          jsonDecode(row.lightColors) as Map<String, dynamic>,
        ),
        dark: ThemePaletteColors.fromJson(
          jsonDecode(row.darkColors) as Map<String, dynamic>,
        ),
      );
}

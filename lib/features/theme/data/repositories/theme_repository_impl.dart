import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/storage/preferences_service.dart';
import 'package:music_app/features/theme/domain/repositories/theme_repository.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final PreferencesService _preferencesService;

  ThemeRepositoryImpl(this._preferencesService);

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
}

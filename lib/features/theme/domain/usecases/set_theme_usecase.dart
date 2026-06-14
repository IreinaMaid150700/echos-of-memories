import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/theme/domain/repositories/theme_repository.dart';

@injectable
class SetThemeUseCase {
  final ThemeRepository _repository;

  SetThemeUseCase(this._repository);

  Future<Either<Failure, Unit>> call(ThemeMode mode) =>
      _repository.setThemeMode(mode);
}

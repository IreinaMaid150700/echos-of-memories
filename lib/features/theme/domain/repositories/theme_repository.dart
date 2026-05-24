import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/error/failure.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeMode>> getThemeMode();
  Future<Either<Failure, Unit>> setThemeMode(ThemeMode mode);
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/repositories/theme_repository.dart';

@injectable
class GetSelectedThemeUseCase {
  final ThemeRepository _repository;

  GetSelectedThemeUseCase(this._repository);

  Future<Either<Failure, AppThemePalette>> call() =>
      _repository.getSelectedTheme();
}

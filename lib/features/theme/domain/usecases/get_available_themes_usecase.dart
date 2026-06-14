import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/repositories/theme_repository.dart';

@injectable
class GetAvailableThemesUseCase {
  final ThemeRepository _repository;

  GetAvailableThemesUseCase(this._repository);

  Future<Either<Failure, List<AppThemePalette>>> call() =>
      _repository.getAvailableThemes();
}

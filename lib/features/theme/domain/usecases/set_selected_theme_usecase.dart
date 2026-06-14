import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/theme/domain/repositories/theme_repository.dart';

@injectable
class SetSelectedThemeUseCase {
  final ThemeRepository _repository;

  SetSelectedThemeUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String themeId) =>
      _repository.setSelectedTheme(themeId);
}

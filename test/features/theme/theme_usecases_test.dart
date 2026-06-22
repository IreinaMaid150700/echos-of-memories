import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/repositories/theme_repository.dart';
import 'package:music_app/features/theme/domain/usecases/get_available_themes_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/get_selected_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/set_selected_theme_usecase.dart';

class _MockRepo extends Mock implements ThemeRepository {}

void main() {
  test('GetAvailableThemesUseCase delegates to repo', () async {
    final repo = _MockRepo();
    when(() => repo.getAvailableThemes())
        .thenAnswer((_) async => Right<Failure, List<AppThemePalette>>(kDefaultThemes));
    final result = await GetAvailableThemesUseCase(repo)();
    result.fold((_) => fail('expected Right'), (list) => expect(list.length, 6));
    verify(() => repo.getAvailableThemes()).called(1);
  });

  test('GetSelectedThemeUseCase delegates to repo', () async {
    final repo = _MockRepo();
    when(() => repo.getSelectedTheme())
        .thenAnswer((_) async => Right<Failure, AppThemePalette>(kDefaultThemePalette));
    final result = await GetSelectedThemeUseCase(repo)();
    result.fold((_) => fail('expected Right'), (p) => expect(p.id, 'warm_sand'));
  });

  test('SetSelectedThemeUseCase forwards the id', () async {
    final repo = _MockRepo();
    when(() => repo.setSelectedTheme(any()))
        .thenAnswer((_) async => const Right<Failure, Unit>(unit));
    await SetSelectedThemeUseCase(repo)('ocean');
    verify(() => repo.setSelectedTheme('ocean')).called(1);
  });
}

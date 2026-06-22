import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/theme/domain/data/default_app_themes.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/usecases/get_available_themes_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/get_selected_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/set_selected_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/set_theme_usecase.dart';
import 'package:music_app/features/theme/presentation/cubit/theme_cubit.dart';

class _MockGetThemeUseCase extends Mock implements GetThemeUseCase {}

class _MockSetThemeUseCase extends Mock implements SetThemeUseCase {}

class _MockGetAvailableThemesUseCase extends Mock
    implements GetAvailableThemesUseCase {}

class _MockGetSelectedThemeUseCase extends Mock
    implements GetSelectedThemeUseCase {}

class _MockSetSelectedThemeUseCase extends Mock
    implements SetSelectedThemeUseCase {}

ThemeCubit _build({
  GetThemeUseCase? getThemeUseCase,
  SetThemeUseCase? setThemeUseCase,
  GetAvailableThemesUseCase? getAvailableThemesUseCase,
  GetSelectedThemeUseCase? getSelectedThemeUseCase,
  SetSelectedThemeUseCase? setSelectedThemeUseCase,
}) => ThemeCubit(
  getThemeUseCase ?? _MockGetThemeUseCase(),
  setThemeUseCase ?? _MockSetThemeUseCase(),
  getAvailableThemesUseCase ?? _MockGetAvailableThemesUseCase(),
  getSelectedThemeUseCase ?? _MockGetSelectedThemeUseCase(),
  setSelectedThemeUseCase ?? _MockSetSelectedThemeUseCase(),
);

GetThemeUseCase _successGetThemeUseCase() {
  final m = _MockGetThemeUseCase();
  when(() => m())
      .thenAnswer((_) async => const Right<Failure, ThemeMode>(ThemeMode.system));
  return m;
}

void main() {
  setUpAll(() {
    registerFallbackValue(ThemeMode.system);
  });

  group('ThemeCubit changeTheme', () {
    test('persist success leaves theme as success with the new mode', () async {
      final setUseCase = _MockSetThemeUseCase();
      when(() => setUseCase(any()))
          .thenAnswer((_) async => const Right<Failure, Unit>(unit));
      final cubit = _build(setThemeUseCase: setUseCase);
      addTearDown(cubit.close);

      await cubit.changeTheme(ThemeMode.dark);

      expect(cubit.state.theme.isSuccess, isTrue);
      expect(cubit.state.theme.data, ThemeMode.dark);
      expect(cubit.state.theme.error, isNull);
      verify(() => setUseCase(ThemeMode.dark)).called(1);
    });

    test('persist failure reverts to the PREVIOUS mode and surfaces error',
        () async {
      final setUseCase = _MockSetThemeUseCase();
      when(() => setUseCase(ThemeMode.light))
          .thenAnswer((_) async => const Right<Failure, Unit>(unit));
      when(() => setUseCase(ThemeMode.dark)).thenAnswer(
        (_) async => const Left<Failure, Unit>(CacheFailure(message: 'disk full')),
      );
      final cubit = _build(setThemeUseCase: setUseCase);
      addTearDown(cubit.close);

      await cubit.changeTheme(ThemeMode.light);
      await cubit.changeTheme(ThemeMode.dark);

      expect(cubit.state.theme.isFailure, isTrue);
      expect(cubit.state.theme.error, 'disk full');
      expect(cubit.state.theme.data, ThemeMode.light);
    });

    test('persist failure from initial state reverts to no applied mode',
        () async {
      final setUseCase = _MockSetThemeUseCase();
      when(() => setUseCase(any())).thenAnswer(
        (_) async => const Left<Failure, Unit>(UnknownFailure(message: 'boom')),
      );
      final cubit = _build(setThemeUseCase: setUseCase);
      addTearDown(cubit.close);

      await cubit.changeTheme(ThemeMode.dark);

      expect(cubit.state.theme.isFailure, isTrue);
      expect(cubit.state.theme.error, 'boom');
      expect(cubit.state.theme.data, isNull);
    });
  });

  group('ThemeCubit palette', () {
    test('loadAvailableThemes populates available list', () async {
      final getAvail = _MockGetAvailableThemesUseCase();
      when(() => getAvail()).thenAnswer(
        (_) async => Right<Failure, List<AppThemePalette>>(kDefaultThemes),
      );
      final cubit = _build(getAvailableThemesUseCase: getAvail);
      addTearDown(cubit.close);

      await cubit.loadAvailableThemes();

      expect(cubit.state.available.isSuccess, isTrue);
      expect(cubit.state.available.data!.length, kDefaultThemes.length);
    });

    test('loadAvailableThemes failure surfaces error', () async {
      final getAvail = _MockGetAvailableThemesUseCase();
      when(() => getAvail()).thenAnswer(
        (_) async => const Left<Failure, List<AppThemePalette>>(
          CacheFailure(message: 'no themes'),
        ),
      );
      final cubit = _build(getAvailableThemesUseCase: getAvail);
      addTearDown(cubit.close);

      await cubit.loadAvailableThemes();

      expect(cubit.state.available.isFailure, isTrue);
      expect(cubit.state.available.error, 'no themes');
    });

    test('selectTheme emits palette immediately and persists id', () async {
      final setSel = _MockSetSelectedThemeUseCase();
      when(() => setSel(any()))
          .thenAnswer((_) async => const Right<Failure, Unit>(unit));
      final cubit = _build(setSelectedThemeUseCase: setSel);
      addTearDown(cubit.close);

      final ocean = kDefaultThemes.firstWhere((t) => t.id == 'ocean');
      await cubit.selectTheme(ocean);

      expect(cubit.state.palette.isSuccess, isTrue);
      expect(cubit.state.palette.data!.id, 'ocean');
      verify(() => setSel('ocean')).called(1);
    });

    test('selectTheme persist failure reverts palette and surfaces error',
        () async {
      final getSel = _MockGetSelectedThemeUseCase();
      final setSel = _MockSetSelectedThemeUseCase();
      when(() => getSel()).thenAnswer(
        (_) async => Right<Failure, AppThemePalette>(kDefaultThemePalette),
      );
      when(() => setSel(any())).thenAnswer(
        (_) async =>
            const Left<Failure, Unit>(CacheFailure(message: 'disk full')),
      );
      final cubit = _build(
        getThemeUseCase: _successGetThemeUseCase(),
        getSelectedThemeUseCase: getSel,
        setSelectedThemeUseCase: setSel,
      );
      addTearDown(cubit.close);

      await cubit.loadTheme(); // palette.data = warm_sand
      final ocean = kDefaultThemes.firstWhere((t) => t.id == 'ocean');
      await cubit.selectTheme(ocean);

      expect(cubit.state.palette.isFailure, isTrue);
      expect(cubit.state.palette.error, 'disk full');
      // Reverted to the previously-applied palette, not the failed one.
      expect(cubit.state.palette.data?.id, 'warm_sand');
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:music_app/features/theme/presentation/screens/theme_picker_screen.dart';
import 'package:music_app/features/theme/presentation/widgets/theme_option_tile.dart';

class _MockGetThemeUseCase extends Mock implements GetThemeUseCase {}

class _MockSetThemeUseCase extends Mock implements SetThemeUseCase {}

class _MockGetAvailableThemesUseCase extends Mock
    implements GetAvailableThemesUseCase {}

class _MockGetSelectedThemeUseCase extends Mock
    implements GetSelectedThemeUseCase {}

class _MockSetSelectedThemeUseCase extends Mock
    implements SetSelectedThemeUseCase {}

void main() {
  testWidgets('renders one tile per available theme and selects on tap',
      (tester) async {
    final getAvail = _MockGetAvailableThemesUseCase();
    final setSel = _MockSetSelectedThemeUseCase();
    when(() => getAvail()).thenAnswer(
      (_) async => Right<Failure, List<AppThemePalette>>(kDefaultThemes),
    );
    when(() => setSel(any()))
        .thenAnswer((_) async => const Right<Failure, Unit>(unit));

    final cubit = ThemeCubit(
      _MockGetThemeUseCase(),
      _MockSetThemeUseCase(),
      getAvail,
      _MockGetSelectedThemeUseCase(),
      setSel,
    );
    addTearDown(cubit.close);

    // Tall viewport so the lazy GridView builds all 6 tiles at once.
    tester.view.physicalSize = const Size(1000, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        // context.themeColors (used by ThemeOptionTile) requires the extension.
        theme: ThemeData(
          extensions: [kDefaultThemes.first.light.toAppCustomColors()],
        ),
        home: BlocProvider.value(
          value: cubit,
          child: const ThemePickerScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ThemeOptionTile), findsNWidgets(kDefaultThemes.length));

    await tester.tap(find.text('Ocean'));
    await tester.pump();
    verify(() => setSel('ocean')).called(1);
  });
}

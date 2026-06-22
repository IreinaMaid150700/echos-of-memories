import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/utils/enum/async_status.dart';
import 'package:music_app/core/utils/models/loaded.dart';
import 'package:music_app/features/theme/domain/entities/app_theme_palette.dart';
import 'package:music_app/features/theme/domain/usecases/get_available_themes_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/get_selected_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/set_selected_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/set_theme_usecase.dart';
import 'theme_state.dart';

@injectable
class ThemeCubit extends BaseCubit<ThemeState> {
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;
  final GetAvailableThemesUseCase _getAvailableThemesUseCase;
  final GetSelectedThemeUseCase _getSelectedThemeUseCase;
  final SetSelectedThemeUseCase _setSelectedThemeUseCase;

  ThemeCubit(
    this._getThemeUseCase,
    this._setThemeUseCase,
    this._getAvailableThemesUseCase,
    this._getSelectedThemeUseCase,
    this._setSelectedThemeUseCase,
  ) : super(const ThemeState());

  /// Loads both the persisted [ThemeMode] and the selected palette at startup.
  Future<void> loadTheme() async {
    await execute(
      loadingState: state.copyWith(theme: state.theme.toLoading()),
      action: () => _getThemeUseCase(),
      onSuccess: (themeMode) =>
          state.copyWith(theme: state.theme.toSuccess(themeMode)),
      onFailure: (failure) =>
          state.copyWith(theme: state.theme.toFailure(failure.message)),
    );
    await execute(
      loadingState: state.copyWith(palette: state.palette.toLoading()),
      action: () => _getSelectedThemeUseCase(),
      onSuccess: (palette) =>
          state.copyWith(palette: state.palette.toSuccess(palette)),
      onFailure: (failure) =>
          state.copyWith(palette: state.palette.toFailure(failure.message)),
    );
  }

  /// Loads the full list of selectable themes (for the picker screen).
  Future<void> loadAvailableThemes() async {
    await execute(
      loadingState: state.copyWith(available: state.available.toLoading()),
      action: () => _getAvailableThemesUseCase(),
      onSuccess: (themes) =>
          state.copyWith(available: state.available.toSuccess(themes)),
      onFailure: (failure) =>
          state.copyWith(available: state.available.toFailure(failure.message)),
    );
  }

  /// Applies a palette instantly (optimistic) then persists the selection.
  /// Reverts to the previous palette on persist error.
  Future<void> selectTheme(AppThemePalette palette) async {
    final previous = state.palette.data;
    emit(state.copyWith(palette: state.palette.toSuccess(palette)));

    final result = await _setSelectedThemeUseCase(palette.id);
    result.fold(
      (failure) => emit(
        state.copyWith(
          palette: Loaded<AppThemePalette>(
            status: AsyncStatus.failure,
            data: previous,
            error: failure.message,
          ),
        ),
      ),
      (_) => null,
    );
  }

  /// Changes the light/dark mode. Reverts to the previous mode on persist error.
  Future<void> changeTheme(ThemeMode mode) async {
    final previous = state.theme.data;
    emit(state.copyWith(theme: state.theme.toSuccess(mode)));

    final result = await _setThemeUseCase(mode);
    result.fold(
      (failure) => emit(
        state.copyWith(
          theme: Loaded<ThemeMode>(
            status: AsyncStatus.failure,
            data: previous,
            error: failure.message,
          ),
        ),
      ),
      (_) => null,
    );
  }
}

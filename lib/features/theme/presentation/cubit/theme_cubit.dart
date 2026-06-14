import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:music_app/features/theme/domain/usecases/set_theme_usecase.dart';
import 'theme_state.dart';

@injectable
class ThemeCubit extends BaseCubit<ThemeState> {
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;

  ThemeCubit(this._getThemeUseCase, this._setThemeUseCase)
    : super(const ThemeState());

  Future<void> loadTheme() async {
    await execute(
      loadingState: state.copyWith(theme: state.theme.toLoading()),
      action: () => _getThemeUseCase(),
      onSuccess: (themeMode) =>
          state.copyWith(theme: state.theme.toSuccess(themeMode)),
      onFailure: (failure) =>
          state.copyWith(theme: state.theme.toFailure(failure.message)),
    );
  }

  Future<void> changeTheme(ThemeMode mode) async {
    emit(state.copyWith(theme: state.theme.toSuccess(mode)));

    await _setThemeUseCase(mode);
  }
}

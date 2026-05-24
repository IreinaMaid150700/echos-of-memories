import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/features/settings/presentation/cubit/settings_state.dart';

class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void setThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  void setLanguage(String language) {
    emit(state.copyWith(language: language));
  }

  void setAppLockEnabled(bool enabled) {
    emit(state.copyWith(appLockEnabled: enabled));
  }

  void setKeepMemoriesOffline(bool enabled) {
    emit(state.copyWith(keepMemoriesOffline: enabled));
  }

  void setGentleReminders(bool enabled) {
    emit(state.copyWith(gentleReminders: enabled));
  }
}
import 'package:music_app/core/cubit/base_cubit.dart';
import 'package:music_app/core/storage/preferences_service.dart';
import 'package:music_app/features/settings/presentation/cubit/settings_state.dart';

class SettingsCubit extends BaseCubit<SettingsState> {
  final PreferencesService _preferencesService;

  SettingsCubit({required PreferencesService preferencesService})
    : _preferencesService = preferencesService,
      super(const SettingsState());

  void initialize() {
    final themeMode = _preferencesService.themeMode;
    final language = _preferencesService.language;
    final appLockEnabled = _preferencesService.isAppLockEnabled;
    final keepMemoriesOffline = _preferencesService.keepMemoriesOffline;

    emit(
      state.copyWith(
        themeMode: AppThemeMode.values.firstWhere(
          (mode) => mode.name == themeMode,
          orElse: () => AppThemeMode.system,
        ),
        language: language,
        appLockEnabled: appLockEnabled,
        keepMemoriesOffline: keepMemoriesOffline,
      ),
    );
  }

  void setThemeMode(AppThemeMode mode) {
    _preferencesService.setThemeMode(mode.name);
    emit(state.copyWith(themeMode: mode));
  }

  void setLanguage(String language) {
    _preferencesService.setLanguage(language);
    emit(state.copyWith(language: language));
  }

  void setAppLockEnabled(bool enabled) {
    _preferencesService.setAppLockEnabled(enabled);
    emit(state.copyWith(appLockEnabled: enabled));
  }

  void setKeepMemoriesOffline(bool enabled) {
    _preferencesService.setKeepMemoriesOffline(enabled);
    emit(state.copyWith(keepMemoriesOffline: enabled));
  }

  void setGentleReminders(bool enabled) {
    emit(state.copyWith(gentleReminders: enabled));
  }
}

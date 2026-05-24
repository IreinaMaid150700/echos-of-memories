import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

enum ThemeMode { system, light, dark }

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default('en') String language,
    @Default(true) bool notificationsEnabled,
    @Default(false) bool appLockEnabled,
    @Default(true) bool keepMemoriesOffline,
    @Default(true) bool gentleReminders,
  }) = _SettingsState;
}
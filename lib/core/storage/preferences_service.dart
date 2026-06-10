import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Wrapper class quản lý SharedPreferences.
/// Dùng để lưu trữ thông tin local đơn giản, không nhạy cảm (settings, theme flag, ...).
@lazySingleton
class PreferencesService {
  final SharedPreferences _prefs;

  PreferencesService(this._prefs);

  static const _keyThemeMode = 'theme_mode';
  static const _keyLanguage = 'language';
  static const _keyIsFirstTime = 'is_first_time';
  static const _keyAppLockEnabled = 'app_lock_enabled';
  static const _keyKeepMemoriesOffline = 'keep_memories_offline';

  // Theme
  String get themeMode => _prefs.getString(_keyThemeMode) ?? 'system';
  Future<void> setThemeMode(String mode) =>
      _prefs.setString(_keyThemeMode, mode);

  // Language
  String get language => _prefs.getString(_keyLanguage) ?? 'vi';
  Future<void> setLanguage(String langCode) =>
      _prefs.setString(_keyLanguage, langCode);

  // First time onboarding
  bool get isFirstTime => _prefs.getBool(_keyIsFirstTime) ?? true;
  Future<void> setFirstTimeCompleted() =>
      _prefs.setBool(_keyIsFirstTime, false);

  // App lock
  bool get isAppLockEnabled => _prefs.getBool(_keyAppLockEnabled) ?? false;
  Future<void> setAppLockEnabled(bool enabled) =>
      _prefs.setBool(_keyAppLockEnabled, enabled);

  // Keep memories offline
  bool get keepMemoriesOffline =>
      _prefs.getBool(_keyKeepMemoriesOffline) ?? true;
  Future<void> setKeepMemoriesOffline(bool offline) =>
      _prefs.setBool(_keyKeepMemoriesOffline, offline);

  // Clear all non-sensitive settings (thường ít khi dùng, ngoại trừ reset app)
  Future<void> clearAll() => _prefs.clear();
}

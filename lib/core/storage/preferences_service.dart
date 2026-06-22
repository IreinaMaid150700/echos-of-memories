import 'dart:convert';

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
  static const _keyRecentSearches = 'recent_searches';

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

  // Recent searches (max 10, dedup, move-to-top)
  List<String> get recentSearches {
    final raw = _prefs.getString(_keyRecentSearches);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return decoded.whereType<String>().toList();
    } catch (_) {
      // Corrupted value — self-heal so the screen never crashes on read.
      _prefs.remove(_keyRecentSearches);
      return const [];
    }
  }

  Future<void> addRecentSearch(String query) async {
    final q = query.trim();
    if (q.isEmpty) return;
    final list = List<String>.from(recentSearches)..remove(q);
    list.insert(0, q);
    await _prefs.setString(
      _keyRecentSearches,
      jsonEncode(list.take(10).toList()),
    );
  }

  Future<void> clearRecentSearches() =>
      _prefs.setString(_keyRecentSearches, '[]');

  // Clear all non-sensitive settings (thường ít khi dùng, ngoại trừ reset app)
  Future<void> clearAll() => _prefs.clear();
}

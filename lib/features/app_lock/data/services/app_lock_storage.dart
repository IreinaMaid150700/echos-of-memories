import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Secure-storage wrapper for App Lock secrets.
///
/// Stores ONLY salted hashes for PIN and recovery code — never plaintext.
/// Also persists the failed-attempt counter and lockout deadline so the
/// escalating lockout survives an app restart (anti restart-bypass).
@lazySingleton
class AppLockStorage {
  final FlutterSecureStorage _storage;

  AppLockStorage(this._storage);

  static const _keyPinHash = 'app_lock_pin_hash';
  static const _keyPinSalt = 'app_lock_pin_salt';
  static const _keyRecoveryHash = 'app_lock_recovery_hash';
  static const _keyRecoverySalt = 'app_lock_recovery_salt';
  static const _keyFailCount = 'app_lock_fail_count';
  static const _keyLockoutUntil = 'app_lock_lockout_until';

  // PIN
  Future<String?> getPinHash() => _storage.read(key: _keyPinHash);
  Future<String?> getPinSalt() => _storage.read(key: _keyPinSalt);
  Future<void> setPin({required String hash, required String salt}) async {
    await _storage.write(key: _keyPinHash, value: hash);
    await _storage.write(key: _keyPinSalt, value: salt);
  }

  // Recovery code
  Future<String?> getRecoveryHash() => _storage.read(key: _keyRecoveryHash);
  Future<String?> getRecoverySalt() => _storage.read(key: _keyRecoverySalt);
  Future<void> setRecovery({
    required String hash,
    required String salt,
  }) async {
    await _storage.write(key: _keyRecoveryHash, value: hash);
    await _storage.write(key: _keyRecoverySalt, value: salt);
  }

  // Lockout state
  Future<int> getFailCount() async {
    final raw = await _storage.read(key: _keyFailCount);
    return int.tryParse(raw ?? '') ?? 0;
  }

  Future<void> setFailCount(int count) =>
      _storage.write(key: _keyFailCount, value: count.toString());

  /// Returns the lockout deadline in epoch milliseconds, or null if none.
  Future<int?> getLockoutUntilMillis() async {
    final raw = await _storage.read(key: _keyLockoutUntil);
    return int.tryParse(raw ?? '');
  }

  Future<void> setLockoutUntilMillis(int? millis) async {
    if (millis == null) {
      await _storage.delete(key: _keyLockoutUntil);
    } else {
      await _storage.write(key: _keyLockoutUntil, value: millis.toString());
    }
  }

  /// Wipes every App Lock secret (used by clearLock).
  Future<void> clear() async {
    await _storage.delete(key: _keyPinHash);
    await _storage.delete(key: _keyPinSalt);
    await _storage.delete(key: _keyRecoveryHash);
    await _storage.delete(key: _keyRecoverySalt);
    await _storage.delete(key: _keyFailCount);
    await _storage.delete(key: _keyLockoutUntil);
  }
}

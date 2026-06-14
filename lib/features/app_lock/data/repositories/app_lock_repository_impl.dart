import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/features/app_lock/app_lock_constants.dart';
import 'package:music_app/features/app_lock/data/services/app_lock_storage.dart';
import 'package:music_app/features/app_lock/domain/models/lockout_state.dart';
import 'package:music_app/features/app_lock/domain/repositories/app_lock_repository.dart';

/// PBKDF2-backed implementation of [AppLockRepository].
///
/// Uses PBKDF2-HMAC-SHA256 with a random per-secret salt. Comparisons are
/// constant-time to avoid timing leaks. Lockout state is persisted so it
/// survives an app restart.
@LazySingleton(as: AppLockRepository)
class AppLockRepositoryImpl implements AppLockRepository {
  final AppLockStorage _storage;

  AppLockRepositoryImpl(this._storage);

  static const int _iterations = 10000;
  static const int _saltBytes = 16;
  static const int _recoveryGroups = 4;
  static const int _recoveryGroupLen = 4;
  static const String _recoveryAlphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';

  /// Test seam — injectable random source. Defaults to a secure RNG.
  final Random _rng = Random.secure();

  // ---------------------------------------------------------------------------
  // PIN
  // ---------------------------------------------------------------------------

  @override
  Future<bool> hasPin() async {
    final hash = await _storage.getPinHash();
    final salt = await _storage.getPinSalt();
    return hash != null && hash.isNotEmpty && salt != null && salt.isNotEmpty;
  }

  @override
  Future<void> setPin(String pin) async {
    final salt = _randomSalt();
    final hash = _pbkdf2(pin, salt);
    await _storage.setPin(hash: hash, salt: salt);
  }

  @override
  Future<bool> verifyPin(String pin) async {
    final storedHash = await _storage.getPinHash();
    final salt = await _storage.getPinSalt();
    if (storedHash == null || salt == null) return false;
    final computed = _pbkdf2(pin, salt);
    return _constantTimeEquals(computed, storedHash);
  }

  // ---------------------------------------------------------------------------
  // Recovery code
  // ---------------------------------------------------------------------------

  @override
  Future<String> generateRecoveryCode() async {
    final code = _randomRecoveryCode();
    final salt = _randomSalt();
    final hash = _pbkdf2(_normalizeRecovery(code), salt);
    await _storage.setRecovery(hash: hash, salt: salt);
    return code;
  }

  @override
  Future<bool> hasRecoveryCode() async {
    final hash = await _storage.getRecoveryHash();
    final salt = await _storage.getRecoverySalt();
    return hash != null && hash.isNotEmpty && salt != null && salt.isNotEmpty;
  }

  @override
  Future<bool> verifyRecoveryCode(String code) async {
    final storedHash = await _storage.getRecoveryHash();
    final salt = await _storage.getRecoverySalt();
    if (storedHash == null || salt == null) return false;
    final computed = _pbkdf2(_normalizeRecovery(code), salt);
    return _constantTimeEquals(computed, storedHash);
  }

  // ---------------------------------------------------------------------------
  // Lockout
  // ---------------------------------------------------------------------------

  @override
  Future<LockoutState> getLockoutState() async {
    final failCount = await _storage.getFailCount();
    final until = await _storage.getLockoutUntilMillis();
    if (until == null) {
      return LockoutState(failCount: failCount, remaining: Duration.zero);
    }
    final remaining = DateTime.fromMillisecondsSinceEpoch(
      until,
    ).difference(DateTime.now());
    return LockoutState(
      failCount: failCount,
      remaining: remaining > Duration.zero ? remaining : Duration.zero,
    );
  }

  @override
  Future<LockoutState> recordFailedAttempt() async {
    final newCount = (await _storage.getFailCount()) + 1;
    await _storage.setFailCount(newCount);

    if (newCount < kMaxAttemptsBeforeLockout) {
      await _storage.setLockoutUntilMillis(null);
      return LockoutState(failCount: newCount, remaining: Duration.zero);
    }

    // Escalating: first lockout at threshold = base; each further fail doubles.
    final overflow = newCount - kMaxAttemptsBeforeLockout;
    final duration = kBaseLockoutDuration * pow(2, overflow).toInt();
    final until = DateTime.now().add(duration);
    await _storage.setLockoutUntilMillis(until.millisecondsSinceEpoch);
    return LockoutState(failCount: newCount, remaining: duration);
  }

  @override
  Future<void> resetAttempts() async {
    await _storage.setFailCount(0);
    await _storage.setLockoutUntilMillis(null);
  }

  @override
  Future<void> clearLock() => _storage.clear();

  // ---------------------------------------------------------------------------
  // Crypto helpers
  // ---------------------------------------------------------------------------

  String _randomSalt() {
    final bytes = List<int>.generate(_saltBytes, (_) => _rng.nextInt(256));
    return base64Url.encode(bytes);
  }

  /// PBKDF2-HMAC-SHA256. Returns a base64 hash string bound to [salt].
  String _pbkdf2(String secret, String saltB64) {
    final salt = base64Url.decode(saltB64);
    final hmac = Hmac(sha256, utf8.encode(secret));

    // Single 32-byte output block (dkLen == hLen) is sufficient here.
    final block = <int>[...salt, 0, 0, 0, 1];
    var u = hmac.convert(block).bytes;
    final result = List<int>.from(u);
    for (var i = 1; i < _iterations; i++) {
      u = hmac.convert(u).bytes;
      for (var j = 0; j < result.length; j++) {
        result[j] ^= u[j];
      }
    }
    return base64Url.encode(result);
  }

  String _randomRecoveryCode() {
    final groups = <String>[];
    for (var g = 0; g < _recoveryGroups; g++) {
      final buf = StringBuffer();
      for (var i = 0; i < _recoveryGroupLen; i++) {
        buf.write(_recoveryAlphabet[_rng.nextInt(_recoveryAlphabet.length)]);
      }
      groups.add(buf.toString());
    }
    return groups.join('-');
  }

  /// Normalizes user-entered recovery codes (case + separators) before hashing.
  String _normalizeRecovery(String code) =>
      code.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');

  bool _constantTimeEquals(String a, String b) {
    final ab = utf8.encode(a);
    final bb = utf8.encode(b);
    if (ab.length != bb.length) return false;
    var diff = 0;
    for (var i = 0; i < ab.length; i++) {
      diff |= ab[i] ^ bb[i];
    }
    return diff == 0;
  }
}

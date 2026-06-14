import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

/// Thin wrapper around [LocalAuthentication] for biometric/device-credential
/// unlock. All calls fail safe: any error returns `false` so callers can
/// silently fall back to PIN.
@lazySingleton
class BiometricService {
  final LocalAuthentication _auth;

  BiometricService(this._auth);

  /// Whether biometrics (or device credential) can be used on this device.
  Future<bool> isAvailable() async {
    try {
      final supported = await _auth.isDeviceSupported();
      if (!supported) return false;
      final canCheck = await _auth.canCheckBiometrics;
      final enrolled = await _auth.getAvailableBiometrics();
      return canCheck && enrolled.isNotEmpty;
    } catch (e, s) {
      log('BiometricService.isAvailable failed', error: e, stackTrace: s);
      return false;
    }
  }

  /// Prompts for biometric auth. Returns true only on success.
  Future<bool> authenticate({
    String reason = 'Xác thực để mở khoá',
  }) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
    } catch (e, s) {
      log('BiometricService.authenticate failed', error: e, stackTrace: s);
      return false;
    }
  }
}

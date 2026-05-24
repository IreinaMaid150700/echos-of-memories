import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Wrapper class quản lý FlutterSecureStorage.
/// Dùng chuyên biệt cho lưu thông tin nhạy cảm: Access Token, Refresh Token, User Credentials.
@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageService(this._secureStorage);

  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  // Access Token
  Future<String?> getAccessToken() => _secureStorage.read(key: _keyAccessToken);
  Future<void> setAccessToken(String token) => _secureStorage.write(key: _keyAccessToken, value: token);
  Future<void> deleteAccessToken() => _secureStorage.delete(key: _keyAccessToken);

  // Refresh Token
  Future<String?> getRefreshToken() => _secureStorage.read(key: _keyRefreshToken);
  Future<void> setRefreshToken(String token) => _secureStorage.write(key: _keyRefreshToken, value: token);
  Future<void> deleteRefreshToken() => _secureStorage.delete(key: _keyRefreshToken);

  // Dọn dẹp Credentials khi Logout
  Future<void> clearCredentials() async {
    await deleteAccessToken();
    await deleteRefreshToken();
    // Xóa tất cả: await _secureStorage.deleteAll();
  }
}

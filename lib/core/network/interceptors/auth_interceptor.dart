import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Interceptor tự động thêm Bearer token vào Headers.
/// Cần inject một delegate/service để đọc token từ SharedPreferences / Secure Storage.
@lazySingleton
class AuthInterceptor extends Interceptor {
  // Thay thế bằng service/repository quản lý session của bạn
  // Ví dụ: final LocalStorageService _storageService;
  // AuthInterceptor(this._storageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Tùy theo cách bạn lưu trữ token (Storage service, Hive, v.v...)
    // final token = _storageService.authToken;
    // mock get token:
    const token = 'MOCK_TOKEN'; // TODO: Thay thế bằng token thật

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Pass thêm header language nếu có đa ngôn ngữ
    // options.headers['Accept-Language'] = 'vi';

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Có thể check 401 ở đây để làm logic refreshToken
    // Nếu token hết hạn => call api refresh token => retry original request
    if (err.response?.statusCode == 401) {
      // Ví dụ: await _handleTokenRefresh(err, handler);
    }
    return super.onError(err, handler);
  }
}

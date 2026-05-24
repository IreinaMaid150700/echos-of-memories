import 'package:dio/dio.dart';
import 'failure.dart';

/// Chuyển đổi [DioException] sang [Failure] phù hợp.
///
/// Dùng duy nhất trong `RepositoryImpl` — là điểm catch duy nhất trong app.
///
/// ```dart
/// } on DioException catch (e) {
///   return Left(DioFailureMapper.map(e));
/// }
/// ```
class DioFailureMapper {
  DioFailureMapper._();

  static Failure map(DioException e) {
    switch (e.type) {
      // Không có kết nối / DNS fail
      case DioExceptionType.connectionError:
        return const NetworkFailure();

      // Timeout các loại
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure();

      // SSL / Certificate
      case DioExceptionType.badCertificate:
        return const CertificateFailure();

      // Server trả về HTTP response (có status code)
      case DioExceptionType.badResponse:
        return _mapHttpStatus(e);

      // Request bị cancel (thường do dispose — không cần show error)
      case DioExceptionType.cancel:
        return const UnknownFailure(message: 'Yêu cầu đã bị hủy.');

      // Unknown / other
      case DioExceptionType.unknown:
        // Kiểm tra có phải lỗi mạng không
        if (e.message?.contains('SocketException') == true ||
            e.message?.contains('Connection refused') == true) {
          return const NetworkFailure();
        }
        return UnknownFailure(message: e.message ?? 'Đã có lỗi xảy ra.');
    }
  }

  static Failure _mapHttpStatus(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;

    // Lấy message từ response body nếu có (server custom message)
    final serverMessage = _extractServerMessage(e.response);

    return switch (statusCode) {
      400 =>
        BadRequestFailure(message: serverMessage ?? 'Yêu cầu không hợp lệ.'),
      401 => UnauthorizedFailure(
          message: serverMessage ?? 'Phiên đăng nhập đã hết hạn.'),
      403 => ForbiddenFailure(
          message:
              serverMessage ?? 'Bạn không có quyền thực hiện thao tác này.'),
      404 =>
        NotFoundFailure(message: serverMessage ?? 'Không tìm thấy dữ liệu.'),
      408 => const RequestTimeoutFailure(),
      409 => ConflictFailure(message: serverMessage ?? 'Dữ liệu bị xung đột.'),
      422 =>
        ValidationFailure(message: serverMessage ?? 'Dữ liệu không hợp lệ.'),
      429 => const RateLimitFailure(),
      503 => const ServiceUnavailableFailure(),
      >= 500 => ServerFailure(
          message:
              serverMessage ?? 'Máy chủ đang gặp sự cố. Vui lòng thử lại sau.',
          statusCode: statusCode,
        ),
      _ => ServerFailure(
          message: serverMessage ?? 'Lỗi không xác định (HTTP $statusCode).',
          statusCode: statusCode,
        ),
    };
  }

  /// Trích xuất message từ response body.
  ///
  /// Hỗ trợ các format phổ biến:
  /// - `{ "message": "..." }`
  /// - `{ "error": "..." }`
  /// - `{ "errors": ["...", "..."] }`
  static String? _extractServerMessage(Response<dynamic>? response) {
    try {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        // Format: { "message": "..." }
        if (data['message'] is String) return data['message'] as String;
        // Format: { "error": "..." }
        if (data['error'] is String) return data['error'] as String;
        // Format: { "errors": ["...", "..."] }
        if (data['errors'] is List) {
          final errors = data['errors'] as List;
          if (errors.isNotEmpty) return errors.first.toString();
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}

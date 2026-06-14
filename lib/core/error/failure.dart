// ─────────────────────────────────────────────────────────────────────────────
// Base Failure
// ─────────────────────────────────────────────────────────────────────────────

/// Base class cho mọi loại lỗi trong app.
///
/// Mọi lỗi đều có [message] hiển thị được cho user.
/// Dùng subclass cụ thể để phân biệt nguồn gốc lỗi tại Cubit / UI.
abstract class Failure {
  final String message;

  /// Mã lỗi gốc từ server (nếu có). Dùng để log hoặc analytics.
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  String toString() =>
      '$runtimeType(statusCode: $statusCode, message: $message)';
}

// ─────────────────────────────────────────────────────────────────────────────
// Network Failures — Lỗi kết nối / transport
// ─────────────────────────────────────────────────────────────────────────────

/// Không có kết nối mạng (offline, DNS fail, timeout kết nối).
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Không có kết nối mạng. Vui lòng kiểm tra lại.',
  });
}

/// Request timeout — server không phản hồi trong thời gian cho phép.
class TimeoutFailure extends Failure {
  const TimeoutFailure({
    super.message = 'Yêu cầu mất quá nhiều thời gian. Vui lòng thử lại.',
  });
}

/// SSL / Certificate error.
class CertificateFailure extends Failure {
  const CertificateFailure({super.message = 'Lỗi bảo mật kết nối.'});
}

// ─────────────────────────────────────────────────────────────────────────────
// HTTP Failures — Lỗi theo HTTP status code
// ─────────────────────────────────────────────────────────────────────────────

/// 400 Bad Request — Request không hợp lệ (validate fail từ server).
class BadRequestFailure extends Failure {
  const BadRequestFailure({
    super.message = 'Yêu cầu không hợp lệ.',
    super.statusCode = 400,
  });
}

/// 401 Unauthorized — Chưa đăng nhập hoặc token hết hạn.
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message = 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
    super.statusCode = 401,
  });
}

/// 403 Forbidden — Đã đăng nhập nhưng không có quyền.
class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    super.message = 'Bạn không có quyền thực hiện thao tác này.',
    super.statusCode = 403,
  });
}

/// 404 Not Found — Resource không tồn tại.
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'Không tìm thấy dữ liệu.',
    super.statusCode = 404,
  });
}

/// 408 Request Timeout.
class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure({
    super.message = 'Yêu cầu bị timeout. Vui lòng thử lại.',
    super.statusCode = 408,
  });
}

/// 409 Conflict — Xung đột dữ liệu (vd: email đã tồn tại).
class ConflictFailure extends Failure {
  const ConflictFailure({
    super.message = 'Dữ liệu bị xung đột.',
    super.statusCode = 409,
  });
}

/// 422 Unprocessable Entity — Server hiểu request nhưng không thể xử lý
/// (thường là lỗi validate business logic phía server).
class ValidationFailure extends Failure {
  const ValidationFailure({
    super.message = 'Dữ liệu không hợp lệ.',
    super.statusCode = 422,
  });
}

/// 429 Too Many Requests — Rate limit.
class RateLimitFailure extends Failure {
  const RateLimitFailure({
    super.message = 'Quá nhiều yêu cầu. Vui lòng thử lại sau.',
    super.statusCode = 429,
  });
}

/// 5xx Server Error — Lỗi phía server (500, 502, 503, 504...).
class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Máy chủ đang gặp sự cố. Vui lòng thử lại sau.',
    super.statusCode = 500,
  });
}

/// 503 Service Unavailable — Server đang bảo trì.
class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({
    super.message = 'Dịch vụ tạm thời không khả dụng. Vui lòng thử lại sau.',
    super.statusCode = 503,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// Client-side Failures
// ─────────────────────────────────────────────────────────────────────────────

/// Lỗi parse JSON / mapping data — server trả về format không mong đợi.
class ParseFailure extends Failure {
  const ParseFailure({super.message = 'Không thể xử lý dữ liệu từ server.'});
}

/// Lỗi cache / local storage.
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Lỗi đọc/ghi dữ liệu cục bộ.'});
}

/// Lỗi không xác định — fallback cuối cùng.
class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Đã có lỗi xảy ra. Vui lòng thử lại.'});
}

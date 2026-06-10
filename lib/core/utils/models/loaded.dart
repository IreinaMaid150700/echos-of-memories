import 'package:music_app/core/utils/enum/async_status.dart';

/// Wrapper gộp [AsyncStatus] + [data] + [error] cho một đơn vị dữ liệu async.
///
/// Dùng thay thế cho `bool isLoading` / `AsyncStatus` trực tiếp trên state,
/// giúp mỗi field trong State tự quản lý trạng thái async của mình.
///
/// **Quy tắc:** Luôn dùng [Loaded] cho mọi async operation:
/// - Fetch: `Loaded<Entity>` hoặc `Loaded<List<Entity>>`
/// - Create / Update / Delete: `Loaded<Unit>` (từ package dartz)
/// - UI flag thuần (dialog, navigation): vẫn dùng `bool` thường
///
/// Ví dụ State:
/// ```dart
/// @freezed
/// class DetailState with _$DetailState {
///   const factory DetailState({
///     @Default(Loaded<FeatureEntity>()) Loaded<FeatureEntity> feature,
///     @Default(Loaded<List<CommentEntity>>()) Loaded<List<CommentEntity>> comments,
///     @Default(Loaded<Unit>()) Loaded<Unit> submitAction,
///     @Default(false) bool showDeleteDialog, // UI flag — không phải async
///   }) = _DetailState;
/// }
/// ```
class Loaded<T> {
  final AsyncStatus status;

  /// Dữ liệu hiện tại. Được giữ lại khi reload ([toLoading]) hoặc lỗi ([toFailure]).
  final T? data;

  /// Thông báo lỗi. Null khi không có lỗi.
  final String? error;

  const Loaded({this.status = AsyncStatus.initial, this.data, this.error});

  // ── Getters ──────────────────────────────────────────────────────────────

  bool get isInitial => status == AsyncStatus.initial;
  bool get isLoading => status == AsyncStatus.loading;
  bool get isSuccess => status == AsyncStatus.success;
  bool get isFailure => status == AsyncStatus.failure;

  /// Trả về `true` nếu [data] không null.
  bool get hasData => data != null;

  // ── Transitions ──────────────────────────────────────────────────────────

  /// Chuyển sang trạng thái loading, **giữ nguyên [data] cũ** để UI không bị trắng.
  Loaded<T> toLoading() =>
      Loaded(status: AsyncStatus.loading, data: data, error: null);

  /// Chuyển sang trạng thái success với [value] mới.
  Loaded<T> toSuccess(T value) =>
      Loaded(status: AsyncStatus.success, data: value, error: null);

  /// Chuyển sang trạng thái failure với [message], **giữ nguyên [data] cũ**.
  Loaded<T> toFailure(String message) =>
      Loaded(status: AsyncStatus.failure, data: data, error: message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Loaded<T> &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          data == other.data &&
          error == other.error;

  @override
  int get hashCode => Object.hash(status, data, error);
}

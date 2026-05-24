import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/error/failure.dart';

/// Base class cho mọi Cubit trong project.
///
/// Cung cấp:
/// - [emit] an toàn: tự động guard `isClosed` — subclass không cần check thủ công.
/// - [execute]: bọc gọn pattern loading → action → fold, dùng với [Loaded].
abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  /// Override emit để tự động guard `isClosed`.
  ///
  /// Nếu Cubit đã bị dispose (user back nhanh trong khi Future đang pending),
  /// emit sẽ bị bỏ qua thay vì throw [StateError].
  @override
  void emit(S state) {
    if (!isClosed) super.emit(state);
  }

  /// Thực thi một async UseCase call với pattern chuẩn:
  /// loading → action → fold(onFailure, onSuccess).
  ///
  /// - [loadingState]: state emit trước khi gọi action (thường là `.toLoading()`).
  /// - [action]: UseCase call trả về `Either<Failure, T>`.
  /// - [onSuccess]: trả về state mới khi thành công.
  /// - [onFailure]: trả về state mới khi thất bại.
  ///
  /// Ví dụ:
  /// ```dart
  /// await execute(
  ///   loadingState: state.copyWith(feature: state.feature.toLoading()),
  ///   action: () => _getFeatureUseCase(featureId),
  ///   onSuccess: (entity) => state.copyWith(feature: state.feature.toSuccess(entity)),
  ///   onFailure: (f) => state.copyWith(feature: state.feature.toFailure(f.message)),
  /// );
  /// ```
  Future<void> execute<T>({
    required S loadingState,
    required Future<Either<Failure, T>> Function() action,
    required S Function(T data) onSuccess,
    required S Function(Failure failure) onFailure,
  }) async {
    emit(loadingState);
    final result = await action();
    result.fold(
      (failure) => emit(onFailure(failure)),
      (data) => emit(onSuccess(data)),
    );
  }
}

part of 'camera_capture_cubit.dart';

@freezed
abstract class CameraCaptureState with _$CameraCaptureState {
  const factory CameraCaptureState({
    @Default(false) bool isInitializing,
    @Default(false) bool isReady,
    @Default(false) bool isCapturing,
    @Default(false) bool permissionDenied,
    String? errorMessage,
    @Default([]) List<File> captured,
  }) = _CameraCaptureState;
}

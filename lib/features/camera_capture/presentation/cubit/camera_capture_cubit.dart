import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/permissions/domain/app_permission.dart';
import 'package:music_app/core/permissions/domain/permission_gateway.dart';
import 'package:music_app/core/permissions/domain/permission_result.dart';

part 'camera_capture_state.dart';
part 'camera_capture_cubit.freezed.dart';

/// Owns the [CameraController] lifecycle for the capture screen. The controller
/// is kept as a field (not in state — it is not value-comparable) and exposed
/// via [controller] for [CameraPreview]; UI gates on [CameraCaptureState.isReady].
class CameraCaptureCubit extends Cubit<CameraCaptureState> {
  CameraCaptureCubit({PermissionGateway? permissionGateway})
      : _permissionGateway = permissionGateway,
        super(const CameraCaptureState());

  final PermissionGateway? _permissionGateway;
  CameraController? _controller;
  CameraController? get controller => _controller;

  Future<void> init() async {
    emit(state.copyWith(isInitializing: true, errorMessage: null));
    final gateway = _permissionGateway ?? getIt<PermissionGateway>();
    final result = await gateway.request(AppPermission.camera);
    if (!result.isGranted) {
      emit(state.copyWith(isInitializing: false, permissionDenied: true));
      return;
    }
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        emit(state.copyWith(
          isInitializing: false,
          errorMessage: 'Không tìm thấy camera trên thiết bị.',
        ));
        return;
      }
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        back,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await controller.initialize();
      _controller = controller;
      emit(state.copyWith(isInitializing: false, isReady: true));
    } catch (_) {
      emit(state.copyWith(
        isInitializing: false,
        errorMessage: 'Không khởi tạo được camera. Hãy thử lại.',
      ));
    }
  }

  Future<void> capture() async {
    final c = _controller;
    if (c == null || !c.value.isInitialized || state.isCapturing) return;
    emit(state.copyWith(isCapturing: true, errorMessage: null));
    try {
      final XFile shot = await c.takePicture();
      emit(state.copyWith(
        isCapturing: false,
        captured: [...state.captured, File(shot.path)],
      ));
    } catch (_) {
      emit(state.copyWith(
        isCapturing: false,
        errorMessage: 'Chụp ảnh thất bại. Hãy thử lại.',
      ));
    }
  }

  /// Removes a captured photo by index. Pure — used by the thumbnail strip and
  /// covered by unit tests.
  void removeCaptured(int index) {
    final list = [...state.captured];
    if (index < 0 || index >= list.length) return;
    list.removeAt(index);
    emit(state.copyWith(captured: list));
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/features/camera_capture/presentation/cubit/camera_capture_cubit.dart';

void main() {
  group('CameraCaptureCubit.removeCaptured', () {
    test('removes the photo at the given index', () {
      final cubit = CameraCaptureCubit();
      addTearDown(cubit.close);
      cubit.emit(cubit.state.copyWith(
        captured: [File('/a.jpg'), File('/b.jpg'), File('/c.jpg')],
      ));

      cubit.removeCaptured(1);

      expect(cubit.state.captured.map((f) => f.path), ['/a.jpg', '/c.jpg']);
    });

    test('ignores an out-of-range index', () {
      final cubit = CameraCaptureCubit();
      addTearDown(cubit.close);
      cubit.emit(cubit.state.copyWith(captured: [File('/a.jpg')]));

      cubit.removeCaptured(5);

      expect(cubit.state.captured.map((f) => f.path), ['/a.jpg']);
    });
  });
}

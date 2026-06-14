import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/permissions/domain/app_permission.dart';
import 'package:music_app/core/permissions/domain/permission_gateway.dart';
import 'package:music_app/core/permissions/domain/permission_result.dart';
import 'package:music_app/features/camera_capture/presentation/cubit/camera_capture_cubit.dart';

class _MockPermissionGateway extends Mock implements PermissionGateway {}

void main() {
  setUpAll(() => registerFallbackValue(AppPermission.camera));

  test('init sets permissionDenied when camera permission is not granted', () async {
    final gateway = _MockPermissionGateway();
    when(() => gateway.request(AppPermission.camera))
        .thenAnswer((_) async => PermissionResult.denied);
    final cubit = CameraCaptureCubit(permissionGateway: gateway);
    addTearDown(cubit.close);

    await cubit.init();

    expect(cubit.state.permissionDenied, isTrue);
    expect(cubit.state.isReady, isFalse);
    verify(() => gateway.request(AppPermission.camera)).called(1);
  });
}

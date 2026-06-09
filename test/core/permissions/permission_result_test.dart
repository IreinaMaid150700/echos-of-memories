import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/permissions/domain/permission_result.dart';

void main() {
  test('isGranted is true only for granted', () {
    expect(PermissionResult.granted.isGranted, isTrue);
    expect(PermissionResult.denied.isGranted, isFalse);
    expect(PermissionResult.permanentlyDenied.isGranted, isFalse);
    expect(PermissionResult.restricted.isGranted, isFalse);
  });
}

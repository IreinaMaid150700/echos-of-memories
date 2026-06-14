import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:music_app/core/permissions/data/permission_mappers.dart';
import 'package:music_app/core/permissions/domain/permission_result.dart';

void main() {
  group('mapPluginStatus', () {
    test('granted and limited map to granted', () {
      expect(mapPluginStatus(PermissionStatus.granted), PermissionResult.granted);
      expect(mapPluginStatus(PermissionStatus.limited), PermissionResult.granted);
    });

    test('permanentlyDenied maps to permanentlyDenied', () {
      expect(
        mapPluginStatus(PermissionStatus.permanentlyDenied),
        PermissionResult.permanentlyDenied,
      );
    });

    test('restricted maps to restricted', () {
      expect(mapPluginStatus(PermissionStatus.restricted), PermissionResult.restricted);
    });

    test('denied maps to denied', () {
      expect(mapPluginStatus(PermissionStatus.denied), PermissionResult.denied);
    });
  });

  group('mapLocationPermission', () {
    test('always and whileInUse map to granted', () {
      expect(mapLocationPermission(LocationPermission.always), PermissionResult.granted);
      expect(mapLocationPermission(LocationPermission.whileInUse), PermissionResult.granted);
    });

    test('deniedForever maps to permanentlyDenied', () {
      expect(
        mapLocationPermission(LocationPermission.deniedForever),
        PermissionResult.permanentlyDenied,
      );
    });

    test('denied and unableToDetermine map to denied', () {
      expect(mapLocationPermission(LocationPermission.denied), PermissionResult.denied);
      expect(
        mapLocationPermission(LocationPermission.unableToDetermine),
        PermissionResult.denied,
      );
    });
  });
}

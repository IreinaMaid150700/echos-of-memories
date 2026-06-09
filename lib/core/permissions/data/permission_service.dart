import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:music_app/core/permissions/data/permission_mappers.dart';
import 'package:music_app/core/permissions/domain/app_permission.dart';
import 'package:music_app/core/permissions/domain/permission_gateway.dart';
import 'package:music_app/core/permissions/domain/permission_result.dart';

@LazySingleton(as: PermissionGateway)
class PermissionService implements PermissionGateway {
  @override
  Future<PermissionResult> request(AppPermission permission) async {
    if (permission == AppPermission.location) {
      return _requestLocation();
    }
    final status = await _toPlugin(permission).request();
    return mapPluginStatus(status);
  }

  @override
  Future<PermissionResult> status(AppPermission permission) async {
    if (permission == AppPermission.location) {
      return mapLocationPermission(await Geolocator.checkPermission());
    }
    final s = await _toPlugin(permission).status;
    return mapPluginStatus(s);
  }

  Permission _toPlugin(AppPermission permission) {
    switch (permission) {
      case AppPermission.camera:
        return Permission.camera;
      case AppPermission.photos:
        return Permission.photos;
      case AppPermission.microphone:
        return Permission.microphone;
      case AppPermission.location:
        throw StateError('location is handled by geolocator, not permission_handler');
    }
  }

  Future<PermissionResult> _requestLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return mapLocationPermission(permission);
  }
}

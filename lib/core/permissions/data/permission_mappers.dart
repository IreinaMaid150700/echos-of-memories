import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:music_app/core/permissions/domain/permission_result.dart';

PermissionResult mapPluginStatus(PermissionStatus status) {
  if (status.isGranted || status.isLimited) return PermissionResult.granted;
  if (status.isPermanentlyDenied) return PermissionResult.permanentlyDenied;
  if (status.isRestricted) return PermissionResult.restricted;
  return PermissionResult.denied;
}

PermissionResult mapLocationPermission(LocationPermission permission) {
  switch (permission) {
    case LocationPermission.always:
    case LocationPermission.whileInUse:
      return PermissionResult.granted;
    case LocationPermission.deniedForever:
      return PermissionResult.permanentlyDenied;
    case LocationPermission.denied:
    case LocationPermission.unableToDetermine:
      return PermissionResult.denied;
  }
}

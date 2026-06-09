import 'package:music_app/core/permissions/domain/app_permission.dart';
import 'package:music_app/core/permissions/domain/permission_result.dart';

abstract class PermissionGateway {
  Future<PermissionResult> request(AppPermission permission);
  Future<PermissionResult> status(AppPermission permission);
}

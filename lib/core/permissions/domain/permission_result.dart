enum PermissionResult { granted, denied, permanentlyDenied, restricted }

extension PermissionResultX on PermissionResult {
  bool get isGranted => this == PermissionResult.granted;
}

import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

/// DI bindings for security-related third-party services.
@module
abstract class SecurityModule {
  @lazySingleton
  LocalAuthentication get localAuth => LocalAuthentication();
}

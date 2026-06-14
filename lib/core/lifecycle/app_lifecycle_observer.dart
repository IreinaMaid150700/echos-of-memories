import 'package:flutter/widgets.dart';
import 'package:music_app/features/app_lock/app_lock_constants.dart';
import 'package:music_app/features/app_lock/presentation/cubit/lock_session_cubit.dart';

/// Re-locks the app session when it returns from the background after more
/// than [kAppLockBackgroundTimeout].
///
/// Register with `WidgetsBinding.instance.addObserver` and remove on dispose.
class AppLifecycleObserver with WidgetsBindingObserver {
  final LockSessionCubit _session;
  DateTime? _pausedAt;

  AppLifecycleObserver(this._session);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        _pausedAt = DateTime.now();
        break;
      case AppLifecycleState.resumed:
        final pausedAt = _pausedAt;
        if (pausedAt != null &&
            DateTime.now().difference(pausedAt) > kAppLockBackgroundTimeout) {
          _session.lock();
        }
        _pausedAt = null;
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }
}

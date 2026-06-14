import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/storage/app_database.dart';
import 'package:music_app/core/storage/preferences_service.dart';
import 'package:music_app/features/app_lock/presentation/cubit/lock_session_cubit.dart';

/// Route guard enforcing App Lock.
///
/// - App-open guard (on [HomeRoute]): if `appLockEnabled` and the session is
///   locked, redirect to [UnlockRoute] first.
/// - Per-item guard (on [MomentDetailRoute]): if the target moment is
///   `isLocked` and the session is locked, require unlock first.
///
/// Resolution only proceeds once the unlock screen pops with `true`.
@LazySingleton()
class AppLockGuard extends AutoRouteGuard {
  final PreferencesService _preferences;
  final LockSessionCubit _session;
  final AppDatabase _db;

  AppLockGuard(this._preferences, this._session, this._db);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // Already unlocked for this session — let everything through.
    if (_session.isUnlocked) {
      resolver.next();
      return;
    }

    final routeName = resolver.route.name;
    final bool shouldGate = await _shouldGate(routeName, resolver);

    if (!shouldGate) {
      resolver.next();
      return;
    }

    final unlocked = await router.push<bool>(const UnlockRoute());
    resolver.next(unlocked == true);
  }

  Future<bool> _shouldGate(
    String routeName,
    NavigationResolver resolver,
  ) async {
    // App-open gate.
    if (routeName == HomeRoute.name) {
      return _preferences.isAppLockEnabled;
    }

    // Per-item gate for moment detail.
    if (routeName == MomentDetailRoute.name) {
      final args = resolver.route.args;
      if (args is MomentDetailRouteArgs) {
        return _isMomentLocked(args.momentId);
      }
    }

    return false;
  }

  Future<bool> _isMomentLocked(String momentId) async {
    try {
      final row =
          await (_db.select(_db.moments)
                ..where((t) => t.id.equals(momentId)))
              .getSingleOrNull();
      return row?.isLocked ?? false;
    } catch (_) {
      // Fail safe: if we cannot determine lock state, do not block access
      // beyond what app-open gating already provides.
      return false;
    }
  }
}

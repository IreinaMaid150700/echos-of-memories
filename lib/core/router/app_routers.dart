import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/router/app_lock_guard.dart';
import 'package:music_app/features/app_lock/presentation/screens/change_pin_screen.dart';
import 'package:music_app/features/app_lock/presentation/screens/pin_setup_screen.dart';
import 'package:music_app/features/app_lock/presentation/screens/recovery_screen.dart';
import 'package:music_app/features/app_lock/presentation/screens/unlock_screen.dart';
import 'package:music_app/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:music_app/features/create_collection/presentation/screens/create_collection_screen.dart';
import 'package:music_app/features/camera_capture/presentation/screens/camera_capture_screen.dart';
import 'package:music_app/features/create_moment/presentation/screens/create_moment_screen.dart';
import 'package:music_app/features/dev_db_viewer/presentation/screens/dev_db_viewer_screen.dart';
import 'package:music_app/features/home/presentation/screens/home_screen.dart';
import 'package:music_app/features/introduction/presentation/introduction_screen.dart';
import 'package:music_app/features/map/presentation/screens/map_screen.dart';
import 'package:music_app/features/moment_detail/presentation/screens/moment_detail_screen.dart';
import 'package:music_app/features/search/presentation/screens/search_screen.dart';
import 'package:music_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:music_app/features/splash_screen/splash_screen.dart';
import 'package:music_app/features/theme/presentation/screens/theme_picker_screen.dart';
import 'package:music_app/features/timeline/presentation/screens/timeline_screen.dart';
part 'app_routers.gr.dart';

@LazySingleton()
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
final class AppRouters extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SaveYourMemIntroductionRoute.page),
    AutoRoute(page: HomeRoute.page, guards: [getIt<AppLockGuard>()]),
    AutoRoute(page: TimelineRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: ThemePickerRoute.page),
    AutoRoute(page: CalendarRoute.page),
    AutoRoute(page: MapRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: MomentDetailRoute.page, guards: [getIt<AppLockGuard>()]),
    AutoRoute(page: CreateMomentRoute.page),
    if (kDebugMode) ...[AutoRoute(page: DevDbViewerRoute.page)],
    AutoRoute(page: CreateCollectionRoute.page),
    AutoRoute(page: CameraCaptureRoute.page),
    AutoRoute(page: UnlockRoute.page),
    AutoRoute(page: PinSetupRoute.page),
    AutoRoute(page: ChangePinRoute.page),
    AutoRoute(page: RecoveryRoute.page),
  ];
}

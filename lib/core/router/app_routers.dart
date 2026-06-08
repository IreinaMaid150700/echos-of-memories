import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:music_app/features/create_collection/presentation/screens/create_collection_screen.dart';
import 'package:music_app/features/camera_capture/presentation/screens/camera_capture_screen.dart';
import 'package:music_app/features/create_moment/presentation/screens/create_moment_screen.dart';
import 'package:music_app/features/dev_db_viewer/presentation/screens/dev_db_viewer_screen.dart';
import 'package:music_app/features/home/presentation/screens/home_screen.dart';
import 'package:music_app/features/introduction/presentation/introduction_screen.dart';
import 'package:music_app/features/moment_detail/presentation/screens/moment_detail_screen.dart';
import 'package:music_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:music_app/features/splash_screen/splash_screen.dart';
import 'package:music_app/features/timeline/presentation/screens/timeline_screen.dart';
part 'app_routers.gr.dart';

@LazySingleton()
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
final class AppRouters extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SaveYourMemIntroductionRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: TimelineRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: CalendarRoute.page),
    AutoRoute(page: MomentDetailRoute.page),
    AutoRoute(page: CreateMomentRoute.page),
    AutoRoute(page: DevDbViewerRoute.page),
    AutoRoute(page: CreateCollectionRoute.page),
    AutoRoute(page: CameraCaptureRoute.page),
  ];
}

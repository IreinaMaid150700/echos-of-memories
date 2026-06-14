// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routers.dart';

/// generated route for
/// [CalendarScreen]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalendarScreen();
    },
  );
}

/// generated route for
/// [CameraCaptureScreen]
class CameraCaptureRoute extends PageRouteInfo<void> {
  const CameraCaptureRoute({List<PageRouteInfo>? children})
    : super(CameraCaptureRoute.name, initialChildren: children);

  static const String name = 'CameraCaptureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CameraCaptureScreen();
    },
  );
}

/// generated route for
/// [ChangePinScreen]
class ChangePinRoute extends PageRouteInfo<void> {
  const ChangePinRoute({List<PageRouteInfo>? children})
    : super(ChangePinRoute.name, initialChildren: children);

  static const String name = 'ChangePinRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePinScreen();
    },
  );
}

/// generated route for
/// [CreateCollectionScreen]
class CreateCollectionRoute extends PageRouteInfo<void> {
  const CreateCollectionRoute({List<PageRouteInfo>? children})
    : super(CreateCollectionRoute.name, initialChildren: children);

  static const String name = 'CreateCollectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateCollectionScreen();
    },
  );
}

/// generated route for
/// [CreateMomentScreen]
class CreateMomentRoute extends PageRouteInfo<CreateMomentRouteArgs> {
  CreateMomentRoute({
    Key? key,
    List<File> initialImages = const [],
    List<PageRouteInfo>? children,
  }) : super(
         CreateMomentRoute.name,
         args: CreateMomentRouteArgs(key: key, initialImages: initialImages),
         initialChildren: children,
       );

  static const String name = 'CreateMomentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateMomentRouteArgs>(
        orElse: () => const CreateMomentRouteArgs(),
      );
      return CreateMomentScreen(
        key: args.key,
        initialImages: args.initialImages,
      );
    },
  );
}

class CreateMomentRouteArgs {
  const CreateMomentRouteArgs({this.key, this.initialImages = const []});

  final Key? key;

  final List<File> initialImages;

  @override
  String toString() {
    return 'CreateMomentRouteArgs{key: $key, initialImages: $initialImages}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateMomentRouteArgs) return false;
    return key == other.key &&
        const ListEquality<File>().equals(initialImages, other.initialImages);
  }

  @override
  int get hashCode =>
      key.hashCode ^ const ListEquality<File>().hash(initialImages);
}

/// generated route for
/// [DevDbViewerScreen]
class DevDbViewerRoute extends PageRouteInfo<void> {
  const DevDbViewerRoute({List<PageRouteInfo>? children})
    : super(DevDbViewerRoute.name, initialChildren: children);

  static const String name = 'DevDbViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DevDbViewerScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [MomentDetailScreen]
class MomentDetailRoute extends PageRouteInfo<MomentDetailRouteArgs> {
  MomentDetailRoute({
    Key? key,
    required String momentId,
    List<PageRouteInfo>? children,
  }) : super(
         MomentDetailRoute.name,
         args: MomentDetailRouteArgs(key: key, momentId: momentId),
         initialChildren: children,
       );

  static const String name = 'MomentDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MomentDetailRouteArgs>();
      return MomentDetailScreen(key: args.key, momentId: args.momentId);
    },
  );
}

class MomentDetailRouteArgs {
  const MomentDetailRouteArgs({this.key, required this.momentId});

  final Key? key;

  final String momentId;

  @override
  String toString() {
    return 'MomentDetailRouteArgs{key: $key, momentId: $momentId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MomentDetailRouteArgs) return false;
    return key == other.key && momentId == other.momentId;
  }

  @override
  int get hashCode => key.hashCode ^ momentId.hashCode;
}

/// generated route for
/// [PinSetupScreen]
class PinSetupRoute extends PageRouteInfo<void> {
  const PinSetupRoute({List<PageRouteInfo>? children})
    : super(PinSetupRoute.name, initialChildren: children);

  static const String name = 'PinSetupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PinSetupScreen();
    },
  );
}

/// generated route for
/// [RecoveryScreen]
class RecoveryRoute extends PageRouteInfo<void> {
  const RecoveryRoute({List<PageRouteInfo>? children})
    : super(RecoveryRoute.name, initialChildren: children);

  static const String name = 'RecoveryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RecoveryScreen();
    },
  );
}

/// generated route for
/// [SaveYourMemIntroductionScreen]
class SaveYourMemIntroductionRoute extends PageRouteInfo<void> {
  const SaveYourMemIntroductionRoute({List<PageRouteInfo>? children})
    : super(SaveYourMemIntroductionRoute.name, initialChildren: children);

  static const String name = 'SaveYourMemIntroductionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SaveYourMemIntroductionScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [TimelineScreen]
class TimelineRoute extends PageRouteInfo<void> {
  const TimelineRoute({List<PageRouteInfo>? children})
    : super(TimelineRoute.name, initialChildren: children);

  static const String name = 'TimelineRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TimelineScreen();
    },
  );
}

/// generated route for
/// [UnlockScreen]
class UnlockRoute extends PageRouteInfo<void> {
  const UnlockRoute({List<PageRouteInfo>? children})
    : super(UnlockRoute.name, initialChildren: children);

  static const String name = 'UnlockRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UnlockScreen();
    },
  );
}

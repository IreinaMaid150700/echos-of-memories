import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/enum/splash_navigation_enum.dart';
import 'package:music_app/core/gen/assets.gen.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/features/splash_screen/cubit/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SplashCubit(sharedPreferences: getIt<SharedPreferences>()),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) {
          return current.maybeWhen(
            orElse: () => false,
            loadedLocalData: (_) => true,
          );
        },
        listener: (context, state) {
          state.maybeWhen(
            loadedLocalData: (navigation) {
              switch (navigation) {
                case SplashNavigationEvent.home:
                  break;
                case SplashNavigationEvent.onboarding:
                  context.router.push(const SaveYourMemIntroductionRoute());
                  break;
                case SplashNavigationEvent.none:
                  break;
              }
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: _SaveYourMemoriesBody(),
        ),
      ),
    );
  }
}

class _SaveYourMemoriesBody extends StatefulWidget {
  const _SaveYourMemoriesBody({super.key});

  @override
  State<_SaveYourMemoriesBody> createState() => _SaveYourMemoriesBodyState();
}

class _SaveYourMemoriesBodyState extends State<_SaveYourMemoriesBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationStatusListener();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _animationStatusListener() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        context.read<SplashCubit>().onAnimationLoaded();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    return Lottie.asset(
      controller: _animationController,
      Assets.lotties.splashAnimation.path,
      frameRate: FrameRate.max,
      fit: BoxFit.fill,
      repeat: true,
      animate: true,
      options: LottieOptions(enableMergePaths: true),
      onLoaded: (composition) {
        _animationController
          ..duration = composition.duration
          ..forward();

        splashCubit.initialApp();
      },
    );
  }
}

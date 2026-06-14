import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/di/injector.dart';
import 'package:music_app/core/lifecycle/app_lifecycle_observer.dart';
import 'package:music_app/core/router/app_routers.dart';
import 'package:music_app/core/theme/app_theme.dart';
import 'package:music_app/features/app_lock/presentation/cubit/lock_session_cubit.dart';
import 'package:music_app/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:music_app/features/theme/presentation/cubit/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleObserver _lifecycleObserver;

  @override
  void initState() {
    super.initState();
    _lifecycleObserver = AppLifecycleObserver(getIt<LockSessionCubit>());
    WidgetsBinding.instance.addObserver(_lifecycleObserver);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleObserver);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appRouters = getIt<AppRouters>();
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>()..loadTheme(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.theme.data != current.theme.data,
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Save your Memories',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.theme.data ?? ThemeMode.system,
            routerConfig: appRouters.config(),
          );
        },
      ),
    );
  }
}

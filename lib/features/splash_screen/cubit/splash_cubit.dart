import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/constrant/app_contrants.dart';

import 'package:music_app/core/enum/splash_navigation_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.sharedPreferences})
    : isFirstLogin =
          sharedPreferences.getBool(AppContrants.keyFirstLogin) != true,
      super(SplashState.initial());

  final SharedPreferences sharedPreferences;

  late final bool isFirstLogin;

  bool isLoaded = false;

  Future<void> initialApp() async {
    await Future.delayed(const Duration(seconds: 1));
    isLoaded = true;
  }

  void onAnimationLoaded() {
    if (!isLoaded) return;
    emit(
      SplashState.loadedLocalData(
        navigation: isFirstLogin
            ? SplashNavigationEvent.onboarding
            : SplashNavigationEvent.home,
      ),
    );
  }
}

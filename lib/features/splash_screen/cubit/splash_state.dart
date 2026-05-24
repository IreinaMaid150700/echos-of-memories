part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.loadedLocalData({
    required SplashNavigationEvent navigation,
  }) = _LoadedLocalData;
}

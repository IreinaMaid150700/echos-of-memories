// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart' as _lottie;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_add.svg
  String get icAdd => 'assets/icons/ic_add.svg';

  /// File path: assets/icons/ic_back.svg
  String get icBack => 'assets/icons/ic_back.svg';

  /// File path: assets/icons/ic_calendar.svg
  String get icCalendar => 'assets/icons/ic_calendar.svg';

  /// File path: assets/icons/ic_clock_time.svg
  String get icClockTime => 'assets/icons/ic_clock_time.svg';

  /// File path: assets/icons/ic_delete.svg
  String get icDelete => 'assets/icons/ic_delete.svg';

  /// File path: assets/icons/ic_edit.svg
  String get icEdit => 'assets/icons/ic_edit.svg';

  /// File path: assets/icons/ic_empty_center.svg
  String get icEmptyCenter => 'assets/icons/ic_empty_center.svg';

  /// File path: assets/icons/ic_filter.svg
  String get icFilter => 'assets/icons/ic_filter.svg';

  /// File path: assets/icons/ic_home_header.svg
  String get icHomeHeader => 'assets/icons/ic_home_header.svg';

  /// File path: assets/icons/ic_leaf.svg
  String get icLeaf => 'assets/icons/ic_leaf.svg';

  /// File path: assets/icons/ic_local_only.svg
  String get icLocalOnly => 'assets/icons/ic_local_only.svg';

  /// File path: assets/icons/ic_map.svg
  String get icMap => 'assets/icons/ic_map.svg';

  /// File path: assets/icons/ic_mood.svg
  String get icMood => 'assets/icons/ic_mood.svg';

  /// File path: assets/icons/ic_mood_calm.svg
  String get icMoodCalm => 'assets/icons/ic_mood_calm.svg';

  /// File path: assets/icons/ic_mood_joyful.svg
  String get icMoodJoyful => 'assets/icons/ic_mood_joyful.svg';

  /// File path: assets/icons/ic_mood_peaceful.svg
  String get icMoodPeaceful => 'assets/icons/ic_mood_peaceful.svg';

  /// File path: assets/icons/ic_moon.svg
  String get icMoon => 'assets/icons/ic_moon.svg';

  /// File path: assets/icons/ic_note.svg
  String get icNote => 'assets/icons/ic_note.svg';

  /// File path: assets/icons/ic_nothing_on_map.svg
  String get icNothingOnMap => 'assets/icons/ic_nothing_on_map.svg';

  /// File path: assets/icons/ic_offline_first.svg
  String get icOfflineFirst => 'assets/icons/ic_offline_first.svg';

  /// File path: assets/icons/ic_private_mode.svg
  String get icPrivateMode => 'assets/icons/ic_private_mode.svg';

  /// File path: assets/icons/ic_save.svg
  String get icSave => 'assets/icons/ic_save.svg';

  /// File path: assets/icons/ic_search.svg
  String get icSearch => 'assets/icons/ic_search.svg';

  /// File path: assets/icons/ic_search_result.svg
  String get icSearchResult => 'assets/icons/ic_search_result.svg';

  /// File path: assets/icons/ic_secure_storage.svg
  String get icSecureStorage => 'assets/icons/ic_secure_storage.svg';

  /// File path: assets/icons/ic_setting.svg
  String get icSetting => 'assets/icons/ic_setting.svg';

  /// File path: assets/icons/ic_share.svg
  String get icShare => 'assets/icons/ic_share.svg';

  /// File path: assets/icons/ic_sort.svg
  String get icSort => 'assets/icons/ic_sort.svg';

  /// File path: assets/icons/ic_tag.svg
  String get icTag => 'assets/icons/ic_tag.svg';

  /// File path: assets/icons/ic_timeline.svg
  String get icTimeline => 'assets/icons/ic_timeline.svg';

  /// File path: assets/icons/ic_weather_cool.svg
  String get icWeatherCool => 'assets/icons/ic_weather_cool.svg';

  /// File path: assets/icons/ic_weather_rain.svg
  String get icWeatherRain => 'assets/icons/ic_weather_rain.svg';

  /// File path: assets/icons/ic_weather_sunny.svg
  String get icWeatherSunny => 'assets/icons/ic_weather_sunny.svg';

  /// List of all assets
  List<String> get values => [
    icAdd,
    icBack,
    icCalendar,
    icClockTime,
    icDelete,
    icEdit,
    icEmptyCenter,
    icFilter,
    icHomeHeader,
    icLeaf,
    icLocalOnly,
    icMap,
    icMood,
    icMoodCalm,
    icMoodJoyful,
    icMoodPeaceful,
    icMoon,
    icNote,
    icNothingOnMap,
    icOfflineFirst,
    icPrivateMode,
    icSave,
    icSearch,
    icSearchResult,
    icSecureStorage,
    icSetting,
    icShare,
    icSort,
    icTag,
    icTimeline,
    icWeatherCool,
    icWeatherRain,
    icWeatherSunny,
  ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/splash_animation.json
  LottieGenImage get splashAnimation => const LottieGenImage('assets/lotties/splash_animation.json');

  /// File path: assets/lotties/success.lottie
  LottieGenImage get success => const LottieGenImage('assets/lotties/success.lottie');

  /// File path: assets/lotties/weather_windy.json
  LottieGenImage get weatherWindy => const LottieGenImage('assets/lotties/weather_windy.json');

  /// List of all assets
  List<LottieGenImage> get values => [splashAnimation, success, weatherWindy];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

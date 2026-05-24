import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app/core/utils/models/loaded.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(Loaded<ThemeMode>()) Loaded<ThemeMode> theme,
  }) = _ThemeState;
}

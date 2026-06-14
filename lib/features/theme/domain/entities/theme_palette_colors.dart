import 'package:flutter/material.dart';
import 'package:music_app/core/theme/app_custom_colors.dart';

/// Parses `#RRGGBB` into a fully opaque [Color].
Color hexToColor(String hex) =>
    Color(0xFF000000 | int.parse(hex.substring(1), radix: 16));

/// Formats a [Color] as an uppercase `#RRGGBB` string (alpha dropped).
String colorToHex(Color color) =>
    '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

/// All colors for one brightness variant of a theme.
///
/// Field names mirror [AppCustomColors] 1:1 (34 fields) plus [onPrimary] (35
/// total). Serialized to JSON as a `{fieldName: "#RRGGBB"}` map for DB storage.
class ThemePaletteColors {
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color surfaceLowest;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color tertiary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color borderSubtle;
  final Color borderDefault;
  final Color dangerBackground;
  final Color dangerText;
  final Color successBackground;
  final Color successText;
  final Color warningBackground;
  final Color warningText;
  final Color moodCalmBackground;
  final Color moodCalmText;
  final Color moodWarmBackground;
  final Color moodWarmText;
  final Color moodFocusedBackground;
  final Color moodFocusedText;
  final Color moodPeacefulBackground;
  final Color moodPeacefulText;
  final Color bottomNavBackground;
  final Color bottomNavActiveBackground;
  final Color bottomNavInactiveIcon;
  final Color bottomNavInactiveLabel;
  final Color tagChipBackground;
  final Color privacyChipBackground;
  final Color privacyChipForeground;
  final Color privacyChipBorder;

  const ThemePaletteColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.surfaceLowest,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.tertiary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.borderSubtle,
    required this.borderDefault,
    required this.dangerBackground,
    required this.dangerText,
    required this.successBackground,
    required this.successText,
    required this.warningBackground,
    required this.warningText,
    required this.moodCalmBackground,
    required this.moodCalmText,
    required this.moodWarmBackground,
    required this.moodWarmText,
    required this.moodFocusedBackground,
    required this.moodFocusedText,
    required this.moodPeacefulBackground,
    required this.moodPeacefulText,
    required this.bottomNavBackground,
    required this.bottomNavActiveBackground,
    required this.bottomNavInactiveIcon,
    required this.bottomNavInactiveLabel,
    required this.tagChipBackground,
    required this.privacyChipBackground,
    required this.privacyChipForeground,
    required this.privacyChipBorder,
  });

  Map<String, String> toJson() => {
        'background': colorToHex(background),
        'surface': colorToHex(surface),
        'surfaceElevated': colorToHex(surfaceElevated),
        'surfaceLowest': colorToHex(surfaceLowest),
        'primary': colorToHex(primary),
        'onPrimary': colorToHex(onPrimary),
        'secondary': colorToHex(secondary),
        'tertiary': colorToHex(tertiary),
        'textPrimary': colorToHex(textPrimary),
        'textSecondary': colorToHex(textSecondary),
        'textMuted': colorToHex(textMuted),
        'borderSubtle': colorToHex(borderSubtle),
        'borderDefault': colorToHex(borderDefault),
        'dangerBackground': colorToHex(dangerBackground),
        'dangerText': colorToHex(dangerText),
        'successBackground': colorToHex(successBackground),
        'successText': colorToHex(successText),
        'warningBackground': colorToHex(warningBackground),
        'warningText': colorToHex(warningText),
        'moodCalmBackground': colorToHex(moodCalmBackground),
        'moodCalmText': colorToHex(moodCalmText),
        'moodWarmBackground': colorToHex(moodWarmBackground),
        'moodWarmText': colorToHex(moodWarmText),
        'moodFocusedBackground': colorToHex(moodFocusedBackground),
        'moodFocusedText': colorToHex(moodFocusedText),
        'moodPeacefulBackground': colorToHex(moodPeacefulBackground),
        'moodPeacefulText': colorToHex(moodPeacefulText),
        'bottomNavBackground': colorToHex(bottomNavBackground),
        'bottomNavActiveBackground': colorToHex(bottomNavActiveBackground),
        'bottomNavInactiveIcon': colorToHex(bottomNavInactiveIcon),
        'bottomNavInactiveLabel': colorToHex(bottomNavInactiveLabel),
        'tagChipBackground': colorToHex(tagChipBackground),
        'privacyChipBackground': colorToHex(privacyChipBackground),
        'privacyChipForeground': colorToHex(privacyChipForeground),
        'privacyChipBorder': colorToHex(privacyChipBorder),
      };

  factory ThemePaletteColors.fromJson(Map<String, dynamic> json) {
    Color c(String key) => hexToColor(json[key] as String);
    return ThemePaletteColors(
      background: c('background'),
      surface: c('surface'),
      surfaceElevated: c('surfaceElevated'),
      surfaceLowest: c('surfaceLowest'),
      primary: c('primary'),
      onPrimary: c('onPrimary'),
      secondary: c('secondary'),
      tertiary: c('tertiary'),
      textPrimary: c('textPrimary'),
      textSecondary: c('textSecondary'),
      textMuted: c('textMuted'),
      borderSubtle: c('borderSubtle'),
      borderDefault: c('borderDefault'),
      dangerBackground: c('dangerBackground'),
      dangerText: c('dangerText'),
      successBackground: c('successBackground'),
      successText: c('successText'),
      warningBackground: c('warningBackground'),
      warningText: c('warningText'),
      moodCalmBackground: c('moodCalmBackground'),
      moodCalmText: c('moodCalmText'),
      moodWarmBackground: c('moodWarmBackground'),
      moodWarmText: c('moodWarmText'),
      moodFocusedBackground: c('moodFocusedBackground'),
      moodFocusedText: c('moodFocusedText'),
      moodPeacefulBackground: c('moodPeacefulBackground'),
      moodPeacefulText: c('moodPeacefulText'),
      bottomNavBackground: c('bottomNavBackground'),
      bottomNavActiveBackground: c('bottomNavActiveBackground'),
      bottomNavInactiveIcon: c('bottomNavInactiveIcon'),
      bottomNavInactiveLabel: c('bottomNavInactiveLabel'),
      tagChipBackground: c('tagChipBackground'),
      privacyChipBackground: c('privacyChipBackground'),
      privacyChipForeground: c('privacyChipForeground'),
      privacyChipBorder: c('privacyChipBorder'),
    );
  }

  AppCustomColors toAppCustomColors() => AppCustomColors(
        background: background,
        surface: surface,
        surfaceElevated: surfaceElevated,
        surfaceLowest: surfaceLowest,
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        textMuted: textMuted,
        borderSubtle: borderSubtle,
        borderDefault: borderDefault,
        dangerBackground: dangerBackground,
        dangerText: dangerText,
        successBackground: successBackground,
        successText: successText,
        warningBackground: warningBackground,
        warningText: warningText,
        moodCalmBackground: moodCalmBackground,
        moodCalmText: moodCalmText,
        moodWarmBackground: moodWarmBackground,
        moodWarmText: moodWarmText,
        moodFocusedBackground: moodFocusedBackground,
        moodFocusedText: moodFocusedText,
        moodPeacefulBackground: moodPeacefulBackground,
        moodPeacefulText: moodPeacefulText,
        bottomNavBackground: bottomNavBackground,
        bottomNavActiveBackground: bottomNavActiveBackground,
        bottomNavInactiveIcon: bottomNavInactiveIcon,
        bottomNavInactiveLabel: bottomNavInactiveLabel,
        tagChipBackground: tagChipBackground,
        privacyChipBackground: privacyChipBackground,
        privacyChipForeground: privacyChipForeground,
        privacyChipBorder: privacyChipBorder,
      );

  @override
  bool operator ==(Object other) =>
      other is ThemePaletteColors && other.toJson().toString() == toJson().toString();

  @override
  int get hashCode => toJson().toString().hashCode;
}

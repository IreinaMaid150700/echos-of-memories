import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppCustomColors extends ThemeExtension<AppCustomColors> {
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color surfaceLowest;
  final Color primary;
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

  const AppCustomColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.surfaceLowest,
    required this.primary,
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

  factory AppCustomColors.light() => const AppCustomColors(
    background: AppLightColors.background,
    surface: AppLightColors.surface,
    surfaceElevated: AppLightColors.surfaceLowest,
    surfaceLowest: AppLightColors.surfaceLowest,
    primary: AppLightColors.primary,
    secondary: AppLightColors.secondary,
    tertiary: AppLightColors.tertiary,
    textPrimary: AppLightColors.textPrimary,
    textSecondary: AppLightColors.textSecondary,
    textMuted: AppLightColors.textMuted,
    borderSubtle: AppLightColors.borderSubtle,
    borderDefault: AppLightColors.borderSubtle,
    dangerBackground: AppLightColors.dangerBackground,
    dangerText: AppLightColors.dangerText,
    successBackground: AppLightColors.successBackground,
    successText: AppLightColors.successText,
    warningBackground: AppLightColors.warningBackground,
    warningText: AppLightColors.warningText,
    moodCalmBackground: AppLightColors.moodCalmBackground,
    moodCalmText: AppLightColors.moodCalmText,
    moodWarmBackground: AppLightColors.moodWarmBackground,
    moodWarmText: AppLightColors.moodWarmText,
    moodFocusedBackground: AppLightColors.moodFocusedBackground,
    moodFocusedText: AppLightColors.moodFocusedText,
    moodPeacefulBackground: AppLightColors.moodPeacefulBackground,
    moodPeacefulText: AppLightColors.moodPeacefulText,
    bottomNavBackground: AppLightColors.bottomNavBackground,
    bottomNavActiveBackground: AppLightColors.bottomNavActiveBackground,
    bottomNavInactiveIcon: AppLightColors.bottomNavInactiveIcon,
    bottomNavInactiveLabel: AppLightColors.bottomNavInactiveLabel,
    tagChipBackground: AppLightColors.tagChipBackground,
    privacyChipBackground: AppLightColors.privacyChipBackground,
    privacyChipBorder: AppLightColors.privacyChipBorder,
    privacyChipForeground: AppLightColors.privacyChipForeground,
  );

  factory AppCustomColors.dark() => const AppCustomColors(
    background: AppDarkColors.background,
    surface: AppDarkColors.surface,
    surfaceElevated: AppDarkColors.surfaceElevated,
    surfaceLowest: AppDarkColors.background,
    primary: AppDarkColors.primary,
    secondary: AppDarkColors.secondary,
    tertiary: AppDarkColors.tertiary,
    textPrimary: AppDarkColors.textPrimary,
    textSecondary: AppDarkColors.textSecondary,
    textMuted: AppDarkColors.textMuted,
    borderSubtle: AppDarkColors.borderSubtle,
    borderDefault: AppDarkColors.borderDefault,
    dangerBackground: AppDarkColors.dangerBackground,
    dangerText: AppDarkColors.dangerText,
    successBackground: AppDarkColors.successBackground,
    successText: AppDarkColors.successText,
    warningBackground: AppDarkColors.warningBackground,
    warningText: AppDarkColors.warningText,
    moodCalmBackground: AppDarkColors.moodCalmBackground,
    moodCalmText: AppDarkColors.moodCalmText,
    moodWarmBackground: AppDarkColors.moodWarmBackground,
    moodWarmText: AppDarkColors.moodWarmText,
    moodFocusedBackground: AppDarkColors.moodFocusedBackground,
    moodFocusedText: AppDarkColors.moodFocusedText,
    moodPeacefulBackground: AppDarkColors.moodPeacefulBackground,
    moodPeacefulText: AppDarkColors.moodPeacefulText,
    bottomNavBackground: AppDarkColors.bottomNavBackground,
    bottomNavActiveBackground: AppDarkColors.bottomNavActiveBackground,
    bottomNavInactiveIcon: AppDarkColors.bottomNavInactiveIcon,
    bottomNavInactiveLabel: AppDarkColors.bottomNavInactiveLabel,
    tagChipBackground: AppDarkColors.tagChipBackground,
    privacyChipBackground: AppDarkColors.privacyChipBackground,
    privacyChipBorder: AppDarkColors.privacyChipBorder,
    privacyChipForeground: AppDarkColors.privacyChipForeground,
  );

  @override
  AppCustomColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? surfaceLowest,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? borderSubtle,
    Color? borderDefault,
    Color? dangerBackground,
    Color? dangerText,
    Color? successBackground,
    Color? successText,
    Color? warningBackground,
    Color? warningText,
    Color? moodCalmBackground,
    Color? moodCalmText,
    Color? moodWarmBackground,
    Color? moodWarmText,
    Color? moodFocusedBackground,
    Color? moodFocusedText,
    Color? moodPeacefulBackground,
    Color? moodPeacefulText,
    Color? bottomNavBackground,
    Color? bottomNavActiveBackground,
    Color? bottomNavInactiveIcon,
    Color? bottomNavInactiveLabel,
    Color? tagChipBackground,
    Color? privacyChipBackground,
    Color? privacyChipForeground,
    Color? privacyChipBorder,
  }) {
    return AppCustomColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      surfaceLowest: surfaceLowest ?? this.surfaceLowest,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderDefault: borderDefault ?? this.borderDefault,
      dangerBackground: dangerBackground ?? this.dangerBackground,
      dangerText: dangerText ?? this.dangerText,
      successBackground: successBackground ?? this.successBackground,
      successText: successText ?? this.successText,
      warningBackground: warningBackground ?? this.warningBackground,
      warningText: warningText ?? this.warningText,
      moodCalmBackground: moodCalmBackground ?? this.moodCalmBackground,
      moodCalmText: moodCalmText ?? this.moodCalmText,
      moodWarmBackground: moodWarmBackground ?? this.moodWarmBackground,
      moodWarmText: moodWarmText ?? this.moodWarmText,
      moodFocusedBackground:
          moodFocusedBackground ?? this.moodFocusedBackground,
      moodFocusedText: moodFocusedText ?? this.moodFocusedText,
      moodPeacefulBackground:
          moodPeacefulBackground ?? this.moodPeacefulBackground,
      moodPeacefulText: moodPeacefulText ?? this.moodPeacefulText,
      bottomNavBackground: bottomNavBackground ?? this.bottomNavBackground,
      bottomNavActiveBackground:
          bottomNavActiveBackground ?? this.bottomNavActiveBackground,
      bottomNavInactiveIcon:
          bottomNavInactiveIcon ?? this.bottomNavInactiveIcon,
      bottomNavInactiveLabel:
          bottomNavInactiveLabel ?? this.bottomNavInactiveLabel,
      tagChipBackground: tagChipBackground ?? this.tagChipBackground,
      privacyChipBackground:
          privacyChipBackground ?? this.privacyChipBackground,
      privacyChipForeground:
          privacyChipForeground ?? this.privacyChipForeground,
      privacyChipBorder: privacyChipBorder ?? this.privacyChipBorder,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
    return AppCustomColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      surfaceLowest: Color.lerp(surfaceLowest, other.surfaceLowest, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      dangerBackground: Color.lerp(
        dangerBackground,
        other.dangerBackground,
        t,
      )!,
      dangerText: Color.lerp(dangerText, other.dangerText, t)!,
      successBackground: Color.lerp(
        successBackground,
        other.successBackground,
        t,
      )!,
      successText: Color.lerp(successText, other.successText, t)!,
      warningBackground: Color.lerp(
        warningBackground,
        other.warningBackground,
        t,
      )!,
      warningText: Color.lerp(warningText, other.warningText, t)!,
      moodCalmBackground: Color.lerp(
        moodCalmBackground,
        other.moodCalmBackground,
        t,
      )!,
      moodCalmText: Color.lerp(moodCalmText, other.moodCalmText, t)!,
      moodWarmBackground: Color.lerp(
        moodWarmBackground,
        other.moodWarmBackground,
        t,
      )!,
      moodWarmText: Color.lerp(moodWarmText, other.moodWarmText, t)!,
      moodFocusedBackground: Color.lerp(
        moodFocusedBackground,
        other.moodFocusedBackground,
        t,
      )!,
      moodFocusedText: Color.lerp(moodFocusedText, other.moodFocusedText, t)!,
      moodPeacefulBackground: Color.lerp(
        moodPeacefulBackground,
        other.moodPeacefulBackground,
        t,
      )!,
      moodPeacefulText: Color.lerp(
        moodPeacefulText,
        other.moodPeacefulText,
        t,
      )!,
      bottomNavBackground: Color.lerp(
        bottomNavBackground,
        other.bottomNavBackground,
        t,
      )!,
      bottomNavActiveBackground: Color.lerp(
        bottomNavActiveBackground,
        other.bottomNavActiveBackground,
        t,
      )!,
      bottomNavInactiveIcon: Color.lerp(
        bottomNavInactiveIcon,
        other.bottomNavInactiveIcon,
        t,
      )!,
      bottomNavInactiveLabel: Color.lerp(
        bottomNavInactiveLabel,
        other.bottomNavInactiveLabel,
        t,
      )!,
      tagChipBackground: Color.lerp(
        tagChipBackground,
        other.tagChipBackground,
        t,
      )!,
      privacyChipBackground: Color.lerp(
        privacyChipBackground,
        other.privacyChipBackground,
        t,
      )!,
      privacyChipForeground: Color.lerp(
        privacyChipForeground,
        other.privacyChipForeground,
        t,
      )!,
      privacyChipBorder: Color.lerp(
        privacyChipBorder,
        other.privacyChipBorder,
        t,
      )!,
    );
  }
}

extension ThemeContextExtension on BuildContext {
  AppCustomColors get themeColors =>
      Theme.of(this).extension<AppCustomColors>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

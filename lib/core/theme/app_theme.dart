import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_custom_colors.dart';

class AppTheme {
  AppTheme._();

  static TextTheme _buildTextTheme(Color textPrimary, Color textSecondary) {
    return TextTheme(
      displayLarge: GoogleFonts.getFont(
        AppFonts.heading,
        fontSize: 48,
        fontWeight: FontWeight.w500,
        height: 56.0 / 48.0,
        color: textPrimary,
      ),
      headlineLarge: GoogleFonts.getFont(
        AppFonts.heading,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 36.0 / 28.0,
        color: textPrimary,
      ),
      headlineMedium: GoogleFonts.getFont(
        AppFonts.heading,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32.0 / 24.0,
        color: textPrimary,
      ),
      titleLarge: GoogleFonts.getFont(
        AppFonts.accent,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 30.0 / 22.0,
        color: textPrimary,
      ),
      titleMedium: GoogleFonts.getFont(
        AppFonts.heading,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 26.0 / 18.0,
        color: textPrimary,
      ),
      bodyLarge: GoogleFonts.getFont(
        AppFonts.body,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 28.0 / 18.0,
        color: textPrimary,
      ),
      bodyMedium: GoogleFonts.getFont(
        AppFonts.body,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 26.0 / 16.0,
        color: textPrimary,
      ),
      bodySmall: GoogleFonts.getFont(
        AppFonts.body,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 22.0 / 14.0,
        color: textSecondary,
      ),
      labelMedium: GoogleFonts.getFont(
        AppFonts.label,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16.0 / 12.0,
        color: textSecondary,
      ),
      labelSmall: GoogleFonts.getFont(
        AppFonts.label,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16.0 / 12.0,
        color: textSecondary,
      ),
    );
  }

  static ThemeData _buildBaseTheme({
    required Brightness brightness,
    required AppCustomColors colors,
    required Color shadowColor,
    required Color cardShadowColor,
    required Color fabShadowColor,
    required Color bottomNavShadowColor,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: colors.primary,
      brightness: brightness,
      primary: colors.primary,
      secondary: colors.secondary,
      tertiary: colors.tertiary,
      surface: colors.surface,
      onPrimary: brightness == Brightness.light
          ? AppLightColors.textPrimary
          : AppDarkColors.background,
      onSurface: colors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(colors.textPrimary, colors.textSecondary),

      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          side: BorderSide(color: colors.borderSubtle, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
        foregroundColor: brightness == Brightness.light
            ? AppLightColors.textPrimary
            : AppDarkColors.background,
        elevation: 8,
        shape: const CircleBorder(),
        sizeConstraints: const BoxConstraints.tightFor(width: 60, height: 60),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.bottomNavBackground,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.bottomNavInactiveIcon,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.getFont(
          AppFonts.body,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 16.0 / 12.0,
        ),
        unselectedLabelStyle: GoogleFonts.getFont(
          AppFonts.body,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 16.0 / 12.0,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: colors.borderSubtle),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: colors.borderSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.tagChipBackground,
        labelStyle: GoogleFonts.getFont(
          AppFonts.label,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colors.textSecondary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        side: BorderSide.none,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.getFont(
          AppFonts.heading,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: colors.textPrimary,
        ),
      ),

      dividerTheme: DividerThemeData(
        color: colors.borderSubtle,
        thickness: 1,
        space: 0,
      ),

      extensions: [colors],
    );
  }

  static ThemeData get lightTheme {
    final colors = AppCustomColors.light();
    return _buildBaseTheme(
      brightness: Brightness.light,
      colors: colors,
      shadowColor: const Color(0x0F000000),
      cardShadowColor: const Color(0x0F000000),
      fabShadowColor: const Color(0x29000000),
      bottomNavShadowColor: const Color(0x0F000000),
    );
  }

  static ThemeData get darkTheme {
    final colors = AppCustomColors.dark();
    return _buildBaseTheme(
      brightness: Brightness.dark,
      colors: colors,
      shadowColor: const Color(0x33000000),
      cardShadowColor: const Color(0x33000000),
      fabShadowColor: const Color(0x59000000),
      bottomNavShadowColor: const Color(0x40000000),
    );
  }
}

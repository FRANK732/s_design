import 'package:flutter/material.dart';
import 's_colors.dart';
import 's_typography.dart';

class STheme {
  final SColors sColors = SColors();
  late final STypographyBase lightTypography;
  late final STypographyBase darkTypography;

  STheme() {
    lightTypography = SLightTypography(colors: sColors.light);
    darkTypography = SDarkTypography(colors: sColors.dark);
  }

  ThemeData getLightTheme() {
    final colors = sColors.light;
    final typography = lightTypography;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colors.primary,
      colorScheme: ColorScheme.light(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.surface,
        error: colors.error,
        onPrimary: colors.textOnPrimary,
        onSecondary: colors.textOnSecondary,
        onBackground: colors.textPrimary,
        onSurface: colors.textPrimary,
        onError: colors.textOnPrimary,
      ),
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.cardBackground,
      dialogBackgroundColor: colors.dialogBackground,
      disabledColor: colors.disabled,
      dividerColor: colors.divider,
      shadowColor: colors.shadow,
      textTheme: TextTheme(
        displayLarge: typography.displayLarge,
        displayMedium: typography.displayMedium,
        displaySmall: typography.displaySmall,
        headlineLarge: typography.headlineLarge,
        headlineMedium: typography.headlineMedium,
        headlineSmall: typography.headlineSmall,
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
        labelLarge: typography.labelLarge,
        labelMedium: typography.labelMedium,
        labelSmall: typography.labelSmall,
      ),
    );
  }

  ThemeData getDarkTheme() {
    final colors = sColors.dark;
    final typography = darkTypography;

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: colors.primary,
      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        secondary: colors.secondary,
        background: colors.background,
        surface: colors.surface,
        error: colors.error,
        onPrimary: colors.textOnPrimary,
        onSecondary: colors.textOnSecondary,
        onBackground: colors.textPrimary,
        onSurface: colors.textPrimary,
        onError: colors.textOnPrimary,
      ),
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.cardBackground,
      dialogBackgroundColor: colors.dialogBackground,
      disabledColor: colors.disabled,
      dividerColor: colors.divider,
      shadowColor: colors.shadow,
      textTheme: TextTheme(
        displayLarge: typography.displayLarge,
        displayMedium: typography.displayMedium,
        displaySmall: typography.displaySmall,
        headlineLarge: typography.headlineLarge,
        headlineMedium: typography.headlineMedium,
        headlineSmall: typography.headlineSmall,
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
        labelLarge: typography.labelLarge,
        labelMedium: typography.labelMedium,
        labelSmall: typography.labelSmall,
      ),
    );
  }
}

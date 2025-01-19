import 'package:flutter/material.dart';
import 's_colors.dart';

abstract class STypographyBase {
  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;

  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;
}

/// Light Theme Typography
class SLightTypography extends STypographyBase {
  final SColorsBase colors;

  SLightTypography({required this.colors});

  @override
  TextStyle get displayLarge => TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w300,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get headlineLarge => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: colors.textPrimary,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: colors.textPrimary,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: colors.textPrimary,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get labelMedium => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: colors.textPrimary,
      );
}

/// Dark Theme Typography
class SDarkTypography extends STypographyBase {
  final SColorsBase colors;

  SDarkTypography({required this.colors});

  @override
  TextStyle get displayLarge => TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w300,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get headlineLarge => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: colors.textPrimary,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: colors.textPrimary,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: colors.textPrimary,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: colors.textPrimary,
      );

  @override
  TextStyle get labelMedium => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
        color: colors.textPrimary,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: colors.textPrimary,
      );
}

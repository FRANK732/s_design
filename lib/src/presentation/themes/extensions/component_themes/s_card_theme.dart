import 'package:flutter/material.dart';

/// Theme data for [SCard].
class SCardThemeData
    extends ThemeExtension<
        SCardThemeData> {
  /// Creates an instance of [SCardThemeData].
  const SCardThemeData({
    required this.backgroundColor,
    required this.shadowColor,
    required this.borderColor,
    required this.elevation,
    required this.borderRadius,
    this.dividerColor,
    this.selectedBorderColor,
    this.selectedBackgroundColor,
    this.filledColor,
    this.outlinedBorderColor,
    this.frostedOpacity =
        0.2, // Default opacity for glassmorphism
    this.frostedBlur =
        10.0, // Default blur for glassmorphism
  });

  /// Creates a [SCardThemeData] from [ColorScheme].
  factory SCardThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SCardThemeData(
      backgroundColor:
          colorScheme.surface,
      shadowColor:
          colorScheme.shadow,
      borderColor:
          colorScheme.outlineVariant,
      elevation:
          2.0,
      borderRadius:
          12.0,
      dividerColor:
          colorScheme.outlineVariant.withOpacity(0.5),
      selectedBorderColor:
          colorScheme.primary,
      selectedBackgroundColor:
          colorScheme.primaryContainer.withOpacity(0.1),
      filledColor:
          colorScheme.surfaceContainerHighest,
      outlinedBorderColor:
          colorScheme.outline,
    );
  }

  /// Background color of the card.
  final Color
      backgroundColor;

  /// Shadow color of the card.
  final Color
      shadowColor;

  /// Border color of the card.
  final Color
      borderColor;

  /// Elevation of the card shadow.
  final double
      elevation;

  /// Corner radius of the card.
  final double
      borderRadius;

  /// Color of the dividers inside the card.
  final Color?
      dividerColor;

  /// Border color when the card is selected.
  final Color?
      selectedBorderColor;

  /// Background color when the card is selected.
  final Color?
      selectedBackgroundColor;

  /// Background color for [SCardVariant.filled].
  final Color?
      filledColor;

  /// Border color for [SCardVariant.outlined].
  final Color?
      outlinedBorderColor;

  /// Opacity for [SCardVariant.frosted].
  final double
      frostedOpacity;

  /// Blur amount for [SCardVariant.frosted].
  final double
      frostedBlur;

  @override
  SCardThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        shadowColor,
    Color?
        borderColor,
    double?
        elevation,
    double?
        borderRadius,
    Color?
        dividerColor,
    Color?
        selectedBorderColor,
    Color?
        selectedBackgroundColor,
    Color?
        filledColor,
    Color?
        outlinedBorderColor,
    double?
        frostedOpacity,
    double?
        frostedBlur,
  }) {
    return SCardThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      shadowColor:
          shadowColor ?? this.shadowColor,
      borderColor:
          borderColor ?? this.borderColor,
      elevation:
          elevation ?? this.elevation,
      borderRadius:
          borderRadius ?? this.borderRadius,
      dividerColor:
          dividerColor ?? this.dividerColor,
      selectedBorderColor:
          selectedBorderColor ?? this.selectedBorderColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
      filledColor:
          filledColor ?? this.filledColor,
      outlinedBorderColor:
          outlinedBorderColor ?? this.outlinedBorderColor,
      frostedOpacity:
          frostedOpacity ?? this.frostedOpacity,
      frostedBlur:
          frostedBlur ?? this.frostedBlur,
    );
  }

  @override
  SCardThemeData lerp(
      ThemeExtension<SCardThemeData>?
          other,
      double
          t) {
    if (other
        is! SCardThemeData) {
      return this;
    }
    return SCardThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      shadowColor: Color.lerp(
          shadowColor,
          other.shadowColor,
          t)!,
      borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t)!,
      elevation: t < 0.5
          ? elevation
          : other.elevation,
      borderRadius: t < 0.5
          ? borderRadius
          : other.borderRadius,
      dividerColor: Color.lerp(
          dividerColor,
          other.dividerColor,
          t),
      selectedBorderColor: Color.lerp(
          selectedBorderColor,
          other.selectedBorderColor,
          t),
      selectedBackgroundColor: Color.lerp(
          selectedBackgroundColor,
          other.selectedBackgroundColor,
          t),
      filledColor: Color.lerp(
          filledColor,
          other.filledColor,
          t),
      outlinedBorderColor: Color.lerp(
          outlinedBorderColor,
          other.outlinedBorderColor,
          t),
      frostedOpacity: t < 0.5
          ? frostedOpacity
          : other.frostedOpacity,
      frostedBlur: t < 0.5
          ? frostedBlur
          : other.frostedBlur,
    );
  }
}

/// Extension to access [SCardThemeData] from [ThemeData].
extension SCardThemeExtension
    on ThemeData {
  /// Retrieves the current [SCardThemeData].
  SCardThemeData get sCardTheme =>
      extension<SCardThemeData>() ??
      SCardThemeData.fromColorScheme(colorScheme);
}

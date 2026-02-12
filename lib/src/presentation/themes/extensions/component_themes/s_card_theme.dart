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
  });

  /// Creates a [SCardThemeData] from [ColorScheme].
  factory SCardThemeData.fromColorScheme(
      ColorScheme
          colors) {
    return SCardThemeData(
      backgroundColor:
          colors.cardBackground,
      shadowColor:
          colors.cardShadow,
      borderColor:
          colors.divider,
      elevation:
          2.0,
      borderRadius:
          8.0,
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

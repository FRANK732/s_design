import 'package:flutter/material.dart';

/// Theme data for [SProgressBar].
class SProgressBarThemeData
    extends ThemeExtension<
        SProgressBarThemeData> {
  /// Creates an instance of [SProgressBarThemeData].
  const SProgressBarThemeData({
    required this.backgroundColor,
    required this.valueColor,
    required this.borderRadius,
    required this.height,
  });

  /// Creates a [SProgressBarThemeData] from [ColorScheme].
  factory SProgressBarThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SProgressBarThemeData(
      backgroundColor:
          colorScheme.surfaceContainerHighest,
      valueColor:
          colorScheme.primary,
      borderRadius:
          4.0,
      height:
          8.0,
    );
  }

  /// Background color of the progress bar.
  final Color
      backgroundColor;

  /// Color of the progress value/fill.
  final Color
      valueColor;

  /// Corner radius of the progress bar.
  final double
      borderRadius;

  /// Height of the progress bar.
  final double
      height;

  @override
  SProgressBarThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        valueColor,
    double?
        borderRadius,
    double?
        height,
  }) {
    return SProgressBarThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      valueColor:
          valueColor ?? this.valueColor,
      borderRadius:
          borderRadius ?? this.borderRadius,
      height:
          height ?? this.height,
    );
  }

  @override
  SProgressBarThemeData lerp(
      ThemeExtension<SProgressBarThemeData>?
          other,
      double
          t) {
    if (other
        is! SProgressBarThemeData) {
      return this;
    }
    return SProgressBarThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      valueColor: Color.lerp(
          valueColor,
          other.valueColor,
          t)!,
      borderRadius: t < 0.5
          ? borderRadius
          : other.borderRadius,
      height: t < 0.5
          ? height
          : other.height,
    );
  }
}

/// Extension to access [SProgressBarThemeData] from [ThemeData].
extension SProgressBarThemeExtension
    on ThemeData {
  /// Retrieves the current [SProgressBarThemeData].
  SProgressBarThemeData get sProgressBarTheme =>
      extension<SProgressBarThemeData>() ??
      SProgressBarThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        valueColor: colorScheme.primary,
        borderRadius: 4.0,
        height: 8.0,
      );
}

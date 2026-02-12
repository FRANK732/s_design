import 'package:flutter/material.dart';

/// Theme data for [SButton].
class SButtonThemeData
    extends ThemeExtension<
        SButtonThemeData> {
  /// Creates an instance of [SButtonThemeData].
  const SButtonThemeData({
    required this.defaultBackgroundColor,
    required this.defaultForegroundColor,
    required this.outlineBackgroundColor,
    required this.outlineForegroundColor,
    required this.outlineBorderColor,
    required this.ghostBackgroundColor,
    required this.ghostForegroundColor,
    required this.linkForegroundColor,
    required this.secondaryBackgroundColor,
    required this.secondaryForegroundColor,
    required this.destructiveBackgroundColor,
    required this.destructiveForegroundColor,
  });

  /// Creates a [SButtonThemeData] from [ColorScheme].
  factory SButtonThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SButtonThemeData(
      defaultBackgroundColor:
          colorScheme.primary,
      defaultForegroundColor:
          colorScheme.onPrimary,
      outlineBackgroundColor:
          Colors.transparent,
      outlineForegroundColor:
          colorScheme.primary,
      outlineBorderColor:
          colorScheme.primary,
      ghostBackgroundColor:
          Colors.transparent,
      ghostForegroundColor:
          colorScheme.primary,
      linkForegroundColor:
          colorScheme.primary,
      secondaryBackgroundColor:
          colorScheme.secondary,
      secondaryForegroundColor:
          colorScheme.onSecondary,
      destructiveBackgroundColor:
          colorScheme.error,
      destructiveForegroundColor:
          colorScheme.onError,
    );
  }

  /// Default background color for filled variants.
  final Color
      defaultBackgroundColor;

  /// Default foreground (text and icon) color for filled variants.
  final Color
      defaultForegroundColor;

  /// Default background color for outlined variants.
  final Color
      outlineBackgroundColor;

  /// Default foreground color for outlined variants.
  final Color
      outlineForegroundColor;

  /// Default border color for outlined variants.
  final Color
      outlineBorderColor;

  /// Default background color for ghost variants.
  final Color
      ghostBackgroundColor;

  /// Default foreground color for ghost variants.
  final Color
      ghostForegroundColor;

  /// Default foreground color for link variants.
  final Color
      linkForegroundColor;

  /// Background color for secondary variant.
  final Color
      secondaryBackgroundColor;

  /// Foreground color for secondary variant.
  final Color
      secondaryForegroundColor;

  /// Background color for destructive variant.
  final Color
      destructiveBackgroundColor;

  /// Foreground color for destructive variant.
  final Color
      destructiveForegroundColor;

  @override
  SButtonThemeData
      copyWith({
    Color?
        defaultBackgroundColor,
    Color?
        defaultForegroundColor,
    Color?
        outlineBackgroundColor,
    Color?
        outlineForegroundColor,
    Color?
        outlineBorderColor,
    Color?
        ghostBackgroundColor,
    Color?
        ghostForegroundColor,
    Color?
        linkForegroundColor,
    Color?
        secondaryBackgroundColor,
    Color?
        secondaryForegroundColor,
    Color?
        destructiveBackgroundColor,
    Color?
        destructiveForegroundColor,
  }) {
    return SButtonThemeData(
      defaultBackgroundColor:
          defaultBackgroundColor ?? this.defaultBackgroundColor,
      defaultForegroundColor:
          defaultForegroundColor ?? this.defaultForegroundColor,
      outlineBackgroundColor:
          outlineBackgroundColor ?? this.outlineBackgroundColor,
      outlineForegroundColor:
          outlineForegroundColor ?? this.outlineForegroundColor,
      outlineBorderColor:
          outlineBorderColor ?? this.outlineBorderColor,
      ghostBackgroundColor:
          ghostBackgroundColor ?? this.ghostBackgroundColor,
      ghostForegroundColor:
          ghostForegroundColor ?? this.ghostForegroundColor,
      linkForegroundColor:
          linkForegroundColor ?? this.linkForegroundColor,
      secondaryBackgroundColor:
          secondaryBackgroundColor ?? this.secondaryBackgroundColor,
      secondaryForegroundColor:
          secondaryForegroundColor ?? this.secondaryForegroundColor,
      destructiveBackgroundColor:
          destructiveBackgroundColor ?? this.destructiveBackgroundColor,
      destructiveForegroundColor:
          destructiveForegroundColor ?? this.destructiveForegroundColor,
    );
  }

  @override
  SButtonThemeData lerp(
      ThemeExtension<SButtonThemeData>?
          other,
      double
          t) {
    if (other
        is! SButtonThemeData) {
      return this;
    }
    return SButtonThemeData(
      defaultBackgroundColor: Color.lerp(
          defaultBackgroundColor,
          other.defaultBackgroundColor,
          t)!,
      defaultForegroundColor: Color.lerp(
          defaultForegroundColor,
          other.defaultForegroundColor,
          t)!,
      outlineBackgroundColor: Color.lerp(
          outlineBackgroundColor,
          other.outlineBackgroundColor,
          t)!,
      outlineForegroundColor: Color.lerp(
          outlineForegroundColor,
          other.outlineForegroundColor,
          t)!,
      outlineBorderColor: Color.lerp(
          outlineBorderColor,
          other.outlineBorderColor,
          t)!,
      ghostBackgroundColor: Color.lerp(
          ghostBackgroundColor,
          other.ghostBackgroundColor,
          t)!,
      ghostForegroundColor: Color.lerp(
          ghostForegroundColor,
          other.ghostForegroundColor,
          t)!,
      linkForegroundColor: Color.lerp(
          linkForegroundColor,
          other.linkForegroundColor,
          t)!,
      secondaryBackgroundColor: Color.lerp(
          secondaryBackgroundColor,
          other.secondaryBackgroundColor,
          t)!,
      secondaryForegroundColor: Color.lerp(
          secondaryForegroundColor,
          other.secondaryForegroundColor,
          t)!,
      destructiveBackgroundColor: Color.lerp(
          destructiveBackgroundColor,
          other.destructiveBackgroundColor,
          t)!,
      destructiveForegroundColor: Color.lerp(
          destructiveForegroundColor,
          other.destructiveForegroundColor,
          t)!,
    );
  }
}

/// Extension to access [SButtonThemeData] from [ThemeData].
extension SButtonThemeExtension
    on ThemeData {
  /// Retrieves the current [SButtonThemeData].
  SButtonThemeData get sButtonTheme =>
      extension<SButtonThemeData>() ??
      SButtonThemeData.fromColorScheme(colorScheme);
}

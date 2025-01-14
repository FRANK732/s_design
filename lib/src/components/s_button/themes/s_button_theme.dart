import 'package:flutter/material.dart';

/// Theme data for [SButton].
class SButtonThemeData {
  /// Default background color for filled variants.
  final Color defaultBackgroundColor;

  /// Default foreground (text and icon) color for filled variants.
  final Color defaultForegroundColor;

  /// Default background color for outlined variants.
  final Color outlineBackgroundColor;

  /// Default foreground color for outlined variants.
  final Color outlineForegroundColor;

  /// Default border color for outlined variants.
  final Color outlineBorderColor;

  /// Default background color for ghost variants.
  final Color ghostBackgroundColor;

  /// Default foreground color for ghost variants.
  final Color ghostForegroundColor;

  /// Default foreground color for link variants.
  final Color linkForegroundColor;

  /// Creates an instance of [SButtonThemeData].
  const SButtonThemeData({
    this.defaultBackgroundColor = Colors.teal,
    this.defaultForegroundColor = Colors.white,
    this.outlineBackgroundColor = Colors.transparent,
    this.outlineForegroundColor = Colors.teal,
    this.outlineBorderColor = Colors.teal,
    this.ghostBackgroundColor = Colors.transparent,
    this.ghostForegroundColor = Colors.teal,
    this.linkForegroundColor = Colors.blue,
  });

  /// Provides a light theme.
  static const SButtonThemeData light = SButtonThemeData();

  /// Provides a dark theme.
  static const SButtonThemeData dark = SButtonThemeData(
    defaultBackgroundColor: Colors.teal,
    defaultForegroundColor: Colors.white,
    outlineForegroundColor: Colors.tealAccent,
    outlineBorderColor: Colors.tealAccent,
    ghostForegroundColor: Colors.tealAccent,
    linkForegroundColor: Colors.lightBlueAccent,
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SButtonThemeData copyWith({
    Color? defaultBackgroundColor,
    Color? defaultForegroundColor,
    Color? outlineBackgroundColor,
    Color? outlineForegroundColor,
    Color? outlineBorderColor,
    Color? ghostBackgroundColor,
    Color? ghostForegroundColor,
    Color? linkForegroundColor,
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
      outlineBorderColor: outlineBorderColor ?? this.outlineBorderColor,
      ghostBackgroundColor:
      ghostBackgroundColor ?? this.ghostBackgroundColor,
      ghostForegroundColor:
      ghostForegroundColor ?? this.ghostForegroundColor,
      linkForegroundColor: linkForegroundColor ?? this.linkForegroundColor,
    );
  }
}

/// Extension to access [SButtonThemeData] from [ThemeData].
extension SButtonThemeExtension on ThemeData {
  /// Retrieves the current [SButtonThemeData].
  SButtonThemeData get sButtonTheme =>
      extension<SButtonThemeData>() ?? SButtonThemeData.light;
}

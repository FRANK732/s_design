import 'package:flutter/material.dart';

/// Theme data for [SCheckbox].
class SCheckboxThemeData {
  /// Default active color when the checkbox is checked.
  final Color activeColor;

  /// Default color for the check mark or indeterminate line.
  final Color checkColor;

  /// Default border color for the checkbox.
  final Color borderColor;

  /// Creates an instance of [SCheckboxThemeData].
  const SCheckboxThemeData({
    this.activeColor = Colors.teal,
    this.checkColor = Colors.white,
    this.borderColor = Colors.grey,
  });

  /// Provides a light theme.
  static const SCheckboxThemeData light = SCheckboxThemeData();

  /// Provides a dark theme.
  static const SCheckboxThemeData dark = SCheckboxThemeData(
    activeColor: Colors.lightBlueAccent,
    checkColor: Colors.black,
    borderColor: Colors.white70,
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SCheckboxThemeData copyWith({
    Color? activeColor,
    Color? checkColor,
    Color? borderColor,
  }) {
    return SCheckboxThemeData(
      activeColor: activeColor ?? this.activeColor,
      checkColor: checkColor ?? this.checkColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

/// Extension to access [SCheckboxThemeData] from [ThemeData].
extension SCheckboxThemeExtension on ThemeData {
  /// Retrieves the current [SCheckboxThemeData].
  SCheckboxThemeData get sCheckboxTheme =>
      extension<SCheckboxThemeData>() ?? SCheckboxThemeData.light;
}

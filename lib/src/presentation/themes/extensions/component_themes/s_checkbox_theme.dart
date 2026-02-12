import 'package:flutter/material.dart';

/// Theme data for [SCheckbox].
class SCheckboxThemeData
    extends ThemeExtension<
        SCheckboxThemeData> {
  /// Creates an instance of [SCheckboxThemeData].
  const SCheckboxThemeData({
    required this.activeColor,
    required this.checkColor,
    required this.borderColor,
    required this.inactiveColor,
    required this.disabledColor,
  });

  /// Creates a [SCheckboxThemeData] from [ColorScheme].
  factory SCheckboxThemeData.fromColorScheme(
      ColorScheme
          colors) {
    return SCheckboxThemeData(
      activeColor:
          colors.checkboxActive,
      checkColor:
          colorScheme.onPrimary,
      borderColor:
          colors.checkboxInactive,
      inactiveColor:
          colors.checkboxInactive,
      disabledColor:
          colors.checkboxDisabled,
    );
  }

  /// Default active color when the checkbox is checked.
  final Color
      activeColor;

  /// Default color for the check mark or indeterminate line.
  final Color
      checkColor;

  /// Default border color for the checkbox.
  final Color
      borderColor;

  /// Color when checkbox is unchecked.
  final Color
      inactiveColor;

  /// Color when checkbox is disabled.
  final Color
      disabledColor;

  @override
  SCheckboxThemeData
      copyWith({
    Color?
        activeColor,
    Color?
        checkColor,
    Color?
        borderColor,
    Color?
        inactiveColor,
    Color?
        disabledColor,
  }) {
    return SCheckboxThemeData(
      activeColor:
          activeColor ?? this.activeColor,
      checkColor:
          checkColor ?? this.checkColor,
      borderColor:
          borderColor ?? this.borderColor,
      inactiveColor:
          inactiveColor ?? this.inactiveColor,
      disabledColor:
          disabledColor ?? this.disabledColor,
    );
  }

  @override
  SCheckboxThemeData lerp(
      ThemeExtension<SCheckboxThemeData>?
          other,
      double
          t) {
    if (other
        is! SCheckboxThemeData) {
      return this;
    }
    return SCheckboxThemeData(
      activeColor: Color.lerp(
          activeColor,
          other.activeColor,
          t)!,
      checkColor: Color.lerp(
          checkColor,
          other.checkColor,
          t)!,
      borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t)!,
      inactiveColor: Color.lerp(
          inactiveColor,
          other.inactiveColor,
          t)!,
      disabledColor: Color.lerp(
          disabledColor,
          other.disabledColor,
          t)!,
    );
  }
}

/// Extension to access [SCheckboxThemeData] from [ThemeData].
extension SCheckboxThemeExtension
    on ThemeData {
  /// Retrieves the current [SCheckboxThemeData].
  SCheckboxThemeData get sCheckboxTheme =>
      extension<SCheckboxThemeData>() ??
      SCheckboxThemeData.fromColorScheme(colorScheme);
}

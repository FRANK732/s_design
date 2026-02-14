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
    required this.errorColor,
    required this.focusColor,
    required this.hoverColor,
  });

  /// Creates a [SCheckboxThemeData] from [ColorScheme].
  factory SCheckboxThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SCheckboxThemeData(
      activeColor:
          colorScheme.primary,
      checkColor:
          colorScheme.onPrimary,
      borderColor:
          colorScheme.outline,
      inactiveColor:
          colorScheme.outline,
      disabledColor:
          colorScheme.onSurface.withOpacity(0.38),
      errorColor:
          colorScheme.error,
      focusColor:
          colorScheme.primary.withOpacity(0.12),
      hoverColor:
          colorScheme.primary.withOpacity(0.08),
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

  /// Color for the checkbox border in error state.
  final Color
      errorColor;

  /// Color for the focus overlay.
  final Color
      focusColor;

  /// Color for the hover overlay.
  final Color
      hoverColor;

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
    Color?
        errorColor,
    Color?
        focusColor,
    Color?
        hoverColor,
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
      errorColor:
          errorColor ?? this.errorColor,
      focusColor:
          focusColor ?? this.focusColor,
      hoverColor:
          hoverColor ?? this.hoverColor,
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
      errorColor: Color.lerp(
          errorColor,
          other.errorColor,
          t)!,
      focusColor: Color.lerp(
          focusColor,
          other.focusColor,
          t)!,
      hoverColor: Color.lerp(
          hoverColor,
          other.hoverColor,
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

import 'package:flutter/material.dart';
import '../../../theme/s_colors.dart';

/// Theme data for [SInputField].
class SInputFieldThemeData
    extends ThemeExtension<
        SInputFieldThemeData> {
  /// Creates an instance of [SInputFieldThemeData].
  const SInputFieldThemeData({
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.disabledBorderColor,
    required this.hintTextColor,
    required this.labelColor,
    required this.textColor,
    required this.borderRadius,
    required this.borderWidth,
    required this.focusedBorderWidth,
  });

  /// Creates a [SInputFieldThemeData] from [SColorsBase].
  factory SInputFieldThemeData.fromColors(
      SColorsBase
          colors) {
    return SInputFieldThemeData(
      backgroundColor:
          colors.inputBackground,
      borderColor:
          colors.inputBorder,
      focusedBorderColor:
          colors.inputFocusBorder,
      errorBorderColor:
          colors.inputErrorBorder,
      disabledBorderColor:
          colors.disabled,
      hintTextColor:
          colors.inputHintText,
      labelColor:
          colors.textPrimary,
      textColor:
          colors.textPrimary,
      borderRadius:
          6.0,
      borderWidth:
          1.0,
      focusedBorderWidth:
          1.5,
    );
  }

  /// Background color of the input field.
  final Color
      backgroundColor;

  /// Border color in normal state.
  final Color
      borderColor;

  /// Border color when focused.
  final Color
      focusedBorderColor;

  /// Border color when there's an error.
  final Color
      errorBorderColor;

  /// Border color when disabled.
  final Color
      disabledBorderColor;

  /// Color of hint text.
  final Color
      hintTextColor;

  /// Color of label text.
  final Color
      labelColor;

  /// Color of input text.
  final Color
      textColor;

  /// Corner radius of the input field.
  final double
      borderRadius;

  /// Width of the border.
  final double
      borderWidth;

  /// Width of the border when focused.
  final double
      focusedBorderWidth;

  @override
  SInputFieldThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        borderColor,
    Color?
        focusedBorderColor,
    Color?
        errorBorderColor,
    Color?
        disabledBorderColor,
    Color?
        hintTextColor,
    Color?
        labelColor,
    Color?
        textColor,
    double?
        borderRadius,
    double?
        borderWidth,
    double?
        focusedBorderWidth,
  }) {
    return SInputFieldThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      borderColor:
          borderColor ?? this.borderColor,
      focusedBorderColor:
          focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor:
          errorBorderColor ?? this.errorBorderColor,
      disabledBorderColor:
          disabledBorderColor ?? this.disabledBorderColor,
      hintTextColor:
          hintTextColor ?? this.hintTextColor,
      labelColor:
          labelColor ?? this.labelColor,
      textColor:
          textColor ?? this.textColor,
      borderRadius:
          borderRadius ?? this.borderRadius,
      borderWidth:
          borderWidth ?? this.borderWidth,
      focusedBorderWidth:
          focusedBorderWidth ?? this.focusedBorderWidth,
    );
  }

  @override
  SInputFieldThemeData lerp(
      ThemeExtension<SInputFieldThemeData>?
          other,
      double
          t) {
    if (other
        is! SInputFieldThemeData) {
      return this;
    }
    return SInputFieldThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t)!,
      focusedBorderColor: Color.lerp(
          focusedBorderColor,
          other.focusedBorderColor,
          t)!,
      errorBorderColor: Color.lerp(
          errorBorderColor,
          other.errorBorderColor,
          t)!,
      disabledBorderColor: Color.lerp(
          disabledBorderColor,
          other.disabledBorderColor,
          t)!,
      hintTextColor: Color.lerp(
          hintTextColor,
          other.hintTextColor,
          t)!,
      labelColor: Color.lerp(
          labelColor,
          other.labelColor,
          t)!,
      textColor: Color.lerp(
          textColor,
          other.textColor,
          t)!,
      borderRadius: t < 0.5
          ? borderRadius
          : other.borderRadius,
      borderWidth: t < 0.5
          ? borderWidth
          : other.borderWidth,
      focusedBorderWidth: t < 0.5
          ? focusedBorderWidth
          : other.focusedBorderWidth,
    );
  }
}

/// Extension to access [SInputFieldThemeData] from [ThemeData].
extension SInputFieldThemeExtension
    on ThemeData {
  /// Retrieves the current [SInputFieldThemeData].
  SInputFieldThemeData get sInputFieldTheme =>
      extension<SInputFieldThemeData>() ??
      SInputFieldThemeData.fromColors(SLightColors());
}

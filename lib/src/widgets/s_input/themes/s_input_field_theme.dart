import 'package:flutter/material.dart';

/// Theme data for [SInputField].
@immutable
class SInputFieldThemeData extends ThemeExtension<SInputFieldThemeData> {
  /// Background color of the input field.
  final Color backgroundColor;

  /// Text color for the input text.
  final Color textColor;

  /// Text color for the hint text.
  final Color hintTextColor;

  /// Border color when the input field is enabled but not focused.
  final Color enabledBorderColor;

  /// Border color when the input field is focused.
  final Color focusedBorderColor;

  /// Border color when the input field has an error.
  final Color errorBorderColor;

  /// Text style for the input text.
  final TextStyle? textStyle;

  /// Text style for the hint text.
  final TextStyle? hintStyle;

  /// Icon color.
  final Color iconColor;

  /// Creates an instance of [SInputFieldThemeData].
  const SInputFieldThemeData({
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.hintTextColor = Colors.grey,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.errorBorderColor = Colors.red,
    this.textStyle,
    this.hintStyle,
    this.iconColor = Colors.black,
  });

  /// Provides a light theme.
  static const SInputFieldThemeData light = SInputFieldThemeData();

  /// Provides a dark theme.
  static const SInputFieldThemeData dark = SInputFieldThemeData(
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    hintTextColor: Colors.white70,
    enabledBorderColor: Colors.white70,
    focusedBorderColor: Colors.lightBlueAccent,
    errorBorderColor: Colors.redAccent,
    iconColor: Colors.white,
  );

  @override
  SInputFieldThemeData copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? hintTextColor,
    Color? enabledBorderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    Color? iconColor,
  }) {
    return SInputFieldThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      enabledBorderColor: enabledBorderColor ?? this.enabledBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      textStyle: textStyle ?? this.textStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  SInputFieldThemeData lerp(ThemeExtension<SInputFieldThemeData>? other, double t) {
    if (other is! SInputFieldThemeData) {
      return this;
    }
    return SInputFieldThemeData(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t) ?? hintTextColor,
      enabledBorderColor: Color.lerp(enabledBorderColor, other.enabledBorderColor, t) ?? enabledBorderColor,
      focusedBorderColor: Color.lerp(focusedBorderColor, other.focusedBorderColor, t) ?? focusedBorderColor,
      errorBorderColor: Color.lerp(errorBorderColor, other.errorBorderColor, t) ?? errorBorderColor,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      hintStyle: TextStyle.lerp(hintStyle, other.hintStyle, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t) ?? iconColor,
    );
  }

  /// Creates a copy of this theme with the given fields replaced with the new values.
  @override
  SInputFieldThemeData copyWithPartial({
    Color? backgroundColor,
    Color? textColor,
    Color? hintTextColor,
    Color? enabledBorderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    Color? iconColor,
  }) {
    return copyWith(
      backgroundColor: backgroundColor,
      textColor: textColor,
      hintTextColor: hintTextColor,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      textStyle: textStyle,
      hintStyle: hintStyle,
      iconColor: iconColor,
    );
  }
}

/// Extension to access [SInputFieldThemeData] from [ThemeData].
extension SInputFieldThemeExtension on ThemeData {
  /// Retrieves the current [SInputFieldThemeData].
  SInputFieldThemeData get sInputFieldTheme =>
      extension<SInputFieldThemeData>() ?? SInputFieldThemeData.light;
}

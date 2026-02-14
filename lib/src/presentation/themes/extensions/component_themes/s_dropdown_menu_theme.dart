import 'package:flutter/material.dart';

/// Theme data for [SDropdownMenu].
class SDropdownMenuThemeData
    extends ThemeExtension<
        SDropdownMenuThemeData> {
  /// Creates an instance of [SDropdownMenuThemeData].
  const SDropdownMenuThemeData({
    required this.backgroundColor,
    required this.textColor,
    required this.disabledTextColor,
    required this.separatorColor,
    required this.iconColor,
    required this.selectedItemColor,
  });

  /// Creates a [SDropdownMenuThemeData] from [SColorsBase].
  factory SDropdownMenuThemeData.fromColors(
      SColorsBase
          colors) {
    return SDropdownMenuThemeData(
      backgroundColor:
          colors.dropdownBackground,
      textColor:
          colors.dropdownItemUnselected,
      disabledTextColor:
          colors.disabled,
      separatorColor:
          colors.divider,
      iconColor:
          colors.textPrimary,
      selectedItemColor:
          colors.dropdownItemSelected,
    );
  }

  /// Background color of the dropdown menu.
  final Color
      backgroundColor;

  /// Text color for enabled menu items.
  final Color
      textColor;

  /// Text color for disabled menu items.
  final Color
      disabledTextColor;

  /// Color of the separator lines.
  final Color
      separatorColor;

  /// Icon color for menu items.
  final Color
      iconColor;

  /// Color for selected menu items.
  final Color
      selectedItemColor;

  @override
  SDropdownMenuThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        textColor,
    Color?
        disabledTextColor,
    Color?
        separatorColor,
    Color?
        iconColor,
    Color?
        selectedItemColor,
  }) {
    return SDropdownMenuThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      textColor:
          textColor ?? this.textColor,
      disabledTextColor:
          disabledTextColor ?? this.disabledTextColor,
      separatorColor:
          separatorColor ?? this.separatorColor,
      iconColor:
          iconColor ?? this.iconColor,
      selectedItemColor:
          selectedItemColor ?? this.selectedItemColor,
    );
  }

  @override
  SDropdownMenuThemeData lerp(
      ThemeExtension<SDropdownMenuThemeData>?
          other,
      double
          t) {
    if (other
        is! SDropdownMenuThemeData) {
      return this;
    }
    return SDropdownMenuThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      textColor: Color.lerp(
          textColor,
          other.textColor,
          t)!,
      disabledTextColor: Color.lerp(
          disabledTextColor,
          other.disabledTextColor,
          t)!,
      separatorColor: Color.lerp(
          separatorColor,
          other.separatorColor,
          t)!,
      iconColor: Color.lerp(
          iconColor,
          other.iconColor,
          t)!,
      selectedItemColor: Color.lerp(
          selectedItemColor,
          other.selectedItemColor,
          t)!,
    );
  }
}

/// Extension to access [SDropdownMenuThemeData] from [ThemeData].
extension SDropdownMenuThemeExtension
    on ThemeData {
  /// Retrieves the current [SDropdownMenuThemeData].
  SDropdownMenuThemeData get sDropdownMenuTheme =>
      extension<SDropdownMenuThemeData>() ??
      SDropdownMenuThemeData.fromColors(SLightColors());
}

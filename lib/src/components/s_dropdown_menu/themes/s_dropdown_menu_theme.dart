import 'package:flutter/material.dart';

/// Theme data for [SDropdownMenu].
class SDropdownMenuThemeData {
  /// Background color of the dropdown menu.
  final Color backgroundColor;

  /// Text color for enabled menu items.
  final Color textColor;

  /// Text color for disabled menu items.
  final Color disabledTextColor;

  /// Color of the separator lines.
  final Color separatorColor;

  /// Icon color for menu items.
  final Color iconColor;

  /// Creates an instance of [SDropdownMenuThemeData].
  const SDropdownMenuThemeData({
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.disabledTextColor = Colors.grey,
    this.separatorColor = Colors.grey,
    this.iconColor = Colors.black,
  });

  /// Provides a light theme.
  static const SDropdownMenuThemeData light = SDropdownMenuThemeData();

  /// Provides a dark theme.
  static const SDropdownMenuThemeData dark = SDropdownMenuThemeData(
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    disabledTextColor: Colors.grey,
    separatorColor: Colors.grey,
    iconColor: Colors.white,
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SDropdownMenuThemeData copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? disabledTextColor,
    Color? separatorColor,
    Color? iconColor,
  }) {
    return SDropdownMenuThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      separatorColor: separatorColor ?? this.separatorColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}

/// Extension to access [SDropdownMenuThemeData] from [ThemeData].
extension SDropdownMenuThemeExtension on ThemeData {
  /// Retrieves the current [SDropdownMenuThemeData].
  SDropdownMenuThemeData get sDropdownMenuTheme =>
      extension<SDropdownMenuThemeData>() ?? SDropdownMenuThemeData.light;
}

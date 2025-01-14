import 'package:flutter/material.dart';

/// Theme data for [SDialog].
class SDialogThemeData {
  /// Background color of the dialog.
  final Color backgroundColor;

  /// Color of the title text.
  final Color titleColor;

  /// Color of the description text.
  final Color descriptionColor;

  /// Color of the action buttons.
  final Color actionTextColor;

  /// Creates an instance of [SDialogThemeData].
  const SDialogThemeData({
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.descriptionColor = Colors.black54,
    this.actionTextColor = Colors.blue,
  });

  /// Provides a light theme.
  static const SDialogThemeData light = SDialogThemeData();

  /// Provides a dark theme.
  static const SDialogThemeData dark = SDialogThemeData(
    backgroundColor: Colors.grey,
    titleColor: Colors.white,
    descriptionColor: Colors.white70,
    actionTextColor: Colors.lightBlueAccent,
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SDialogThemeData copyWith({
    Color? backgroundColor,
    Color? titleColor,
    Color? descriptionColor,
    Color? actionTextColor,
  }) {
    return SDialogThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleColor: titleColor ?? this.titleColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      actionTextColor: actionTextColor ?? this.actionTextColor,
    );
  }
}

/// Extension to access [SDialogThemeData] from [ThemeData].
extension SDialogThemeExtension on ThemeData {
  /// Retrieves the current [SDialogThemeData].
  SDialogThemeData get sDialogTheme =>
      extension<SDialogThemeData>() ?? SDialogThemeData.light;
}

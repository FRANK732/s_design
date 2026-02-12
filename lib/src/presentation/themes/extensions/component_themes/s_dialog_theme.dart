import 'package:flutter/material.dart';

/// Theme data for [SDialog].
class SDialogThemeData
    extends ThemeExtension<
        SDialogThemeData> {
  /// Creates an instance of [SDialogThemeData].
  const SDialogThemeData({
    required this.backgroundColor,
    required this.titleColor,
    required this.descriptionColor,
    required this.actionTextColor,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
  });

  /// Creates a [SDialogThemeData] from [ColorScheme].
  factory SDialogThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SDialogThemeData(
      backgroundColor:
          colorScheme.surface,
      titleColor:
          colorScheme.onSurface,
      descriptionColor:
          colorScheme.onSurfaceVariant,
      actionTextColor:
          colorScheme.primary,
      buttonBackgroundColor:
          colorScheme.primaryContainer,
      buttonTextColor:
          colorScheme.onPrimaryContainer,
    );
  }

  /// Background color of the dialog.
  final Color
      backgroundColor;

  /// Color of the title text.
  final Color
      titleColor;

  /// Color of the description text.
  final Color
      descriptionColor;

  /// Color of the action buttons text.
  final Color
      actionTextColor;

  /// Background color of dialog buttons.
  final Color
      buttonBackgroundColor;

  /// Text color of dialog buttons.
  final Color
      buttonTextColor;

  @override
  SDialogThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        titleColor,
    Color?
        descriptionColor,
    Color?
        actionTextColor,
    Color?
        buttonBackgroundColor,
    Color?
        buttonTextColor,
  }) {
    return SDialogThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      titleColor:
          titleColor ?? this.titleColor,
      descriptionColor:
          descriptionColor ?? this.descriptionColor,
      actionTextColor:
          actionTextColor ?? this.actionTextColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonTextColor:
          buttonTextColor ?? this.buttonTextColor,
    );
  }

  @override
  SDialogThemeData lerp(
      ThemeExtension<SDialogThemeData>?
          other,
      double
          t) {
    if (other
        is! SDialogThemeData) {
      return this;
    }
    return SDialogThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      titleColor: Color.lerp(
          titleColor,
          other.titleColor,
          t)!,
      descriptionColor: Color.lerp(
          descriptionColor,
          other.descriptionColor,
          t)!,
      actionTextColor: Color.lerp(
          actionTextColor,
          other.actionTextColor,
          t)!,
      buttonBackgroundColor: Color.lerp(
          buttonBackgroundColor,
          other.buttonBackgroundColor,
          t)!,
      buttonTextColor: Color.lerp(
          buttonTextColor,
          other.buttonTextColor,
          t)!,
    );
  }
}

/// Extension to access [SDialogThemeData] from [ThemeData].
extension SDialogThemeExtension
    on ThemeData {
  /// Retrieves the current [SDialogThemeData].
  SDialogThemeData get sDialogTheme =>
      extension<SDialogThemeData>() ??
      SDialogThemeData.fromColorScheme(colorScheme);
}

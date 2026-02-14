import 'package:flutter/material.dart';

/// Theme data for [SSelect].
class SSelectThemeData
    extends ThemeExtension<
        SSelectThemeData> {
  /// Creates an instance of [SSelectThemeData].
  const SSelectThemeData({
    required this.backgroundColor,
    required this.itemColor,
    required this.selectedItemColor,
    required this.selectedItemBackgroundColor,
    required this.disabledColor,
    required this.iconColor,
    required this.borderColor,
  });

  /// Background color of the select dropdown.
  final Color
      backgroundColor;

  /// Text color for unselected items.
  final Color
      itemColor;

  /// Text color for selected items.
  final Color
      selectedItemColor;

  /// Background color for selected items.
  final Color
      selectedItemBackgroundColor;

  /// Color when select is disabled.
  final Color
      disabledColor;

  /// Icon color for the dropdown arrow.
  final Color
      iconColor;

  /// Border color of the select field.
  final Color
      borderColor;

  @override
  SSelectThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        itemColor,
    Color?
        selectedItemColor,
    Color?
        selectedItemBackgroundColor,
    Color?
        disabledColor,
    Color?
        iconColor,
    Color?
        borderColor,
  }) {
    return SSelectThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      itemColor:
          itemColor ?? this.itemColor,
      selectedItemColor:
          selectedItemColor ?? this.selectedItemColor,
      selectedItemBackgroundColor:
          selectedItemBackgroundColor ?? this.selectedItemBackgroundColor,
      disabledColor:
          disabledColor ?? this.disabledColor,
      iconColor:
          iconColor ?? this.iconColor,
      borderColor:
          borderColor ?? this.borderColor,
    );
  }

  @override
  SSelectThemeData lerp(
      ThemeExtension<SSelectThemeData>?
          other,
      double
          t) {
    if (other
        is! SSelectThemeData) {
      return this;
    }
    return SSelectThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      itemColor: Color.lerp(
          itemColor,
          other.itemColor,
          t)!,
      selectedItemColor: Color.lerp(
          selectedItemColor,
          other.selectedItemColor,
          t)!,
      selectedItemBackgroundColor: Color.lerp(
          selectedItemBackgroundColor,
          other.selectedItemBackgroundColor,
          t)!,
      disabledColor: Color.lerp(
          disabledColor,
          other.disabledColor,
          t)!,
      iconColor: Color.lerp(
          iconColor,
          other.iconColor,
          t)!,
      borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t)!,
    );
  }
}

/// Extension to access [SSelectThemeData] from [ThemeData].
extension SSelectThemeExtension
    on ThemeData {
  /// Retrieves the current [SSelectThemeData].
  SSelectThemeData get sSelectTheme =>
      extension<SSelectThemeData>() ??
      SSelectThemeData(
        backgroundColor: colorScheme.surface,
        itemColor: colorScheme.onSurface,
        selectedItemColor: colorScheme.primary,
        selectedItemBackgroundColor: colorScheme.primary.withOpacity(0.1),
        disabledColor: colorScheme.onSurface.withOpacity(0.38),
        iconColor: colorScheme.onSurfaceVariant,
        borderColor: colorScheme.outline,
      );
}

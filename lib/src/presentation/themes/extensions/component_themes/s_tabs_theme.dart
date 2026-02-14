import 'package:flutter/material.dart';

/// Theme data for [STabs].
class STabsThemeData
    extends ThemeExtension<
        STabsThemeData> {
  /// Creates an instance of [STabsThemeData].
  const STabsThemeData({
    required this.indicatorColor,
    required this.labelColor,
    required this.unselectedLabelColor,
    required this.backgroundColor,
  });

  /// Creates an [STabsThemeData] from a [ColorScheme].
  factory STabsThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return STabsThemeData(
      indicatorColor:
          colorScheme.primary,
      labelColor:
          colorScheme.primary,
      unselectedLabelColor:
          colorScheme.onSurfaceVariant,
      backgroundColor:
          Colors.transparent,
    );
  }

  /// Color of the tab indicator.
  final Color
      indicatorColor;

  /// Color of the selected tab label.
  final Color
      labelColor;

  /// Color of the unselected tab labels.
  final Color
      unselectedLabelColor;

  /// Background color of the tabs.
  final Color
      backgroundColor;

  @override
  STabsThemeData
      copyWith({
    Color?
        indicatorColor,
    Color?
        labelColor,
    Color?
        unselectedLabelColor,
    Color?
        backgroundColor,
  }) {
    return STabsThemeData(
      indicatorColor:
          indicatorColor ?? this.indicatorColor,
      labelColor:
          labelColor ?? this.labelColor,
      unselectedLabelColor:
          unselectedLabelColor ?? this.unselectedLabelColor,
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  STabsThemeData lerp(
      ThemeExtension<STabsThemeData>?
          other,
      double
          t) {
    if (other
        is! STabsThemeData) {
      return this;
    }
    return STabsThemeData(
      indicatorColor: Color.lerp(
          indicatorColor,
          other.indicatorColor,
          t)!,
      labelColor: Color.lerp(
          labelColor,
          other.labelColor,
          t)!,
      unselectedLabelColor: Color.lerp(
          unselectedLabelColor,
          other.unselectedLabelColor,
          t)!,
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
    );
  }
}

/// Extension to access [STabsThemeData] from [ThemeData].
extension STabsThemeExtension
    on ThemeData {
  /// Retrieves the current [STabsThemeData].
  STabsThemeData get sTabsTheme =>
      extension<STabsThemeData>() ??
      STabsThemeData(
        indicatorColor: colorScheme.primary,
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        backgroundColor: colorScheme.surface,
      );
}

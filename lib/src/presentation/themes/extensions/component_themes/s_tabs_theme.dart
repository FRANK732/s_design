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

  /// Creates a [STabsThemeData] from [ColorScheme].
  factory STabsThemeData.fromColorScheme(
      ColorScheme
          colors) {
    return STabsThemeData(
      indicatorColor:
          colors.tabsIndicator,
      labelColor:
          colors.tabsLabel,
      unselectedLabelColor:
          colors.tabsUnselectedLabel,
      backgroundColor:
          colors.surface,
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
      STabsThemeData.fromColorScheme(colorScheme);
}

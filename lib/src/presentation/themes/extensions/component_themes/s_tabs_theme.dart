import 'package:flutter/material.dart';

/// Theme data for [STabs].
class STabsThemeData
    extends ThemeExtension<
        STabsThemeData> {
  /// Creates an instance of [STabsThemeData].
  /// Creates an instance of [STabsThemeData].
  const STabsThemeData({
    required this.indicatorColor,
    required this.labelColor,
    required this.unselectedLabelColor,
    required this.backgroundColor,
    required this.dividerColor,
    required this.hoverColor,
    required this.cardBackgroundColor,
    required this.cardActiveBackgroundColor,
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
      dividerColor:
          colorScheme.outlineVariant,
      hoverColor:
          colorScheme.surfaceContainerHighest.withOpacity(0.3),
      cardBackgroundColor:
          colorScheme.surfaceContainerLow,
      cardActiveBackgroundColor:
          colorScheme.surface,
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

  /// Background color of the tabs container.
  final Color
      backgroundColor;

  /// Color of the dividers between tabs or sections.
  final Color
      dividerColor;

  /// Color overlay for hover states.
  final Color
      hoverColor;

  /// Background color for tabs in 'card' type when inactive.
  final Color
      cardBackgroundColor;

  /// Background color for tabs in 'card' type when active.
  final Color
      cardActiveBackgroundColor;

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
    Color?
        dividerColor,
    Color?
        hoverColor,
    Color?
        cardBackgroundColor,
    Color?
        cardActiveBackgroundColor,
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
      dividerColor:
          dividerColor ?? this.dividerColor,
      hoverColor:
          hoverColor ?? this.hoverColor,
      cardBackgroundColor:
          cardBackgroundColor ?? this.cardBackgroundColor,
      cardActiveBackgroundColor:
          cardActiveBackgroundColor ?? this.cardActiveBackgroundColor,
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
      dividerColor: Color.lerp(
          dividerColor,
          other.dividerColor,
          t)!,
      hoverColor: Color.lerp(
          hoverColor,
          other.hoverColor,
          t)!,
      cardBackgroundColor: Color.lerp(
          cardBackgroundColor,
          other.cardBackgroundColor,
          t)!,
      cardActiveBackgroundColor: Color.lerp(
          cardActiveBackgroundColor,
          other.cardActiveBackgroundColor,
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

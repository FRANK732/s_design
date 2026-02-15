import 'package:flutter/material.dart';

/// Theme data for [SListTile].
class SListTileThemeData
    extends ThemeExtension<
        SListTileThemeData> {
  /// Creates an instance of [SListTileThemeData].
  const SListTileThemeData({
    required this.textColor,
    required this.subtitleColor,
    required this.iconColor,
    required this.backgroundColor,
    required this.selectedColor,
    required this.selectedBackgroundColor,
    required this.hoverColor,
    this.filledColor,
    this.outlinedBorderColor,
    this.borderRadius,
    this.groupBackgroundColor,
    this.dividerColor,
    this.groupBorderRadius,
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  /// Creates a [SListTileThemeData] from [ColorScheme].
  factory SListTileThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SListTileThemeData(
      textColor:
          colorScheme.onSurface,
      subtitleColor:
          colorScheme.onSurfaceVariant,
      iconColor:
          colorScheme.onSurfaceVariant,
      backgroundColor:
          Colors.transparent,
      selectedColor:
          colorScheme.primary,
      selectedBackgroundColor:
          colorScheme.primaryContainer,
      hoverColor:
          colorScheme.surfaceVariant,
      filledColor:
          colorScheme.surfaceContainerHighest,
      outlinedBorderColor:
          colorScheme.outline,
      borderRadius:
          BorderRadius.circular(12),
      groupBackgroundColor:
          colorScheme.surfaceContainerLow,
      dividerColor:
          colorScheme.outlineVariant,
      groupBorderRadius:
          BorderRadius.circular(16),
      titleTextStyle:
          null,
      subtitleTextStyle:
          null,
    );
  }

  /// Text color for the list tile title.
  final Color
      textColor;

  /// Text color for the list tile subtitle.
  final Color
      subtitleColor;

  /// Icon color for leading/trailing icons.
  final Color
      iconColor;

  /// Background color of the list tile (standard variant).
  final Color
      backgroundColor;

  /// Text color when selected.
  final Color
      selectedColor;

  /// Background color when selected.
  final Color
      selectedBackgroundColor;

  /// Background color when hovered.
  final Color
      hoverColor;

  /// Background color for the Filled variant.
  final Color?
      filledColor;

  /// Border color for the Outlined variant.
  final Color?
      outlinedBorderColor;

  /// Border radius for shaped variants (Filled/Outlined).
  final BorderRadius?
      borderRadius;

  /// Background color for [SListTileGroup].
  final Color?
      groupBackgroundColor;

  /// Divider color for [SListTileGroup].
  final Color?
      dividerColor;

  /// Border radius for [SListTileGroup].
  final BorderRadius?
      groupBorderRadius;

  /// Custom text style for the title.
  final TextStyle?
      titleTextStyle;

  /// Custom text style for the subtitle.
  final TextStyle?
      subtitleTextStyle;

  @override
  SListTileThemeData
      copyWith({
    Color?
        textColor,
    Color?
        subtitleColor,
    Color?
        iconColor,
    Color?
        backgroundColor,
    Color?
        selectedColor,
    Color?
        selectedBackgroundColor,
    Color?
        hoverColor,
    Color?
        filledColor,
    Color?
        outlinedBorderColor,
    BorderRadius?
        borderRadius,
    Color?
        groupBackgroundColor,
    Color?
        dividerColor,
    BorderRadius?
        groupBorderRadius,
    TextStyle?
        titleTextStyle,
    TextStyle?
        subtitleTextStyle,
  }) {
    return SListTileThemeData(
      textColor:
          textColor ?? this.textColor,
      subtitleColor:
          subtitleColor ?? this.subtitleColor,
      iconColor:
          iconColor ?? this.iconColor,
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      selectedColor:
          selectedColor ?? this.selectedColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
      hoverColor:
          hoverColor ?? this.hoverColor,
      filledColor:
          filledColor ?? this.filledColor,
      outlinedBorderColor:
          outlinedBorderColor ?? this.outlinedBorderColor,
      borderRadius:
          borderRadius ?? this.borderRadius,
      groupBackgroundColor:
          groupBackgroundColor ?? this.groupBackgroundColor,
      dividerColor:
          dividerColor ?? this.dividerColor,
      groupBorderRadius:
          groupBorderRadius ?? this.groupBorderRadius,
      titleTextStyle:
          titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle:
          subtitleTextStyle ?? this.subtitleTextStyle,
    );
  }

  @override
  SListTileThemeData lerp(
      ThemeExtension<SListTileThemeData>?
          other,
      double
          t) {
    if (other
        is! SListTileThemeData) {
      return this;
    }
    return SListTileThemeData(
      textColor: Color.lerp(
          textColor,
          other.textColor,
          t)!,
      subtitleColor: Color.lerp(
          subtitleColor,
          other.subtitleColor,
          t)!,
      iconColor: Color.lerp(
          iconColor,
          other.iconColor,
          t)!,
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      selectedColor: Color.lerp(
          selectedColor,
          other.selectedColor,
          t)!,
      selectedBackgroundColor: Color.lerp(
          selectedBackgroundColor,
          other.selectedBackgroundColor,
          t)!,
      hoverColor: Color.lerp(
          hoverColor,
          other.hoverColor,
          t)!,
      filledColor: Color.lerp(
          filledColor,
          other.filledColor,
          t),
      outlinedBorderColor: Color.lerp(
          outlinedBorderColor,
          other.outlinedBorderColor,
          t),
      borderRadius: BorderRadius.lerp(
          borderRadius,
          other.borderRadius,
          t),
      groupBackgroundColor: Color.lerp(
          groupBackgroundColor,
          other.groupBackgroundColor,
          t),
      dividerColor: Color.lerp(
          dividerColor,
          other.dividerColor,
          t),
      groupBorderRadius: BorderRadius.lerp(
          groupBorderRadius,
          other.groupBorderRadius,
          t),
      titleTextStyle: TextStyle.lerp(
          titleTextStyle,
          other.titleTextStyle,
          t),
      subtitleTextStyle: TextStyle.lerp(
          subtitleTextStyle,
          other.subtitleTextStyle,
          t),
    );
  }
}

/// Extension to access [SListTileThemeData] from [ThemeData].
extension SListTileThemeExtension
    on ThemeData {
  /// Retrieves the current [SListTileThemeData].
  SListTileThemeData get sListTileTheme =>
      extension<SListTileThemeData>() ??
      SListTileThemeData.fromColorScheme(colorScheme);
}

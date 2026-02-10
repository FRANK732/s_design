import 'package:flutter/material.dart';
import '../../../theme/s_colors.dart';

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
  });

  /// Creates a [SListTileThemeData] from [SColorsBase].
  factory SListTileThemeData.fromColors(
      SColorsBase
          colors) {
    return SListTileThemeData(
      textColor:
          colors.textPrimary,
      subtitleColor:
          colors.textSecondary,
      iconColor:
          colors.textSecondary,
      backgroundColor:
          Colors.transparent,
      selectedColor:
          colors.primary,
      selectedBackgroundColor:
          colors.primary.withOpacity(0.1),
      hoverColor:
          colors.surface,
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

  /// Background color of the list tile.
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
    );
  }
}

/// Extension to access [SListTileThemeData] from [ThemeData].
extension SListTileThemeExtension
    on ThemeData {
  /// Retrieves the current [SListTileThemeData].
  SListTileThemeData get sListTileTheme =>
      extension<SListTileThemeData>() ??
      SListTileThemeData.fromColors(SLightColors());
}

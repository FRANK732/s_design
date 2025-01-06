import 'package:flutter/material.dart';

/// Theme data for [TListTile].
class TListTileThemeData {
  /// Default text style for the title.
  final TextStyle titleTextStyle;

  /// Default text style for the subtitle.
  final TextStyle? subtitleTextStyle;

  /// Default color for the leading widget.
  final Color? leadingColor;

  /// Default color for the trailing widget.
  final Color? trailingColor;

  /// Default size for the trailing icon.
  final double trailingIconSize;

  /// Creates an instance of [TListTileThemeData].
  const TListTileThemeData({
    this.titleTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    this.subtitleTextStyle,
    this.leadingColor,
    this.trailingColor,
    this.trailingIconSize = 24.0,
  });

  /// Provides a light theme.
  static const TListTileThemeData light = TListTileThemeData();

  /// Provides a dark theme.
  static const TListTileThemeData dark = TListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 14,
      color: Colors.white70,
    ),
    leadingColor: Colors.white,
    trailingColor: Colors.white70,
    trailingIconSize: 24.0,
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  TListTileThemeData copyWith({
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    Color? leadingColor,
    Color? trailingColor,
    double? trailingIconSize,
  }) {
    return TListTileThemeData(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      leadingColor: leadingColor ?? this.leadingColor,
      trailingColor: trailingColor ?? this.trailingColor,
      trailingIconSize: trailingIconSize ?? this.trailingIconSize,
    );
  }
}

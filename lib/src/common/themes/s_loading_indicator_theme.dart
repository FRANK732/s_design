import 'package:flutter/material.dart';

/// Theme data for [SLoadingIndicator].
class SLoadingIndicatorThemeData {
  /// Default color for the loading spinner.
  final Color spinnerColor;

  /// Default size for the loading spinner.
  final double spinnerSize;

  /// Default text style for the loading message.
  final TextStyle messageStyle;

  /// Creates an instance of [SLoadingIndicatorThemeData].
  const SLoadingIndicatorThemeData({
    this.spinnerColor = Colors.teal,
    this.spinnerSize = 25.0,
    this.messageStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
  });

  /// Provides a default theme.
  factory SLoadingIndicatorThemeData.light() {
    return const SLoadingIndicatorThemeData();
  }

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SLoadingIndicatorThemeData copyWith({
    Color? spinnerColor,
    double? spinnerSize,
    TextStyle? messageStyle,
  }) {
    return SLoadingIndicatorThemeData(
      spinnerColor: spinnerColor ?? this.spinnerColor,
      spinnerSize: spinnerSize ?? this.spinnerSize,
      messageStyle: messageStyle ?? this.messageStyle,
    );
  }
}

/// Extension to access [SLoadingIndicatorThemeData] from [ThemeData].
extension SLoadingIndicatorThemeExtension on ThemeData {
  /// Retrieves the current [SLoadingIndicatorThemeData].
  SLoadingIndicatorThemeData get sLoadingIndicatorTheme =>
      extension<SLoadingIndicatorThemeData>() ??
           SLoadingIndicatorThemeData.light();
}

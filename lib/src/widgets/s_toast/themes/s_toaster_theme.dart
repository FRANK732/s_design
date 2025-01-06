import 'package:flutter/material.dart';

/// Theme data for [SToasterService] and [SToastWidget].
class SToasterThemeData {
  /// Default background color of the toast.
  final Color backgroundColor;

  /// Default text style of the toast message.
  final TextStyle messageTextStyle;

  /// Default icon color based on toast type.
  final Color iconColor;

  /// Default border radius of the toast.
  final BorderRadiusGeometry borderRadius;

  /// Default padding of the toast.
  final EdgeInsetsGeometry padding;

  /// Creates an instance of [SToasterThemeData].
  const SToasterThemeData({
    this.backgroundColor = const Color(0xFF323232), // Dark gray
    this.messageTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    this.iconColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  });

  /// Provides a light theme.
  static const SToasterThemeData light = SToasterThemeData();

  /// Provides a dark theme.
  static const SToasterThemeData dark = SToasterThemeData(
    backgroundColor: Colors.black87,
    messageTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    iconColor: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SToasterThemeData copyWith({
    Color? backgroundColor,
    TextStyle? messageTextStyle,
    Color? iconColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return SToasterThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      messageTextStyle: messageTextStyle ?? this.messageTextStyle,
      iconColor: iconColor ?? this.iconColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }
}

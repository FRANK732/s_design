// lib/src/components/s_modal/themes/s_modal_theme.dart

import 'package:flutter/material.dart';
import '../enums/modal_animation_type.dart';
import '../enums/s_modal_size.dart';

/// Theme data for [SModal].
class SModalThemeData {
  /// Default background color of the modal.
  final Color backgroundColor;

  /// Default title text style.
  final TextStyle titleTextStyle;

  /// Default message text style.
  final TextStyle messageTextStyle;

  /// Default icon color.
  final Color iconColor;

  /// Default icon size.
  final double iconSize;

  /// Default border radius of the modal.
  final BorderRadiusGeometry borderRadius;

  /// Default padding inside the modal.
  final EdgeInsetsGeometry padding;

  /// Default animation type for the modal.
  final SModalAnimationType animationType;

  /// Default modal size.
  final SModalSize size;

  /// Creates an instance of [SModalThemeData].
  const SModalThemeData({
    this.backgroundColor = Colors.white,
    this.titleTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.messageTextStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
    this.iconColor = Colors.blue,
    this.iconSize = 60.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(20.0)),
    this.padding = const EdgeInsets.all(20.0),
    this.animationType = SModalAnimationType.fade,
    this.size = SModalSize.medium,
  });

  /// Provides a light theme.
  static const SModalThemeData light = SModalThemeData();

  /// Provides a dark theme.
  static const SModalThemeData dark = SModalThemeData(
    backgroundColor: Colors.grey,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    messageTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
    iconColor: Colors.blueAccent,
    iconSize: 60.0,
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    padding: EdgeInsets.all(20.0),
    animationType: SModalAnimationType.fade,
    size: SModalSize.medium,
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SModalThemeData copyWith({
    Color? backgroundColor,
    TextStyle? titleTextStyle,
    TextStyle? messageTextStyle,
    Color? iconColor,
    double? iconSize,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    SModalAnimationType? animationType,
    SModalSize? size,
  }) {
    return SModalThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      messageTextStyle: messageTextStyle ?? this.messageTextStyle,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      animationType: animationType ?? this.animationType,
      size: size ?? this.size,
    );
  }
}

/// Extension to access [SModalThemeData] from [ThemeData].
extension SModalThemeExtension on ThemeData {
  /// Retrieves the current [SModalThemeData].
  SModalThemeData get sModalTheme =>
      extension<SModalThemeData>() ?? SModalThemeData.light;
}

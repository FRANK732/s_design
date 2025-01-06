import 'package:flutter/material.dart';

/// Theme data for [SProgressBar].
class SProgressBarThemeData {
  /// Default background color of the progress bar.
  final Color backgroundColor;

  /// Default color of the progress indicator.
  final Color progressColor;

  /// Default height of the progress bar.
  final double height;

  /// Default border radius of the progress bar.
  final BorderRadiusGeometry borderRadius;

  /// Default animation duration.
  final Duration animationDuration;

  /// Default animation curve.
  final Curve animationCurve;

  /// Creates an instance of [SProgressBarThemeData].
  const SProgressBarThemeData({
    this.backgroundColor = const Color(0xFFD1D5DB), // Gray color
    this.progressColor = const Color(0xFF3B82F6), // Blue color
    this.height = 8.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.linear,
  });

  /// Provides a light theme.
  static const SProgressBarThemeData light = SProgressBarThemeData();

  /// Provides a dark theme.
  static const SProgressBarThemeData dark = SProgressBarThemeData(
    backgroundColor: Colors.grey,
    progressColor: Colors.blueAccent,
    height: 8.0,
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    animationDuration: Duration(milliseconds: 200),
    animationCurve: Curves.linear,
  );

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SProgressBarThemeData copyWith({
    Color? backgroundColor,
    Color? progressColor,
    double? height,
    BorderRadiusGeometry? borderRadius,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    return SProgressBarThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      progressColor: progressColor ?? this.progressColor,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }
}

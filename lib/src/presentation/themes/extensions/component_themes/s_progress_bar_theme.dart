import 'package:flutter/material.dart';

/// Theme data for [SProgressBar].
class SProgressBarThemeData
    extends ThemeExtension<
        SProgressBarThemeData> {
  /// Creates an instance of [SProgressBarThemeData].
  const SProgressBarThemeData({
    required this.backgroundColor,
    required this.progressColor,
    required this.bufferColor,
    required this.borderRadius,
    required this.height,
    this.animationDuration,
    this.animationCurve,
  });

  /// Creates a [SProgressBarThemeData] from [ColorScheme].
  factory SProgressBarThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SProgressBarThemeData(
      backgroundColor:
          colorScheme.surfaceContainerHighest,
      progressColor:
          colorScheme.primary,
      bufferColor:
          colorScheme.primary.withOpacity(0.3),
      borderRadius:
          BorderRadius.circular(4.0),
      height:
          8.0,
      animationDuration:
          const Duration(milliseconds: 300),
      animationCurve:
          Curves.linear,
    );
  }

  /// Background color of the progress bar track.
  final Color
      backgroundColor;

  /// Color of the filled progress portion.
  final Color
      progressColor;

  /// Color of the buffered portion.
  final Color
      bufferColor;

  /// Borader radius of the progress bar.
  final BorderRadiusGeometry
      borderRadius;

  /// Height of the progress bar track.
  final double
      height;

  /// Duration of the progress animation.
  final Duration?
      animationDuration;

  /// Curve of the progress animation.
  final Curve?
      animationCurve;

  @override
  SProgressBarThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        progressColor,
    Color?
        bufferColor,
    BorderRadiusGeometry?
        borderRadius,
    double?
        height,
    Duration?
        animationDuration,
    Curve?
        animationCurve,
  }) {
    return SProgressBarThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      progressColor:
          progressColor ?? this.progressColor,
      bufferColor:
          bufferColor ?? this.bufferColor,
      borderRadius:
          borderRadius ?? this.borderRadius,
      height:
          height ?? this.height,
      animationDuration:
          animationDuration ?? this.animationDuration,
      animationCurve:
          animationCurve ?? this.animationCurve,
    );
  }

  @override
  SProgressBarThemeData lerp(
      ThemeExtension<SProgressBarThemeData>?
          other,
      double
          t) {
    if (other
        is! SProgressBarThemeData) {
      return this;
    }
    return SProgressBarThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      progressColor: Color.lerp(
          progressColor,
          other.progressColor,
          t)!,
      bufferColor: Color.lerp(
          bufferColor,
          other.bufferColor,
          t)!,
      borderRadius: BorderRadiusGeometry.lerp(
          borderRadius,
          other.borderRadius,
          t)!,
      height:
          (height + (other.height - height) * t),
      animationDuration:
          other.animationDuration,
      animationCurve:
          other.animationCurve,
    );
  }

  @override
  bool operator ==(
      Object
          other) {
    if (identical(
        this,
        other))
      return true;
    if (other.runtimeType !=
        runtimeType)
      return false;
    return other is SProgressBarThemeData &&
        other.backgroundColor == backgroundColor &&
        other.progressColor == progressColor &&
        other.bufferColor == bufferColor &&
        other.borderRadius == borderRadius &&
        other.height == height &&
        other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve;
  }

  @override
  int get hashCode {
    return Object
        .hash(
      backgroundColor,
      progressColor,
      bufferColor,
      borderRadius,
      height,
      animationDuration,
      animationCurve,
    );
  }
}

/// Extension to access [SProgressBarThemeData] from [ThemeData].
extension SProgressBarThemeExtension
    on ThemeData {
  /// Retrieves the current [SProgressBarThemeData].
  SProgressBarThemeData get sProgressBarTheme =>
      extension<SProgressBarThemeData>() ??
      SProgressBarThemeData.fromColorScheme(colorScheme);
}

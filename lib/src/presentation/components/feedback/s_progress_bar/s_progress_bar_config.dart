import 'package:flutter/material.dart';

/// Configuration class for [SProgressBar].
///
/// This class holds all the customizable properties for the progress bar,
/// allowing for a clean separation between the widget and its configuration.
class SProgressBarConfig {
  /// Creates an [SProgressBarConfig].
  const SProgressBarConfig({
    this.backgroundColor,
    this.progressColor,
    this.bufferColor,
    this.height,
    this.borderRadius,
    this.animationDuration,
    this.animationCurve,
    this.label,
    this.vertical =
        false,
    this.indeterminate =
        false,
  });

  /// The background color of the progress bar track.
  final Color?
      backgroundColor;

  /// The color of the filled progress portion.
  final Color?
      progressColor;

  /// The color of the buffered portion.
  final Color?
      bufferColor;

  /// The height of the progress bar track (or width if vertical).
  final double?
      height;

  /// The border radius of the progress bar.
  final BorderRadiusGeometry?
      borderRadius;

  /// The duration of the progress bar animation.
  final Duration?
      animationDuration;

  /// The curve of the progress bar animation.
  final Curve?
      animationCurve;

  /// An optional widget to display as a label (e.g., inside or above the bar).
  final Widget?
      label;

  /// Whether the progress bar is vertical.
  final bool
      vertical;

  /// Whether the progress bar is in an indeterminate state.
  final bool
      indeterminate;

  /// Creates a copy of this config with the given fields replaced with the new values.
  SProgressBarConfig
      copyWith({
    Color?
        backgroundColor,
    Color?
        progressColor,
    Color?
        bufferColor,
    double?
        height,
    BorderRadiusGeometry?
        borderRadius,
    Duration?
        animationDuration,
    Curve?
        animationCurve,
    Widget?
        label,
    bool?
        vertical,
    bool?
        indeterminate,
  }) {
    return SProgressBarConfig(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      progressColor:
          progressColor ?? this.progressColor,
      bufferColor:
          bufferColor ?? this.bufferColor,
      height:
          height ?? this.height,
      borderRadius:
          borderRadius ?? this.borderRadius,
      animationDuration:
          animationDuration ?? this.animationDuration,
      animationCurve:
          animationCurve ?? this.animationCurve,
      label:
          label ?? this.label,
      vertical:
          vertical ?? this.vertical,
      indeterminate:
          indeterminate ?? this.indeterminate,
    );
  }
}

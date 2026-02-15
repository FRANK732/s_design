import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 's_progress_bar_config.dart';

/// A customizable progress bar widget.
///
/// [SProgressBar] displays a horizontal (or vertical) bar representing progress.
/// It supports custom values, buffers, colors, sizes, animations, and theming via
/// [SProgressBarThemeData] and [SProgressBarConfig].
class SProgressBar
    extends StatelessWidget {
  /// Creates an [SProgressBar].
  ///
  /// * [value] must be between 0.0 and [max] (if determinate).
  /// * [max] must be greater than zero.
  const SProgressBar({
    super.key,
    this.value =
        0.0,
    this.max =
        1.0,
    this.config,
    this.bufferValue,
    this.height,
    this.width,
    this.backgroundColor,
    this.progressColor,
    this.bufferColor,
    this.borderRadius,
    this.animationDuration,
    this.animationCurve,
    this.label,
    this.vertical =
        false,
    this.indeterminate =
        false,
  }) : assert(max > 0, 'Max must be greater than 0');

  /// The current value of the progress bar (0.0 to [max]).
  final double
      value;

  /// The maximum value of the progress bar.
  final double
      max;

  /// Configuration object for granular control.
  final SProgressBarConfig?
      config;

  /// The buffer value (0.0 to [max]), displayed as a secondary progress bar.
  final double?
      bufferValue;

  /// The height of the progress bar track (or width if vertical).
  final double?
      height;

  /// The width of the progress bar (or height if vertical).
  final double?
      width;

  /// The background color of the progress bar track.
  final Color?
      backgroundColor;

  /// The color of the filled progress portion.
  final Color?
      progressColor;

  /// The color of the buffered portion.
  final Color?
      bufferColor;

  /// The border radius of the progress bar.
  final BorderRadiusGeometry?
      borderRadius;

  /// The duration of the progress bar animation.
  final Duration?
      animationDuration;

  /// The curve of the progress bar animation.
  final Curve?
      animationCurve;

  /// An optional widget to display as a label.
  final Widget?
      label;

  /// Whether the progress bar is vertical.
  final bool
      vertical;

  /// Whether the progress bar is in an indeterminate state.
  final bool
      indeterminate;

  @override
  Widget build(
      BuildContext
          context) {
    final SProgressBarThemeData
        theme =
        Theme.of(context).sProgressBarTheme;

    // Resolve configuration
    final SProgressBarConfig effectiveConfig = config ??
        SProgressBarConfig(
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          bufferColor: bufferColor,
          height: height,
          borderRadius: borderRadius,
          animationDuration: animationDuration,
          animationCurve: animationCurve,
          label: label,
          vertical: vertical,
          indeterminate: indeterminate,
        );

    // Resolve component style properties
    final Color
        effectiveBackgroundColor =
        effectiveConfig.backgroundColor ?? theme.backgroundColor;
    final Color
        effectiveProgressColor =
        effectiveConfig.progressColor ?? theme.progressColor;
    final Color
        effectiveBufferColor =
        effectiveConfig.bufferColor ?? theme.bufferColor;
    final double
        effectiveHeight =
        effectiveConfig.height ?? theme.height;
    final BorderRadiusGeometry
        effectiveBorderRadius =
        effectiveConfig.borderRadius ?? theme.borderRadius;
    final Duration effectiveDuration = effectiveConfig.animationDuration ??
        theme.animationDuration ??
        const Duration(milliseconds: 300);
    final Curve effectiveCurve = effectiveConfig.animationCurve ??
        theme.animationCurve ??
        Curves.easeInOut;

    // Calculate percentages
    final double safeMax = max > 0
        ? max
        : 1.0;
    final double
        progressPercentage =
        (value / safeMax).clamp(0.0, 1.0);
    final double
        bufferPercentage =
        ((bufferValue ?? 0.0) / safeMax).clamp(0.0, 1.0);

    Widget
        progressBar =
        Container(
      height:
          effectiveHeight,
      width:
          width,
      decoration:
          BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
      ),
      child:
          ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: Stack(
          children: [
            // Buffer Bar
            if (bufferValue != null && !effectiveConfig.indeterminate)
              LayoutBuilder(
                builder: (context, constraints) {
                  return AnimatedContainer(
                    duration: effectiveDuration,
                    curve: effectiveCurve,
                    width: constraints.maxWidth * bufferPercentage,
                    color: effectiveBufferColor,
                  );
                },
              ),

            // Progress Bar
            if (effectiveConfig.indeterminate)
              const LinearProgressIndicator(
                backgroundColor: Colors.transparent,
              )
            else
              LayoutBuilder(
                builder: (context, constraints) {
                  return AnimatedContainer(
                    duration: effectiveDuration,
                    curve: effectiveCurve,
                    width: constraints.maxWidth * progressPercentage,
                    color: effectiveProgressColor,
                  );
                },
              ),

            // Label (if provided)
            if (effectiveConfig.label != null)
              Align(
                alignment: Alignment.center,
                child: effectiveConfig.label,
              ),
          ],
        ),
      ),
    );

    if (effectiveConfig
        .vertical) {
      return RotatedBox(
        quarterTurns: -1,
        child: progressBar,
      );
    }

    return progressBar;
  }
}

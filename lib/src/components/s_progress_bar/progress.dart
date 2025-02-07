import 'package:flutter/material.dart';
import 'utils/s_progress_bar_utils.dart';

/// A customizable progress bar widget.
///
/// [SProgressBar] displays a horizontal bar representing progress.
/// It supports custom values, colors, sizes, animations, and theming via
/// Flutter's built-in [Theme].
class SProgressBar extends StatelessWidget {
  /// The current value of the progress bar.
  final double value;

  /// The maximum value of the progress bar (must be > 0).
  final double max;

  /// The height of the progress bar track.
  final double height;

  /// The explicit width of the progress bar (if null, it expands to max width).
  final double? length;

  /// The background color of the progress bar track.
  final Color? backgroundColor;

  /// The color of the filled progress portion.
  final Color? progressColor;

  /// The border radius of the progress bar.
  final BorderRadiusGeometry? borderRadius;

  /// The duration of the progress bar animation.
  final Duration? animationDuration;

  /// The curve of the progress bar animation.
  final Curve? animationCurve;

  /// Creates an [SProgressBar].
  ///
  /// * [value] must be non-negative.
  /// * [max] must be greater than zero.
  const SProgressBar({
    super.key,
    required this.value,
    this.max = 100.0,
    this.height = 8.0,
    this.length,
    this.backgroundColor,
    this.progressColor,
    this.borderRadius,
    this.animationDuration,
    this.animationCurve,
  })  : assert(value >= 0),
        assert(max > 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final progressTheme = theme.progressIndicatorTheme;

    // Calculate progress fraction (0.0 -> 1.0).
    final double percentage = SProgressBarUtils.valueToPercentage(value, max);

    final trackColor = backgroundColor ??
        progressTheme.linearTrackColor ??
        colorScheme.surfaceContainerHighest;
    final fillColor =
        progressColor ?? progressTheme.color ?? colorScheme.primary;

    final usedBorderRadius = borderRadius ?? BorderRadius.circular(4.0);
    final usedAnimationDuration =
        animationDuration ?? const Duration(milliseconds: 300);
    final usedCurve = animationCurve ?? Curves.linear;

    final usedHeight = height < 1.0 ? 8.0 : height;

    return ClipRRect(
      borderRadius: usedBorderRadius,
      child: Container(
        height: usedHeight,
        width: length ?? double.infinity,
        color: trackColor,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AnimatedContainer(
                  duration: usedAnimationDuration,
                  curve: usedCurve,
                  width: constraints.maxWidth * percentage,
                  color: fillColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'themes/s_progress_bar_theme.dart';
import 'themes/s_progress_bar_theme_extension.dart';
import 'utils/s_progress_bar_utils.dart'; // Import if utilities are added

/// A customizable progress bar widget.
///
/// [SProgressBar] displays a horizontal bar representing progress.
/// It supports custom values, colors, sizes, animations, and theming.
///
/// Example usage:
/// ```dart
/// SProgressBar(
///   value: 50,
///   max: 100,
///   height: 10.0,
///   progressColor: Colors.green,
/// )
/// ```
class SProgressBar extends StatelessWidget {
  /// The current value of the progress bar.
  final double value;

  /// The maximum value of the progress bar.
  final double max;

  /// The height of the progress bar.
  final double height;

  /// The background color of the progress bar.
  final Color? backgroundColor;

  /// The color of the progress indicator.
  final Color? progressColor;

  /// The border radius of the progress bar.
  final BorderRadiusGeometry? borderRadius;

  /// The duration of the progress bar animation.
  final Duration? animationDuration;

  /// The curve of the progress bar animation.
  final Curve? animationCurve;

  /// Creates an [SProgressBar].
  ///
  /// The [value] must be non-negative and [max] must be greater than zero.
  const SProgressBar({
    Key? key,
    required this.value,
    this.max = 100.0,
    this.height = 8.0,
    this.backgroundColor,
    this.progressColor,
    this.borderRadius,
    this.animationDuration,
    this.animationCurve,
  })  : assert(value >= 0),
        assert(max > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the current theme data.
    final SProgressBarThemeData theme = Theme.of(context).sProgressBarTheme;

    // Calculate percentage using utility.
    final double percentage =
    SProgressBarUtils.valueToPercentage(value, max);

    return ClipRRect(
      borderRadius: borderRadius ?? theme.borderRadius,
      child: Container(
        height: height < 1.0 ? theme.height : height,
        color: backgroundColor ?? theme.backgroundColor,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AnimatedContainer(
                  duration:
                  animationDuration ?? theme.animationDuration,
                  curve: animationCurve ?? theme.animationCurve,
                  width: constraints.maxWidth * percentage,
                  color: progressColor ?? theme.progressColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

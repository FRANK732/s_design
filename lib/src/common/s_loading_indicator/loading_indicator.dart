import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:s_design/src/common/s_loading_indicator/themes/s_loading_indicator_theme.dart';
import 'enums/s_loading_types.dart';
import 'utils/loading_indicator_utils.dart';

/// Displays a centered, compact container with a loading spinner and an optional message.
/// Suitable for overlaying on existing content without covering the entire screen.
class SLoadingIndicator extends StatefulWidget {
  /// The message to display below the loading spinner.
  final String message;

  /// The color of the loading spinner.
  final Color? spinnerColor;

  /// The color of the loading message text.
  final Color? messageColor;

  /// The size of the loading spinner.
  final double spinnerSize;

  /// The type of loading spinner to display.
  final SLoaderType? loaderType;

  /// Whether to display a semi-transparent background overlay.
  final bool showBackground;

  /// The opacity of the background overlay.
  final double backgroundOpacity;

  /// The border radius of the loading indicator container.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the background overlay.
  final Color? backgroundColor;

  /// The text style of the loading message.
  final TextStyle? messageStyle;

  /// Whether the dialog can be dismissed by tapping outside.
  final bool barrierDismissible;

  /// The semantic label for accessibility.
  final String? semanticLabel;

  /// Duration for fade-in and fade-out animations.
  final Duration animationDuration;

  /// Animation curve for the fade transition.
  final Curve animationCurve;

  /// Speed multiplier for the spinner animation.
  final double spinnerSpeed;

  /// Optional custom icon instead of a spinner.
  final Widget? customIcon;

  /// Padding inside the loading indicator container.
  final EdgeInsetsGeometry? padding;

  /// Margin around the loading indicator container.
  final EdgeInsetsGeometry? margin;

  const SLoadingIndicator({
    super.key,
    this.message = "Loading...",
    this.spinnerColor,
    this.spinnerSize = 25.0,
    this.messageColor,
    this.loaderType = SLoaderType.fadingCircle,
    this.showBackground = true,
    this.backgroundOpacity = 0.5,
    this.backgroundColor,
    this.messageStyle,
    this.barrierDismissible = false,
    this.semanticLabel,
    this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.spinnerSpeed = 1.0,
    this.customIcon,
    this.padding,
    this.margin,
  }) : assert((customIcon == null || loaderType == null), "Use either a custom Icon or a loader type" );

  @override
  _SLoadingIndicatorState createState() => _SLoadingIndicatorState();
}

class _SLoadingIndicatorState extends State<SLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: widget.animationCurve);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Selects the appropriate spinner widget based on [loaderType].
  Widget _buildSpinner() {
    if (widget.customIcon != null) {
      return widget.customIcon!;
    }

    final spinner = (SLoaderType? type) {
      switch (type) {
        case SLoaderType.chasingDots:
          return SpinKitChasingDots(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.doubleBounce:
          return SpinKitDoubleBounce(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.wave:
          return SpinKitWave(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.threeBounce:
          return SpinKitThreeBounce(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.circle:
          return SpinKitCircle(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.cubeGrid:
          return SpinKitCubeGrid(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.rotatingCircle:
          return SpinKitRotatingCircle(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.rotatingPlain:
          return SpinKitRotatingPlain(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.foldingCube:
          return SpinKitFoldingCube(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
        case SLoaderType.fadingCircle:
        default:
          return SpinKitFadingCircle(
            color: widget.spinnerColor ?? Colors.teal,
            size: widget.spinnerSize,
            duration:
            Duration(milliseconds: (1000 / widget.spinnerSpeed).round()),
          );
      }
    }(widget.loaderType);

    return spinner;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).sLoadingIndicatorTheme;

    final messageStyle = widget.messageStyle ??
        theme.messageStyle.copyWith(color: widget.messageColor);

    return FadeTransition(
      opacity: _animation,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            if (widget.showBackground)
              GestureDetector(
                onTap: widget.barrierDismissible
                    ? () {
                  Navigator.of(context).pop();
                }
                    : null,
                child: AnimatedContainer(
                  duration: widget.animationDuration,
                  color: widget.backgroundColor
                      ?.withOpacity(widget.backgroundOpacity) ??
                      Colors.black.withOpacity(widget.backgroundOpacity),
                ),
              ),
            Center(
              child: Semantics(
                label: widget.semanticLabel ?? 'Loading',
                child: Container(
                  padding: widget.padding ?? const EdgeInsets.all(20.0),
                  margin: widget.margin,
                  decoration: BoxDecoration(
                    gradient: theme.useGradient
                        ? LinearGradient(
                      colors: [
                        widget.backgroundColor ?? Colors.white,
                        (widget.backgroundColor ?? Colors.white)
                            .withOpacity(0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                        : null,
                    color: theme.useGradient
                        ? null
                        : (widget.backgroundColor ?? Colors.white),
                    borderRadius:
                    widget.borderRadius ?? BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor,
                        blurRadius: theme.shadowBlurRadius,
                        offset: theme.shadowOffset,
                      ),
                    ],
                  ),
                  constraints: BoxConstraints(
                    minWidth: widget.spinnerSize * 4,
                    maxWidth: 200,
                    minHeight: widget.spinnerSize * 4,
                    maxHeight: 200,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildSpinner(),
                      if (widget.message.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        Text(
                          SLoadingIndicatorUtils
                              .formatMessage(widget.message),
                          textAlign: TextAlign.center,
                          style: messageStyle,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

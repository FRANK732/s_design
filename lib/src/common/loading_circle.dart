import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:s_design/src/common/enums/s_loading_types.dart';
import 'package:s_design/src/common/themes/s_loading_indicator_theme.dart';
import 'package:s_design/src/common/utils/loading_indicator_utils.dart';

/// A customizable and production-ready loading indicator widget.
///
/// Displays a centered, compact container with a loading spinner and an optional message.
/// Suitable for overlaying on existing content without covering the entire screen.
class SLoadingIndicator extends StatefulWidget {
  /// The message to display below the loading spinner.
  final String message;

  /// The color of the loading spinner.
  final Color? color;

  /// The color of the loading message text.
  final Color? messageColor;

  /// The size of the loading spinner.
  final double size;

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

  const SLoadingIndicator({
    Key? key,
    this.message = "Loading...",
    this.color,
    this.size = 25.0,
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
  }) : super(key: key);

  @override
  _SLoadingIndicatorState createState() => _SLoadingIndicatorState();
}

class _SLoadingIndicatorState extends State<SLoadingIndicator>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _visible = true;
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Selects the appropriate spinner widget based on [loaderType].
  Widget _buildSpinner() {
    switch (widget.loaderType) {
      case SLoaderType.chasingDots:
        return SpinKitChasingDots(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.doubleBounce:
        return SpinKitDoubleBounce(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.wave:
        return SpinKitWave(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.threeBounce:
        return SpinKitThreeBounce(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.circle:
        return SpinKitCircle(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.cubeGrid:
        return SpinKitCubeGrid(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.rotatingCircle:
        return SpinKitRotatingCircle(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.rotatingPlain:
        return SpinKitRotatingPlain(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.foldingCube:
        return SpinKitFoldingCube(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
      case SLoaderType.fadingCircle:
      default:
        return SpinKitFadingCircle(
          color: widget.color ?? Colors.teal,
          size: widget.size,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).sLoadingIndicatorTheme;

    final spinnerColor = widget.color ?? theme.spinnerColor;
    final spinnerSize = widget.size;
    final messageStyle = widget.messageStyle ??
        theme.messageStyle.copyWith(color: widget.messageColor);

    return FadeTransition(
      opacity: _animation,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            if (widget.showBackground)
              // Semi-transparent overlay
              GestureDetector(
                onTap: widget.barrierDismissible
                    ? () {
                        Navigator.of(context).pop();
                      }
                    : null,
                child: Container(
                  color: widget.backgroundColor
                          ?.withOpacity(widget.backgroundOpacity) ??
                      Colors.black.withOpacity(widget.backgroundOpacity),
                ),
              ),
            Center(
              child: Semantics(
                label: widget.semanticLabel ?? 'Loading',
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor ?? Colors.white,
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    maxWidth: 150,
                    minHeight: 100,
                    maxHeight: 150,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildSpinner(),
                      if (widget.message.isNotEmpty) ...[
                        const SizedBox(height: 15),
                        Text(
                          SLoadingIndicatorUtils.formatMessage(widget.message),
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

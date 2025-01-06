import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_toast/enums/s_toast_options.dart';
import 'package:s_design/src/widgets/s_toast/themes/s_toaster_theme.dart';
import 'package:s_design/src/widgets/s_toast/themes/s_toaster_theme_extension.dart';
import 'package:s_design/src/widgets/s_toast/utils/s_toaster_utils.dart';

/// The main [SToastWidget] that displays the toast message.
class SToastWidget extends StatefulWidget {
  /// The options that define the toast's appearance and behavior.
  final SToastOptions options;

  /// Callback when the toast is dismissed.
  final VoidCallback onDismiss;

  /// Creates an [SToastWidget].
  const SToastWidget({
    Key? key,
    required this.options,
    required this.onDismiss,
  }) : super(key: key);

  @override
  _SToastWidgetState createState() => _SToastWidgetState();
}

class _SToastWidgetState extends State<SToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late IconData _iconData;

  @override
  void initState() {
    super.initState();

    // Configure icon based on the toast type.
    _iconData = SToasterUtils.getIconData(widget.options.type);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: SToasterUtils.getOffsetBegin(widget.options.position),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();

    // Dismiss the toast after the specified duration.
    Future.delayed(widget.options.duration, () {
      _animationController.reverse().then((value) {
        widget.onDismiss();
      });
    });
  }

  Alignment _getAlignment() {
    return SToasterUtils.getAlignment(widget.options.position);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SToasterThemeData theme = Theme.of(context).sToasterTheme;
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;

    return Align(
      alignment: _getAlignment(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
        child: SlideTransition(
          position: _offsetAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: theme.padding,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: theme.borderRadius,
                border: Border.all(
                  color: isDarkMode ? Colors.white70 : Colors.black12,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _iconData,
                    color: theme.iconColor,
                  ),
                  const SizedBox(width: 8.0),
                  Flexible(
                    child: Text(
                      widget.options.message,
                      style: theme.messageTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

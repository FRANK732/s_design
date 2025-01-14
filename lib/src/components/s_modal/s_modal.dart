// lib/src/widgets/s_modal/s_modal.dart

import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_modal/enums/modal_animation_type.dart';
import 'package:s_design/src/widgets/s_modal/enums/s_modal_size.dart';
import 'package:s_design/src/widgets/s_modal/enums/s_modal_type.dart';
import 'package:s_design/src/widgets/s_modal/themes/s_modal_theme.dart';
import 'package:s_design/src/widgets/s_modal/utils/s_modal_utils.dart';

/// A comprehensive, generic modal widget that can be customized for different scenarios.
/// It supports custom icons, titles, messages, actions, animations, and theming.
class SModal extends StatefulWidget {
  /// The title text of the modal.
  final String title;

  /// The message content of the modal.
  final String message;

  /// The icon to display at the top of the modal. Defaults to a generic info icon.
  final Icon? icon;

  /// The color of the icon. Defaults to primary color if not specified.
  final Color? iconColor;

  /// A list of action widgets (e.g., buttons) to display at the bottom of the modal.
  final List<Widget>? actions;

  /// Determines whether tapping outside the modal dismisses it.
  final bool barrierDismissible;

  /// The color of the modal barrier (background overlay).
  final Color barrierColor;

  /// The semantic label for the modal barrier (required if barrierDismissible is true).
  final String? barrierLabel;

  /// The duration of the modal's entrance and exit animations.
  final Duration transitionDuration;

  /// The shape of the modal's container.
  final ShapeBorder? shape;

  /// The background color of the modal.
  final Color? backgroundColor;

  /// The padding inside the modal's container.
  final EdgeInsetsGeometry? contentPadding;

  /// The animation type for the modal.
  final SModalAnimationType animationType;

  /// The size of the modal.
  final SModalSize size;

  /// Creates an [SModal].
  const SModal({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.iconColor,
    this.actions,
    this.barrierDismissible = true,
    this.barrierColor = Colors.black54,
    this.barrierLabel,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.shape,
    this.backgroundColor,
    this.contentPadding,
    this.animationType = SModalAnimationType.fade,
    this.size = SModalSize.medium,
  });

  /// Method to show the modal.
  static Future<void> _show(
      BuildContext context, {
        required String title,
        required String message,
        Icon? icon,
        Color? iconColor,
        List<Widget>? actions,
        bool barrierDismissible = true,
        Color barrierColor = Colors.black54,
        String? barrierLabel,
        Duration transitionDuration = const Duration(milliseconds: 300),
        ShapeBorder? shape,
        Color? backgroundColor,
        EdgeInsetsGeometry? contentPadding,
        SModalAnimationType animationType = SModalAnimationType.fade,
        SModalSize size = SModalSize.medium,
      }) {
    // Compute the effective barrierLabel
    final String? effectiveBarrierLabel =
    barrierDismissible ? (barrierLabel ?? 'Dismiss dialog') : null;

    // Update the assertion to check the effective barrierLabel
    assert(
    !barrierDismissible || effectiveBarrierLabel != null,
    '!barrierDismissible || effectiveBarrierLabel != null',
    );

    return showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: effectiveBarrierLabel,
      transitionDuration: transitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (context) {
            return SModal(
              title: title,
              message: message,
              icon: icon,
              iconColor: iconColor,
              actions: actions,
              barrierDismissible: barrierDismissible,
              barrierColor: barrierColor,
              barrierLabel: barrierLabel,
              transitionDuration: transitionDuration,
              shape: shape,
              backgroundColor: backgroundColor,
              contentPadding: contentPadding,
              animationType: animationType,
              size: size,
            );
          }),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Utilize SModalUtils to get the appropriate transition
        return SModalUtils.getTransition(
          animationType,
          child,
          animation,
        );
      },
    );
  }


  // ### Specialized Static Methods ###

  /// Displays a Success modal with predefined settings.
  static Future<void> showSuccess(
      BuildContext context, {
        required String message,
        String title = 'Success',
        List<Widget>? actions,
        bool barrierDismissible = true,
        Color barrierColor = Colors.black54,
        String? barrierLabel,
        Duration transitionDuration = const Duration(milliseconds: 300),
        ShapeBorder? shape,
        Color? backgroundColor,
        EdgeInsetsGeometry? contentPadding,
        SModalAnimationType animationType = SModalAnimationType.fade,
        SModalSize size = SModalSize.medium,
      }) {
    return _show(
      context,
      title: title,
      message: message,
      icon: const Icon(Icons.check_circle_outline) ,
      iconColor: Colors.green,
      actions: actions,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      shape: shape,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      animationType: animationType,
      size: size,
    );
  }

  /// Displays an Error modal with predefined settings.
  static Future<void> showError(
      BuildContext context, {
        required String message,
        String title = 'Error',
        List<Widget>? actions,
        bool barrierDismissible = true,
        Color barrierColor = Colors.black54,
        String? barrierLabel,
        Duration transitionDuration = const Duration(milliseconds: 300),
        ShapeBorder? shape,
        Color? backgroundColor,
        EdgeInsetsGeometry? contentPadding,
        SModalAnimationType animationType = SModalAnimationType.fade,
        SModalSize size = SModalSize.medium,
      }) {
    return _show(
      context,
      title: title,
      message: message,
      icon: const Icon(Icons.error_outline,color: Colors.red,),
      actions: actions,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      shape: shape,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      animationType: animationType,
      size: size,
    );
  }

  /// Displays an Info modal with predefined settings.
  static Future<void> showInfo(
      BuildContext context, {
        required String message,
        String title = 'Information',
        List<Widget>? actions,
        bool barrierDismissible = true,
        Color barrierColor = Colors.black54,
        String? barrierLabel,
        Duration transitionDuration = const Duration(milliseconds: 300),
        ShapeBorder? shape,
        Color? backgroundColor,
        Icon? icon,
        EdgeInsetsGeometry? contentPadding,
        SModalAnimationType animationType = SModalAnimationType.fade,
        SModalSize size = SModalSize.medium,
      }) {
    return _show(
      context,
      title: title,
      message: message,
      icon: icon ?? const Icon(Icons.info_outline, color:Colors.blue),
      actions: actions,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      shape: shape,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      animationType: animationType,
      size: size,
    );
  }

  /// Displays a Warning modal with predefined settings.
  static Future<void> showWarning(
      BuildContext context, {
        required String message,
        String title = 'Warning',
        List<Widget>? actions,
        bool barrierDismissible = true,
        Color barrierColor = Colors.black54,
        String? barrierLabel,
        Duration transitionDuration = const Duration(milliseconds: 300),
        ShapeBorder? shape,
        Color? backgroundColor,
        EdgeInsetsGeometry? contentPadding,
        SModalAnimationType animationType = SModalAnimationType.fade,
        SModalSize size = SModalSize.medium,
        Icon? icon
      }) {
    return _show(
      context,
      title: title,
      message: message,
      icon: icon ?? const Icon(Icons.warning_amber_outlined, color:Colors.orange),
      actions: actions,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      shape: shape,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      animationType: animationType,
      size: size,
    );
  }

  /// Displays a Custom modal where you can specify the modal type.
  static Future<void> showCustom(
      BuildContext context, {
        required SModalType type,
        required String title,
        required String message,
        List<Widget>? actions,
        bool barrierDismissible = true,
        Color barrierColor = Colors.black54,
        String? barrierLabel,
        Duration transitionDuration = const Duration(milliseconds: 300),
        ShapeBorder? shape,
        Color? backgroundColor,
        EdgeInsetsGeometry? contentPadding,
        SModalAnimationType animationType = SModalAnimationType.fade,
        SModalSize size = SModalSize.medium,
        IconData? customIcon,
        Color? customIconColor,
      }) {
    IconData? icon;
    Color? iconColor;

    switch (type) {
      case SModalType.success:
        icon = Icons.check_circle_outline;
        iconColor = Colors.green;
        break;
      case SModalType.error:
        icon = Icons.error_outline;
        iconColor = Colors.red;
        break;
      case SModalType.info:
        icon = Icons.info_outline;
        iconColor = Colors.blue;
        break;
      case SModalType.warning:
        icon = Icons.warning_amber_outlined;
        iconColor = Colors.orange;
        break;
      case SModalType.custom:
        icon = customIcon;
        iconColor = customIconColor;
        break;
    }

    return _show(
      context,
      title: title,
      message: message,
      icon: Icon(icon, color: iconColor),
     actions: actions,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionDuration: transitionDuration,
      shape: shape,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      animationType: animationType,
      size: size,
    );
  }

  @override
  State<SModal> createState() => _SModalState();
}

class _SModalState extends State<SModal> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for scaling effect.
    _animationController = AnimationController(
      vsync: this,
      duration: widget.transitionDuration,
    );

    // Define the scale animation.
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    // Start the animation.
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the current theme data.
    final SModalThemeData theme = Theme.of(context).sModalTheme;

    // Responsive constraints based on modal size.
    double modalWidth;
    double modalHeight;


    switch (widget.size) {
      case SModalSize.small:
        modalWidth = MediaQuery.of(context).size.width * 0.6;
        modalHeight = MediaQuery.of(context).size.height * 0.3;
        break;
      case SModalSize.medium:
        modalWidth = MediaQuery.of(context).size.width * 0.8;
        modalHeight = MediaQuery.of(context).size.height * 0.4;
        break;
      case SModalSize.large:
        modalWidth = MediaQuery.of(context).size.width * 0.9;
        modalHeight = MediaQuery.of(context).size.height * 0.6;
        break;
      case SModalSize.fullScreen:
        modalWidth = MediaQuery.of(context).size.width;
        modalHeight = MediaQuery.of(context).size.height;
        break;
      default:
        modalWidth = MediaQuery.of(context).size.width * 0.8;
        modalHeight = MediaQuery.of(context).size.height * 0.4;


    }

    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:  modalWidth,
              maxHeight: modalHeight,
            ),
            child: Dialog(
              shape: widget.shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
              elevation: 16.0,
              backgroundColor: widget.backgroundColor ?? theme.backgroundColor,
              child: Container(
                padding: widget.contentPadding ?? theme.padding,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      // Optional Icon
                      if (widget.icon != null) widget.icon!,
                      if (widget.icon != null) const SizedBox(height: 20),
                      // Title Text
                      Text(
                        widget.title,
                        style: theme.titleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      // Message Text
                      Text(
                        widget.message,
                        style: theme.messageTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      // Action Buttons
                      if (widget.actions != null && widget.actions!.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: widget.actions!,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

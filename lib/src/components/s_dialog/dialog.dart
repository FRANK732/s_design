import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'package:s_design/src/theme/s_spacers.dart';
import 'package:s_design/src/theme/theme_extension.dart';

class SDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget? content;
  final List<Widget>? actions;
  final bool barrierDismissible;
  final Color barrierColor;
  final Duration transitionDuration;
  final ShapeDecoration? shapeDecoration;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? semanticLabel;
  final bool showCloseButton;
  final double maxWidth;
  final double maxHeight;
  final Curve animationCurve;
  final Duration animationDuration;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final BorderRadius? borderRadius;
  final SDialogAnimationType animationType;

  const SDialog({
    this.title,
    this.description,
    this.content,
    this.actions,
    this.barrierDismissible = true,
    this.barrierColor = Colors.black54,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.shapeDecoration,
    this.backgroundColor,
    this.contentPadding,
    this.semanticLabel,
    this.showCloseButton = true,
    this.maxWidth = 250,
    this.maxHeight = 350,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 300),
    this.titleStyle,
    this.descriptionStyle,
    this.borderRadius,
    this.animationType = SDialogAnimationType.zoomIn,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      child: AnimatedBuilder(
        animation: ModalRoute.of(context)!.animation!,
        builder: (context, child) {
          final animation = CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: animationCurve,
            reverseCurve: Curves.easeInOut,
          );

          return _buildAnimatedDialog(animation, context);
        },
      ),
    );
  }

  Widget _buildAnimatedDialog(
      Animation<double> animation, BuildContext context) {
    switch (animationType) {
      case SDialogAnimationType.zoomIn:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
          child: _buildDialogContent(context),
        );
      case SDialogAnimationType.slideFromLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: _buildDialogContent(context),
        );
      case SDialogAnimationType.slideFromRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: _buildDialogContent(context),
        );
      case SDialogAnimationType.slideFromTop:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation),
          child: _buildDialogContent(context),
        );
      case SDialogAnimationType.slideFromBottom:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: _buildDialogContent(context),
        );
      default:
        return _buildDialogContent(context);
    }
  }

  Widget _buildDialogContent(BuildContext context) {
    final ShapeDecoration defaultDecoration = ShapeDecoration(
      color: backgroundColor ?? Theme.of(context).dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? Spacers.radiusMedium,
      ),
      shadows: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          offset: Offset(0, 10),
        ),
      ],
    );

    final ShapeDecoration effectiveDecoration =
        shapeDecoration ?? defaultDecoration;

    return Material(
      color: Colors.transparent,
      child: FocusScope(
        child: Semantics(
          label: semanticLabel ?? title,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Container(
              padding: contentPadding ?? const EdgeInsets.all(20.0),
              decoration: effectiveDecoration,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title!,
                              style: titleStyle ??
                                  Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          if (showCloseButton)
                            IconButton(
                              icon: const Icon(Icons.close, size: 24),
                              onPressed: () => Navigator.pop(context),
                            ),
                        ],
                      ),
                    if (description != null && description!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        description!,
                        style: descriptionStyle ??
                            Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.left,
                      ),
                    ],
                    if (content != null) ...[
                      const SizedBox(height: 16),
                      content!,
                    ],
                    if (actions != null && actions!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: actions!,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'package:s_design/src/theme/s_spacers.dart';

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
  final bool showDivider;
  final Color? dividerColor;
  final double dividerThickness;
  final EdgeInsetsGeometry? actionsPadding;
  final MainAxisAlignment actionsAlignment;
  final CrossAxisAlignment contentCrossAlignment;
  final MainAxisAlignment contentMainAlignment;
  final bool scrollable;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final double elevation;
  final bool useSafeArea;
  final bool showTitleDivider;
  final Color? titleDividerColor;
  final double titleDividerThickness;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? descriptionPadding;
  final bool showDescriptionDivider;
  final Color? descriptionDividerColor;
  final double descriptionDividerThickness;
  final bool hasActions;

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
    this.showDivider = false,
    this.dividerColor,
    this.dividerThickness = 1.0,
    this.actionsPadding,
    this.actionsAlignment = MainAxisAlignment.end,
    this.contentCrossAlignment = CrossAxisAlignment.start,
    this.contentMainAlignment = MainAxisAlignment.start,
    this.scrollable = false,
    this.scrollController,
    this.scrollPhysics,
    this.elevation = 0,
    this.useSafeArea = false,
    this.showTitleDivider = false,
    this.titleDividerColor,
    this.titleDividerThickness = 1.0,
    this.titlePadding,
    this.descriptionPadding,
    this.showDescriptionDivider = false,
    this.descriptionDividerColor,
    this.descriptionDividerThickness = 1.0,
    this.hasActions = false,
    Key? key,
  }) : super(key: key);

  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    String? description,
    Widget? content,
    List<Widget>? actions,
    bool barrierDismissible = true,
    Color barrierColor = Colors.black54,
    Duration transitionDuration = const Duration(milliseconds: 300),
    ShapeDecoration? shapeDecoration,
    Color? backgroundColor,
    EdgeInsetsGeometry? contentPadding,
    String? semanticLabel,
    bool showCloseButton = true,
    double maxWidth = 250,
    double maxHeight = 350,
    Curve animationCurve = Curves.easeInOut,
    Duration animationDuration = const Duration(milliseconds: 300),
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    BorderRadius? borderRadius,
    SDialogAnimationType animationType = SDialogAnimationType.zoomIn,
    bool showDivider = false,
    Color? dividerColor,
    double dividerThickness = 1.0,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.end,
    CrossAxisAlignment contentCrossAlignment = CrossAxisAlignment.start,
    MainAxisAlignment contentMainAlignment = MainAxisAlignment.start,
    bool scrollable = false,
    ScrollController? scrollController,
    ScrollPhysics? scrollPhysics,
    double elevation = 0,
    bool useSafeArea = false,
    bool showTitleDivider = false,
    Color? titleDividerColor,
    double titleDividerThickness = 1.0,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? descriptionPadding,
    bool showDescriptionDivider = false,
    Color? descriptionDividerColor,
    double descriptionDividerThickness = 1.0,
    bool hasActions = false,
  }) async {
    assert(
      !hasActions || actions != null,
      'If `hasActions` is true, `actions` must be provided.',
    );
    assert(
      !hasActions || T == bool,
      'If `hasActions` is true, the return type must be `Future<bool?>`.',
    );
    assert(
      maxWidth > 0,
      '`maxWidth` must be greater than 0.',
    );
    assert(
      maxHeight > 0,
      '`maxHeight` must be greater than 0.',
    );
    assert(
      transitionDuration >= Duration.zero,
      '`transitionDuration` must be a non-negative duration.',
    );
    assert(
      animationDuration >= Duration.zero,
      '`animationDuration` must be a non-negative duration.',
    );

    if (hasActions) {
      return await showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        builder: (context) {
          return SDialog(
            title: title,
            description: description,
            content: content,
            actions: actions,
            barrierDismissible: barrierDismissible,
            barrierColor: barrierColor,
            transitionDuration: transitionDuration,
            shapeDecoration: shapeDecoration,
            backgroundColor: backgroundColor,
            contentPadding: contentPadding,
            semanticLabel: semanticLabel,
            showCloseButton: showCloseButton,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            animationCurve: animationCurve,
            animationDuration: animationDuration,
            titleStyle: titleStyle,
            descriptionStyle: descriptionStyle,
            borderRadius: borderRadius,
            animationType: animationType,
            showDivider: showDivider,
            dividerColor: dividerColor,
            dividerThickness: dividerThickness,
            actionsPadding: actionsPadding,
            actionsAlignment: actionsAlignment,
            contentCrossAlignment: contentCrossAlignment,
            contentMainAlignment: contentMainAlignment,
            scrollable: scrollable,
            scrollController: scrollController,
            scrollPhysics: scrollPhysics,
            elevation: elevation,
            useSafeArea: useSafeArea,
            showTitleDivider: showTitleDivider,
            titleDividerColor: titleDividerColor,
            titleDividerThickness: titleDividerThickness,
            titlePadding: titlePadding,
            descriptionPadding: descriptionPadding,
            showDescriptionDivider: showDescriptionDivider,
            descriptionDividerColor: descriptionDividerColor,
            descriptionDividerThickness: descriptionDividerThickness,
            hasActions: hasActions,
          );
        },
      );
    } else {
      await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        builder: (context) {
          return SDialog(
            title: title,
            description: description,
            content: content,
            actions: actions,
            barrierDismissible: barrierDismissible,
            barrierColor: barrierColor,
            transitionDuration: transitionDuration,
            shapeDecoration: shapeDecoration,
            backgroundColor: backgroundColor,
            contentPadding: contentPadding,
            semanticLabel: semanticLabel,
            showCloseButton: showCloseButton,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            animationCurve: animationCurve,
            animationDuration: animationDuration,
            titleStyle: titleStyle,
            descriptionStyle: descriptionStyle,
            borderRadius: borderRadius,
            animationType: animationType,
            showDivider: showDivider,
            dividerColor: dividerColor,
            dividerThickness: dividerThickness,
            actionsPadding: actionsPadding,
            actionsAlignment: actionsAlignment,
            contentCrossAlignment: contentCrossAlignment,
            contentMainAlignment: contentMainAlignment,
            scrollable: scrollable,
            scrollController: scrollController,
            scrollPhysics: scrollPhysics,
            elevation: elevation,
            useSafeArea: useSafeArea,
            showTitleDivider: showTitleDivider,
            titleDividerColor: titleDividerColor,
            titleDividerThickness: titleDividerThickness,
            titlePadding: titlePadding,
            descriptionPadding: descriptionPadding,
            showDescriptionDivider: showDescriptionDivider,
            descriptionDividerColor: descriptionDividerColor,
            descriptionDividerThickness: descriptionDividerThickness,
            hasActions: hasActions,
          );
        },
      );
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor ?? Colors.tealAccent,
      insetPadding: EdgeInsets.zero,
      elevation: elevation,
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
                controller: scrollController,
                physics: scrollPhysics,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: contentCrossAlignment,
                  mainAxisAlignment: contentMainAlignment,
                  children: [
                    if (title != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: titlePadding ?? EdgeInsets.zero,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    title!,
                                    style: titleStyle ??
                                        Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                  ),
                                ),
                                if (showCloseButton)
                                  IconButton(
                                    icon: const Icon(Icons.close, size: 24),
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                  ),
                              ],
                            ),
                          ),
                          if (showTitleDivider)
                            Divider(
                              color: titleDividerColor ??
                                  Theme.of(context).dividerColor,
                              thickness: titleDividerThickness,
                            ),
                        ],
                      ),
                    if (description != null && description!.isNotEmpty) ...[
                      Padding(
                        padding:
                            descriptionPadding ?? const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              description!,
                              style: descriptionStyle ??
                                  Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            if (showDescriptionDivider)
                              Divider(
                                color: descriptionDividerColor ??
                                    Theme.of(context).dividerColor,
                                thickness: descriptionDividerThickness,
                              ),
                          ],
                        ),
                      ),
                    ],
                    if (content != null) ...[
                      const SizedBox(height: 16),
                      content!,
                    ],
                    if (showDivider)
                      Divider(
                        color: dividerColor ?? Theme.of(context).dividerColor,
                        thickness: dividerThickness,
                      ),
                    if (actions != null && actions!.isNotEmpty)
                      Padding(
                        padding:
                            actionsPadding ?? const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: actionsAlignment,
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

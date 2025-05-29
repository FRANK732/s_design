import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../../../s_design.dart';
import '../../theme/s_spacers.dart';

// A customizable dialog widget with support for title, description, content, actions, animations, and accessibility.
class SDialog extends StatelessWidget {
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
    super.key,
  });

  /// The title text displayed at the top of the dialog.
  final String? title;

  /// The description text displayed below the title.
  final String? description;

  /// Custom content widget displayed in the dialog body.
  final Widget? content;

  /// List of action widgets (e.g., buttons) displayed at the bottom.
  final List<Widget>? actions;

  /// Whether the dialog can be dismissed by tapping outside. Defaults to true.
  final bool barrierDismissible;

  /// Color of the barrier behind the dialog. Defaults to black54.
  final Color barrierColor;

  /// Duration of the dialog's entry/exit transition. Defaults to 300ms.
  final Duration transitionDuration;

  /// Custom shape decoration for the dialog (e.g., border, shadow).
  final ShapeDecoration? shapeDecoration;

  /// Background color of the dialog. Defaults to theme's dialogBackgroundColor.
  final Color? backgroundColor;

  /// Padding around the dialog's content. Defaults to 20.0 on all sides.
  final EdgeInsetsGeometry? contentPadding;

  /// Semantic label for accessibility, typically the title.
  final String? semanticLabel;

  /// Whether to show a close button in the title area. Defaults to true.
  final bool showCloseButton;

  /// Maximum width of the dialog. Defaults to 250.
  final double maxWidth;

  /// Maximum height of the dialog. Defaults to 350.
  final double maxHeight;

  /// Animation curve for dialog entry/exit. Defaults to Curves.easeInOut.
  final Curve animationCurve;

  /// Duration of the dialog's animation. Defaults to 300ms.
  final Duration animationDuration;

  /// Custom text style for the title.
  final TextStyle? titleStyle;

  /// Custom text style for the description.
  final TextStyle? descriptionStyle;

  /// Border radius for the dialog's corners. Defaults to medium radius from theme.
  final BorderRadius? borderRadius;

  /// Animation type for dialog entry (e.g., zoomIn, slide). Defaults to zoomIn.
  final SDialogAnimationType animationType;

  /// Whether to show a divider between content and actions. Defaults to false.
  final bool showDivider;

  /// Color of the divider between content and actions. Defaults to theme's dividerColor.
  final Color? dividerColor;

  /// Thickness of the divider between content and actions. Defaults to 1.0.
  final double dividerThickness;

  /// Padding around the actions area. Defaults to 20.0 top padding.
  final EdgeInsetsGeometry? actionsPadding;

  /// Alignment of action widgets. Defaults to MainAxisAlignment.end.
  final MainAxisAlignment actionsAlignment;

  /// Cross-axis alignment of content. Defaults to CrossAxisAlignment.start.
  final CrossAxisAlignment contentCrossAlignment;

  /// Main-axis alignment of content. Defaults to MainAxisAlignment.start.
  final MainAxisAlignment contentMainAlignment;

  /// Whether the dialog content is scrollable. Defaults to false.
  final bool scrollable;

  /// Controller for scrolling behavior if scrollable.
  final ScrollController? scrollController;

  /// Scroll physics for the dialog content if scrollable.
  final ScrollPhysics? scrollPhysics;

  /// Elevation of the dialog for shadow effect. Defaults to 0.
  final double elevation;

  /// Whether to respect safe area insets. Defaults to false.
  final bool useSafeArea;

  /// Whether to show a divider below the title. Defaults to false.
  final bool showTitleDivider;

  /// Color of the title divider. Defaults to theme's dividerColor.
  final Color? titleDividerColor;

  /// Thickness of the title divider. Defaults to 1.0.
  final double titleDividerThickness;

  /// Padding around the title. Defaults to zero.
  final EdgeInsetsGeometry? titlePadding;

  /// Padding around the description. Defaults to 8.0 top padding.
  final EdgeInsetsGeometry? descriptionPadding;

  /// Whether to show a divider below the description. Defaults to false.
  final bool showDescriptionDivider;

  /// Color of the description divider. Defaults to theme's dividerColor.
  final Color? descriptionDividerColor;

  /// Thickness of the description divider. Defaults to 1.0.
  final double descriptionDividerThickness;

  /// Whether the dialog expects action results (returns bool). Defaults to false.
  final bool hasActions;

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

    developer.log(
      'SDialog: Showing dialog with title: $title, hasActions: $hasActions',
      name: 'SDialog',
    );

    if (hasActions) {
      return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        builder: (BuildContext context) {
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
        builder: (BuildContext context) {
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
      developer.log('SDialog: Dialog closed without actions', name: 'SDialog');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    developer.log(
      'SDialog: Building dialog with animationType: $animationType, maxWidth: $maxWidth, maxHeight: $maxHeight',
      name: 'SDialog',
    );
    return Dialog(
      backgroundColor: backgroundColor ?? Colors.tealAccent,
      insetPadding: EdgeInsets.zero,
      elevation: elevation,
      child: AnimatedBuilder(
        animation: ModalRoute.of(context)!.animation!,
        builder: (BuildContext context, Widget? child) {
          final CurvedAnimation animation = CurvedAnimation(
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
    Animation<double> animation,
    BuildContext context,
  ) {
    developer.log(
      'SDialog: Applying animation: $animationType',
      name: 'SDialog',
    );
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
    developer.log(
      'SDialog: Building content with title: $title, hasDescription: ${description != null}, hasContent: ${content != null}, hasActions: ${actions != null}',
      name: 'SDialog',
    );

    final ShapeDecoration defaultDecoration = ShapeDecoration(
      color: backgroundColor ?? Theme.of(context).dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? Spacers.radiusMedium,
      ),
      shadows: const <BoxShadow>[
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
                  children: <Widget>[
                    if (title != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: titlePadding ?? EdgeInsets.zero,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
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
                                    onPressed: () {
                                      developer.log(
                                        'SDialog: Closed via close button',
                                        name: 'SDialog',
                                      );
                                      Navigator.pop(context, false);
                                    },
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
                    if (description != null && description!.isNotEmpty) ...<Widget>[
                      Padding(
                        padding:
                            descriptionPadding ?? const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                    if (content != null) ...<Widget>[
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

import 'dart:developer'
    as developer;

import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

import 's_dialog_config.dart';

// A customizable dialog widget with support for title, description, content, actions, animations, and accessibility.
class SDialog
    extends StatelessWidget {
  const SDialog({
    this.title,
    this.description,
    this.content,
    this.actions,
    this.barrierDismissible =
        true,
    this.barrierColor,
    this.transitionDuration,
    this.shapeDecoration,
    this.backgroundColor,
    this.contentPadding,
    this.semanticLabel,
    this.showCloseButton,
    this.maxWidth,
    this.maxHeight,
    this.animationCurve =
        Curves.easeInOut,
    this.animationDuration,
    this.titleStyle,
    this.descriptionStyle,
    this.borderRadius,
    this.animationType =
        SDialogAnimationType.zoomIn,
    this.showDivider,
    this.dividerColor,
    this.dividerThickness,
    this.actionsPadding,
    this.actionsAlignment =
        MainAxisAlignment.end,
    this.contentCrossAlignment =
        CrossAxisAlignment.start,
    this.contentMainAlignment =
        MainAxisAlignment.start,
    this.scrollable =
        false,
    this.scrollController,
    this.scrollPhysics,
    this.elevation,
    this.useSafeArea =
        false,
    this.showTitleDivider,
    this.titleDividerColor,
    this.titleDividerThickness,
    this.titlePadding,
    this.descriptionPadding,
    this.showDescriptionDivider,
    this.descriptionDividerColor,
    this.descriptionDividerThickness,
    this.hasActions =
        false,
    this.insetPadding,
    this.alignment,
    this.shadowColor,
    this.surfaceTintColor,
    this.clipBehavior,
    super.key,
  });

  /// Creates an SDialog from an SDialogConfig object.
  factory SDialog.fromConfig(
      SDialogConfig
          config,
      {Key?
          key}) {
    return SDialog(
      key:
          key,
      title:
          config.title,
      description:
          config.description,
      content:
          config.content,
      actions:
          config.actions,
      barrierDismissible:
          config.barrierDismissible,
      barrierColor:
          config.barrierColor,
      transitionDuration:
          config.transitionDuration,
      shapeDecoration:
          config.shapeDecoration,
      backgroundColor:
          config.backgroundColor,
      contentPadding:
          config.contentPadding,
      semanticLabel:
          config.semanticLabel,
      showCloseButton:
          config.showCloseButton,
      maxWidth:
          config.maxWidth,
      maxHeight:
          config.maxHeight,
      animationCurve:
          config.animationCurve,
      animationDuration:
          config.animationDuration,
      titleStyle:
          config.titleStyle,
      descriptionStyle:
          config.descriptionStyle,
      borderRadius:
          config.borderRadius,
      animationType:
          config.animationType,
      showDivider:
          config.showDivider,
      dividerColor:
          config.dividerColor,
      dividerThickness:
          config.dividerThickness,
      actionsPadding:
          config.actionsPadding,
      actionsAlignment:
          config.actionsAlignment ?? MainAxisAlignment.end,
      contentCrossAlignment:
          config.contentCrossAlignment,
      contentMainAlignment:
          config.contentMainAlignment,
      scrollable:
          config.scrollable,
      scrollController:
          config.scrollController,
      scrollPhysics:
          config.scrollPhysics,
      elevation:
          config.elevation,
      useSafeArea:
          config.useSafeArea,
      showTitleDivider:
          config.showTitleDivider,
      titleDividerColor:
          config.titleDividerColor,
      titleDividerThickness:
          config.titleDividerThickness,
      titlePadding:
          config.titlePadding,
      descriptionPadding:
          config.descriptionPadding,
      showDescriptionDivider:
          config.showDescriptionDivider,
      descriptionDividerColor:
          config.descriptionDividerColor,
      descriptionDividerThickness:
          config.descriptionDividerThickness,
      hasActions:
          config.hasActions,
      insetPadding:
          config.insetPadding,
      alignment:
          config.alignment,
      shadowColor:
          config.shadowColor,
      surfaceTintColor:
          config.surfaceTintColor,
      clipBehavior:
          config.clipBehavior,
    );
  }

  /// The title text displayed at the top of the dialog.
  final String?
      title;

  /// The description text displayed below the title.
  final String?
      description;

  /// Custom content widget displayed in the dialog body.
  final Widget?
      content;

  /// List of action widgets (e.g., buttons) displayed at the bottom.
  final List<Widget>?
      actions;

  /// Whether the dialog can be dismissed by tapping outside. Defaults to true.
  final bool
      barrierDismissible;

  /// Color of the barrier behind the dialog.
  final Color?
      barrierColor;

  /// Duration of the dialog's entry/exit transition.
  final Duration?
      transitionDuration;

  /// Custom shape decoration for the dialog (e.g., border, shadow).
  final ShapeDecoration?
      shapeDecoration;

  /// Background color of the dialog. Defaults to theme's dialogBackgroundColor.
  final Color?
      backgroundColor;

  /// Padding around the dialog's content.
  final EdgeInsetsGeometry?
      contentPadding;

  /// Semantic label for accessibility, typically the title.
  final String?
      semanticLabel;

  /// Whether to show a close button in the title area.
  final bool?
      showCloseButton;

  /// Maximum width of the dialog.
  final double?
      maxWidth;

  /// Maximum height of the dialog.
  final double?
      maxHeight;

  /// Animation curve for dialog entry/exit. Defaults to Curves.easeInOut.
  final Curve
      animationCurve;

  /// Duration of the dialog's animation.
  final Duration?
      animationDuration;

  /// Custom text style for the title.
  final TextStyle?
      titleStyle;

  /// Custom text style for the description.
  final TextStyle?
      descriptionStyle;

  /// Border radius for the dialog's corners. Defaults to medium radius from theme.
  final BorderRadius?
      borderRadius;

  /// Animation type for dialog entry (e.g., zoomIn, slide). Defaults to zoomIn.
  final SDialogAnimationType
      animationType;

  /// Whether to show a divider between content and actions.
  final bool?
      showDivider;

  /// Color of the divider between content and actions. Defaults to theme's dividerColor.
  final Color?
      dividerColor;

  /// Thickness of the divider between content and actions.
  final double?
      dividerThickness;

  /// Padding around the actions area.
  final EdgeInsetsGeometry?
      actionsPadding;

  /// Alignment of action widgets. Defaults to MainAxisAlignment.end.
  final MainAxisAlignment
      actionsAlignment;

  /// Cross-axis alignment of content. Defaults to CrossAxisAlignment.start.
  final CrossAxisAlignment
      contentCrossAlignment;

  /// Main-axis alignment of content. Defaults to MainAxisAlignment.start.
  final MainAxisAlignment
      contentMainAlignment;

  /// Whether the dialog content is scrollable. Defaults to false.
  final bool
      scrollable;

  /// Controller for scrolling behavior if scrollable.
  final ScrollController?
      scrollController;

  /// Scroll physics for the dialog content if scrollable.
  final ScrollPhysics?
      scrollPhysics;

  /// Elevation of the dialog for shadow effect.
  final double?
      elevation;

  /// Whether to respect safe area insets. Defaults to false.
  final bool
      useSafeArea;

  /// Whether to show a divider below the title.
  final bool?
      showTitleDivider;

  /// Color of the title divider. Defaults to theme's dividerColor.
  final Color?
      titleDividerColor;

  /// Thickness of the title divider.
  final double?
      titleDividerThickness;

  /// Padding around the title. Defaults to zero.
  final EdgeInsetsGeometry?
      titlePadding;

  /// Padding around the description.
  final EdgeInsetsGeometry?
      descriptionPadding;

  /// Whether to show a divider below the description.
  final bool?
      showDescriptionDivider;

  /// Color of the description divider. Defaults to theme's dividerColor.
  final Color?
      descriptionDividerColor;

  /// Thickness of the description divider.
  final double?
      descriptionDividerThickness;

  /// Whether the dialog expects action results (returns bool). Defaults to false.
  final bool
      hasActions;

  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside of the dialog.
  final EdgeInsets?
      insetPadding;

  /// The alignment of the dialog.
  final AlignmentGeometry?
      alignment;

  /// The color of the shadow.
  final Color?
      shadowColor;

  /// The surface tint color.
  final Color?
      surfaceTintColor;

  /// The clip behavior.
  final Clip?
      clipBehavior;

  static Future<T?>
      show<T>({
    required BuildContext
        context,
    SDialogConfig?
        config,
    String?
        title,
    String?
        description,
    Widget?
        content,
    List<Widget>?
        actions,
    bool barrierDismissible =
        true,
    Color?
        barrierColor,
    Duration?
        transitionDuration,
    ShapeDecoration?
        shapeDecoration,
    Color?
        backgroundColor,
    EdgeInsetsGeometry?
        contentPadding,
    String?
        semanticLabel,
    bool?
        showCloseButton,
    double?
        maxWidth,
    double?
        maxHeight,
    Curve animationCurve =
        Curves.easeInOut,
    Duration?
        animationDuration,
    TextStyle?
        titleStyle,
    TextStyle?
        descriptionStyle,
    BorderRadius?
        borderRadius,
    SDialogAnimationType animationType =
        SDialogAnimationType.zoomIn,
    bool?
        showDivider,
    Color?
        dividerColor,
    double?
        dividerThickness,
    EdgeInsetsGeometry?
        actionsPadding,
    MainAxisAlignment actionsAlignment =
        MainAxisAlignment.end,
    CrossAxisAlignment contentCrossAlignment =
        CrossAxisAlignment.start,
    MainAxisAlignment contentMainAlignment =
        MainAxisAlignment.start,
    bool scrollable =
        false,
    ScrollController?
        scrollController,
    ScrollPhysics?
        scrollPhysics,
    double?
        elevation,
    bool useSafeArea =
        false,
    bool?
        showTitleDivider,
    Color?
        titleDividerColor,
    double?
        titleDividerThickness,
    EdgeInsetsGeometry?
        titlePadding,
    EdgeInsetsGeometry?
        descriptionPadding,
    bool?
        showDescriptionDivider,
    Color?
        descriptionDividerColor,
    double?
        descriptionDividerThickness,
    bool hasActions =
        false,
    EdgeInsets?
        insetPadding,
    AlignmentGeometry?
        alignment,
    Color?
        shadowColor,
    Color?
        surfaceTintColor,
    Clip?
        clipBehavior,
  }) async {
    final SDialogConfig effectiveConfig = config ??
        SDialogConfig(
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
          insetPadding: insetPadding,
          alignment: alignment,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          clipBehavior: clipBehavior,
        );

    assert(
      !effectiveConfig.hasActions ||
          effectiveConfig.actions != null,
      'If `hasActions` is true, `actions` must be provided.',
    );
    assert(
      !effectiveConfig.hasActions ||
          T == bool,
      'If `hasActions` is true, the return type must be `Future<bool?>`.',
    );
    assert(
      (effectiveConfig.maxWidth ?? 250) >
          0,
      '`maxWidth` must be greater than 0.',
    );
    assert(
      (effectiveConfig.maxHeight ?? 350) >
          0,
      '`maxHeight` must be greater than 0.',
    );
    assert(
      (effectiveConfig.transitionDuration ?? Duration.zero) >=
          Duration.zero,
      '`transitionDuration` must be a non-negative duration.',
    );
    assert(
      (effectiveConfig.animationDuration ?? Duration.zero) >=
          Duration.zero,
      '`animationDuration` must be a non-negative duration.',
    );

    developer
        .log(
      'SDialog: Showing dialog with title: ${effectiveConfig.title}, hasActions: ${effectiveConfig.hasActions}',
      name:
          'SDialog',
    );

    if (effectiveConfig
        .hasActions) {
      return showDialog<T>(
        context: context,
        barrierDismissible: effectiveConfig.barrierDismissible,
        barrierColor: effectiveConfig.barrierColor,
        builder: (BuildContext context) {
          return SDialog.fromConfig(effectiveConfig);
        },
      );
    } else {
      await showDialog<T>(
        context: context,
        barrierDismissible: effectiveConfig.barrierDismissible,
        barrierColor: effectiveConfig.barrierColor,
        builder: (BuildContext context) {
          return SDialog.fromConfig(effectiveConfig);
        },
      );
      developer.log('SDialog: Dialog closed without actions',
          name: 'SDialog');
      return null;
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    developer
        .log(
      'SDialog: Building dialog with animationType: $animationType, maxWidth: $maxWidth, maxHeight: $maxHeight',
      name:
          'SDialog',
    );
    return Dialog(
      backgroundColor:
          backgroundColor ?? Colors.tealAccent,
      insetPadding:
          EdgeInsets.zero,
      elevation: elevation ??
          Theme.of(context).sDialogTheme.elevation ??
          0,
      child:
          AnimatedBuilder(
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

  Widget
      _buildAnimatedDialog(
    Animation<double>
        animation,
    BuildContext
        context,
  ) {
    developer
        .log(
      'SDialog: Applying animation: $animationType',
      name:
          'SDialog',
    );
    switch (
        animationType) {
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
    }
  }

  Widget _buildDialogContent(
      BuildContext
          context) {
    developer
        .log(
      'SDialog: Building content with title: $title, hasDescription: ${description != null}, hasContent: ${content != null}, hasActions: ${actions != null}',
      name:
          'SDialog',
    );

    final SDialogThemeData
        dialogTheme =
        Theme.of(context).sDialogTheme;

    final ShapeDecoration
        defaultDecoration =
        ShapeDecoration(
      color:
          backgroundColor ?? dialogTheme.backgroundColor,
      shape: (shapeDecoration?.shape ?? dialogTheme.shape) ??
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? dialogTheme.borderRadius ?? Spacers.radiusMedium,
          ),
      shadows: <BoxShadow>[
        BoxShadow(
          color: shadowColor ?? dialogTheme.shadowColor ?? Colors.black.withOpacity(0.2),
          blurRadius: elevation ?? dialogTheme.elevation ?? 6.0,
          offset: const Offset(0, 10),
        ),
      ],
    );

    final ShapeDecoration
        effectiveDecoration =
        shapeDecoration ?? defaultDecoration;

    return Material(
      color:
          Colors.transparent,
      surfaceTintColor:
          surfaceTintColor ?? dialogTheme.surfaceTintColor,
      clipBehavior: clipBehavior ??
          dialogTheme.clipBehavior ??
          Clip.none,
      child:
          FocusScope(
        child: Semantics(
          label: semanticLabel ?? title,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth ?? 250,
              maxHeight: maxHeight ?? 350,
            ),
            child: Container(
              padding: contentPadding ?? dialogTheme.contentPadding ?? const EdgeInsets.all(24.0),
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
                                        dialogTheme.titleStyle?.copyWith(color: dialogTheme.titleColor) ??
                                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                                              color: dialogTheme.titleColor,
                                            ),
                                  ),
                                ),
                                if (showCloseButton ?? true)
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
                          if (showTitleDivider ?? false)
                            Divider(
                              color: titleDividerColor ?? dialogTheme.dividerColor ?? Theme.of(context).dividerColor,
                              thickness: titleDividerThickness ?? dialogTheme.dividerThickness ?? 1.0,
                            ),
                        ],
                      ),
                    if (description != null && description!.isNotEmpty) ...<Widget>[
                      Padding(
                        padding: descriptionPadding ?? const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              description!,
                              style: descriptionStyle ??
                                  dialogTheme.descriptionStyle?.copyWith(color: dialogTheme.descriptionColor) ??
                                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: dialogTheme.descriptionColor,
                                      ),
                              textAlign: TextAlign.left,
                            ),
                            if (showDescriptionDivider ?? false)
                              Divider(
                                color: descriptionDividerColor ?? dialogTheme.dividerColor ?? Theme.of(context).dividerColor,
                                thickness: descriptionDividerThickness ?? dialogTheme.dividerThickness ?? 1.0,
                              ),
                          ],
                        ),
                      ),
                    ],
                    if (content != null) ...<Widget>[
                      const SizedBox(height: 16),
                      content!,
                    ],
                    if (showDivider ?? dialogTheme.showDivider ?? false)
                      Divider(
                        color: dividerColor ?? dialogTheme.dividerColor ?? Theme.of(context).dividerColor,
                        thickness: dividerThickness ?? dialogTheme.dividerThickness ?? 1.0,
                      ),
                    if (actions != null && actions!.isNotEmpty)
                      Padding(
                        padding: actionsPadding ?? dialogTheme.actionsPadding ?? const EdgeInsets.only(top: 24.0),
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

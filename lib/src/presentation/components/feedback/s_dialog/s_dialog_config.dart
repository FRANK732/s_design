import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// Configuration for [SDialog].
///
/// Aggregates all display, animation, and interaction parameters for a dialog.
class SDialogConfig {
  const SDialogConfig({
    this.title,
    this.titleWidget,
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
        Curves.easeOutCubic,
    this.animationDuration,
    this.titleStyle,
    this.descriptionStyle,
    this.borderRadius,
    this.animationType =
        SDialogAnimationType.zoomIn,
    this.backgroundEffect =
        SDialogBackgroundEffect.none,
    this.showDivider,
    this.dividerColor,
    this.dividerThickness,
    this.actionsPadding,
    // ignore: deprecated_member_use_from_same_package
    @Deprecated(
        'Inferred from actions list. This field is ignored.')
    this.hasActions =
        false,
    this.insetPadding,
    this.alignment,
    this.shadowColor,
    this.surfaceTintColor,
    this.actionsAlignment,
    this.scrollController,
    this.scrollPhysics,
    this.elevation,
    this.showTitleDivider,
    this.titleDividerColor,
    this.titleDividerThickness,
    this.titlePadding,
    this.descriptionPadding,
    this.showDescriptionDivider,
    this.descriptionDividerColor,
    this.descriptionDividerThickness,
    this.contentCrossAlignment =
        CrossAxisAlignment.start,
    this.contentMainAlignment =
        MainAxisAlignment.start,
    this.scrollable =
        false,
    this.useSafeArea =
        false,
    this.clipBehavior,
    this.iconWidget,
    this.footerWidget,
    this.actionsWrap =
        false,
  });

  /// Text title shown at the top of the dialog.
  final String?
      title;

  /// Custom widget that replaces the text [title].
  final Widget?
      titleWidget;

  /// Subtitle / body text shown below the title.
  final String?
      description;

  /// Arbitrary body widget rendered below the description.
  final Widget?
      content;

  /// Optional icon widget rendered above the title.
  final Widget?
      iconWidget;

  /// Optional widget pinned below the actions row.
  final Widget?
      footerWidget;

  /// Row of action widgets (buttons) shown at the bottom.
  final List<Widget>?
      actions;

  /// When true, actions wrap onto multiple lines instead of scrolling.
  final bool
      actionsWrap;

  /// Whether tapping outside the dialog dismisses it. Defaults to true.
  final bool
      barrierDismissible;

  /// Color of the modal barrier. Defaults to `Colors.black54`.
  final Color?
      barrierColor;

  /// Maximum width. Defaults to `min(screenWidth − 48, 560)`.
  final double?
      maxWidth;

  /// Maximum height. Defaults to `screenHeight * 0.85`.
  final double?
      maxHeight;

  /// Entry/exit transition type. Defaults to [SDialogAnimationType.zoomIn].
  final SDialogAnimationType
      animationType;

  /// Animation curve. Defaults to [Curves.easeOutCubic].
  final Curve
      animationCurve;

  /// Duration of the content animation. When null, defaults to 250 ms.
  final Duration?
      animationDuration;

  /// Duration of the route transition (barrier fade + push). When null,
  /// defaults to [animationDuration] or 250 ms.
  final Duration?
      transitionDuration;

  /// Visual treatment applied behind the dialog. Defaults to [SDialogBackgroundEffect.none].
  final SDialogBackgroundEffect
      backgroundEffect;

  final ShapeDecoration?
      shapeDecoration;
  final Color?
      backgroundColor;
  final EdgeInsetsGeometry?
      contentPadding;
  final String?
      semanticLabel;
  final bool?
      showCloseButton;
  final TextStyle?
      titleStyle;
  final TextStyle?
      descriptionStyle;
  final BorderRadius?
      borderRadius;
  final bool?
      showDivider;
  final Color?
      dividerColor;
  final double?
      dividerThickness;
  final EdgeInsetsGeometry?
      actionsPadding;
  final MainAxisAlignment?
      actionsAlignment;
  final CrossAxisAlignment
      contentCrossAlignment;
  final MainAxisAlignment
      contentMainAlignment;
  final bool
      scrollable;
  final ScrollController?
      scrollController;
  final ScrollPhysics?
      scrollPhysics;
  final double?
      elevation;
  final bool
      useSafeArea;
  final bool?
      showTitleDivider;
  final Color?
      titleDividerColor;
  final double?
      titleDividerThickness;
  final EdgeInsetsGeometry?
      titlePadding;
  final EdgeInsetsGeometry?
      descriptionPadding;
  final bool?
      showDescriptionDivider;
  final Color?
      descriptionDividerColor;
  final double?
      descriptionDividerThickness;
  final EdgeInsets?
      insetPadding;
  final AlignmentGeometry?
      alignment;
  final Color?
      shadowColor;
  final Color?
      surfaceTintColor;
  final Clip?
      clipBehavior;

  // ignore: deprecated_member_use_from_same_package
  @Deprecated(
      'Inferred from actions list. This field is ignored.')
  // ignore: unused_field
  final bool
      hasActions;
}

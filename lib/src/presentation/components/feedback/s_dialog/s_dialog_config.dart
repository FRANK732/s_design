import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// Configuration for SDialog.
///
/// This entity aggregates all configurations for a dialog.
class SDialogConfig {
  const SDialogConfig({
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
  });

  final String?
      title;
  final String?
      description;
  final Widget?
      content;
  final List<Widget>?
      actions;
  final bool
      barrierDismissible;
  final Color?
      barrierColor;
  final Duration?
      transitionDuration;
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
  final double?
      maxWidth;
  final double?
      maxHeight;
  final Curve
      animationCurve;
  final Duration?
      animationDuration;
  final TextStyle?
      titleStyle;
  final TextStyle?
      descriptionStyle;
  final BorderRadius?
      borderRadius;
  final SDialogAnimationType
      animationType;
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
  final bool
      hasActions;
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
}

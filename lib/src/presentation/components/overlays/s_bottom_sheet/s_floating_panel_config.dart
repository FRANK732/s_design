import 'package:flutter/material.dart';

/// Configuration for SFloatingPanel.
class SFloatingPanelConfig {
  const SFloatingPanelConfig({
    required this.content,
    this.barrierColor,
    this.horizontalMargin,
    this.bottomMargin,
    this.panelSpacing,
    this.onClose,
    this.customBottomWidget,
    this.animationDuration,
    this.showCloseButton =
        false,
    this.isDismissable =
        true,
    this.constraints,
    this.contentPadding,
    this.backdropBlur,
    this.shadowColor,
    this.shape,
  });

  final Widget
      content;
  final Color?
      barrierColor;
  final double?
      horizontalMargin;
  final double?
      bottomMargin;
  final double?
      panelSpacing;
  final VoidCallback?
      onClose;
  final Widget?
      customBottomWidget;
  final Duration?
      animationDuration;
  final bool
      showCloseButton;
  final bool
      isDismissable;
  final BoxConstraints?
      constraints;
  final EdgeInsetsGeometry?
      contentPadding;
  final double?
      backdropBlur;
  final Color?
      shadowColor;
  final ShapeBorder?
      shape;
}

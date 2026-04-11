import 'package:flutter/material.dart';

/// Defines the layout styling for standard bottom panel actions.
enum SFloatingBottomLayout {
  /// Actions span horizontally next to each other
  row,
  /// Actions stack vertically, expanding to full width
  column,
}

/// A highly customizable footer widget config for SFloatingPanel.
class SFloatingBottomConfig {
  const SFloatingBottomConfig({
    this.actions = const <Widget>[],
    this.layout = SFloatingBottomLayout.row,
    this.customWidget,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.borderRadius,
    this.boxShadow,
  });

  /// A structured list of action buttons (e.g. SButton).
  final List<Widget> actions;

  /// Defines how the [actions] are laid out geometrically.
  final SFloatingBottomLayout layout;

  /// A completely custom widget to override the standard [actions] rendering.
  final Widget? customWidget;

  /// Internal padding of the bottom container.
  final EdgeInsetsGeometry padding;

  /// Background color of the isolated floating bottom action block.
  final Color? backgroundColor;

  /// Corner radiuses of the bottom block. Defaults to theme standard if null.
  final BorderRadiusGeometry? borderRadius;

  /// Custom shadow underlying the bottom action block.
  final List<BoxShadow>? boxShadow;
}

/// A highly customizable content block config for SFloatingPanel.
class SFloatingContentConfig {
  const SFloatingContentConfig({
    this.title,
    this.description,
    this.icon,
    this.child,
  });

  /// Primary title rendered heavily.
  final String? title;

  /// Secondary description block rendered mildly.
  final String? description;

  /// Center-aligned header icon.
  final Widget? icon;

  /// An appended custom child widget inserted into the flow.
  final Widget? child;
}

/// Configuration for SFloatingPanel.
class SFloatingPanelConfig {
  const SFloatingPanelConfig({
    @Deprecated('Use contentConfig for structured data') this.content,
    this.contentConfig,
    this.barrierColor,
    this.horizontalMargin,
    this.bottomMargin,
    this.panelSpacing,
    this.onClose,
    this.customBottomWidget, // DEPRECATED: use bottomConfig instead for defined structures
    this.bottomConfig,
    this.animationDuration,
    this.showCloseButton =
        false,
    this.showDragIndicator =
        true,
    this.elevation,
    this.isDismissable =
        true,
    this.constraints,
    this.contentPadding,
    this.backdropBlur,
    this.backgroundColor,
    this.shadowColor,
    this.shape,
  });

  @Deprecated('Use contentConfig instead')
  final Widget?
      content;
      
  /// Explicit structured definition for the main panel body.
  final SFloatingContentConfig?
      contentConfig;
      
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
  /// Explicit structured definition for the bottom utility/footer bar.
  final SFloatingBottomConfig?
      bottomConfig;
  final Duration?
      animationDuration;
  final bool
      showCloseButton;
  /// Renders a small grey visual pill at the top of the panel hinting at drag-to-dismiss behavior.
  final bool
      showDragIndicator;
  /// Explicitly control the shadow extrusion height. Set to 0 for a flat UI footprint.
  final double?
      elevation;
  final bool
      isDismissable;
  final BoxConstraints?
      constraints;
  final EdgeInsetsGeometry?
      contentPadding;
  final double?
      backdropBlur;
  final Color?
      backgroundColor;
  final Color?
      shadowColor;
  final ShapeBorder?
      shape;
}

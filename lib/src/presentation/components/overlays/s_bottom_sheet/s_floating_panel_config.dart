import 'package:flutter/material.dart';

/// How the [SFloatingPanelConfig.actions] are arranged in the footer.
enum SFloatingBottomLayout {
  /// Actions sit side-by-side in a [Row].
  row,

  /// Actions stack vertically in a [Column].
  column,
}

/// Single configuration object for [SFloatingPanel.show].
///
/// All content, footer, and panel-shell options live here — no nested config
/// objects required:
///
/// ```dart
/// SFloatingPanel.show(
///   context: context,
///   config: SFloatingPanelConfig(
///     icon: Icon(Icons.local_offer, size: 48),
///     title: 'Special Offer',
///     description: 'Limited time deal just for you.',
///     actions: [
///       SButton(onPressed: () => SFloatingPanel.close(context), child: Text('Claim')),
///     ],
///   ),
/// );
/// ```
class SFloatingPanelConfig {
  const SFloatingPanelConfig({
    // ── Content ──────────────────────────────────────────────────────────
    this.icon,
    this.title,
    this.description,
    this.child,
    this.scrollable =
        false,
    this.maxContentHeight,
    this.actions =
        const <Widget>[],
    this.actionsLayout =
        SFloatingBottomLayout.row,
    this.actionsWidget,
    this.actionsPadding = const EdgeInsets
        .all(
        16),
    this.actionsBackgroundColor,
    this.actionsRadius,
    this.actionsShadow,
    this.barrierColor,
    this.horizontalMargin,
    this.bottomMargin,
    this.panelSpacing,
    this.onClose,
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

  /// Center-aligned icon at the top of the panel body.
  final Widget?
      icon;

  /// Primary bold title text.
  final String?
      title;

  /// Secondary muted description text below the title.
  final String?
      description;

  /// Any custom widget appended below the structured content fields.
  final Widget?
      child;

  /// If `true`, the main content area (icon, title, description, child) is
  /// wrapped in a [SingleChildScrollView]. The footer ([actions]) always
  /// stays pinned outside the scroll.
  final bool
      scrollable;

  /// Maximum height of the scrollable content area in logical pixels.
  /// Defaults to 60 % of the screen height when [scrollable] is `true`.
  /// Has no effect when [scrollable] is `false`.
  final double?
      maxContentHeight;

  // ── Footer actions ───────────────────────────────────────────────────────

  /// Action buttons rendered in the floating footer block.
  final List<Widget>
      actions;

  /// How [actions] are arranged — [SFloatingBottomLayout.row] or [SFloatingBottomLayout.column].
  final SFloatingBottomLayout
      actionsLayout;

  /// A fully custom footer widget that replaces the [actions] list entirely.
  final Widget?
      actionsWidget;

  /// Internal padding of the footer container.
  final EdgeInsetsGeometry
      actionsPadding;

  /// Background color of the floating footer block.
  final Color?
      actionsBackgroundColor;

  /// Corner radius of the footer block.
  final BorderRadiusGeometry?
      actionsRadius;

  /// Custom shadow for the footer block.
  final List<BoxShadow>?
      actionsShadow;

  // ── Panel shell ──────────────────────────────────────────────────────────

  /// The translucent scrim color behind the panel.
  final Color?
      barrierColor;

  /// Left + right gap keeping the panel inset from screen edges.
  final double?
      horizontalMargin;

  /// Gap between the bottom of the panel and the screen bottom.
  final double?
      bottomMargin;

  /// Gap between the main panel card and the footer block.
  final double?
      panelSpacing;

  /// Called once after the panel has fully dismissed.
  final VoidCallback?
      onClose;

  /// Duration of the slide-in / slide-out animation.
  final Duration?
      animationDuration;

  /// Show an `×` close icon in the top-right corner of the panel.
  final bool
      showCloseButton;

  /// Show the grey drag-indicator pill at the top of the panel.
  final bool
      showDragIndicator;

  /// Shadow depth beneath the panel card. Set to `0` for flat appearance.
  final double?
      elevation;

  /// Whether tapping the barrier or dragging down dismisses the panel.
  final bool
      isDismissable;

  /// Hard size constraints on the panel shell.
  final BoxConstraints?
      constraints;

  /// Internal padding inside the panel card shell.
  final EdgeInsetsGeometry?
      contentPadding;

  /// Gaussian blur applied to content behind the panel.
  final double?
      backdropBlur;

  /// Background color of the panel card.
  final Color?
      backgroundColor;

  /// Tint of the drop shadow cast by the panel.
  final Color?
      shadowColor;

  /// Custom [ShapeBorder] for the panel card outline and corner radius.
  final ShapeBorder?
      shape;
}

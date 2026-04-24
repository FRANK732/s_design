import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// A highly customizable, production-ready dialog widget.
///
/// Supports multiple animation types, background blur/frosted effects,
/// full theme integration, accessibility semantics, and a convenient
/// static [show] factory that honours all transition parameters.
///
/// ## Quickstart
/// ```dart
/// await SDialog.show(
///   context: context,
///   title: 'Delete item',
///   description: 'This action cannot be undone.',
///   animationType: SDialogAnimationType.fade,
///   backgroundEffect: SDialogBackgroundEffect.blur,
///   actions: [
///     SButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
///     SButton(variant: SButtonVariant.destructive, onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
///   ],
/// );
/// ```
class SDialog
    extends StatefulWidget {
  const SDialog({
    /// Primary title text.
    this.title,

    /// Custom widget for the title, takes precedence over [title].
    this.titleWidget,

    /// Supporting description text shown below the title.
    this.description,

    /// Primary content widget for the dialog body.
    this.content,

    /// List of widgets (buttons) at the bottom.
    this.actions,

    /// Whether the dialog can be dismissed by tapping the barrier.
    this.barrierDismissible =
        true,

    /// Custom colour for the barrier backdrop.
    this.barrierColor,

    /// Duration for the entry/exit transitions.
    this.transitionDuration,

    /// Custom decoration for the dialog container.
    this.shapeDecoration,

    /// Background color of the dialog.
    this.backgroundColor,

    /// Padding for the central content block.
    this.contentPadding,

    /// Accessibility label for screen readers.
    this.semanticLabel,

    /// Whether to show a close icon in the corner.
    this.showCloseButton,

    /// Maximum width of the dialog.
    this.maxWidth,

    /// Maximum height of the dialog.
    this.maxHeight,

    /// Timing curve for the entry animation.
    this.animationCurve =
        Curves.easeOutCubic,

    /// Duration for inner-modal animations.
    this.animationDuration,

    /// Custom style for the title text.
    this.titleStyle,

    /// Custom style for the description text.
    this.descriptionStyle,

    /// Custom border radius for the container.
    this.borderRadius,

    /// Type of entry animation (scale, fade, slide).
    this.animationType =
        SDialogAnimationType.zoomIn,

    /// Background filter effects like glassmorphism.
    this.backgroundEffect =
        SDialogBackgroundEffect.none,

    /// Whether to show a divider above the actions.
    this.showDivider,

    /// Custom divider color.
    this.dividerColor,

    /// Custom divider vertical thickness.
    this.dividerThickness,

    /// Padding wrapping the action buttons.
    this.actionsPadding,

    /// Alignment of actions within the bottom area.
    this.actionsAlignment =
        MainAxisAlignment.end,

    /// Cross-axis alignment for the body content.
    this.contentCrossAlignment =
        CrossAxisAlignment.start,

    /// Main-axis alignment for the body content.
    this.contentMainAlignment =
        MainAxisAlignment.start,

    /// Whether the content area should be scrollable.
    this.scrollable =
        false,

    /// Custom scroll controller for the content.
    this.scrollController,

    /// Custom scroll physics for the content.
    this.scrollPhysics,

    /// Elevation shadow depth.
    this.elevation,

    /// Whether to wrap the dialog in a SafeArea.
    this.useSafeArea =
        false,

    /// Whether to show a divider below the title.
    this.showTitleDivider,

    /// Color for the title divider.
    this.titleDividerColor,

    /// Thickness for the title divider.
    this.titleDividerThickness,

    /// Padding wrapping the title area.
    this.titlePadding,

    /// Padding wrapping the description area.
    this.descriptionPadding,

    /// Whether to show a divider below the description.
    this.showDescriptionDivider,

    /// Color for the description divider.
    this.descriptionDividerColor,

    /// Thickness for the description divider.
    this.descriptionDividerThickness,

    /// Margin padding around the entire dialog container.
    this.insetPadding,

    /// Positional alignment of the dialog on screen.
    this.alignment,

    /// Shadow color for the elevation effect.
    this.shadowColor,

    /// Material 3 surface tint color.
    this.surfaceTintColor,

    /// Clip behavior for the dialog contents.
    this.clipBehavior,

    /// Optional graphical icon at the top of the dialog.
    this.iconWidget,

    /// Custom widget trailing at the end of the body.
    this.footerWidget,

    /// Whether actions should wrap if space is constrained.
    this.actionsWrap =
        false,
    super.key,
  });

  /// Creates an [SDialog] from an [SDialogConfig] object.
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
      titleWidget:
          config.titleWidget,
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
      backgroundEffect:
          config.backgroundEffect,
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
      iconWidget:
          config.iconWidget,
      footerWidget:
          config.footerWidget,
      actionsWrap:
          config.actionsWrap,
    );
  }

  final String?
      title;
  final Widget?
      titleWidget;
  final String?
      description;
  final Widget?
      content;
  final Widget?
      iconWidget;
  final Widget?
      footerWidget;

  final List<Widget>?
      actions;
  final bool
      actionsWrap;

  final bool
      barrierDismissible;
  final Color?
      barrierColor;

  final double?
      maxWidth;
  final double?
      maxHeight;

  final SDialogAnimationType
      animationType;
  final Curve
      animationCurve;
  final Duration?
      animationDuration;
  final Duration?
      transitionDuration;

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
  final MainAxisAlignment
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

  /// Shows the dialog and returns its result.
  ///
  /// Uses [showGeneralDialog] so [animationType], [transitionDuration], and
  /// [animationCurve] are all honoured.
  /// Shows an animated, highly customizable modal dialog.
  ///
  /// This wrapper around SDK's `showGeneralDialog` seamlessly integrates custom entry/exit
  /// animations, layout behaviors, background filters, and native `SDialogTheme` capabilities.
  static Future<T?>
      show<T>({
    /// Valid build context enabling theme lookups and overlay injections.
    required BuildContext
        context,

    /// Optional structured config object to decouple properties.
    SDialogConfig?
        config,

    /// Text forcefully rendered in the modal's primary title position.
    String?
        title,

    /// Strongly typed custom widget superseding the raw `title` string if provided.
    Widget?
        titleWidget,

    /// Subtext or explanatory paragraph displayed directly below the title.
    String?
        description,

    /// Primary widget content inside the dialog body.
    Widget?
        content,

    /// Row of widgets (typically buttons) rendered cleanly at the bottom of the modal.
    List<Widget>?
        actions,

    /// Toggles whether clicking the darkened background safely dismisses the modal.
    bool barrierDismissible =
        true,

    /// Tint of the backdrop overlay (defaults to `Colors.black54` if null).
    Color?
        barrierColor,

    /// Timeline duration allotted for the modal entry/exit animations.
    Duration?
        transitionDuration,

    /// Manual container outline logic overriding the native `ShapeDecoration`.
    ShapeDecoration?
        shapeDecoration,

    /// The base fill color behind all dialog contents.
    Color?
        backgroundColor,

    /// Spacing physically enforcing padding boundaries against the modal edge.
    EdgeInsetsGeometry?
        contentPadding,

    /// Accessibility tracking label broadcast to engine screen-readers.
    String?
        semanticLabel,

    /// Renders a native 'X' close button inside the modal frame if `true`.
    bool?
        showCloseButton,

    /// Physical maximum pixel width the rendering agent is permitted to stretch the dialog box to.
    double?
        maxWidth,

    /// Physical maximum pixel height. If content exceeds this, it becomes scrollable (if enabled).
    double?
        maxHeight,

    /// Timing arc dictating the bezier interpolation of the `animationType`.
    Curve animationCurve =
        Curves.easeOutCubic,

    /// Total timeline allotted for inner-modal child animations (different from `transitionDuration`).
    Duration?
        animationDuration,

    /// Font style directly overriding the themed `TextTheme` for the title.
    TextStyle?
        titleStyle,

    /// Font style overriding the themed `description` format.
    TextStyle?
        descriptionStyle,

    /// Outer framing curvature mapping to a smooth UI look.
    BorderRadius?
        borderRadius,

    /// Defines exactly how the UI flies into view (e.g. `SDialogAnimationType.fade`, `zoomIn`).
    SDialogAnimationType animationType =
        SDialogAnimationType.zoomIn,

    /// Dictates backing effects like glassmorphism blurs vs standard dimming.
    SDialogBackgroundEffect backgroundEffect =
        SDialogBackgroundEffect.none,

    /// Triggers rendering of a native separator line between content and actions.
    bool?
        showDivider,

    /// Visual tint of the action separator line.
    Color?
        dividerColor,

    /// Physical vertical thickness of the action separator line.
    double?
        dividerThickness,

    /// Layout padding enforcing strict boundaries around the `actions` widget list.
    EdgeInsetsGeometry?
        actionsPadding,

    /// Horizontal positioning gravity applied to the action layout. Defaults to `MainAxisAlignment.end`.
    MainAxisAlignment actionsAlignment =
        MainAxisAlignment.end,

    /// Internal cross-axis alignment for the primary dialog layout sequence.
    CrossAxisAlignment contentCrossAlignment =
        CrossAxisAlignment.start,

    /// Internal main-axis alignment for the primary dialog layout sequence.
    MainAxisAlignment contentMainAlignment =
        MainAxisAlignment.start,

    /// Enables raw vertical scrolling if the internal widget content exceeds physical bounds.
    bool scrollable =
        false,

    /// A tethered controller managing the `scrollable` state.
    ScrollController?
        scrollController,

    /// Dictates raw physical bounce simulation algorithms (e.g. `BouncingScrollPhysics`).
    ScrollPhysics?
        scrollPhysics,

    /// Box projection depth dictating the ambient shadow cast.
    double?
        elevation,

    /// Bounds dialog against un-safe engine intrusion zones (margins/notches).
    bool useSafeArea =
        false,

    /// Draws a separator under the title block.
    bool?
        showTitleDivider,

    /// Colors the title block separator.
    Color?
        titleDividerColor,

    /// Thickness of the title block separator.
    double?
        titleDividerThickness,

    /// Padding isolating the title text frame natively.
    EdgeInsetsGeometry?
        titlePadding,

    /// Padding visually separating the description text from nearby bodies.
    EdgeInsetsGeometry?
        descriptionPadding,

    /// Renders a horizontal divider underneath the description parameter.
    bool?
        showDescriptionDivider,

    /// Color driving the description separator line.
    Color?
        descriptionDividerColor,

    /// Thickness of the description separator.
    double?
        descriptionDividerThickness,

    /// Margin bounds safely isolating the entire `SDialog` container inside the screen payload.
    EdgeInsets?
        insetPadding,

    /// High-level 2D coordinate gravity (e.g. `Alignment.center`) adjusting the modal position relative to screen scope.
    AlignmentGeometry?
        alignment,

    /// Shadow ambient color.
    Color?
        shadowColor,

    /// Emulation of Material 3 elevated surface tint.
    Color?
        surfaceTintColor,

    /// Clip calculation bounding logic containing modal edge-painting.
    Clip?
        clipBehavior,

    /// Icon visually stamped directly above the structural text nodes.
    Widget?
        iconWidget,

    /// Custom widget trailing at the terminal end of the internal structure block (below content, above actions).
    Widget?
        footerWidget,

    /// Toggles if multiple action widgets should overflow defensively onto a new line if constrained.
    bool actionsWrap =
        false,
  }) {
    final SDialogConfig effectiveConfig = config ??
        SDialogConfig(
          title: title,
          titleWidget: titleWidget,
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
          backgroundEffect: backgroundEffect,
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
          insetPadding: insetPadding,
          alignment: alignment,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          clipBehavior: clipBehavior,
          iconWidget: iconWidget,
          footerWidget: footerWidget,
          actionsWrap: actionsWrap,
        );

    final Duration effectiveTransitionDuration = effectiveConfig.transitionDuration ??
        effectiveConfig.animationDuration ??
        const Duration(milliseconds: 250);

    return showGeneralDialog<
        T>(
      context:
          context,
      barrierDismissible:
          effectiveConfig.barrierDismissible,
      barrierLabel:
          effectiveConfig.semanticLabel ?? MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor:
          effectiveConfig.barrierColor ?? Colors.black54,
      transitionDuration:
          effectiveTransitionDuration,
      pageBuilder: (BuildContext ctx,
          Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget dialog = SDialog.fromConfig(effectiveConfig);
        return useSafeArea ? SafeArea(child: dialog) : dialog;
      },
      transitionBuilder: (BuildContext ctx,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return _buildTransition(
          animation: animation,
          animationType: effectiveConfig.animationType,
          animationCurve: effectiveConfig.animationCurve,
          child: child,
        );
      },
    );
  }

  /// Builds the appropriate transition widget for the given [animationType].
  static Widget
      _buildTransition({
    required Animation<double>
        animation,
    required SDialogAnimationType
        animationType,
    required Curve
        animationCurve,
    required Widget
        child,
  }) {
    final Animation<double>
        curved =
        CurvedAnimation(
      parent:
          animation,
      curve:
          animationCurve,
      reverseCurve:
          animationCurve.flipped,
    );

    switch (
        animationType) {
      case SDialogAnimationType.fade:
        return FadeTransition(opacity: curved, child: child);

      case SDialogAnimationType.zoomIn:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.85, end: 1.0).animate(curved),
          child: FadeTransition(opacity: curved, child: child),
        );

      case SDialogAnimationType.slideFromLeft:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(curved),
          child: child,
        );

      case SDialogAnimationType.slideFromRight:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(curved),
          child: child,
        );

      case SDialogAnimationType.slideFromTop:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(curved),
          child: child,
        );

      case SDialogAnimationType.slideFromBottom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(curved),
          child: child,
        );
    }
  }

  @override
  State<SDialog>
      createState() =>
          _SDialogState();
}

class _SDialogState
    extends State<
        SDialog>
    with
        SingleTickerProviderStateMixin {
  late final AnimationController
      _controller;

  @override
  void
      initState() {
    super
        .initState();
    _controller =
        AnimationController(
      vsync:
          this,
      duration:
          widget.animationDuration ?? const Duration(milliseconds: 250),
    );
    _controller
        .forward();
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final MediaQueryData
        mq =
        MediaQuery.of(context);
    final SDialogThemeData
        dialogTheme =
        Theme.of(context).sDialogTheme;
    final ThemeData
        theme =
        Theme.of(context);

    // Responsive defaults — never too small, never off-screen.
    final double
        effectiveMaxWidth =
        widget.maxWidth ?? (mq.size.width - 48).clamp(280.0, 560.0);
    final double
        effectiveMaxHeight =
        widget.maxHeight ?? mq.size.height * 0.85;

    Widget surface = _buildSurface(
        context,
        theme,
        dialogTheme,
        effectiveMaxWidth,
        effectiveMaxHeight);

    // Apply background effect to the dialog surface itself.
    if (widget.backgroundEffect ==
        SDialogBackgroundEffect.frosted) {
      surface =
          ClipRRect(
        borderRadius: widget.borderRadius ?? (dialogTheme.borderRadius as BorderRadius?) ?? BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: surface,
        ),
      );
    }

    return Dialog(
      backgroundColor:
          Colors.transparent,
      insetPadding: widget.insetPadding ??
          dialogTheme.insetPadding ??
          const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      elevation:
          0,
      alignment: widget.alignment ??
          dialogTheme.alignment ??
          Alignment.center,
      child:
          surface,
    );
  }

  Widget
      _buildSurface(
    BuildContext
        context,
    ThemeData
        theme,
    SDialogThemeData
        dialogTheme,
    double
        maxWidth,
    double
        maxHeight,
  ) {
    final Color
        bgColor =
        widget.backgroundColor ?? dialogTheme.backgroundColor;

    // Frosted = semi-transparent, otherwise opaque.
    final Color effectiveBg = widget.backgroundEffect == SDialogBackgroundEffect.frosted
        ? bgColor.withOpacity(0.75)
        : bgColor;

    final BorderRadius effectiveRadius = widget.borderRadius ??
        (dialogTheme.borderRadius as BorderRadius?) ??
        BorderRadius.circular(16);

    final ShapeDecoration decoration = widget.shapeDecoration ??
        ShapeDecoration(
          color: effectiveBg,
          shape: RoundedRectangleBorder(borderRadius: effectiveRadius),
          shadows: <BoxShadow>[
            BoxShadow(
              color: widget.shadowColor ?? dialogTheme.shadowColor ?? Colors.black.withOpacity(0.15),
              blurRadius: widget.elevation ?? dialogTheme.elevation ?? 24.0,
              offset: const Offset(0, 8),
            ),
          ],
        );

    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child:
          Material(
        color: Colors.transparent,
        surfaceTintColor: widget.surfaceTintColor ?? dialogTheme.surfaceTintColor,
        clipBehavior: widget.clipBehavior ?? dialogTheme.clipBehavior ?? Clip.none,
        child: FocusScope(
          child: Semantics(
            label: widget.semanticLabel ?? widget.title,
            child: Container(
              decoration: decoration,
              child: _buildBody(context, theme, dialogTheme),
            ),
          ),
        ),
      ),
    );
  }

  Widget
      _buildBody(
    BuildContext
        context,
    ThemeData
        theme,
    SDialogThemeData
        dialogTheme,
  ) {
    final EdgeInsetsGeometry padding = widget.contentPadding ??
        dialogTheme.contentPadding ??
        const EdgeInsets.all(24);

    return Padding(
      padding:
          padding,
      child:
          Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: widget.contentCrossAlignment,
        children: <Widget>[
          if (widget.iconWidget != null) ...<Widget>[
            widget.iconWidget!,
            const SizedBox(height: 12),
          ],
          if (widget.title != null || widget.titleWidget != null) _buildTitleRow(context, theme, dialogTheme),
          if (widget.description != null && widget.description!.isNotEmpty) _buildDescription(context, theme, dialogTheme),
          if (widget.content != null) ...<Widget>[
            const SizedBox(height: 16),
            if (widget.scrollable)
              Flexible(
                child: SingleChildScrollView(
                  controller: widget.scrollController,
                  physics: widget.scrollPhysics,
                  child: widget.content,
                ),
              )
            else
              widget.content!,
          ],
          if (widget.showDivider ?? dialogTheme.showDivider ?? false) ...<Widget>[
            const SizedBox(height: 16),
            Divider(
              color: widget.dividerColor ?? dialogTheme.dividerColor ?? theme.dividerColor,
              thickness: widget.dividerThickness ?? dialogTheme.dividerThickness ?? 1.0,
              height: 1,
            ),
          ],
          if (widget.actions != null && widget.actions!.isNotEmpty) _buildActions(context, dialogTheme),
          if (widget.footerWidget != null) ...<Widget>[
            const SizedBox(height: 12),
            widget.footerWidget!,
          ],
        ],
      ),
    );
  }

  Widget
      _buildTitleRow(
    BuildContext
        context,
    ThemeData
        theme,
    SDialogThemeData
        dialogTheme,
  ) {
    final Widget titleContent = widget.titleWidget ??
        Text(
          widget.title!,
          style: widget.titleStyle ??
              dialogTheme.titleStyle?.copyWith(color: dialogTheme.titleColor) ??
              theme.textTheme.titleLarge?.copyWith(
                color: dialogTheme.titleColor,
                fontWeight: FontWeight.w600,
              ),
        );

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: widget.titlePadding ?? EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: titleContent),
              if (widget.showCloseButton ?? false)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20,
                      color: dialogTheme.titleColor,
                    ),
                    style: IconButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                    ),
                    tooltip: MaterialLocalizations.of(context).closeButtonLabel,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
            ],
          ),
        ),
        if (widget.showTitleDivider ?? false) ...<Widget>[
          const SizedBox(height: 8),
          Divider(
            color: widget.titleDividerColor ?? dialogTheme.dividerColor ?? theme.dividerColor,
            thickness: widget.titleDividerThickness ?? dialogTheme.dividerThickness ?? 1.0,
            height: 1,
          ),
        ],
      ],
    );
  }

  Widget
      _buildDescription(
    BuildContext
        context,
    ThemeData
        theme,
    SDialogThemeData
        dialogTheme,
  ) {
    return Padding(
      padding:
          widget.descriptionPadding ?? const EdgeInsets.only(top: 8),
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.description!,
            style: widget.descriptionStyle ??
                dialogTheme.descriptionStyle?.copyWith(color: dialogTheme.descriptionColor) ??
                theme.textTheme.bodyMedium?.copyWith(
                  color: dialogTheme.descriptionColor,
                  height: 1.5,
                ),
          ),
          if (widget.showDescriptionDivider ?? false) ...<Widget>[
            const SizedBox(height: 8),
            Divider(
              color: widget.descriptionDividerColor ?? dialogTheme.dividerColor ?? theme.dividerColor,
              thickness: widget.descriptionDividerThickness ?? dialogTheme.dividerThickness ?? 1.0,
              height: 1,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActions(
      BuildContext
          context,
      SDialogThemeData
          dialogTheme) {
    return Padding(
      padding: widget.actionsPadding ??
          dialogTheme.actionsPadding ??
          const EdgeInsets.only(top: 24),
      child: widget.actionsWrap
          ? Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.end,
              children: widget.actions!,
            )
          : Row(
              mainAxisAlignment: widget.actionsAlignment,
              children: widget.actions!
                  .expand<Widget>((Widget w) => <Widget>[
                        w,
                        const SizedBox(width: 8)
                      ])
                  .toList()
                ..removeLast(),
            ),
    );
  }
}

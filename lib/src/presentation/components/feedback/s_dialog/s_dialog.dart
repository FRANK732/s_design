import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../../s_design.dart';
import 's_dialog_config.dart';

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
    this.insetPadding,
    this.alignment,
    this.shadowColor,
    this.surfaceTintColor,
    this.clipBehavior,
    this.iconWidget,
    this.footerWidget,
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

  // ── Content ───────────────────────────────────────────────────────────────
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

  // ── Actions ───────────────────────────────────────────────────────────────
  final List<Widget>?
      actions;
  final bool
      actionsWrap;

  // ── Barrier ───────────────────────────────────────────────────────────────
  final bool
      barrierDismissible;
  final Color?
      barrierColor;

  // ── Sizing ────────────────────────────────────────────────────────────────
  final double?
      maxWidth;
  final double?
      maxHeight;

  // ── Animation ─────────────────────────────────────────────────────────────
  final SDialogAnimationType
      animationType;
  final Curve
      animationCurve;
  final Duration?
      animationDuration;
  final Duration?
      transitionDuration;

  // ── Background effect ─────────────────────────────────────────────────────
  final SDialogBackgroundEffect
      backgroundEffect;

  // ── Appearance ────────────────────────────────────────────────────────────
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

  // ── Static show factory ───────────────────────────────────────────────────

  /// Shows the dialog and returns its result.
  ///
  /// Uses [showGeneralDialog] so [animationType], [transitionDuration], and
  /// [animationCurve] are all honoured.
  static Future<T?>
      show<T>({
    required BuildContext
        context,
    SDialogConfig?
        config,
    String?
        title,
    Widget?
        titleWidget,
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
        Curves.easeOutCubic,
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
    SDialogBackgroundEffect backgroundEffect =
        SDialogBackgroundEffect.none,
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
    Widget?
        iconWidget,
    Widget?
        footerWidget,
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
      useRootNavigator:
          true,
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

// ─────────────────────────────────────────────────────────────────────────────
// State
// ─────────────────────────────────────────────────────────────────────────────

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

  // ── Surface ────────────────────────────────────────────────────────────────

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
              spreadRadius: 0,
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

  // ── Body layout ────────────────────────────────────────────────────────────

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
          // Optional icon above the title.
          if (widget.iconWidget != null) ...<Widget>[
            widget.iconWidget!,
            const SizedBox(height: 12),
          ],

          // Title row (text or custom widget).
          if (widget.title != null || widget.titleWidget != null) _buildTitleRow(context, theme, dialogTheme),

          // Description.
          if (widget.description != null && widget.description!.isNotEmpty) _buildDescription(context, theme, dialogTheme),

          // Content body — scrollable if requested.
          if (widget.content != null) ...<Widget>[
            const SizedBox(height: 16),
            widget.scrollable
                ? Flexible(
                    child: SingleChildScrollView(
                      controller: widget.scrollController,
                      physics: widget.scrollPhysics,
                      child: widget.content!,
                    ),
                  )
                : widget.content!,
          ],

          // Optional pre-actions divider.
          if (widget.showDivider ?? dialogTheme.showDivider ?? false) ...<Widget>[
            const SizedBox(height: 16),
            Divider(
              color: widget.dividerColor ?? dialogTheme.dividerColor ?? theme.dividerColor,
              thickness: widget.dividerThickness ?? dialogTheme.dividerThickness ?? 1.0,
              height: 1,
            ),
          ],

          // Actions row / wrap.
          if (widget.actions != null && widget.actions!.isNotEmpty) _buildActions(context, dialogTheme),

          // Optional footer.
          if (widget.footerWidget != null) ...<Widget>[
            const SizedBox(height: 12),
            widget.footerWidget!,
          ],
        ],
      ),
    );
  }

  // ── Title row ──────────────────────────────────────────────────────────────

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
                      color: dialogTheme.titleColor ?? theme.iconTheme.color,
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

  // ── Description ────────────────────────────────────────────────────────────

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

  // ── Actions ────────────────────────────────────────────────────────────────

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
              mainAxisSize: MainAxisSize.max,
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

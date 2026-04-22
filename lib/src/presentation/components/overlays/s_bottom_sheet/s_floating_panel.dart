import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../s_design.dart';

class SFloatingPanel {
  /// Shows a modern floating bottom sheet panel.
  ///
  /// All configuration is passed through [config]:
  ///
  /// ```dart
  /// SFloatingPanel.show(
  ///   context: context,
  ///   config: SFloatingPanelConfig(
  ///     icon: Icon(Icons.check_circle, size: 48, color: Colors.green),
  ///     title: 'Done!',
  ///     description: 'Your changes have been saved.',
  ///     actions: [
  ///       SButton(onPressed: () => SFloatingPanel.close(context), child: Text('OK')),
  ///     ],
  ///   ),
  /// );
  /// ```
  static Future<void>
      show({
    required BuildContext
        context,
    required SFloatingPanelConfig
        config,
  }) async {
    final SFloatingPanelThemeData
        theme =
        Theme.of(context).sFloatingPanelTheme;

    final SFloatingPanelConfig
        effectiveConfig =
        SFloatingPanelConfig(
      icon:
          config.icon,
      title:
          config.title,
      description:
          config.description,
      child:
          config.child,
      scrollable:
          config.scrollable,
      maxContentHeight:
          config.maxContentHeight,
      actions:
          config.actions,
      actionsLayout:
          config.actionsLayout,
      actionsWidget:
          config.actionsWidget,
      actionsPadding:
          config.actionsPadding,
      actionsBackgroundColor:
          config.actionsBackgroundColor,
      actionsRadius:
          config.actionsRadius,
      actionsShadow:
          config.actionsShadow,
      barrierColor: config.barrierColor ??
          theme.barrierColor ??
          const Color(0x80000000),
      horizontalMargin: config.horizontalMargin ??
          (theme.margin as EdgeInsets?)?.horizontal ??
          32.0,
      bottomMargin: config.bottomMargin ??
          (theme.margin as EdgeInsets?)?.bottom ??
          16.0,
      panelSpacing: config.panelSpacing ??
          theme.panelSpacing ??
          15.0,
      onClose:
          config.onClose,
      animationDuration: config.animationDuration ??
          theme.animationDuration ??
          const Duration(milliseconds: 300),
      showCloseButton:
          config.showCloseButton,
      showDragIndicator:
          config.showDragIndicator,
      elevation:
          config.elevation,
      isDismissable:
          config.isDismissable,
      constraints:
          config.constraints ?? theme.constraints,
      contentPadding:
          config.contentPadding ?? theme.contentPadding,
      backdropBlur: config.backdropBlur ??
          theme.backdropBlur ??
          0.0,
      shadowColor:
          config.shadowColor ?? theme.shadowColor,
      shape:
          config.shape ?? theme.shape,
    );

    await Navigator.of(context, rootNavigator: true)
        .push(
      _SFloatingPanelRoute(
          config: effectiveConfig,
          theme: theme),
    );

    effectiveConfig
        .onClose
        ?.call();
  }

  /// Closes the topmost SFloatingPanel.
  static Future<void>
      close(BuildContext context) async {
    Navigator.of(context, rootNavigator: true)
        .pop();
  }
}

// ── Internal route ───────────────────────────────────────────────────────────

class _SFloatingPanelRoute
    extends PopupRoute<
        void> {
  _SFloatingPanelRoute(
      {required this.config,
      required this.theme});

  final SFloatingPanelConfig
      config;
  final SFloatingPanelThemeData
      theme;

  @override
  Color? get barrierColor =>
      config.barrierColor;

  @override
  bool get barrierDismissible =>
      config.isDismissable;

  @override
  String? get barrierLabel =>
      'Dismiss panel';

  @override
  Duration get transitionDuration =>
      config.animationDuration ??
      const Duration(milliseconds: 300);

  @override
  Widget buildPage(
      BuildContext
          context,
      Animation<double>
          animation,
      Animation<double>
          secondaryAnimation) {
    Widget
        page =
        _SFloatingPanelContent(config: config, theme: theme);

    if ((config.backdropBlur ?? 0) >
        0) {
      page =
          BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: config.backdropBlur!,
          sigmaY: config.backdropBlur!,
        ),
        child: page,
      );
    }

    return Semantics(
      scopesRoute:
          true,
      explicitChildNodes:
          true,
      child:
          SafeArea(bottom: false, child: page),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext
          context,
      Animation<double>
          animation,
      Animation<double>
          secondaryAnimation,
      Widget
          child) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child:
          FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
        child: child,
      ),
    );
  }
}

// ── Internal content widget ──────────────────────────────────────────────────

class _SFloatingPanelContent
    extends StatefulWidget {
  const _SFloatingPanelContent(
      {required this.config,
      required this.theme});

  final SFloatingPanelConfig
      config;
  final SFloatingPanelThemeData
      theme;

  @override
  State<_SFloatingPanelContent>
      createState() =>
          _SFloatingPanelContentState();
}

class _SFloatingPanelContentState
    extends State<
        _SFloatingPanelContent> {
  double
      _dragOffset =
      0.0;

  void _onVerticalDragUpdate(
      DragUpdateDetails
          details) {
    if (details.delta.dy >
        0) {
      setState(() =>
          _dragOffset += details.delta.dy);
    } else if (details.delta.dy < 0 &&
        _dragOffset > 0) {
      setState(() {
        _dragOffset = (_dragOffset + details.delta.dy).clamp(0.0, double.infinity);
      });
    }
  }

  void _onVerticalDragEnd(
      DragEndDetails
          details) {
    if (_dragOffset > 100 ||
        (details.primaryVelocity ?? 0) > 300) {
      Navigator.of(context).pop();
    } else {
      setState(() =>
          _dragOffset = 0.0);
    }
  }

  bool get _hasFooter =>
      widget.config.actions.isNotEmpty ||
      widget.config.actionsWidget !=
          null;

  @override
  Widget build(
      BuildContext
          context) {
    final double
        hMargin =
        widget.config.horizontalMargin ?? 0;

    return Transform
        .translate(
      offset:
          Offset(0, _dragOffset),
      child:
          GestureDetector(
        onVerticalDragUpdate: widget.config.isDismissable ? _onVerticalDragUpdate : null,
        onVerticalDragEnd: widget.config.isDismissable ? _onVerticalDragEnd : null,
        behavior: HitTestBehavior.deferToChild,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: hMargin / 2,
              right: hMargin / 2,
              bottom: widget.config.bottomMargin ?? 16.0,
            ),
            child: ConstrainedBox(
              constraints: widget.config.constraints ?? const BoxConstraints.tightFor(width: double.infinity),
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // ── Main panel card ──────────────────────────────────
                    _buildPanelCard(context),

                    // ── Floating footer ──────────────────────────────────
                    if (_hasFooter) ...<Widget>[
                      SizedBox(height: widget.config.panelSpacing ?? 15.0),
                      _buildFooter(context),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanelCard(
      BuildContext
          context) {
    final double elev = widget.config.elevation ??
        widget.theme.elevation ??
        12;

    // Build the content column (drag pill + icon + title + description + child)
    final Widget
        contentColumn =
        Column(
      mainAxisSize:
          MainAxisSize.min,
      crossAxisAlignment:
          CrossAxisAlignment.stretch,
      children: <Widget>[
        if (widget.config.showDragIndicator)
          Center(
            child: Container(
              width: 32,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        if (widget.config.icon != null) ...<Widget>[
          Center(child: widget.config.icon),
          const SizedBox(height: 16),
        ],
        if (widget.config.title != null) ...<Widget>[
          Text(
            widget.config.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
        ],
        if (widget.config.description != null) ...<Widget>[
          Text(
            widget.config.description!,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
        if (widget.config.child != null)
          widget.config.child!,
      ],
    );

    final Widget panelBody = widget.config.scrollable
        ? ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: widget.config.maxContentHeight ?? MediaQuery.of(context).size.height,
            ),
            child: SingleChildScrollView(child: contentColumn),
          )
        : contentColumn;

    return Container(
      padding:
          widget.config.contentPadding,
      decoration:
          ShapeDecoration(
        color: widget.config.backgroundColor ?? widget.theme.backgroundColor ?? Colors.white,
        shape: widget.config.shape ??
            RoundedRectangleBorder(
              borderRadius: widget.theme.borderRadius ?? BorderRadius.circular(24),
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
              ),
            ),
        shadows: elev <= 0
            ? null
            : <BoxShadow>[
                BoxShadow(
                  color: widget.config.shadowColor ?? Colors.black.withOpacity(0.12),
                  blurRadius: elev * 2,
                  spreadRadius: 2,
                  offset: Offset(0, elev),
                ),
                BoxShadow(
                  color: widget.config.shadowColor ?? Colors.black.withOpacity(0.15),
                  blurRadius: elev,
                  spreadRadius: -2,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child:
          Stack(
        children: <Widget>[
          panelBody,
          if (widget.config.showCloseButton)
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFooter(
      BuildContext
          context) {
    final double elev = widget.config.elevation ??
        widget.theme.elevation ??
        12;
    final Color?
        bg =
        widget.config.actionsBackgroundColor;
    final bool
        hasBg =
        bg != null && bg != Colors.transparent;

    Widget footerContent = widget.config.actionsWidget ??
        (widget.config.actionsLayout == SFloatingBottomLayout.row
            ? Row(
                children: widget.config.actions
                    .map<Widget>(
                      (Widget a) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: a,
                        ),
                      ),
                    )
                    .toList(),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.config.actions
                    .map<Widget>(
                      (Widget a) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: a,
                      ),
                    )
                    .toList(),
              ));

    return Container(
      padding:
          widget.config.actionsPadding,
      decoration: hasBg
          ? ShapeDecoration(
              color: bg,
              shape: RoundedRectangleBorder(
                borderRadius: widget.config.actionsRadius ?? BorderRadius.circular(20),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
                ),
              ),
              shadows: widget.config.actionsShadow ??
                  (elev <= 0
                      ? null
                      : <BoxShadow>[
                          BoxShadow(
                            color: widget.config.shadowColor ?? Colors.black.withOpacity(0.12),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ]),
            )
          : null,
      child:
          footerContent,
    );
  }
}

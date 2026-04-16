import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../s_design.dart';

class SFloatingPanel {
  /// Deprecated: SFloatingPanel now uses Navigator natively.
  /// This is a no-op to prevent breaking legacy code immediately.
  @Deprecated(
      'SFloatingPanel no longer requires global initialization. It hooks directly into Navigator.')
  static void
      initialize(OverlayState overlayState) {}

  /// Triggers a modern, floating bottom sheet overlay that mimics native iOS fluid sheets.
  ///
  /// The panel is fully customizable, supporting background blur, floating margins,
  /// auto-resizing, and independent bottom utility areas.
  static Future<void>
      show({
    required BuildContext
        context,
    SFloatingPanelConfig?
        config,
    @Deprecated(
        'Use contentConfig for structured panel data')
    Widget?
        content,
    SFloatingContentConfig?
        contentConfig,
    Color?
        barrierColor,
    double?
        horizontalMargin,
    double?
        bottomMargin,
    double?
        panelSpacing,
    VoidCallback?
        onClose,
    @Deprecated(
        'Use bottomConfig instead for structured footers')
    Widget?
        customBottomWidget,
    SFloatingBottomConfig?
        bottomConfig,
    Duration?
        animationDuration,
    bool showCloseButton =
        false,
    bool showDragIndicator =
        true,
    double?
        elevation,
    bool isDismissable =
        true,
    BoxConstraints?
        constraints,
    EdgeInsetsGeometry?
        contentPadding,
    double?
        backdropBlur,
    Color?
        shadowColor,
    ShapeBorder?
        shape,
  }) async {
    final SFloatingPanelThemeData
        theme =
        Theme.of(context).sFloatingPanelTheme;

    final double effectiveHorizontalMargin = horizontalMargin ??
        config?.horizontalMargin ??
        (theme.margin as EdgeInsets?)?.horizontal ??
        32.0;

    final double effectiveBottomMargin = bottomMargin ??
        config?.bottomMargin ??
        (theme.margin as EdgeInsets?)?.bottom ??
        16.0;

    final SFloatingPanelConfig
        effectiveConfig =
        SFloatingPanelConfig(
      content:
          content ?? config?.content,
      contentConfig:
          contentConfig ?? config?.contentConfig,
      barrierColor: barrierColor ??
          config?.barrierColor ??
          theme.barrierColor ??
          const Color(0x80000000),
      horizontalMargin:
          effectiveHorizontalMargin,
      bottomMargin:
          effectiveBottomMargin,
      panelSpacing: panelSpacing ??
          config?.panelSpacing ??
          theme.panelSpacing ??
          15.0,
      onClose:
          onClose ?? config?.onClose,
      customBottomWidget:
          customBottomWidget ?? config?.customBottomWidget,
      bottomConfig:
          bottomConfig ?? config?.bottomConfig,
      animationDuration: animationDuration ??
          config?.animationDuration ??
          theme.animationDuration ??
          const Duration(milliseconds: 300),
      showCloseButton:
          showCloseButton || (config?.showCloseButton ?? false),
      showDragIndicator:
          showDragIndicator && (config?.showDragIndicator ?? true),
      elevation:
          elevation ?? config?.elevation,
      isDismissable:
          isDismissable,
      constraints: constraints ??
          config?.constraints ??
          theme.constraints,
      contentPadding: contentPadding ??
          config?.contentPadding ??
          theme.contentPadding,
      backdropBlur: backdropBlur ??
          config?.backdropBlur ??
          theme.backdropBlur ??
          0.0,
      shadowColor: shadowColor ??
          config?.shadowColor ??
          theme.shadowColor,
      shape: shape ??
          config?.shape ??
          theme.shape,
    );

    // Wait for the popup route to naturally dismiss
    await Navigator.of(context, rootNavigator: true)
        .push(
      _SFloatingPanelRoute(
          config: effectiveConfig,
          theme: theme),
    );

    // Trigger the callback cleanly after unmounting
    effectiveConfig
        .onClose
        ?.call();
  }

  /// Closes the topmost navigation route.
  static Future<void>
      close(BuildContext context) async {
    Navigator.of(context, rootNavigator: true)
        .pop();
  }
}

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
          SafeArea(
        bottom: false,
        child: page,
      ),
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
    final CurvedAnimation
        curvedAnimation =
        CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
    final CurvedAnimation
        opacity =
        CurvedAnimation(parent: animation, curve: Curves.easeIn);

    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(curvedAnimation),
      child:
          FadeTransition(
        opacity: opacity,
        child: child,
      ),
    );
  }
}

class _SFloatingPanelContent
    extends StatefulWidget {
  const _SFloatingPanelContent({
    required this.config,
    required this.theme,
  });

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
      setState(() {
        _dragOffset += details.delta.dy;
      });
    } else if (details.delta.dy < 0 &&
        _dragOffset > 0) {
      setState(() {
        _dragOffset += details.delta.dy;
        if (_dragOffset < 0) {
          _dragOffset = 0;
        }
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
      setState(() {
        _dragOffset = 0.0;
      });
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final double
        effectiveHorizontalMargin =
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
              left: effectiveHorizontalMargin / 2,
              right: effectiveHorizontalMargin / 2,
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
                    Container(
                      padding: widget.config.contentPadding,
                      decoration: ShapeDecoration(
                        color: widget.theme.backgroundColor ?? Colors.white,
                        shape: widget.config.shape ??
                            RoundedRectangleBorder(
                              borderRadius: widget.theme.borderRadius ?? BorderRadius.circular(24),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
                              ),
                            ),
                        shadows: (widget.config.elevation ?? widget.theme.elevation ?? 12) <= 0
                            ? null
                            : <BoxShadow>[
                                BoxShadow(
                                  color: widget.config.shadowColor ?? Colors.black.withOpacity(0.12),
                                  blurRadius: (widget.config.elevation ?? widget.theme.elevation ?? 12) * 2,
                                  spreadRadius: 2,
                                  offset: Offset(0, widget.config.elevation ?? widget.theme.elevation ?? 12),
                                ),
                                BoxShadow(
                                  color: widget.config.shadowColor ?? Colors.black.withOpacity(0.15),
                                  blurRadius: widget.config.elevation ?? widget.theme.elevation ?? 8,
                                  spreadRadius: -2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              if (widget.config.contentConfig != null) ...<Widget>[
                                if (widget.config.contentConfig!.icon != null) ...<Widget>[
                                  Center(child: widget.config.contentConfig!.icon),
                                  const SizedBox(height: 16),
                                ],
                                if (widget.config.contentConfig!.title != null) ...<Widget>[
                                  Text(
                                    widget.config.contentConfig!.title!,
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                if (widget.config.contentConfig!.description != null) ...<Widget>[
                                  Text(
                                    widget.config.contentConfig!.description!,
                                    style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                                if (widget.config.contentConfig!.child != null) widget.config.contentConfig!.child!,
                              ],
                              if (widget.config.content != null) widget.config.content!,
                            ],
                          ),
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
                    ),
                    if (widget.config.customBottomWidget != null) ...<Widget>[
                      SizedBox(height: widget.config.panelSpacing),
                      widget.config.customBottomWidget!,
                    ],
                    if (widget.config.bottomConfig != null) ...<Widget>[
                      SizedBox(height: widget.config.panelSpacing),
                      Container(
                        padding: widget.config.bottomConfig!.padding,
                        decoration: widget.config.bottomConfig!.backgroundColor != Colors.transparent
                            ? ShapeDecoration(
                                color: widget.config.bottomConfig!.backgroundColor ?? widget.theme.backgroundColor ?? Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: widget.config.bottomConfig!.borderRadius ?? BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
                                  ),
                                ),
                                shadows: widget.config.bottomConfig!.boxShadow ??
                                    ((widget.config.elevation ?? widget.theme.elevation ?? 12) <= 0
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
                        child: widget.config.bottomConfig!.customWidget ??
                            (widget.config.bottomConfig!.layout == SFloatingBottomLayout.row
                                ? Row(
                                    children: widget.config.bottomConfig!.actions.map<Widget>((Widget action) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0), child: action))).toList(),
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: widget.config.bottomConfig!.actions.map<Widget>((Widget action) => Padding(padding: const EdgeInsets.symmetric(vertical: 4.0), child: action)).toList(),
                                  )),
                      ),
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
}

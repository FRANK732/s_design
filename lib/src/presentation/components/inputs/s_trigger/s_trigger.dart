import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../s_design.dart';

enum STriggerAction {
  hover,
  click,
  focus,
  contextMenu
}

enum STriggerPlacement {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
  leftTop,
  leftCenter,
  leftBottom,
  rightTop,
  rightCenter,
  rightBottom,
}

class STriggerScope extends InheritedWidget {
  const STriggerScope({
    super.key,
    required this.onClose,
    required super.child,
  });

  final VoidCallback onClose;

  static STriggerScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<STriggerScope>();
  }

  @override
  bool updateShouldNotify(STriggerScope oldWidget) => false;
}

class STrigger
    extends StatefulWidget {
  const STrigger({
    super.key,
    required this.child,
    required this.popup,
    this.action =
        const <STriggerAction>[
      STriggerAction.hover
    ],
    this.placement =
        STriggerPlacement.bottomLeft,
    this.popupVisible,
    this.onPopupVisibleChange,
    this.mouseEnterDelay =
        const Duration(milliseconds: 100),
    this.mouseLeaveDelay =
        const Duration(milliseconds: 100),
    this.disabled =
        false,
    this.destroyPopupOnHide =
        false,
    this.gap =
        4.0,
    this.showArrow =
        false,
    this.popupAlign,
    this.getPopupContainer,
  });

  final Widget
      child;
  final Widget
      popup;
  final List<STriggerAction>
      action;
  final STriggerPlacement
      placement;

  /// Controlled visibility. If null, STrigger manages its own state.
  final bool?
      popupVisible;
  final ValueChanged<bool>?
      onPopupVisibleChange;

  final Duration
      mouseEnterDelay;
  final Duration
      mouseLeaveDelay;
  final bool
      disabled;
  final bool
      destroyPopupOnHide;

  /// Pixel gap between the trigger edge and the popup.
  final double
      gap;

  /// Whether to show a little arrow pointing back to the trigger.
  final bool
      showArrow;

  /// Reserved for future rc-trigger align spec offsets.
  final dynamic
      popupAlign;
  final dynamic
      getPopupContainer;

  /// Closes the nearest ancestor [STrigger] and triggers its parent cascade dismissal.
  static void close(BuildContext context) {
    STriggerScope.of(context)?.onClose();
  }

  @override
  State<STrigger>
      createState() =>
          _STriggerState();
}

class _STriggerState
    extends State<
        STrigger>
    with
        SingleTickerProviderStateMixin {
  bool
      _isVisible =
      false;

  DateTime? _mountedAt;

  STriggerScope? _parentScope;

  void _handleClose() {
    _fireVisibleChange(false);
    _parentScope?.onClose();
  }
  OverlayEntry?
      _overlayEntry;
  Timer?
      _delayTimer;
  ScrollPosition?
      _scrollPosition;

  late AnimationController
      _animationController;
  late Animation<double>
      _fadeAnimation;
  late Animation<double>
      _scaleAnimation;

  @override
  void
      initState() {
    super
        .initState();
    _mountedAt = DateTime.now();
    _isVisible =
        widget.popupVisible ?? false;
    _animationController =
        AnimationController(
      vsync:
          this,
      duration:
          const Duration(milliseconds: 180),
      reverseDuration:
          const Duration(milliseconds: 130),
    );
    _fadeAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut);
    _scaleAnimation =
        Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOutCubic),
    );

    if (_isVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          _showPopup());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _parentScope = STriggerScope.of(context);
    _scrollPosition?.removeListener(_handleScroll);
    _scrollPosition = Scrollable.maybeOf(context)?.position;
    _scrollPosition?.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_isVisible) {
      _fireVisibleChange(false);
    }
  }

  @override
  void didUpdateWidget(
      covariant STrigger
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.popupVisible != null &&
        widget.popupVisible != oldWidget.popupVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        if (widget.popupVisible!) {
          _showPopup();
        } else {
          _hidePopup();
        }
      });
    }
  }

  @override
  void
      dispose() {
    _scrollPosition?.removeListener(_handleScroll);
    _delayTimer
        ?.cancel();
    _animationController
        .dispose();
    _removeOverlay();
    super
        .dispose();
  }

  void _clearTimer() =>
      _delayTimer?.cancel();

  void _fireVisibleChange(
      bool
          visible) {
    if (widget
        .disabled) {
      return;
    }
    if (widget.popupVisible ==
        null) {
      if (visible) {
        _showPopup();
      } else {
        _hidePopup();
      }
    }
    widget
        .onPopupVisibleChange
        ?.call(visible);
  }

  void
      _onMouseEnter() {
    // Guard: Ignore hovers for the first 150ms to prevent auto-opening 
    // when a menu appears directly under the pointer (common on mobile).
    final bool isTooSoon = _mountedAt != null && 
        DateTime.now().difference(_mountedAt!).inMilliseconds < 150;
    if (isTooSoon) {
      return;
    }

    _clearTimer();
    _delayTimer = Timer(
        widget.mouseEnterDelay,
        () => _fireVisibleChange(true));
  }

  void
      _onMouseLeave() {
    _clearTimer();
    _delayTimer = Timer(
        widget.mouseLeaveDelay,
        () => _fireVisibleChange(false));
  }

  void _onClick() =>
      _fireVisibleChange(!_isVisible);
  void _onContextMenu() =>
      _fireVisibleChange(true);

  void
      _showPopup() {
    if (_isVisible &&
        _overlayEntry != null) {
      return;
    }
    if (widget
        .disabled) {
      return;
    }

    _overlayEntry =
        _createOverlayEntry();
    Overlay.of(context, rootOverlay: true)
        .insert(_overlayEntry!);
    setState(() =>
        _isVisible = true);
    _animationController
        .forward();
  }

  Future<void>
      _hidePopup() async {
    if (!_isVisible) {
      return;
    }
    setState(() =>
        _isVisible = false);
    await _animationController
        .reverse();
    if (!mounted ||
        _isVisible) {
      return;
    }
    _removeOverlay();
  }

  void
      _removeOverlay() {
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
  }

  OverlayEntry
      _createOverlayEntry() {
    return OverlayEntry(
      builder:
          (BuildContext ctx) {
        if (!mounted) {
          return const SizedBox.shrink();
        }
        final RenderBox? box = context.findRenderObject() as RenderBox?;
        if (box == null || !box.attached) {
          return const SizedBox.shrink();
        }

        final Offset globalOffset = box.localToGlobal(Offset.zero);
        final Size triggerSize = box.size;
        final Rect triggerRect = globalOffset & triggerSize;

        return _STriggerOverlay(
          triggerRect: triggerRect,
          placement: widget.placement,
          gap: widget.gap,
          showArrow: widget.showArrow,
          fadeAnimation: _fadeAnimation,
          scaleAnimation: _scaleAnimation,
          isHoverAction: widget.action.contains(STriggerAction.hover),
          isClickAction: widget.action.contains(STriggerAction.click),
          isContextMenuAction: widget.action.contains(STriggerAction.contextMenu),
          onPopupHoverEnter: _clearTimer,
          onPopupHoverExit: _onMouseLeave,
          onBackgroundTap: () => _fireVisibleChange(false),
          popup: STriggerScope(
            onClose: _handleClose,
            child: widget.popup,
          ),
        );
      },
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    Widget
        target =
        widget.child;

    // Use a combined Listener for click/contextMenu/hover-touch-fallback to
    // ensure we see the events even if children are interactive.
    final bool
        hasHover =
        widget.action.contains(STriggerAction.hover);
    final bool
        hasClick =
        widget.action.contains(STriggerAction.click);
    final bool
        hasContextMenu =
        widget.action.contains(STriggerAction.contextMenu);

    if (hasClick ||
        hasHover ||
        hasContextMenu) {
      target =
          Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (PointerDownEvent event) {
          if (widget.disabled) {
            return;
          }

          final bool isTouch = event.kind == PointerDeviceKind.touch || event.kind == PointerDeviceKind.stylus;
          final bool isLeftClick = event.buttons == 1;
          final bool isRightClick = event.buttons == 2;

          // Guard: Ignore events that occur too soon after the trigger is mounted.
          final bool isTooSoon = _mountedAt != null && 
              DateTime.now().difference(_mountedAt!).inMilliseconds < 100;

          if (isTouch && hasHover && !hasClick) {
            if (isTooSoon) {
              return;
            }
            _onClick();
          } else if (isLeftClick && hasClick) {
            _onClick();
          } else if (isRightClick && hasContextMenu) {
            _onContextMenu();
          }
        },
        child: target,
      );
    }

    if (widget
        .action
        .contains(STriggerAction.hover)) {
      target =
          MouseRegion(
        onEnter: (_) => _onMouseEnter(),
        onExit: (_) => _onMouseLeave(),
        child: target,
      );
    }

    if (widget
        .action
        .contains(STriggerAction.contextMenu)) {
      target =
          GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: _onContextMenu,
        child: target,
      );
    }

    return target;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Overlay widget: positions popup using screen-aware layout delegate
// ─────────────────────────────────────────────────────────────────────────────

class _STriggerOverlay
    extends StatelessWidget {
  const _STriggerOverlay({
    required this.triggerRect,
    required this.placement,
    required this.gap,
    required this.fadeAnimation,
    required this.scaleAnimation,
    required this.isHoverAction,
    required this.isClickAction,
    required this.isContextMenuAction,
    required this.onPopupHoverEnter,
    required this.onPopupHoverExit,
    required this.onBackgroundTap,
    required this.popup,
    required this.showArrow,
  });

  final Rect
      triggerRect;
  final STriggerPlacement
      placement;
  final double
      gap;
  final Animation<double>
      fadeAnimation;
  final Animation<double>
      scaleAnimation;
  final bool
      isHoverAction;
  final bool
      isClickAction;
  final bool
      isContextMenuAction;
  final VoidCallback
      onPopupHoverEnter;
  final VoidCallback
      onPopupHoverExit;
  final VoidCallback
      onBackgroundTap;
  final Widget
      popup;
  final bool
      showArrow;

  @override
  Widget build(
      BuildContext
          context) {
    final Size
        screen =
        MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        // Background dismiss layer for click/context-menu triggers
        if (isClickAction || isContextMenuAction)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onBackgroundTap,
              onSecondaryTap: onBackgroundTap,
            ),
          ),

        // The positioned popup with collision-safe layout
        CustomSingleChildLayout(
          delegate: _TriggerPositionDelegate(
            triggerRect: triggerRect,
            screenSize: screen,
            placement: placement,
            gap: gap,
          ),
          child: IntrinsicWidth(
            child: MouseRegion(
              onEnter: (_) {
                if (isHoverAction) {
                  onPopupHoverEnter();
                }
              },
              onExit: (_) {
                if (isHoverAction) {
                  onPopupHoverExit();
                }
              },
              child: FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  alignment: _scaleAlignment(placement),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      popup,
                      if (showArrow)
                        _TriggerArrow(
                          placement: placement,
                          triggerRect: triggerRect,
                          theme: STheme.of(context),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Alignment
      _scaleAlignment(STriggerPlacement p) {
    switch (
        p) {
      case STriggerPlacement.topLeft:
        return Alignment.bottomLeft;
      case STriggerPlacement.topCenter:
        return Alignment.bottomCenter;
      case STriggerPlacement.topRight:
        return Alignment.bottomRight;
      case STriggerPlacement.bottomLeft:
        return Alignment.topLeft;
      case STriggerPlacement.bottomCenter:
        return Alignment.topCenter;
      case STriggerPlacement.bottomRight:
        return Alignment.topRight;
      case STriggerPlacement.leftTop:
        return Alignment.topRight;
      case STriggerPlacement.leftCenter:
        return Alignment.centerRight;
      case STriggerPlacement.leftBottom:
        return Alignment.bottomRight;
      case STriggerPlacement.rightTop:
        return Alignment.topLeft;
      case STriggerPlacement.rightCenter:
        return Alignment.centerLeft;
      case STriggerPlacement.rightBottom:
        return Alignment.bottomLeft;
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Layout delegate: computes popup position with auto-flip and screen clamping
// ─────────────────────────────────────────────────────────────────────────────

class _TriggerPositionDelegate
    extends SingleChildLayoutDelegate {
  const _TriggerPositionDelegate({
    required this.triggerRect,
    required this.screenSize,
    required this.placement,
    required this.gap,
  });

  final Rect
      triggerRect;
  final Size
      screenSize;
  final STriggerPlacement
      placement;
  final double
      gap;

  static const double
      _screenPadding =
      8.0;

  @override
  BoxConstraints
      getConstraintsForChild(BoxConstraints constraints) {
    // Let popup be as large as it wants, up to screen bounds minus padding
    return BoxConstraints(
      maxWidth:
          screenSize.width - _screenPadding * 2,
      maxHeight:
          screenSize.height - _screenPadding * 2,
    );
  }

  @override
  Offset getPositionForChild(
      Size
          size,
      Size
          childSize) {
    // Ideal position from spec'd placement
    Offset
        pos =
        _idealPosition(childSize, placement);

    // ── Auto-flip ──────────────────────────────────────────────────────────
    bool
        flipped =
        false;
    switch (
        placement) {
      // verticals: flip top ↔ bottom
      case STriggerPlacement.bottomLeft:
      case STriggerPlacement.bottomCenter:
      case STriggerPlacement.bottomRight:
        if (pos.dy + childSize.height > screenSize.height - _screenPadding) {
          pos = _idealPosition(childSize, _flipVertical(placement));
          flipped = true;
        }
      case STriggerPlacement.topLeft:
      case STriggerPlacement.topCenter:
      case STriggerPlacement.topRight:
        if (pos.dy < _screenPadding && !flipped) {
          pos = _idealPosition(childSize, _flipVertical(placement));
        }
      // horizontals: flip left ↔ right
      case STriggerPlacement.rightTop:
      case STriggerPlacement.rightCenter:
      case STriggerPlacement.rightBottom:
        if (pos.dx + childSize.width > screenSize.width - _screenPadding) {
          pos = _idealPosition(childSize, _flipHorizontal(placement));
          flipped = true;
        }
      case STriggerPlacement.leftTop:
      case STriggerPlacement.leftCenter:
      case STriggerPlacement.leftBottom:
        if (pos.dx < _screenPadding && !flipped) {
          pos = _idealPosition(childSize, _flipHorizontal(placement));
        }
    }

    // ── Final clamp to screen ──────────────────────────────────────────────
    final double
        left =
        pos.dx.clamp(_screenPadding, screenSize.width - childSize.width - _screenPadding);
    final double
        top =
        pos.dy.clamp(_screenPadding, screenSize.height - childSize.height - _screenPadding);

    return Offset(
        left,
        top);
  }

  Offset _idealPosition(
      Size
          childSize,
      STriggerPlacement
          p) {
    final double
        tw =
        triggerRect.width;
    final double
        th =
        triggerRect.height;
    final double
        l =
        triggerRect.left;
    final double
        t =
        triggerRect.top;
    final double
        r =
        triggerRect.right;
    final double
        b =
        triggerRect.bottom;
    final double
        cw =
        childSize.width;
    final double
        ch =
        childSize.height;

    switch (
        p) {
      case STriggerPlacement.bottomLeft:
        return Offset(l, b + gap);
      case STriggerPlacement.bottomCenter:
        return Offset(l + tw / 2 - cw / 2, b + gap);
      case STriggerPlacement.bottomRight:
        return Offset(r - cw, b + gap);
      case STriggerPlacement.topLeft:
        return Offset(l, t - ch - gap);
      case STriggerPlacement.topCenter:
        return Offset(l + tw / 2 - cw / 2, t - ch - gap);
      case STriggerPlacement.topRight:
        return Offset(r - cw, t - ch - gap);
      case STriggerPlacement.leftTop:
        return Offset(l - cw - gap, t);
      case STriggerPlacement.leftCenter:
        return Offset(l - cw - gap, t + th / 2 - ch / 2);
      case STriggerPlacement.leftBottom:
        return Offset(l - cw - gap, b - ch);
      case STriggerPlacement.rightTop:
        return Offset(r + gap, t);
      case STriggerPlacement.rightCenter:
        return Offset(r + gap, t + th / 2 - ch / 2);
      case STriggerPlacement.rightBottom:
        return Offset(r + gap, b - ch);
    }
  }

  STriggerPlacement
      _flipVertical(STriggerPlacement p) {
    const Map<STriggerPlacement, STriggerPlacement>
        map =
        <STriggerPlacement, STriggerPlacement>{
      STriggerPlacement.bottomLeft:
          STriggerPlacement.topLeft,
      STriggerPlacement.bottomCenter:
          STriggerPlacement.topCenter,
      STriggerPlacement.bottomRight:
          STriggerPlacement.topRight,
      STriggerPlacement.topLeft:
          STriggerPlacement.bottomLeft,
      STriggerPlacement.topCenter:
          STriggerPlacement.bottomCenter,
      STriggerPlacement.topRight:
          STriggerPlacement.bottomRight,
    };
    return map[p] ??
        p;
  }

  STriggerPlacement
      _flipHorizontal(STriggerPlacement p) {
    const Map<STriggerPlacement, STriggerPlacement>
        map =
        <STriggerPlacement, STriggerPlacement>{
      STriggerPlacement.rightTop:
          STriggerPlacement.leftTop,
      STriggerPlacement.rightCenter:
          STriggerPlacement.leftCenter,
      STriggerPlacement.rightBottom:
          STriggerPlacement.leftBottom,
      STriggerPlacement.leftTop:
          STriggerPlacement.rightTop,
      STriggerPlacement.leftCenter:
          STriggerPlacement.rightCenter,
      STriggerPlacement.leftBottom:
          STriggerPlacement.rightBottom,
    };
    return map[p] ??
        p;
  }

  @override
  bool shouldRelayout(_TriggerPositionDelegate old) =>
      triggerRect != old.triggerRect ||
      placement !=
          old.placement ||
      gap != old.gap;
}

// ─────────────────────────────────────────────────────────────────────────────
// Arrow: A small geometric triangle pointing to the trigger
// ─────────────────────────────────────────────────────────────────────────────

class _TriggerArrow
    extends StatelessWidget {
  const _TriggerArrow({
    required this.placement,
    required this.triggerRect,
    required this.theme,
  });

  final STriggerPlacement
      placement;
  final Rect
      triggerRect;
  final SThemeData
      theme;

  static const double
      arrowSize =
      10.0;

  @override
  Widget build(
      BuildContext
          context) {
    double?
        left,
        top,
        right,
        bottom;
    double
        angle =
        0;

    switch (
        placement) {
      case STriggerPlacement.bottomLeft:
        top = -arrowSize + 1.5;
        left = 12.0;
        angle = 0;
      case STriggerPlacement.bottomCenter:
        top = -arrowSize + 1.5;
        left = 0;
        right = 0;
        angle = 0;
      case STriggerPlacement.bottomRight:
        top = -arrowSize + 1.5;
        right = 12.0;
        angle = 0;
      case STriggerPlacement.topLeft:
        bottom = -arrowSize + 1.5;
        left = 12.0;
        angle = 3.14159; // PI
      case STriggerPlacement.topCenter:
        bottom = -arrowSize + 1.5;
        left = 0;
        right = 0;
        angle = 3.14159;
      case STriggerPlacement.topRight:
        bottom = -arrowSize + 1.5;
        right = 12.0;
        angle = 3.14159;
      case STriggerPlacement.leftTop:
        right = -arrowSize + 1.5;
        top = 12.0;
        angle = 3.14159 / 2;
      case STriggerPlacement.leftCenter:
        right = -arrowSize + 1.5;
        top = 0;
        bottom = 0;
        angle = 3.14159 / 2;
      case STriggerPlacement.leftBottom:
        right = -arrowSize + 1.5;
        bottom = 12.0;
        angle = 3.14159 / 2;
      case STriggerPlacement.rightTop:
        left = -arrowSize + 1.5;
        top = 12.0;
        angle = -3.14159 / 2;
      case STriggerPlacement.rightCenter:
        left = -arrowSize + 1.5;
        top = 0;
        bottom = 0;
        angle = -3.14159 / 2;
      case STriggerPlacement.rightBottom:
        left = -arrowSize + 1.5;
        bottom = 12.0;
        angle = -3.14159 / 2;
    }

    final Widget
        arrow =
        Center(
      child:
          Transform.rotate(
        angle: angle,
        child: CustomPaint(
          size: const Size(arrowSize, arrowSize),
          painter: _ArrowPainter(
            color: theme.colorToken.surface,
            borderColor: theme.colorToken.divider.withOpacity(0.5),
          ),
        ),
      ),
    );

    return Positioned(
      left:
          left,
      top:
          top,
      right:
          right,
      bottom:
          bottom,
      child:
          SizedBox(
        width: arrowSize,
        height: arrowSize,
        child: arrow,
      ),
    );
  }
}

class _ArrowPainter
    extends CustomPainter {
  const _ArrowPainter({
    required this.color,
    required this.borderColor,
  });

  final Color
      color;
  final Color
      borderColor;

  @override
  void paint(
      Canvas
          canvas,
      Size
          size) {
    final Path
        path =
        Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();

    canvas.drawPath(
        path,
        Paint()..color = color);

    final Paint
        borderPaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0;

    final Path
        borderPath =
        Path()
          ..moveTo(0, size.height)
          ..lineTo(size.width / 2, 0)
          ..lineTo(size.width, size.height);

    canvas.drawPath(
        borderPath,
        borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false;
}

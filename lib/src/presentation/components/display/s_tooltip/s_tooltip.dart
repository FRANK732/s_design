import 'dart:async';
import 'dart:math'
    as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../../../themes/extensions/component_themes/s_tooltip_theme.dart';

part 's_tooltip_enums.dart';
part 's_tooltip_overlay.dart';
part 's_tooltip_positioner.dart';

/// Features premium aesthetics, 12 placement directions, auto-flipping
/// logic when hitting screen boundaries, and smooth animations.
///
class STooltip
    extends StatefulWidget {
  const STooltip({
    super.key,
    required this.child,
    required this.content,
    this.placement =
        STooltipPlacement.top,
    this.trigger =
        STooltipTrigger.hover,
    this.visible,
    this.onVisibleChange,
    this.mouseCursor =
        SystemMouseCursors.click,
    this.color,
    this.textColor,
    this.padding,
    this.borderRadius,
    this.showArrow =
        true,
    this.arrowSize,
    this.offset =
        8.0,
    this.autoFlip =
        true,
    this.autoShow =
        false,
    this.autoShowDuration =
        const Duration(seconds: 5),
    this.animationDuration,
    this.elevation,
    this.showCloseButton =
        false,
  });

  /// Whether to show a close button. If true, the tooltip remains visible until closed manually.
  final bool
      showCloseButton;

  /// Whether to automatically show the tooltip when it is first built.
  final bool
      autoShow;

  /// The duration to keep the tooltip visible when [autoShow] is true. Defaults to 5 seconds.
  final Duration
      autoShowDuration;

  /// The widget that triggers the tooltip.
  final Widget
      child;

  /// The content displayed inside the tooltip bubble.
  final Widget
      content;

  /// Preferred placement of the tooltip relative to the [child].
  final STooltipPlacement
      placement;

  /// How the tooltip is triggered.
  final STooltipTrigger
      trigger;

  /// Manual visibility control. If provided, the tooltip will be controlled externally.
  final bool?
      visible;

  /// Callback when visibility changes.
  final ValueChanged<bool>?
      onVisibleChange;

  /// Cursor to show when hovering over the trigger.
  final MouseCursor
      mouseCursor;

  /// Background color override. Uses [STooltipThemeData.backgroundColor] by default.
  final Color?
      color;

  /// Text color override.
  final Color?
      textColor;

  /// Padding override.
  final EdgeInsetsGeometry?
      padding;

  /// Border radius override.
  final BorderRadiusGeometry?
      borderRadius;

  /// Whether to show the orientation arrow.
  final bool
      showArrow;

  /// The size of the arrow.
  final double?
      arrowSize;

  /// The distance between the target and the tooltip.
  final double
      offset;

  /// Whether to automatically flip the tooltip if there is no space in the preferred direction.
  final bool
      autoFlip;

  /// Duration of the fade/scale animation.
  final Duration?
      animationDuration;

  /// The z-axis elevation for the tooltip overlay.
  final double?
      elevation;

  @override
  State<STooltip>
      createState() =>
          _STooltipState();
}

class _STooltipState
    extends State<
        STooltip>
    with
        SingleTickerProviderStateMixin {
  OverlayEntry?
      _overlayEntry;
  final LayerLink
      _layerLink =
      LayerLink();
  bool
      _isVisible =
      false;
  Timer?
      _hoverTimer;
  Timer?
      _autoHideTimer;

  late final AnimationController
      _animationController;
  late final Animation<double>
      _scaleAnimation;
  late final Animation<double>
      _fadeAnimation;

  @override
  void
      initState() {
    super
        .initState();
    _animationController =
        AnimationController(
      vsync:
          this,
      duration:
          widget.animationDuration ?? const Duration(milliseconds: 200),
    );
    _scaleAnimation =
        CurvedAnimation(
      parent:
          _animationController,
      curve:
          Curves.easeOutBack,
    );
    _fadeAnimation =
        CurvedAnimation(
      parent:
          _animationController,
      curve:
          Curves.easeIn,
    );

    if (widget.visible !=
        null) {
      _isVisible =
          widget.visible!;
      if (_isVisible) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _showTooltip();
          }
        });
      }
    } else if (widget
        .autoShow) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showTooltip();
          if (!widget.showCloseButton) {
            _autoHideTimer = Timer(widget.autoShowDuration, () {
              if (mounted) {
                _hideTooltip();
              }
            });
          }
        }
      });
    }
  }

  @override
  void didUpdateWidget(
      STooltip
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.visible != oldWidget.visible &&
        widget.visible != null) {
      if (widget.visible!) {
        _showTooltip();
      } else {
        _hideTooltip();
      }
    }
  }

  @override
  void
      dispose() {
    _autoHideTimer
        ?.cancel();
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
    _animationController
        .dispose();
    _hoverTimer
        ?.cancel();
    super
        .dispose();
  }

  void
      _toggleTooltip() {
    if (_isVisible) {
      _hideTooltip();
    } else {
      _showTooltip();
    }
  }

  void
      _showTooltip() {
    if (_isVisible &&
        _overlayEntry != null) {
      return;
    }

    _isVisible =
        true;
    _overlayEntry =
        _createOverlayEntry();
    Overlay.of(context, rootOverlay: true)
        .insert(_overlayEntry!);
    _animationController
        .forward();
    widget
        .onVisibleChange
        ?.call(true);
  }

  void
      _hideTooltip() {
    _autoHideTimer
        ?.cancel();
    if (!_isVisible) {
      return;
    }

    _animationController
        .reverse()
        .then((_) {
      if (!mounted) {
        return;
      }
      _overlayEntry?.remove();
      _overlayEntry =
          null;
      setState(() {
        _isVisible = false;
      });
      widget.onVisibleChange?.call(false);
    }).catchError((_) {
      if (!mounted) {
        return;
      }
      _overlayEntry?.remove();
      _overlayEntry =
          null;
      setState(() {
        _isVisible = false;
      });
      widget.onVisibleChange?.call(false);
    });
  }

  void _handleHover(
      bool
          hovering) {
    if (widget.trigger !=
        STooltipTrigger.hover) {
      return;
    }
    _hoverTimer
        ?.cancel();
    if (hovering) {
      _showTooltip();
    } else {
      if (!widget.showCloseButton) {
        _hoverTimer = Timer(const Duration(milliseconds: 100), _hideTooltip);
      }
    }
  }

  OverlayEntry
      _createOverlayEntry() {
    final RenderBox?
        renderBox =
        context.findRenderObject() as RenderBox?;
    final Rect targetGlobalRect = renderBox != null
        ? (renderBox.localToGlobal(Offset.zero) & renderBox.size)
        : Rect.zero;

    return OverlayEntry(
      builder:
          (BuildContext context) {
        if (!mounted) {
          return const SizedBox.shrink();
        }
        final STooltipThemeData theme = Theme.of(context).sTooltipTheme;
        final Color backgroundColor = widget.color ?? theme.backgroundColor;
        final EdgeInsetsGeometry? actualPadding = widget.padding ?? theme.padding;
        final BorderRadiusGeometry actualBorderRadius = widget.borderRadius ?? theme.borderRadius ?? BorderRadius.circular(4);

        final Widget overlayBody = _STooltipOverlay(
          layerLink: _layerLink,
          placement: widget.placement,
          offset: widget.offset,
          autoFlip: widget.autoFlip,
          showArrow: widget.showArrow,
          arrowSize: widget.arrowSize ?? theme.arrowSize,
          animation: _animationController,
          scaleAnimation: _scaleAnimation,
          fadeAnimation: _fadeAnimation,
          backgroundColor: backgroundColor,
          padding: actualPadding,
          borderRadius: actualBorderRadius,
          elevation: widget.elevation ?? theme.elevation,
          shadowColor: theme.shadowColor ?? Colors.black26,
          screenSize: MediaQuery.of(context).size,
          targetGlobalRect: targetGlobalRect,
          content: DefaultTextStyle(
            style: theme.textStyle?.copyWith(color: widget.textColor ?? theme.textColor) ?? TextStyle(color: widget.textColor ?? theme.textColor, fontSize: 12),
            child: widget.showCloseButton
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.content,
                      const SizedBox(width: 8),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: _hideTooltip,
                          child: Icon(
                            Icons.close,
                            size: 14,
                            color: widget.textColor ?? theme.textColor,
                          ),
                        ),
                      ),
                    ],
                  )
                : widget.content,
          ),
          onHover: _handleHover,
        );

        if (widget.trigger == STooltipTrigger.click) {
          return Stack(
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _hideTooltip,
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              overlayBody,
            ],
          );
        }
        return overlayBody;
      },
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    Widget
        result =
        CompositedTransformTarget(
      link:
          _layerLink,
      child:
          widget.child,
    );

    if (widget.trigger ==
        STooltipTrigger
            .hover) {
      result =
          GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: _showTooltip,
        onLongPressEnd: (_) => _hideTooltip(),
        child: MouseRegion(
          cursor: widget.mouseCursor,
          onEnter: (_) => _handleHover(true),
          onExit: (_) => _handleHover(false),
          child: result,
        ),
      );
    } else if (widget.trigger ==
        STooltipTrigger
            .click) {
      result =
          Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) => _toggleTooltip(),
        child: result,
      );
    } else if (widget.trigger ==
        STooltipTrigger.longPress) {
      result =
          GestureDetector(
        onLongPress: _showTooltip,
        onLongPressEnd: (_) => _hideTooltip(),
        child: result,
      );
    }

    return result;
  }
}

part of 's_tooltip.dart';

class _STooltipPositioner
    extends SingleChildRenderObjectWidget {
  const _STooltipPositioner({
    required this.layerLink,
    required this.placement,
    required this.offset,
    required this.autoFlip,
    required this.showArrow,
    required this.arrowSize,
    required this.backgroundColor,
    required this.borderRadius,
    required this.elevation,
    required this.shadowColor,
    required this.animation,
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.onHover,
    required this.screenSize,
    required this.targetGlobalRect,
    this.padding,
    super.child,
  });

  final LayerLink
      layerLink;
  final STooltipPlacement
      placement;
  final double
      offset;
  final bool
      autoFlip;
  final bool
      showArrow;
  final double
      arrowSize;
  final Color
      backgroundColor;
  final EdgeInsetsGeometry?
      padding;
  final BorderRadiusGeometry
      borderRadius;
  final double
      elevation;
  final Color
      shadowColor;
  final Animation<double>
      animation;
  final Animation<double>
      scaleAnimation;
  final Animation<double>
      fadeAnimation;
  final Size
      screenSize;
  final Rect
      targetGlobalRect;
  final ValueChanged<bool>
      onHover;

  @override
  RenderObject
      createRenderObject(BuildContext context) {
    return _RenderSTooltipPositioner(
      layerLink:
          layerLink,
      placement:
          placement,
      offsetValue:
          offset,
      autoFlip:
          autoFlip,
      showArrow:
          showArrow,
      arrowSize:
          arrowSize,
      backgroundColor:
          backgroundColor,
      padding:
          padding,
      borderRadius:
          borderRadius,
      elevation:
          elevation,
      shadowColor:
          shadowColor,
      animation:
          animation,
      scaleAnimation:
          scaleAnimation,
      fadeAnimation:
          fadeAnimation,
      onHover:
          onHover,
      screenSize:
          screenSize,
      targetGlobalRect:
          targetGlobalRect,
    );
  }

  @override
  void updateRenderObject(
      BuildContext
          context,
      _RenderSTooltipPositioner
          renderObject) {
    renderObject
      ..placement =
          placement
      ..offsetValue =
          offset
      ..autoFlip =
          autoFlip
      ..showArrow =
          showArrow
      ..arrowSize =
          arrowSize
      ..backgroundColor =
          backgroundColor
      ..padding =
          padding
      ..borderRadius =
          borderRadius
      ..elevation =
          elevation
      ..shadowColor =
          shadowColor
      ..screenSize =
          screenSize
      ..targetGlobalRect =
          targetGlobalRect;
  }
}

class _RenderSTooltipPositioner
    extends RenderProxyBox {
  _RenderSTooltipPositioner({
    required LayerLink
        layerLink,
    required STooltipPlacement
        placement,
    required double
        offsetValue,
    required bool
        autoFlip,
    required bool
        showArrow,
    required double
        arrowSize,
    required Color
        backgroundColor,
    required EdgeInsetsGeometry?
        padding,
    required BorderRadiusGeometry
        borderRadius,
    required double
        elevation,
    required Color
        shadowColor,
    required Animation<double>
        animation,
    required Animation<double>
        scaleAnimation,
    required Animation<double>
        fadeAnimation,
    required ValueChanged<bool>
        onHover,
    required Size
        screenSize,
    required Rect
        targetGlobalRect,
  })  : _layerLink = layerLink,
        _placement = placement,
        _offsetValue = offsetValue,
        _autoFlip = autoFlip,
        _showArrow = showArrow,
        _arrowSize = arrowSize,
        _backgroundColor = backgroundColor,
        _padding = padding,
        _borderRadius = borderRadius,
        _elevation = elevation,
        _shadowColor = shadowColor,
        _animation = animation,
        _scaleAnimation = scaleAnimation,
        _fadeAnimation = fadeAnimation,
        _onHover = onHover,
        _screenSize = screenSize,
        _targetGlobalRect = targetGlobalRect {
    _animation
        .addListener(markNeedsPaint);
  }

  @override
  void
      dispose() {
    _animation
        .removeListener(markNeedsPaint);
    super
        .dispose();
  }

  final LayerLink
      _layerLink;
  STooltipPlacement
      _placement;
  double
      _offsetValue;
  bool
      _autoFlip;
  bool
      _showArrow;
  double
      _arrowSize;
  Color
      _backgroundColor;
  EdgeInsetsGeometry?
      _padding;
  BorderRadiusGeometry
      _borderRadius;
  double
      _elevation;
  Color
      _shadowColor;
  Size
      _screenSize;
  Rect
      _targetGlobalRect;
  final Animation<double>
      _animation;
  final Animation<double>
      _scaleAnimation;
  final Animation<double>
      _fadeAnimation;
  final ValueChanged<bool>
      _onHover;

  // Internal state
  Offset
      _tooltipOffset =
      Offset.zero;
  STooltipPlacement
      _actualPlacement =
      STooltipPlacement.top;
  Rect
      _targetRect =
      Rect.zero;

  STooltipPlacement
      get placement =>
          _placement;
  set placement(
      STooltipPlacement
          value) {
    if (_placement ==
        value) {
      return;
    }
    _placement =
        value;
    markNeedsLayout();
  }

  double get offsetValue =>
      _offsetValue;
  set offsetValue(
      double
          value) {
    if (_offsetValue ==
        value) {
      return;
    }
    _offsetValue =
        value;
    markNeedsLayout();
  }

  bool get autoFlip =>
      _autoFlip;
  set autoFlip(
      bool
          value) {
    if (_autoFlip ==
        value) {
      return;
    }
    _autoFlip =
        value;
    markNeedsLayout();
  }

  bool get showArrow =>
      _showArrow;
  set showArrow(
      bool
          value) {
    if (_showArrow ==
        value) {
      return;
    }
    _showArrow =
        value;
    markNeedsPaint();
  }

  double get arrowSize =>
      _arrowSize;
  set arrowSize(
      double
          value) {
    if (_arrowSize ==
        value) {
      return;
    }
    _arrowSize =
        value;
    markNeedsPaint();
  }

  Color get backgroundColor =>
      _backgroundColor;
  set backgroundColor(
      Color
          value) {
    if (_backgroundColor ==
        value) {
      return;
    }
    _backgroundColor =
        value;
    markNeedsPaint();
  }

  EdgeInsetsGeometry?
      get padding =>
          _padding;
  set padding(
      EdgeInsetsGeometry?
          value) {
    if (_padding ==
        value) {
      return;
    }
    _padding =
        value;
    markNeedsLayout();
  }

  BorderRadiusGeometry
      get borderRadius =>
          _borderRadius;
  set borderRadius(
      BorderRadiusGeometry
          value) {
    if (_borderRadius ==
        value) {
      return;
    }
    _borderRadius =
        value;
    markNeedsPaint();
  }

  double get elevation =>
      _elevation;
  set elevation(
      double
          value) {
    if (_elevation ==
        value) {
      return;
    }
    _elevation =
        value;
    markNeedsPaint();
  }

  Color get shadowColor =>
      _shadowColor;
  set shadowColor(
      Color
          value) {
    if (_shadowColor ==
        value) {
      return;
    }
    _shadowColor =
        value;
    markNeedsPaint();
  }

  Size get screenSize =>
      _screenSize;
  set screenSize(
      Size
          value) {
    if (_screenSize ==
        value) {
      return;
    }
    _screenSize =
        value;
    markNeedsLayout();
  }

  Rect get targetGlobalRect =>
      _targetGlobalRect;
  set targetGlobalRect(
      Rect
          value) {
    if (_targetGlobalRect ==
        value) {
      return;
    }
    _targetGlobalRect =
        value;
    markNeedsLayout();
  }

  @override
  void handleEvent(
      PointerEvent
          event,
      HitTestEntry
          entry) {
    if (event
        is PointerEnterEvent) {
      _onHover(true);
    } else if (event
        is PointerExitEvent) {
      _onHover(false);
    }
  }

  @override
  bool hitTestChildren(
      BoxHitTestResult
          result,
      {required Offset
          position}) {
    if (child != null &&
        _animation.value > 0) {
      final double
          scale =
          _scaleAnimation.value;
      if (scale ==
          0) {
        return false;
      }

      Offset
          pivot =
          Offset(size.width / 2, size.height / 2);
      switch (_actualPlacement) {
        case STooltipPlacement.top:
          pivot = Offset(size.width / 2, size.height);
        case STooltipPlacement.bottom:
          pivot = Offset(size.width / 2, 0);
        case STooltipPlacement.left:
          pivot = Offset(size.width, size.height / 2);
        case STooltipPlacement.right:
          pivot = Offset(0, size.height / 2);
        default:
          break;
      }

      final EdgeInsets
          resolvedPadding =
          _padding?.resolve(TextDirection.ltr) ?? EdgeInsets.zero;

      Offset
          transformed =
          position - _tooltipOffset;
      transformed =
          transformed - pivot;
      transformed =
          transformed / scale;
      transformed =
          transformed + pivot;

      return result.addWithPaintOffset(
        offset: resolvedPadding.topLeft,
        position: transformed,
        hitTest: (BoxHitTestResult result, Offset position) {
          return child!.hitTest(result, position: position);
        },
      );
    }
    return false;
  }

  @override
  bool hitTest(
      BoxHitTestResult
          result,
      {required Offset
          position}) {
    // Offset the hit test based on the calculated tooltip position
    final Offset
        translatedPosition =
        position - _tooltipOffset;
    if (size
        .contains(translatedPosition)) {
      if (hitTestChildren(result, position: position) ||
          hitTestSelf(position)) {
        result.add(BoxHitTestEntry(this, position));
        return true;
      }
    }
    return false;
  }

  @override
  void
      performLayout() {
    if (child !=
        null) {
      final EdgeInsets
          resolvedPadding =
          _padding?.resolve(TextDirection.ltr) ?? EdgeInsets.zero;

      child!.layout(constraints.loosen().deflate(resolvedPadding),
          parentUsesSize: true);

      size =
          constraints.constrain(resolvedPadding.inflateSize(child!.size));

      _calculatePosition();
    } else {
      size =
          constraints.smallest;
    }
  }

  void
      _calculatePosition() {
    final Size?
        leaderSize =
        _layerLink.leaderSize;
    if (leaderSize ==
        null) {
      return;
    }

    _targetRect =
        Offset.zero & leaderSize;

    _actualPlacement =
        _placement;
    if (_autoFlip) {
      _actualPlacement = _flipPlacementIfNeeded(
          _placement,
          _targetGlobalRect,
          size,
          _screenSize);
    }

    _tooltipOffset = _getOffsetForPlacement(
        _actualPlacement,
        _targetRect,
        size);
  }

  STooltipPlacement _flipPlacementIfNeeded(
      STooltipPlacement
          p,
      Rect
          target,
      Size
          tip,
      Size
          screen) {
    // Check Y axis
    if (p == STooltipPlacement.top ||
        p == STooltipPlacement.topLeft ||
        p == STooltipPlacement.topRight) {
      if (target.top <
          tip.height + _offsetValue + _arrowSize) {
        return _flipPlacement(p);
      }
    } else if (p == STooltipPlacement.bottom || p == STooltipPlacement.bottomLeft || p == STooltipPlacement.bottomRight) {
      if (screen.height - target.bottom <
          tip.height + _offsetValue + _arrowSize) {
        return _flipPlacement(p);
      }
    }
    // Check X axis
    if (p == STooltipPlacement.left ||
        p == STooltipPlacement.leftTop ||
        p == STooltipPlacement.leftBottom) {
      if (target.left <
          tip.width + _offsetValue + _arrowSize) {
        return _flipPlacement(p);
      }
    } else if (p == STooltipPlacement.right || p == STooltipPlacement.rightTop || p == STooltipPlacement.rightBottom) {
      if (screen.width - target.right <
          tip.width + _offsetValue + _arrowSize) {
        return _flipPlacement(p);
      }
    }
    return p;
  }

  STooltipPlacement
      _flipPlacement(STooltipPlacement p) {
    switch (
        p) {
      case STooltipPlacement.top:
        return STooltipPlacement.bottom;
      case STooltipPlacement.topLeft:
        return STooltipPlacement.bottomLeft;
      case STooltipPlacement.topRight:
        return STooltipPlacement.bottomRight;
      case STooltipPlacement.bottom:
        return STooltipPlacement.top;
      case STooltipPlacement.bottomLeft:
        return STooltipPlacement.topLeft;
      case STooltipPlacement.bottomRight:
        return STooltipPlacement.topRight;
      case STooltipPlacement.left:
        return STooltipPlacement.right;
      case STooltipPlacement.leftTop:
        return STooltipPlacement.rightTop;
      case STooltipPlacement.leftBottom:
        return STooltipPlacement.rightBottom;
      case STooltipPlacement.right:
        return STooltipPlacement.left;
      case STooltipPlacement.rightTop:
        return STooltipPlacement.leftTop;
      case STooltipPlacement.rightBottom:
        return STooltipPlacement.leftBottom;
    }
  }

  Offset _getOffsetForPlacement(
      STooltipPlacement
          p,
      Rect
          target,
      Size
          tip) {
    double
        x = 0,
        y = 0;
    final double
        gap =
        _offsetValue + (_showArrow ? _arrowSize : 0);

    switch (
        p) {
      case STooltipPlacement.top:
        x = (target.width - tip.width) / 2;
        y = -tip.height - gap;
      case STooltipPlacement.topLeft:
        x = 0;
        y = -tip.height - gap;
      case STooltipPlacement.topRight:
        x = target.width - tip.width;
        y = -tip.height - gap;
      case STooltipPlacement.bottom:
        x = (target.width - tip.width) / 2;
        y = target.height + gap;
      case STooltipPlacement.bottomLeft:
        x = 0;
        y = target.height + gap;
      case STooltipPlacement.bottomRight:
        x = target.width - tip.width;
        y = target.height + gap;
      case STooltipPlacement.left:
        x = -tip.width - gap;
        y = (target.height - tip.height) / 2;
      case STooltipPlacement.leftTop:
        x = -tip.width - gap;
        y = 0;
      case STooltipPlacement.leftBottom:
        x = -tip.width - gap;
        y = target.height - tip.height;
      case STooltipPlacement.right:
        x = target.width + gap;
        y = (target.height - tip.height) / 2;
      case STooltipPlacement.rightTop:
        x = target.width + gap;
        y = 0;
      case STooltipPlacement.rightBottom:
        x = target.width + gap;
        y = target.height - tip.height;
    }
    return Offset(
        x,
        y);
  }

  @override
  void paint(
      PaintingContext
          context,
      Offset
          offset) {
    if (child != null &&
        _animation.value > 0) {
      final Canvas
          canvas =
          context.canvas;

      // Calculate paint offset including animation scale
      final double
          scale =
          _scaleAnimation.value;
      final double
          opacity =
          _fadeAnimation.value;

      // Determine pivot for scale
      Offset
          pivot =
          Offset(size.width / 2, size.height / 2);
      switch (_actualPlacement) {
        case STooltipPlacement.top:
          pivot = Offset(size.width / 2, size.height);
        case STooltipPlacement.bottom:
          pivot = Offset(size.width / 2, 0);
        case STooltipPlacement.left:
          pivot = Offset(size.width, size.height / 2);
        case STooltipPlacement.right:
          pivot = Offset(0, size.height / 2);
        default:
          break;
      }

      final Paint paint = Paint()
        ..color = _backgroundColor.withOpacity(opacity);

      canvas.save();
      canvas.translate(offset.dx + _tooltipOffset.dx + pivot.dx,
          offset.dy + _tooltipOffset.dy + pivot.dy);
      canvas.scale(scale);
      canvas.translate(-pivot.dx,
          -pivot.dy);

      // Draw shadow
      if (_elevation >
          0) {
        final Path shadowPath = Path()..addRRect(_borderRadius.resolve(TextDirection.ltr).toRRect(Offset.zero & size));
        canvas.drawShadow(shadowPath, _shadowColor, _elevation, true);
      }

      // Draw bubble
      canvas.drawRRect(
        _borderRadius.resolve(TextDirection.ltr).toRRect(Offset.zero & size),
        paint,
      );

      // Draw arrow
      if (_showArrow) {
        _paintArrow(canvas, paint);
      }

      // Paint child
      final EdgeInsets
          resolvedPadding =
          _padding?.resolve(TextDirection.ltr) ?? EdgeInsets.zero;
      context.paintChild(child!,
          resolvedPadding.topLeft);

      canvas.restore();
    }
  }

  void _paintArrow(
      Canvas
          canvas,
      Paint
          paint) {
    final Path
        path =
        Path();
    final double
        s =
        _arrowSize;

    switch (
        _actualPlacement) {
      case STooltipPlacement.top:
      case STooltipPlacement.topLeft:
      case STooltipPlacement.topRight:
        double x = size.width / 2;
        if (_actualPlacement == STooltipPlacement.topLeft) {
          x = math.min(16, size.width / 2);
        }
        if (_actualPlacement == STooltipPlacement.topRight) {
          x = math.max(size.width - 16, size.width / 2);
        }
        path.moveTo(x - s, size.height);
        path.lineTo(x + s, size.height);
        path.lineTo(x, size.height + s);
      case STooltipPlacement.bottom:
      case STooltipPlacement.bottomLeft:
      case STooltipPlacement.bottomRight:
        double x = size.width / 2;
        if (_actualPlacement == STooltipPlacement.bottomLeft) {
          x = math.min(16, size.width / 2);
        }
        if (_actualPlacement == STooltipPlacement.bottomRight) {
          x = math.max(size.width - 16, size.width / 2);
        }
        path.moveTo(x - s, 0);
        path.lineTo(x + s, 0);
        path.lineTo(x, -s);
      case STooltipPlacement.left:
      case STooltipPlacement.leftTop:
      case STooltipPlacement.leftBottom:
        double y = size.height / 2;
        if (_actualPlacement == STooltipPlacement.leftTop) {
          y = math.min(16, size.height / 2);
        }
        if (_actualPlacement == STooltipPlacement.leftBottom) {
          y = math.max(size.height - 16, size.height / 2);
        }
        path.moveTo(size.width, y - s);
        path.lineTo(size.width, y + s);
        path.lineTo(size.width + s, y);
      case STooltipPlacement.right:
      case STooltipPlacement.rightTop:
      case STooltipPlacement.rightBottom:
        double y = size.height / 2;
        if (_actualPlacement == STooltipPlacement.rightTop) {
          y = math.min(16, size.height / 2);
        }
        if (_actualPlacement == STooltipPlacement.rightBottom) {
          y = math.max(size.height - 16, size.height / 2);
        }
        path.moveTo(0, y - s);
        path.lineTo(0, y + s);
        path.lineTo(-s, y);
    }
    path.close();
    canvas.drawPath(
        path,
        paint);
  }
}

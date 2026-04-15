part of 's_tooltip.dart';

class _STooltipOverlay
    extends StatelessWidget {
  const _STooltipOverlay({
    required this.layerLink,
    required this.placement,
    required this.offset,
    required this.autoFlip,
    required this.showArrow,
    required this.arrowSize,
    required this.animation,
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.backgroundColor,
    required this.content,
    required this.padding,
    required this.borderRadius,
    required this.elevation,
    required this.shadowColor,
    required this.onHover,
    required this.screenSize,
    required this.targetGlobalRect,
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
  final Animation<double>
      animation;
  final Animation<double>
      scaleAnimation;
  final Animation<double>
      fadeAnimation;
  final Color
      backgroundColor;
  final Widget
      content;
  final EdgeInsetsGeometry?
      padding;
  final BorderRadiusGeometry
      borderRadius;
  final double
      elevation;
  final Color
      shadowColor;
  final Size
      screenSize;
  final Rect
      targetGlobalRect;
  final ValueChanged<bool>
      onHover;

  @override
  Widget build(
      BuildContext
          context) {
    return Positioned(
      left:
          0,
      top:
          0,
      child:
          CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        child: _STooltipPositioner(
          layerLink: layerLink,
          placement: placement,
          offset: offset,
          autoFlip: autoFlip,
          showArrow: showArrow,
          arrowSize: arrowSize,
          backgroundColor: backgroundColor,
          padding: padding,
          borderRadius: borderRadius,
          elevation: elevation,
          shadowColor: shadowColor,
          animation: animation,
          scaleAnimation: scaleAnimation,
          fadeAnimation: fadeAnimation,
          onHover: onHover,
          screenSize: screenSize,
          targetGlobalRect: targetGlobalRect,
          child: content,
        ),
      ),
    );
  }
}

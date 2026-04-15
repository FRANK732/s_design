import 'package:flutter/material.dart';

class SRateItem
    extends StatelessWidget {
  const SRateItem({
    super.key,
    required this.percent,
    required this.character,
    this.color,
    this.unselectedColor,
    this.size,
    this.applyColor = true,
  });

  /// 0.0 to 1.0 (0=empty, 0.5=half, 1.0=full)
  final double
      percent;
  final Widget
      character;
  final Color?
      color;
  final Color?
      unselectedColor;
  final double?
      size;
  final bool
      applyColor;

  @override
  Widget build(
      BuildContext
          context) {
    // If percent is 0, show unselected color
    // If percent is 1, show selected color
    // If percent is 0.5, show half selected

    final IconThemeData
        iconTheme =
        IconTheme.of(context);
    final double iconSize = size ??
        iconTheme.size ??
        24;
    final Color
        effectiveUnselectedColor =
        unselectedColor ?? Colors.grey.shade300;
    final Color
        effectiveColor =
        color ?? Colors.yellow.shade700;

    // Base character (background/unselected)
    final Widget
        base =
        Opacity(
      opacity: applyColor ? 1.0 : 0.3,
      child:
          IconTheme(
        data:
            iconTheme.copyWith(
          color: applyColor ? effectiveUnselectedColor : null,
          size: iconSize,
        ),
        child:
            DefaultTextStyle(
          style: TextStyle(
            color: applyColor ? effectiveUnselectedColor : null,
            fontSize: iconSize,
          ),
          child:
              character,
        ),
      ),
    );

    if (percent <=
        0) {
      return base;
    }

    if (percent >=
        1) {
      return Opacity(
        opacity: 1.0,
        child: IconTheme(
          data: iconTheme.copyWith(
            color: applyColor ? effectiveColor : null,
            size: iconSize,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: applyColor ? effectiveColor : null,
              fontSize: iconSize,
            ),
            child: character,
          ),
        ),
      );
    }

    // Half star rendering using ClipRect
    return Stack(
      children: <Widget>[
        base,
        ClipRect(
          clipper: _HalfClipper(),
          child: Opacity(
            opacity: 1.0,
            child: IconTheme(
              data: iconTheme.copyWith(
                color: applyColor ? effectiveColor : null,
                size: iconSize,
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: applyColor ? effectiveColor : null,
                  fontSize: iconSize,
                ),
                child: character,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HalfClipper
    extends CustomClipper<
        Rect> {
  @override
  Rect getClip(
      Size
          size) {
    return Rect.fromLTWH(
        0,
        0,
        size.width / 2,
        size.height);
  }

  @override
  bool shouldReclip(
      covariant CustomClipper<Rect>
          oldClipper) {
    return false;
  }
}

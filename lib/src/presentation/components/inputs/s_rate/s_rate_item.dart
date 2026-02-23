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
        IconTheme(
      data:
          iconTheme.copyWith(
        color: effectiveUnselectedColor,
        size: iconSize,
      ),
      child:
          character,
    );

    if (percent <=
        0) {
      return base;
    }

    if (percent >=
        1) {
      return IconTheme(
        data: iconTheme.copyWith(
          color: effectiveColor,
          size: iconSize,
        ),
        child: character,
      );
    }

    // Half star rendering using ClipRect
    return Stack(
      children: <Widget>[
        base,
        ClipRect(
          clipper: _HalfClipper(),
          child: IconTheme(
            data: iconTheme.copyWith(
              color: effectiveColor,
              size: iconSize,
            ),
            child: character,
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

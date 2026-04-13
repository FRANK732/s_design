import 'dart:ui'
    as ui;
import 'package:flutter/material.dart';

/// The official SDesign logo widget, inspired by Schrift Flow.
/// Translated into a resolution-independent Flutter CustomPaint widget.
class SDesignLogo
    extends StatelessWidget {
  const SDesignLogo({
    super.key,
    this.size =
        32,
    this.withText =
        false,
    this.textColor,
  });

  final double
      size;
  final bool
      withText;
  final Color?
      textColor;

  @override
  Widget build(
      BuildContext
          context) {
    final Widget
        logoIcon =
        CustomPaint(
      size:
          Size(size, size),
      painter:
          _SDesignLogoPainter(),
    );

    if (!withText) {
      return logoIcon;
    }

    final theme =
        Theme.of(context);
    final isDark =
        theme.brightness == Brightness.dark;
    final defaultTextColor =
        textColor ?? (isDark ? Colors.white : const Color(0xFF1F2937));

    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        logoIcon,
        SizedBox(width: size * 0.3),
        Text(
          'S',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: size * 0.75,
            color: defaultTextColor,
            letterSpacing: -0.5,
            height: 1.0,
          ),
        ),
        Text(
          'Design',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: size * 0.75,
            letterSpacing: -0.5,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

class _SDesignLogoPainter
    extends CustomPainter {
  @override
  void paint(
      Canvas
          canvas,
      Size
          size) {
    // scale to 32x32 viewbox
    final double
        scale =
        size.width / 32;
    canvas.scale(
        scale,
        scale);

    // Left bracket (<)
    final Paint paintBracketLeft = Paint()
      ..style =
          PaintingStyle.stroke
      ..strokeWidth =
          3
      ..strokeCap =
          StrokeCap.round
      ..strokeJoin =
          StrokeJoin.round
      ..shader = ui.Gradient.linear(
        const Offset(4, 8),
        const Offset(10, 24),
        [
          const Color(0xFF8B5CF6),
          const Color(0xFF6366F1)
        ],
      );

    final Path
        pathBracketLeft =
        Path()
          ..moveTo(10, 8)
          ..lineTo(4, 16)
          ..lineTo(10, 24);
    canvas.drawPath(
        pathBracketLeft,
        paintBracketLeft);

    // Right bracket (>)
    final Paint paintBracketRight = Paint()
      ..style =
          PaintingStyle.stroke
      ..strokeWidth =
          3
      ..strokeCap =
          StrokeCap.round
      ..strokeJoin =
          StrokeJoin.round
      ..shader = ui.Gradient.linear(
        const Offset(22, 8),
        const Offset(28, 24),
        [
          const Color(0xFF6366F1),
          const Color(0xFF3B82F6)
        ],
      );

    final Path
        pathBracketRight =
        Path()
          ..moveTo(22, 8)
          ..lineTo(28, 16)
          ..lineTo(22, 24);
    canvas.drawPath(
        pathBracketRight,
        paintBracketRight);

    // Flowing 'S' line
    final Paint paintSLine = Paint()
      ..style =
          PaintingStyle.stroke
      ..strokeWidth =
          2.5
      ..strokeCap =
          StrokeCap.round
      ..shader = ui.Gradient.linear(
        const Offset(14, 26),
        const Offset(18, 6),
        [
          const Color(0xFFEC4899),
          const Color(0xFF8B5CF6)
        ],
      );

    final Path
        pathSLine =
        Path()
          ..moveTo(18, 9)
          ..cubicTo(13.5, 6.5, 9, 13, 16, 16)
          ..cubicTo(23, 19, 18.5, 25.5, 14, 23);
    canvas.drawPath(
        pathSLine,
        paintSLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false;
}

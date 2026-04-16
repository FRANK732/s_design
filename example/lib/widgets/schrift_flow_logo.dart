import 'dart:ui'
    as ui;
import 'package:flutter/material.dart';

/// The official Schrift Flow company logo, translated directly from React SVG
/// into a resolution-independent Flutter CustomPaint widget.
class SchriftFlowLogo
    extends StatelessWidget {
  const SchriftFlowLogo({
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
          _SchriftFlowLogoPainter(),
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
          'Schrift',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: size * 0.75,
            color: defaultTextColor,
            letterSpacing: -0.5,
            height: 1.0,
          ),
        ),
        const SizedBox(width: 2),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFF8B5CF6),
              Color(0xFF6366F1)
            ],
          ).createShader(bounds),
          child: Text(
            'Flow',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              fontSize: size * 0.75,
              color: Colors.white,
              letterSpacing: -0.5,
              height: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _SchriftFlowLogoPainter
    extends CustomPainter {
  @override
  void paint(
      Canvas
          canvas,
      Size
          size) {
    final double
        scale =
        size.width / 32;
    canvas.scale(
        scale,
        scale);

    // Path 1 (Left bracket)
    final Paint paint1 = Paint()
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
        path1 =
        Path()
          ..moveTo(10, 8)
          ..lineTo(4, 16)
          ..lineTo(10, 24);
    canvas.drawPath(
        path1,
        paint1);

    // Path 2 (Right bracket)
    final Paint paint2 = Paint()
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
        path2 =
        Path()
          ..moveTo(22, 8)
          ..lineTo(28, 16)
          ..lineTo(22, 24);
    canvas.drawPath(
        path2,
        paint2);

    // Path 3 (Middle "S" curve flow line)
    final Paint paint3 = Paint()
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
        path3 =
        Path()
          ..moveTo(18, 9)
          ..cubicTo(13.5, 6.5, 10, 13, 16, 16)
          ..cubicTo(22, 19, 18.5, 25.5, 14, 23);
    canvas.drawPath(
        path3,
        paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false;
}

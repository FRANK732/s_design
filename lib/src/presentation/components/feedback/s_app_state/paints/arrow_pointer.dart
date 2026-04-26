import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {


  ArrowPainter({
    this.color = Colors.teal,
    this.strokeWidth = 4.0,
    this.primaryColor,
  });
  final Color? primaryColor;
  
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Define the path for the arrow
    final Path path = Path();

    // Start from the top-left (adjustable starting point)
    path.moveTo(size.width * 0.2, size.height * 0.8);

    // Curve or line to the bottom-right (pointing toward FAB)
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.2,
      size.width * 0.9,
      size.height * 0.1,
    );

    // Draw arrowhead
    _drawArrowHead(canvas, size, paint);

    // Draw the path
    canvas.drawPath(path, paint);
  }

  void _drawArrowHead(Canvas canvas, Size size, Paint paint) {
    final Paint arrowHeadPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Arrowhead at the end of the path (bottom-right)
    final Path arrowHeadPath = Path();
    final double endX = size.width * 0.9;
    final double endY = size.height * 0.1;

    // Create a triangular arrowhead
    arrowHeadPath.moveTo(endX, endY);
    arrowHeadPath.lineTo(endX - 10, endY + 10);
    arrowHeadPath.lineTo(endX + 10, endY + 10);
    arrowHeadPath.close();

    canvas.drawPath(arrowHeadPath, arrowHeadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
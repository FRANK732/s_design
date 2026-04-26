import 'dart:math';
import 'package:flutter/material.dart';

/// Custom painter class to draw a "Something Went Wrong" graphic with a rocket, planets, and stars.
/// Extends CustomPainter to provide custom drawing logic for a Flutter widget.
class WrongServerPainter extends CustomPainter {
  final Color primaryColor;
  
  const WrongServerPainter({required this.primaryColor});

  /// Main painting method that defines how the graphic is drawn on the canvas.
  /// [canvas]: The canvas to draw on.
  /// [size]: The size of the widget's available drawing area.
  @override
  void paint(Canvas canvas, Size size) {
    // Normalize coordinates to a simpler viewBox (300 x 300) to match the image's proportions.
    final double scaleX = size.width / 300.0;
    final double scaleY = size.height / 300.0;
    final double scale = min(scaleX, scaleY); // Maintain aspect ratio.

    // Save the canvas state to apply transformations and restore later.
    canvas.save();

    // Apply scaling and center the graphic.
    canvas.scale(scale, scale);
    canvas.translate(0, 0);

    // Path 0: Large planet (bottom left) with light gray fill (#e6e6e6).
    final Path path_0 = Path();
    path_0.moveTo(50, 250); // Start at bottom left.
    path_0.quadraticBezierTo(0, 200, 50, 150); // Curve to left side.
    path_0.quadraticBezierTo(100, 100, 150, 150); // Curve to top.
    path_0.quadraticBezierTo(200, 200, 150, 250); // Curve to right side.
    path_0.close(); // Close the path.

    // Define paint for the large planet: light gray fill.
    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    // Path 1: Stripes on the large planet with dark gray fill (#3f3d56).
    final Path path_1 = Path();
    path_1.moveTo(50, 200);
    path_1.quadraticBezierTo(75, 175, 100, 200);
    path_1.lineTo(90, 210);
    path_1.quadraticBezierTo(65, 185, 40, 210);
    path_1.close();

    path_1.moveTo(100, 150);
    path_1.quadraticBezierTo(125, 125, 150, 150);
    path_1.lineTo(140, 160);
    path_1.quadraticBezierTo(115, 135, 90, 160);
    path_1.close();

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    // Path 2: Small planet with ring (top left) with teal fill (#00675B).
    final Path path_2 = Path();
    path_2.addOval(Rect.fromCircle(
        center: const Offset(100, 50), radius: 30,),); // Small planet circle.

    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = primaryColor;
    canvas.drawPath(path_2, paint2Fill);

    // Path 3: Ring around the small planet with dark gray stroke (#3f3d56).
    final Path path_3 = Path();
    path_3.addOval(Rect.fromCenter(
        center: const Offset(100, 50),
        width: 80,
        height: 20,),); // Elliptical ring.

    final Paint paint3Stroke = Paint()..style = PaintingStyle.stroke;
    paint3Stroke.color = const Color(0xff3f3d56).withOpacity(1.0);
    paint3Stroke.strokeWidth = 4;
    canvas.drawPath(path_3, paint3Stroke);

    // Path 4: Rocket body with white fill (#ffffff).
    final Path path_4 = Path();
    path_4.moveTo(200, 150); // Start at the top center.
    path_4.lineTo(220, 200); // Right side of rocket body.
    path_4.lineTo(210, 250); // Right side bottom.
    path_4.lineTo(190, 250); // Bottom of rocket.
    path_4.lineTo(180, 200); // Left side of rocket body.
    path_4.close();

    final Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    // Path 5: Rocket top with dark gray fill (#3f3d56).
    final Path path_5 = Path();
    path_5.moveTo(200, 130); // Top point of the rocket.
    path_5.lineTo(220, 150); // Right side.
    path_5.lineTo(180, 150); // Left side.
    path_5.close();

    final Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);

    // Path 6: Rocket window with teal fill (#00675B).
    final Path path_6 = Path();
    path_6.addOval(Rect.fromCircle(center: const Offset(200, 190), radius: 10));

    final Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = primaryColor;
    canvas.drawPath(path_6, paint6Fill);

    // Path 7: Rocket fins with dark gray fill (#3f3d56).
    final Path path_7 = Path();
    // Left fin.
    path_7.moveTo(180, 200);
    path_7.lineTo(160, 220);
    path_7.lineTo(180, 220);
    path_7.close();
    // Right fin.
    path_7.moveTo(220, 200);
    path_7.lineTo(240, 220);
    path_7.lineTo(220, 220);
    path_7.close();

    final Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawPath(path_7, paint7Fill);

    // Stars with white fill (#ffffff).
    final Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xffffffff).withOpacity(1.0);

    // Draw stars as small crosses.
    for (final Offset star in <Offset>[
      const Offset(50, 50),
      const Offset(150, 30),
      const Offset(250, 50),
      const Offset(200, 100),
    ]) {
      final Path starPath = Path();
      starPath.moveTo(star.dx - 5, star.dy);
      starPath.lineTo(star.dx + 5, star.dy);
      starPath.moveTo(star.dx, star.dy - 5);
      starPath.lineTo(star.dx, star.dy + 5);
      canvas.drawPath(starPath, paint8Fill);
    }

    // Restore the canvas state.
    canvas.restore();
  }

  /// Determines whether the painter should repaint when the widget updates.
  /// Returns true to always repaint if the widget size changes.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

/// Custom painter class to draw a complex SVG-based graphic with multiple paths and shapes.
/// Extends CustomPainter to provide custom drawing logic for a Flutter widget.
class NoDataPainter extends CustomPainter {
  
  const NoDataPainter({required this.primaryColor});
  final Color primaryColor;

  /// Main painting method that defines how the graphic is drawn on the canvas.
  /// [canvas]: The canvas to draw on.
  /// [size]: The size of the widget's available drawing area.
  @override
  void paint(Canvas canvas, Size size) {
    // Normalize coordinates to match SVG viewBox dimensions (647.63626 x 632.17383).
    // Calculate scaling factors to fit the SVG within the widget's size.
    final double scaleX = size.width / 647.63626;
    final double scaleY = size.height / 632.17383;
    final double scale = min(scaleX, scaleY); // Use the smaller scale to maintain aspect ratio.

    // Save the canvas state to apply transformations and restore later.
    canvas.save();

    // Apply scaling to match SVG proportions and translate to align with SVG coordinates.
    canvas.scale(scale, scale);
    canvas.translate(-276.18187, -133.91309); // Adjust for SVG's transform offset.

    // Path 0: Background shape with a light gray fill (#f2f2f2).
    // Represents a complex polygon with arcs for smooth corners.
    final Path path_0 = Path();
    path_0.moveTo(687.3279, 276.08691); // Starting point of the path.
    path_0.lineTo(512.81813, 276.08691); // Draw a straight line.
    path_0.arcToPoint(
      const Offset(497.81813, 291.08691), // Arc to this point.
      radius: const Radius.elliptical(15, 15), // Arc radius.
      clockwise: false, // Counterclockwise arc.
    );
    path_0.lineTo(497.81813, 678.93691); // Draw a vertical line.
    path_0.lineTo(495.81813, 679.54696); // Small diagonal line.
    path_0.lineTo(453.00807, 692.65696); // Diagonal line to another point.
    path_0.arcToPoint(
      const Offset(443.01833, 687.34691),
      radius: const Radius.elliptical(8, 8),
    );
    path_0.lineTo(315.678, 271.39691); // Long diagonal line.
    path_0.arcToPoint(
      const Offset(320.98806, 261.40691),
      radius: const Radius.elliptical(8, 8),
    );
    path_0.lineTo(386.95828, 241.20691); // Diagonal line.
    path_0.lineTo(578.20828, 182.66691); // Another diagonal line.
    path_0.lineTo(644.178, 162.46691); // Line to close the shape.
    path_0.arcToPoint(
      const Offset(654.16774, 167.76691),
      radius: const Radius.elliptical(8, 8),
    );
    path_0.lineTo(687.3279, 276.08691); // Return to starting point.
    path_0.close(); // Close the path to form a filled shape.

    // Define paint properties for Path 0: filled with light gray.
    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xfff2f2f2).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill); // Draw the path on the canvas.

    // Path 1: Foreground shape with a dark gray fill (#3f3d56).
    // Another complex polygon with arcs for rounded transitions.
    final Path path_1 = Path();
    path_1.moveTo(725.408, 274.08691); // Start point.
    path_1.lineTo(686.178, 145.94691); // Diagonal line.
    path_1.arcToPoint(
      const Offset(664.948, 134.66691),
      radius: const Radius.elliptical(16.99368, 16.99368),
      clockwise: false,
    );
    path_1.lineTo(572.198, 163.05691); // Line to next point.
    path_1.lineTo(380.95827, 221.60693); // Diagonal line.
    path_1.lineTo(288.20827, 250.00693); // Another line.
    path_1.arcToPoint(
      const Offset(276.928, 271.23691),
      radius: const Radius.elliptical(17.0152, 17.0152),
      clockwise: false,
    );
    path_1.lineTo(411.00808, 709.16691); // Long vertical line.
    path_1.arcToPoint(
      const Offset(427.26834, 721.19691),
      radius: const Radius.elliptical(17.02661, 17.02661),
      clockwise: false,
    );
    path_1.lineTo(490.84842, 701.73691); // Diagonal line.
    path_1.lineTo(492.84842, 699.64691); // Small adjustment.
    path_1.lineTo(490.84842, 700.25691); // Another small adjustment.
    path_1.lineTo(426.6785, 719.90691); // Diagonal line.
    path_1.arcToPoint(
      const Offset(411.00808, 709.16691),
      radius: const Radius.elliptical(15, 15),
    );
    path_1.lineTo(276.93825, 271.22691); // Long diagonal line.
    path_1.arcToPoint(
      const Offset(288.20827, 250.00693),
      radius: const Radius.elliptical(14.97935, 14.97935),
    );
    path_1.lineTo(380.95827, 221.60693); // Retrace earlier line.
    path_1.lineTo(572.198, 163.05691); // Retrace another line.
    path_1.lineTo(664.948, 134.66691); // Retrace to arc point.
    path_1.arcToPoint(
      const Offset(669.35766, 134.00691),
      radius: const Radius.elliptical(15.15551, 15.15551),
    );
    path_1.lineTo(708.40746, 262.56691); // Diagonal line.
    path_1.lineTo(725.408, 274.08691); // Return to start.
    path_1.close(); // Close the path.

    // Define paint properties for Path 1: filled with dark gray.
    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill); // Draw the path.

    // Path 2: Middle shape with a teal fill (#00675B).
    // A smaller polygon with arcs for rounded corners.
    final Path path_2 = Path();
    path_2.moveTo(398.86279, 261.73389); // Start point.
    path_2.arcToPoint(
      const Offset(390.25146, 255.36719),
      radius: const Radius.elliptical(9.0157, 9.0157),
    );
    path_2.lineTo(377.37109, 213.29541); // Diagonal line.
    path_2.arcToPoint(
      const Offset(383.34229, 202.05518),
      radius: const Radius.elliptical(8.99884, 8.99884),
    );
    path_2.lineTo(559.28129, 148.19141); // Long diagonal line.
    path_2.arcToPoint(
      const Offset(570.52201, 154.16211),
      radius: const Radius.elliptical(9.00867, 9.00867),
    );
    path_2.lineTo(583.40238, 196.23438); // Diagonal line.
    path_2.arcToPoint(
      const Offset(577.43168, 207.4751),
      radius: const Radius.elliptical(9.01029, 9.01029),
    );
    path_2.lineTo(401.49219, 261.33887); // Line to close shape.
    path_2.close(); // Close the path.

    // Define paint properties for Path 2: filled with teal.
    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = primaryColor;
    canvas.drawPath(path_2, paint2Fill); // Draw the path.

    // Circle 1: Outer circle with teal fill (#00675B).
    final Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = primaryColor;
    canvas.drawCircle(const Offset(466.33538, 158.86774), 20, paint3Fill); // Draw outer circle.

    // Inner circle with white fill (#fff).
    final Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(const Offset(466.33538, 158.86774), 12.66462, paint4Fill); // Draw inner circle.

    // Path 3: Rectangle with light gray fill (#e6e6e6).
    // Represents a rounded rectangle shape.
    final Path path_3 = Path();
    path_3.moveTo(878.81836, 716.08691); // Start point.
    path_3.lineTo(540.81836, 716.08691); // Horizontal line.
    path_3.arcToPoint(
      const Offset(532.31836, 707.58691),
      radius: const Radius.elliptical(8.50981, 8.50981),
    );
    path_3.lineTo(532.31836, 302.58691); // Vertical line.
    path_3.arcToPoint(
      const Offset(540.81836, 294.08691),
      radius: const Radius.elliptical(8.50951, 8.50951),
    );
    path_3.lineTo(878.81836, 294.08691); // Horizontal line.
    path_3.arcToPoint(
      const Offset(887.31836, 302.58691),
      radius: const Radius.elliptical(8.50982, 8.50982),
    );
    path_3.lineTo(887.31836, 707.58691); // Vertical line.
    path_3.arcToPoint(
      const Offset(878.81836, 716.08691),
      radius: const Radius.elliptical(8.51013, 8.51013),
    );
    path_3.close(); // Close the path.

    // Define paint properties for Path 3: filled with light gray.
    final Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_3, paint5Fill); // Draw the path.

    // Path 4: Combined rectangles with dark gray fill (#3f3d56).
    // Represents multiple overlapping rectangular shapes with rounded corners.
    final Path path_4 = Path();
    path_4.moveTo(723.31813, 274.08691); // Start first rectangle.
    path_4.lineTo(512.81813, 274.08691); // Horizontal line.
    path_4.arcToPoint(
      const Offset(495.81813, 291.08691),
      radius: const Radius.elliptical(17.02411, 17.02411),
      clockwise: false,
    );
    path_4.lineTo(497.81813, 698.88691); // Vertical line.
    path_4.lineTo(495.81813, 698.27686); // Small adjustment.
    path_4.lineTo(497.81813, 291.08691); // Retrace vertical line.
    path_4.arcToPoint(
      const Offset(512.81813, 276.08691),
      radius: const Radius.elliptical(15, 15),
    );
    path_4.lineTo(723.31813, 276.08691); // Horizontal line to close.
    path_4.close(); // Close first rectangle.

    // Second rectangle in Path 4.
    path_4.moveTo(906.81813, 274.08691); // Start second rectangle.
    path_4.lineTo(512.81813, 274.08691); // Horizontal line.
    path_4.arcToPoint(
      const Offset(495.81813, 291.08691),
      radius: const Radius.elliptical(17.02411, 17.02411),
      clockwise: false,
    );
    path_4.lineTo(495.81813, 749.08691); // Long vertical line.
    path_4.arcToPoint(
      const Offset(512.81813, 766.08691),
      radius: const Radius.elliptical(17.0241, 17.0241),
      clockwise: false,
    );
    path_4.lineTo(906.81813, 766.08691); // Horizontal line.
    path_4.arcToPoint(
      const Offset(923.81813, 749.08691),
      radius: const Radius.elliptical(17.0241, 17.0241),
      clockwise: false,
    );
    path_4.lineTo(923.81813, 291.08691); // Vertical line.
    path_4.arcToPoint(
      const Offset(906.81813, 274.08691),
      radius: const Radius.elliptical(17.02411, 17.02411),
      clockwise: false,
    );
    path_4.close(); // Close second rectangle.

    // Third rectangle in Path 4.
    path_4.moveTo(921.81813, 749.08691); // Start third rectangle.
    path_4.arcToPoint(
      const Offset(906.81813, 764.08691),
      radius: const Radius.elliptical(15, 15),
    );
    path_4.lineTo(512.81813, 764.08691); // Horizontal line.
    path_4.arcToPoint(
      const Offset(497.81813, 749.08691),
      radius: const Radius.elliptical(15, 15),
    );
    path_4.lineTo(497.81813, 291.08691); // Vertical line.
    path_4.arcToPoint(
      const Offset(512.81813, 276.08691),
      radius: const Radius.elliptical(15, 15),
    );
    path_4.lineTo(906.81813, 276.08691); // Horizontal line.
    path_4.arcToPoint(
      const Offset(921.81813, 291.08691),
      radius: const Radius.elliptical(15, 15),
    );
    path_4.close(); // Close third rectangle.

    // Define paint properties for Path 4: filled with dark gray.
    final Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawPath(path_4, paint6Fill); // Draw the path.

    // Path 5: Small rectangle with teal fill (#00675B).
    // A smaller rounded rectangle shape.
    final Path path_5 = Path();
    path_5.moveTo(801.81836, 318.08691); // Start point.
    path_5.lineTo(617.81836, 318.08691); // Horizontal line.
    path_5.arcToPoint(
      const Offset(608.81836, 309.08691),
      radius: const Radius.elliptical(9.01015, 9.01015),
    );
    path_5.lineTo(608.81836, 265.08691); // Vertical line.
    path_5.arcToPoint(
      const Offset(617.81836, 256.08691),
      radius: const Radius.elliptical(9.01016, 9.01016),
    );
    path_5.lineTo(801.81836, 256.08691); // Horizontal line.
    path_5.arcToPoint(
      const Offset(810.81836, 265.08691),
      radius: const Radius.elliptical(9.01016, 9.01016),
    );
    path_5.lineTo(810.81836, 309.08691); // Vertical line.
    path_5.arcToPoint(
      const Offset(801.81836, 318.08691),
      radius: const Radius.elliptical(9.01015, 9.01015),
    );
    path_5.close(); // Close the path.

    // Define paint properties for Path 5: filled with teal.
    final Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = primaryColor;
    canvas.drawPath(path_5, paint7Fill); // Draw the path.

    // Circle 2: Outer circle with teal fill (#00675B).
    final Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = primaryColor;
    canvas.drawCircle(const Offset(709.81813, 239.08692), 20, paint8Fill); // Draw outer circle.

    // Inner circle with white fill (#fff).
    final Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(const Offset(709.81813, 239.08692), 12.18187, paint9Fill); // Draw inner circle.

    // Restore the canvas state to undo scaling and translation.
    canvas.restore();
  }

  /// Determines whether the painter should repaint when the widget updates.
  /// Returns true to always repaint, ensuring the graphic is redrawn if the widget size changes.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
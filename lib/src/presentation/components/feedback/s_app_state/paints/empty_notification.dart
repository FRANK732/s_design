import 'package:flutter/material.dart';

class EmptyNotificationPainter extends CustomPainter {
  final Color primaryColor;
  
  const EmptyNotificationPainter({required this.primaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    // Scale factors to map SVG viewBox (753.989 x 800.132) to canvas size
    final double scaleX = size.width / 753.989;
    final double scaleY = size.height / 800.132;

    // Apply global translation from SVG: translate(-633 -135.401)
    canvas.save();
    canvas.translate(633 * scaleX, 135.401 * scaleY);

    // Group 1: translate(661.796 375.837)
    canvas.save();
    canvas.translate(661.796 * scaleX, 375.837 * scaleY);

    // Path 0: Arm rectangle
    final Path path_0 = Path();
    path_0.moveTo(339.12 * scaleX, 110.866 * scaleY);
    path_0.lineTo(369.091 * scaleX, 120.714 * scaleY);
    path_0.lineTo(369.091 * scaleX, 77.59 * scaleY);
    path_0.lineTo(341.907 * scaleX, 77.59 * scaleY);
    path_0.close();
    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff9f616a);
    canvas.drawPath(path_0, paint0Fill);

    // Ellipse: Head
    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff9f616a);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(121.695 * scaleX, 41.336 * scaleY),
            width: 59.71 * scaleX,
            height: 59.71 * scaleY,),
        paint1Fill,);

    // Path 2: Hair
    final Path path_2 = Path();
    path_2.moveTo(351.187 * scaleX, 69.817 * scaleY);
    path_2.lineTo(355.299 * scaleX, 74.817 * scaleY);
    path_2.lineTo(362.74 * scaleX, 61.79 * scaleY);
    path_2.cubicTo(362.74 * scaleX, 61.79 * scaleY, 372.24 * scaleX, 62.29 * scaleY, 372.24 * scaleX, 55.225 * scaleY);
    path_2.cubicTo(372.24 * scaleX, 48.16 * scaleY, 380.959 * scaleX, 47.98 * scaleY, 380.959 * scaleX, 47.98 * scaleY);
    path_2.cubicTo(380.959 * scaleX, 47.98 * scaleY, 393.307 * scaleX, 26.429 * scaleY, 367.736 * scaleX, 32.108 * scaleY);
    path_2.cubicTo(367.736 * scaleX, 32.108 * scaleY, 350.009 * scaleX, 19.956 * scaleY, 341.186 * scaleX, 30.346 * scaleY);
    path_2.cubicTo(341.186 * scaleX, 30.346 * scaleY, 314.153 * scaleX, 43.961 * scaleY, 321.893 * scaleX, 67.665 * scaleY);
    path_2.lineTo(334.747 * scaleX, 92.095 * scaleY);
    path_2.lineTo(337.661 * scaleX, 86.566 * scaleY);
    path_2.cubicTo(337.661 * scaleX, 86.566 * scaleY, 335.9 * scaleX, 63.344 * scaleY, 351.187 * scaleX, 69.817 * scaleY);
    path_2.close();
    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff090814);
    canvas.drawPath(path_2, paint2Fill);

    // Rectangle: Right arm
    final Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff9f616a);
    canvas.drawRect(
        Rect.fromLTWH(87.21 * scaleX, 501.136 * scaleY, 24.119 * scaleX, 34.221 * scaleY),
        paint3Fill,);

    // Path 4: Right leg
    final Path path_4 = Path();
    path_4.moveTo(362.8 * scaleX, 514.06 * scaleY);
    path_4.cubicTo(365.334 * scaleX, 514.06 * scaleY, 367.592 * scaleX, 514.002 * scaleY, 369.3 * scaleX, 513.841 * scaleY);
    path_4.cubicTo(375.7 * scaleX, 513.254 * scaleY, 381.82 * scaleX, 508.52 * scaleY, 384.9 * scaleX, 505.755 * scaleY);
    path_4.arcToPoint(
        Offset(386.006 * scaleX, 500.825 * scaleY),
        radius: Radius.elliptical(4.367 * scaleX, 4.367 * scaleY),
        clockwise: false,);
    path_4.lineTo(386.006 * scaleX, 500.825 * scaleY);
    path_4.arcToPoint(
        Offset(383.184 * scaleX, 498.325 * scaleY),
        radius: Radius.elliptical(4.332 * scaleX, 4.332 * scaleY),
        clockwise: false,);
    path_4.lineTo(366.252 * scaleX, 493.487 * scaleY);
    path_4.lineTo(338.838 * scaleX, 474.987 * scaleY);
    path_4.lineTo(338.527 * scaleX, 475.54 * scaleY);
    path_4.arcToPoint(
        Offset(334.818 * scaleX, 483.868 * scaleY),
        radius: Radius.elliptical(48.854 * scaleX, 48.854 * scaleY),
        clockwise: false,);
    path_4.arcToPoint(
        Offset(335.083 * scaleX, 486.955 * scaleY),
        radius: Radius.elliptical(3.706 * scaleX, 3.706 * scaleY),
        clockwise: false,);
    path_4.arcToPoint(
        Offset(336.35 * scaleX, 488.015 * scaleY),
        radius: Radius.elliptical(2.948 * scaleX, 2.948 * scaleY),
        clockwise: false,);
    path_4.cubicTo(335.85 * scaleX, 488.533 * scaleY, 334.3 * scaleX, 489.593 * scaleY, 329.508 * scaleX, 490.353 * scaleY);
    path_4.cubicTo(322.516 * scaleX, 491.459 * scaleY, 321.042 * scaleX, 484.214 * scaleY, 320.984 * scaleX, 483.914 * scaleY);
    path_4.lineTo(320.938 * scaleX, 483.672 * scaleY);
    path_4.lineTo(320.731 * scaleX, 483.534 * scaleY);
    path_4.cubicTo(317.402 * scaleX, 481.392 * scaleY, 315.352 * scaleX, 480.413 * scaleY, 314.649 * scaleX, 480.62 * scaleY);
    path_4.cubicTo(314.211 * scaleX, 480.747 * scaleY, 313.474 * scaleX, 480.977 * scaleY, 311.481 * scaleX, 500.708 * scaleY);
    path_4.arcToPoint(
        Offset(310.836 * scaleX, 510.208 * scaleY),
        radius: Radius.elliptical(20.285 * scaleX, 20.285 * scaleY),
        clockwise: false,);
    path_4.cubicTo(311.861 * scaleX, 514.931 * scaleY, 332.502 * scaleX, 513.308 * scaleY, 336.636 * scaleX, 512.938 * scaleY);
    path_4.cubicTo(336.751 * scaleX, 512.95 * scaleY, 352.209 * scaleX, 514.055 * scaleY, 362.794 * scaleX, 514.055 * scaleY);
    path_4.lineTo(362.794 * scaleX, 514.055 * scaleY);
    path_4.close();
    final Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xff090814);
    canvas.drawPath(path_4, paint4Fill);

    // Rectangle: Left arm with matrix transformation
    canvas.save();
    final Matrix4 matrix = Matrix4.identity()
      ..translate(32.903 * scaleX, 491.586 * scaleY)
      ..multiply(Matrix4(-0.771, -0.637, 0, 0, 0.637, -0.771, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1));
    canvas.transform(matrix.storage);
    final Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xff9f616a);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, 24.119 * scaleX, 34.221 * scaleY),
        paint5Fill,);
    canvas.restore();

    // Path 6: Left leg
    final Path path_6 = Path();
    path_6.moveTo(429.983 * scaleX, 487.187 * scaleY);
    path_6.cubicTo(431.941 * scaleX, 488.8 * scaleY, 433.715 * scaleX, 490.193 * scaleY, 435.12 * scaleX, 491.161 * scaleY);
    path_6.cubicTo(440.43 * scaleX, 494.789 * scaleY, 448.159 * scaleX, 495.043 * scaleY, 452.282 * scaleX, 494.87 * scaleY);
    path_6.arcToPoint(
        Offset(456.282 * scaleX, 491.77 * scaleY),
        radius: Radius.elliptical(4.38 * scaleX, 4.38 * scaleY),
        clockwise: false,);
    path_6.lineTo(456.282 * scaleX, 491.77 * scaleY);
    path_6.arcToPoint(
        Offset(455.706 * scaleX, 488.038 * scaleY),
        radius: Radius.elliptical(4.37 * scaleX, 4.37 * scaleY),
        clockwise: false,);
    path_6.lineTo(445.743 * scaleX, 473.513 * scaleY);
    path_6.lineTo(436.413 * scaleX, 441.792 * scaleY);
    path_6.lineTo(435.826 * scaleX, 442.022 * scaleY);
    path_6.arcToPoint(
        Offset(427.659 * scaleX, 446.076 * scaleY),
        radius: Radius.elliptical(49.012 * scaleX, 49.012 * scaleY),
        clockwise: false,);
    path_6.arcToPoint(
        Offset(425.897 * scaleX, 448.622 * scaleY),
        radius: Radius.elliptical(3.714 * scaleX, 3.714 * scaleY),
        clockwise: false,);
    path_6.arcToPoint(
        Offset(426.197 * scaleX, 450.258 * scaleY),
        radius: Radius.elliptical(2.939 * scaleX, 2.939 * scaleY),
        clockwise: false,);
    path_6.cubicTo(425.483 * scaleX, 450.339 * scaleY, 423.617 * scaleX, 450.166 * scaleY, 419.436 * scaleX, 447.701 * scaleY);
    path_6.cubicTo(413.343 * scaleX, 444.107 * scaleY, 416.821 * scaleX, 437.576 * scaleY, 416.983 * scaleX, 437.301 * scaleY);
    path_6.lineTo(417.098 * scaleX, 437.082 * scaleY);
    path_6.lineTo(417.029 * scaleX, 436.852 * scaleY);
    path_6.cubicTo(415.829 * scaleX, 433.074 * scaleY, 414.875 * scaleX, 431.024 * scaleY, 414.196 * scaleX, 430.736 * scaleY);
    path_6.cubicTo(413.77 * scaleX, 430.552 * scaleY, 413.067 * scaleX, 430.252 * scaleY, 398.957 * scaleX, 444.201 * scaleY);
    path_6.arcToPoint(
        Offset(392.403 * scaleX, 451.112 * scaleY),
        radius: Radius.elliptical(20.1 * scaleX, 20.1 * scaleY),
        clockwise: false,);
    path_6.cubicTo(390.18 * scaleX, 455.412 * scaleY, 407.123 * scaleX, 467.318 * scaleY, 410.544 * scaleX, 469.656 * scaleY);
    path_6.cubicTo(410.625 * scaleX, 469.737 * scaleY, 421.832 * scaleX, 480.437 * scaleY, 429.987 * scaleX, 487.187 * scaleY);
    path_6.lineTo(429.987 * scaleX, 487.187 * scaleY);
    path_6.close();
    final Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xff090814);
    canvas.drawPath(path_6, paint6Fill);

    // Path 7: Body
    final Path path_7 = Path();
    path_7.moveTo(399.446 * scaleX, 232.11 * scaleY);
    path_7.lineTo(316.71 * scaleX, 232.11 * scaleY);
    path_7.lineTo(335.093 * scaleX, 505.589 * scaleY);
    path_7.lineTo(362.668 * scaleX, 505.589 * scaleY);
    path_7.lineTo(399.434 * scaleX, 232.109 * scaleY);
    path_7.close();
    final Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xff090814);
    canvas.drawPath(path_7, paint7Fill);

    // Path 8: Shirt detail
    final Path path_8 = Path();
    path_8.moveTo(426.007 * scaleX, 247.176 * scaleY);
    path_8.lineTo(442.858 * scaleX, 232.11 * scaleY);
    path_8.lineTo(434.438 * scaleX, 382.516 * scaleY);
    path_8.lineTo(340.207 * scaleX, 472.14 * scaleY);
    path_8.lineTo(316.707 * scaleX, 452.732 * scaleY);
    path_8.lineTo(371.615 * scaleX, 381.491 * scaleY);
    path_8.close();
    final Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xff090814);
    canvas.drawPath(path_8, paint8Fill);

    // Path 9: Shirt
    final Path path_9 = Path();
    path_9.moveTo(390.129 * scaleX, 93.315 * scaleY);
    path_9.lineTo(349.273 * scaleX, 86.68 * scaleY);
    path_9.lineTo(336.58 * scaleX, 108.864 * scaleY);
    path_9.arcToPoint(
        Offset(317.828 * scaleX, 201.978 * scaleY),
        radius: Radius.elliptical(150.668 * scaleX, 150.668 * scaleY),
        clockwise: false,);
    path_9.lineTo(324.244 * scaleX, 254.191 * scaleY);
    path_9.lineTo(406.98 * scaleX, 254.191 * scaleY);
    path_9.lineTo(390.129 * scaleX, 93.315 * scaleY);
    path_9.close();
    final Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xff17B8A6);
    canvas.drawPath(path_9, paint9Fill);

    // Path 10: Right hand
    final Path path_10 = Path();
    path_10.moveTo(300.064 * scaleX, 246.982 * scaleY);
    path_10.cubicTo(306.929 * scaleX, 252.177 * scaleY, 309.682 * scaleX, 260.021 * scaleY, 306.215 * scaleX, 264.513 * scaleY);
    path_10.cubicTo(302.748 * scaleX, 269.005 * scaleY, 294.363 * scaleX, 268.441 * scaleY, 287.498 * scaleX, 263.246 * scaleY);
    path_10.arcToPoint(
        Offset(281.025 * scaleX, 255.402 * scaleY),
        radius: Radius.elliptical(20.682 * scaleX, 20.682 * scaleY),);
    path_10.lineTo(252.225 * scaleX, 233.033 * scaleY);
    path_10.lineTo(263.54 * scaleX, 219.35 * scaleY);
    path_10.lineTo(290.735 * scaleX, 242.859 * scaleY);
    path_10.arcToPoint(
        Offset(300.088 * scaleX, 246.983 * scaleY),
        radius: Radius.elliptical(21.182 * scaleX, 21.182 * scaleY),);
    path_10.close();
    final Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = const Color(0xff9f616a);
    canvas.drawPath(path_10, paint10Fill);

    // Path 11: Left hand
    final Path path_11 = Path();
    path_11.moveTo(403.463 * scaleX, 251.421 * scaleY);
    path_11.lineTo(348.635 * scaleX, 195.8 * scaleY);
    path_11.lineTo(315.889 * scaleX, 132.99 * scaleY);
    path_11.arcToPoint(
        Offset(273.283 * scaleX, 158.745 * scaleY),
        radius: Radius.elliptical(24.943 * scaleX, 24.943 * scaleY),
        largeArc: true,
        clockwise: false,);
    path_11.lineTo(320.383 * scaleX, 226.473 * scaleY);
    path_11.lineTo(320.452 * scaleX, 226.573 * scaleY);
    path_11.lineTo(392.511 * scaleX, 269.007 * scaleY);
    path_11.lineTo(403.453 * scaleX, 251.407 * scaleY);
    path_11.close();
    final Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = const Color(0xff17B8A6);
    canvas.drawPath(path_11, paint11Fill);

    canvas.restore(); // End Group 1

    // Group 2: translate(959.417 135.401)
    canvas.save();
    canvas.translate(959.417 * scaleX, 135.401 * scaleY);

    // Path 12: Device outer
    final Path path_12 = Path();
    path_12.moveTo(663.52 * scaleX, 268.471 * scaleY);
    path_12.lineTo(659.14 * scaleX, 268.471 * scaleY);
    path_12.lineTo(659.14 * scaleX, 148.58 * scaleY);
    path_12.arcToPoint(
        Offset(589.75 * scaleX, 79.19 * scaleY),
        radius: Radius.elliptical(69.39 * scaleX, 69.39 * scaleY),
        clockwise: false,);
    path_12.lineTo(335.75 * scaleX, 79.19 * scaleY);
    path_12.arcToPoint(
        Offset(266.36 * scaleX, 148.58 * scaleY),
        radius: Radius.elliptical(69.39 * scaleX, 69.39 * scaleY),
        clockwise: false,);
    path_12.lineTo(266.36 * scaleX, 806.3 * scaleY);
    path_12.arcToPoint(
        Offset(335.75 * scaleX, 875.69 * scaleY),
        radius: Radius.elliptical(69.39 * scaleX, 69.39 * scaleY),
        clockwise: false,);
    path_12.lineTo(589.75 * scaleX, 875.69 * scaleY);
    path_12.arcToPoint(
        Offset(659.14 * scaleX, 806.3 * scaleY),
        radius: Radius.elliptical(69.39 * scaleX, 69.39 * scaleY),
        clockwise: false,);
    path_12.lineTo(659.14 * scaleX, 353.8 * scaleY);
    path_12.lineTo(663.52 * scaleX, 353.8 * scaleY);
    path_12.close();
    final Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = const Color(0xff090814);
    canvas.drawPath(path_12, paint12Fill);

    // Path 13: Device inner
    final Path path_13 = Path();
    path_13.moveTo(590.9 * scaleX, 95.686 * scaleY);
    path_13.lineTo(557.751 * scaleX, 95.686 * scaleY);
    path_13.arcToPoint(
        Offset(534.951 * scaleX, 129.604 * scaleY),
        radius: Radius.elliptical(24.619 * scaleX, 24.619 * scaleY),);
    path_13.lineTo(389.428 * scaleX, 129.604 * scaleY);
    path_13.arcToPoint(
        Offset(366.628 * scaleX, 95.686 * scaleY),
        radius: Radius.elliptical(24.619 * scaleX, 24.619 * scaleY),);
    path_13.lineTo(335.669 * scaleX, 95.686 * scaleY);
    path_13.arcToPoint(
        Offset(283.849 * scaleX, 147.506 * scaleY),
        radius: Radius.elliptical(51.82 * scaleX, 51.82 * scaleY),
        clockwise: false,);
    path_13.lineTo(283.849 * scaleX, 804.264 * scaleY);
    path_13.arcToPoint(
        Offset(335.667 * scaleX, 856.083 * scaleY),
        radius: Radius.elliptical(51.819 * scaleX, 51.819 * scaleY),
        clockwise: false,);
    path_13.lineTo(590.893 * scaleX, 856.083 * scaleY);
    path_13.arcToPoint(
        Offset(642.713 * scaleX, 804.263 * scaleY),
        radius: Radius.elliptical(51.82 * scaleX, 51.82 * scaleY),
        clockwise: false,);
    path_13.lineTo(642.713 * scaleX, 147.506 * scaleY);
    path_13.arcToPoint(
        Offset(590.9 * scaleX, 95.686 * scaleY),
        radius: Radius.elliptical(51.819 * scaleX, 51.819 * scaleY),
        clockwise: false,);
    path_13.close();
    final Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = const Color(0xffffffff);
    canvas.drawPath(path_13, paint13Fill);

    canvas.restore(); // End Group 2

    // Path 14: Notification 1 background
    final Path path_14 = Path();
    path_14.moveTo(996.259 * scaleX, 449.177 * scaleY);
    path_14.lineTo(684.893 * scaleX, 449.177 * scaleY);
    path_14.arcToPoint(
        Offset(674.429 * scaleX, 438.713 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_14.lineTo(674.429 * scaleX, 393.113 * scaleY);
    path_14.arcToPoint(
        Offset(684.893 * scaleX, 382.649 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_14.lineTo(996.259 * scaleX, 382.649 * scaleY);
    path_14.arcToPoint(
        Offset(1006.723 * scaleX, 393.113 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_14.lineTo(1006.723 * scaleX, 438.713 * scaleY);
    path_14.arcToPoint(
        Offset(996.259 * scaleX, 449.178 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_14.close();
    final Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_14, paint14Fill);

    // Path 15: Notification 1 foreground
    final Path path_15 = Path();
    path_15.moveTo(965.076 * scaleX, 441.187 * scaleY);
    path_15.lineTo(691.023 * scaleX, 441.187 * scaleY);
    path_15.arcToPoint(
        Offset(680.559 * scaleX, 430.723 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_15.lineTo(680.559 * scaleX, 399.243 * scaleY);
    path_15.arcToPoint(
        Offset(691.023 * scaleX, 388.779 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_15.lineTo(988.27 * scaleX, 388.779 * scaleY);
    path_15.arcToPoint(
        Offset(998.734 * scaleX, 399.243 * scaleY),
        radius: Radius.elliptical(10.477 * scaleX, 10.477 * scaleY),);
    path_15.lineTo(998.734 * scaleX, 407.528 * scaleY);
    path_15.arcToPoint(
        Offset(965.075 * scaleX, 441.187 * scaleY),
        radius: Radius.elliptical(33.7 * scaleX, 33.7 * scaleY),);
    path_15.close();
    final Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = const Color(0xffffffff);
    canvas.drawPath(path_15, paint15Fill);

    // Path 16: Notification 1 line 1
    final Path path_16 = Path();
    path_16.moveTo(862.352 * scaleX, 409.422 * scaleY);
    path_16.lineTo(737.207 * scaleX, 409.422 * scaleY);
    path_16.arcToPoint(
        Offset(737.207 * scaleX, 404.022 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),);
    path_16.lineTo(862.352 * scaleX, 404.022 * scaleY);
    path_16.arcToPoint(
        Offset(862.352 * scaleX, 409.422 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_16.close();
    final Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = const Color(0xff17B8A6);
    canvas.drawPath(path_16, paint16Fill);

    // Path 17: Notification 1 line 2
    final Path path_17 = Path();
    path_17.moveTo(925.7 * scaleX, 419 * scaleY);
    path_17.lineTo(737.2 * scaleX, 419 * scaleY);
    path_17.arcToPoint(
        Offset(737.2 * scaleX, 413.6 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_17.lineTo(925.7 * scaleX, 413.6 * scaleY);
    path_17.arcToPoint(
        Offset(925.7 * scaleX, 419 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_17.close();
    final Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_17, paint17Fill);

    // Path 18: Notification 2 background
    final Path path_18 = Path();
    path_18.moveTo(996.259 * scaleX, 533.177 * scaleY);
    path_18.lineTo(684.893 * scaleX, 533.177 * scaleY);
    path_18.arcToPoint(
        Offset(674.429 * scaleX, 522.713 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_18.lineTo(674.429 * scaleX, 477.113 * scaleY);
    path_18.arcToPoint(
        Offset(684.893 * scaleX, 466.649 * scaleY),
        radius: Radius.elliptical(10.477 * scaleX, 10.477 * scaleY),);
    path_18.lineTo(996.259 * scaleX, 466.649 * scaleY);
    path_18.arcToPoint(
        Offset(1006.723 * scaleX, 477.113 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_18.lineTo(1006.723 * scaleX, 522.713 * scaleY);
    path_18.arcToPoint(
        Offset(996.259 * scaleX, 533.177 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_18.close();
    final Paint paint18Fill = Paint()..style = PaintingStyle.fill;
    paint18Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_18, paint18Fill);

    // Path 19: Notification 2 foreground
    final Path path_19 = Path();
    path_19.moveTo(965.076 * scaleX, 525.187 * scaleY);
    path_19.lineTo(691.023 * scaleX, 525.187 * scaleY);
    path_19.arcToPoint(
        Offset(680.559 * scaleX, 514.723 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_19.lineTo(680.559 * scaleX, 483.243 * scaleY);
    path_19.arcToPoint(
        Offset(691.023 * scaleX, 472.779 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_19.lineTo(988.27 * scaleX, 472.779 * scaleY);
    path_19.arcToPoint(
        Offset(998.734 * scaleX, 483.243 * scaleY),
        radius: Radius.elliptical(10.477 * scaleX, 10.477 * scaleY),);
    path_19.lineTo(998.734 * scaleX, 491.528 * scaleY);
    path_19.arcToPoint(
        Offset(965.075 * scaleX, 525.187 * scaleY),
        radius: Radius.elliptical(33.7 * scaleX, 33.7 * scaleY),);
    path_19.close();
    final Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = const Color(0xffffffff);
    canvas.drawPath(path_19, paint19Fill);

    // Path 20: Notification 2 line 1
    final Path path_20 = Path();
    path_20.moveTo(862.352 * scaleX, 493.422 * scaleY);
    path_20.lineTo(737.207 * scaleX, 493.422 * scaleY);
    path_20.arcToPoint(
        Offset(737.207 * scaleX, 488.022 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),);
    path_20.lineTo(862.352 * scaleX, 488.022 * scaleY);
    path_20.arcToPoint(
        Offset(862.352 * scaleX, 493.422 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_20.close();
    final Paint paint20Fill = Paint()..style = PaintingStyle.fill;
    paint20Fill.color = const Color(0xff17B8A6);
    canvas.drawPath(path_20, paint20Fill);

    // Path 21: Notification 2 line 2
    final Path path_21 = Path();
    path_21.moveTo(925.7 * scaleX, 503 * scaleY);
    path_21.lineTo(737.2 * scaleX, 503 * scaleY);
    path_21.arcToPoint(
        Offset(737.2 * scaleX, 497.6 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_21.lineTo(925.7 * scaleX, 497.6 * scaleY);
    path_21.arcToPoint(
        Offset(925.7 * scaleX, 503 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_21.close();
    final Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_21, paint21Fill);

    // Path 22: Notification 3 background
    final Path path_22 = Path();
    path_22.moveTo(996.259 * scaleX, 617.177 * scaleY);
    path_22.lineTo(684.893 * scaleX, 617.177 * scaleY);
    path_22.arcToPoint(
        Offset(674.429 * scaleX, 606.713 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_22.lineTo(674.429 * scaleX, 561.113 * scaleY);
    path_22.arcToPoint(
        Offset(684.893 * scaleX, 550.649 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_22.lineTo(996.259 * scaleX, 550.649 * scaleY);
    path_22.arcToPoint(
        Offset(1006.723 * scaleX, 561.113 * scaleY),
        radius: Radius.elliptical(10.477 * scaleX, 10.477 * scaleY),);
    path_22.lineTo(1006.723 * scaleX, 606.713 * scaleY);
    path_22.arcToPoint(
        Offset(996.259 * scaleX, 617.177 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_22.close();
    final Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_22, paint22Fill);

    // Path 23: Notification 3 foreground
    final Path path_23 = Path();
    path_23.moveTo(965.076 * scaleX, 609.187 * scaleY);
    path_23.lineTo(691.023 * scaleX, 609.187 * scaleY);
    path_23.arcToPoint(
        Offset(680.559 * scaleX, 598.723 * scaleY),
        radius: Radius.elliptical(10.476 * scaleX, 10.476 * scaleY),);
    path_23.lineTo(680.559 * scaleX, 567.243 * scaleY);
    path_23.arcToPoint(
        Offset(691.023 * scaleX, 556.779 * scaleY),
        radius: Radius.elliptical(10.477 * scaleX, 10.477 * scaleY),);
    path_23.lineTo(988.27 * scaleX, 556.779 * scaleY);
    path_23.arcToPoint(
        Offset(998.734 * scaleX, 567.243 * scaleY),
        radius: Radius.elliptical(10.477 * scaleX, 10.477 * scaleY),);
    path_23.lineTo(998.734 * scaleX, 575.528 * scaleY);
    path_23.arcToPoint(
        Offset(965.076 * scaleX, 609.187 * scaleY),
        radius: Radius.elliptical(33.7 * scaleX, 33.7 * scaleY),);
    path_23.close();
    final Paint paint23Fill = Paint()..style = PaintingStyle.fill;
    paint23Fill.color = const Color(0xffffffff);
    canvas.drawPath(path_23, paint23Fill);

    // Path 24: Notification 3 line 1
    final Path path_24 = Path();
    path_24.moveTo(862.352 * scaleX, 577.422 * scaleY);
    path_24.lineTo(737.207 * scaleX, 577.422 * scaleY);
    path_24.arcToPoint(
        Offset(737.207 * scaleX, 572.022 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_24.lineTo(862.352 * scaleX, 572.022 * scaleY);
    path_24.arcToPoint(
        Offset(862.352 * scaleX, 577.422 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_24.close();
    final Paint paint24Fill = Paint()..style = PaintingStyle.fill;
    paint24Fill.color = const Color(0xff17B8A6);
    canvas.drawPath(path_24, paint24Fill);

    // Path 25: Notification 3 line 2
    final Path path_25 = Path();
    path_25.moveTo(925.7 * scaleX, 587 * scaleY);
    path_25.lineTo(737.2 * scaleX, 587 * scaleY);
    path_25.arcToPoint(
        Offset(737.2 * scaleX, 581.6 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_25.lineTo(925.7 * scaleX, 581.6 * scaleY);
    path_25.arcToPoint(
        Offset(925.7 * scaleX, 587 * scaleY),
        radius: Radius.elliptical(2.7 * scaleX, 2.7 * scaleY),
        largeArc: true,);
    path_25.close();
    final Paint paint25Fill = Paint()..style = PaintingStyle.fill;
    paint25Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_25, paint25Fill);

    // Group 3: translate(1112.037 229.628)
    canvas.save();
    canvas.translate(1112.037 * scaleX, 229.628 * scaleY);

    // Path 26: Icon part 1
    final Path path_26 = Path();
    path_26.moveTo(87.317 * scaleX, 81.006 * scaleY);
    path_26.lineTo(4.607 * scaleX, 81.006 * scaleY);
    path_26.arcToPoint(
        Offset(2.337 * scaleX, 72.39 * scaleY),
        radius: Radius.elliptical(4.607 * scaleX, 4.607 * scaleY),);
    path_26.cubicTo(5.944 * scaleX, 70.348 * scaleY, 7.892 * scaleX, 66.63 * scaleY, 8.654 * scaleX, 60.337 * scaleY);
    path_26.lineTo(10.367 * scaleX, 44.875 * scaleY);
    path_26.arcToPoint(
        Offset(31.267 * scaleX, 11.424 * scaleY),
        radius: Radius.elliptical(40.528 * scaleX, 40.528 * scaleY),);
    path_26.cubicTo(32.549 * scaleX, 3.857 * scaleY, 38.535 * scaleX, -3.776 * scaleY, 46.003 * scaleX, -3.776 * scaleY);
    path_26.cubicTo(53.943 * scaleX, -3.776 * scaleY, 59.375 * scaleX, 4.408 * scaleY, 60.628 * scaleX, 11.407 * scaleY);
    path_26.arcToPoint(
        Offset(81.58 * scaleX, 45.167 * scaleY),
        radius: Radius.elliptical(40.7 * scaleX, 40.7 * scaleY),);
    path_26.lineTo(83.28 * scaleX, 60.382 * scaleY);
    path_26.cubicTo(84.037 * scaleX, 66.632 * scaleY, 85.98 * scaleX, 70.349 * scaleY, 89.587 * scaleX, 72.39 * scaleY);
    path_26.arcToPoint(
        Offset(87.317 * scaleX, 81.006 * scaleY),
        radius: Radius.elliptical(4.607 * scaleX, 4.607 * scaleY),);
    path_26.close();
    path_26.moveTo(14.934 * scaleX, 71.791 * scaleY);
    path_26.lineTo(76.99 * scaleX, 71.791 * scaleY);
    path_26.arcToPoint(
        Offset(74.127 * scaleX, 61.444 * scaleY),
        radius: Radius.elliptical(31.973 * scaleX, 31.973 * scaleY),);
    path_26.lineTo(72.4 * scaleX, 45.891 * scaleY);
    path_26.arcToPoint(
        Offset(54.332 * scaleX, 18.531 * scaleY),
        radius: Radius.elliptical(31.658 * scaleX, 31.658 * scaleY),
        clockwise: false,);
    path_26.arcToPoint(
        Offset(51.694 * scaleX, 14.366 * scaleY),
        radius: Radius.elliptical(4.607 * scaleX, 4.607 * scaleY),);
    path_26.cubicTo(51.694 * scaleX, 10.53 * scaleY, 48.452 * scaleX, 5.443 * scaleY, 46.008 * scaleX, 5.443 * scaleY);
    path_26.cubicTo(43.542 * scaleX, 5.443 * scaleY, 40.277 * scaleX, 10.46 * scaleY, 40.232 * scaleX, 14.287 * scaleY);
    path_26.arcToPoint(
        Offset(37.507 * scaleX, 18.572 * scaleY),
        radius: Radius.elliptical(4.615 * scaleX, 4.615 * scaleY),);
    path_26.arcToPoint(
        Offset(19.548 * scaleX, 45.6 * scaleY),
        radius: Radius.elliptical(31.516 * scaleX, 31.516 * scaleY),
        clockwise: false,);
    path_26.lineTo(17.807 * scaleX, 61.4 * scaleY);
    path_26.arcToPoint(
        Offset(14.934 * scaleX, 71.791 * scaleY),
        radius: Radius.elliptical(32.117 * scaleX, 32.117 * scaleY),);
    path_26.close();
    final Paint paint26Fill = Paint()..style = PaintingStyle.fill;
    paint26Fill.color = const Color(0xff000000);
    canvas.drawPath(path_26, paint26Fill);

    // Path 27: Icon part 2
    final Path path_27 = Path();
    path_27.moveTo(25.115 * scaleX, 42.892 * scaleY);
    path_27.arcToPoint(
        Offset(5 * scaleX, 22.777 * scaleY),
        radius: Radius.elliptical(20.138 * scaleX, 20.138 * scaleY),);
    path_27.lineTo(5 * scaleX, 17.607 * scaleY);
    path_27.arcToPoint(
        Offset(14.215 * scaleX, 17.607 * scaleY),
        radius: Radius.elliptical(4.607 * scaleX, 4.607 * scaleY),
        largeArc: true,);
    path_27.lineTo(14.215 * scaleX, 22.776 * scaleY);
    path_27.arcToPoint(
        Offset(36.015 * scaleX, 22.776 * scaleY),
        radius: Radius.elliptical(10.9 * scaleX, 10.9 * scaleY),
        largeArc: true,
        clockwise: false,);
    path_27.lineTo(36.015 * scaleX, 17.607 * scaleY);
    path_27.arcToPoint(
        Offset(45.23 * scaleX, 17.607 * scaleY),
        radius: Radius.elliptical(4.607 * scaleX, 4.607 * scaleY),);
    path_27.lineTo(45.23 * scaleX, 22.776 * scaleY);
    path_27.arcToPoint(
        Offset(25.115 * scaleX, 42.892 * scaleY),
        radius: Radius.elliptical(20.138 * scaleX, 20.138 * scaleY),);
    path_27.close();
    final Paint paint27Fill = Paint()..style = PaintingStyle.fill;
    paint27Fill.color = const Color(0xff000000);
    canvas.drawPath(path_27, paint27Fill);

    canvas.restore(); // End Group 3

    // Path 28: Cloud background
    final Path path_28 = Path();
    path_28.moveTo(650 * scaleX, 259.482 * scaleY);
    path_28.arcToPoint(
        Offset(652.211 * scaleX, 266.771 * scaleY),
        radius: Radius.elliptical(17.1 * scaleX, 17.1 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(664.473 * scaleX, 276.941 * scaleY),
        radius: Radius.elliptical(24.671 * scaleX, 24.671 * scaleY),
        clockwise: false,);
    path_28.cubicTo(670.673 * scaleX, 279.479 * scaleY, 677.59 * scaleX, 279.557 * scaleY, 684.173 * scaleX, 278.991 * scaleY);
    path_28.cubicTo(690.287 * scaleX, 278.465 * scaleY, 696.338 * scaleX, 277.247 * scaleY, 702.473 * scaleX, 276.991 * scaleY);
    path_28.arcToPoint(
        Offset(716.702 * scaleX, 277.33 * scaleY),
        radius: Radius.elliptical(127.518 * scaleX, 127.518 * scaleY),);
    path_28.cubicTo(725.884 * scaleX, 277.982 * scaleY, 735.028 * scaleX, 279.191 * scaleY, 744.114 * scaleX, 280.657 * scaleY);
    path_28.quadraticBezierTo(747.805 * scaleX, 281.245 * scaleY, 751.48 * scaleX, 281.921 * scaleY);
    path_28.arcToPoint(
        Offset(752.164 * scaleX, 282.048 * scaleY),
        radius: Radius.elliptical(3.646 * scaleX, 3.646 * scaleY),);
    path_28.cubicTo(752.208 * scaleX, 282.066 * scaleY, 752.28 * scaleX, 282.048 * scaleY, 752.321 * scaleX, 282.078 * scaleY);
    path_28.cubicTo(752.395 * scaleX, 282.125 * scaleY, 752.021 * scaleX, 281.96 * scaleY, 752.248 * scaleX, 282.147 * scaleY);
    path_28.arcToPoint(
        Offset(753.087 * scaleX, 283.227 * scaleY),
        radius: Radius.elliptical(6.788 * scaleX, 6.788 * scaleY),);
    path_28.lineTo(756.442 * scaleX, 287.545 * scaleY);
    path_28.arcToPoint(
        Offset(759.542 * scaleX, 291.264 * scaleY),
        radius: Radius.elliptical(20.406 * scaleX, 20.406 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(765.753 * scaleX, 291.697 * scaleY),
        radius: Radius.elliptical(5.611 * scaleX, 5.611 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(768.063 * scaleX, 289.073 * scaleY),
        radius: Radius.elliptical(6.207 * scaleX, 6.207 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(770.81 * scaleX, 285.108 * scaleY),
        radius: Radius.elliptical(22.64 * scaleX, 22.64 * scaleY),);
    path_28.cubicTo(774.802 * scaleX, 280.451 * scaleY, 780.35 * scaleX, 277.587 * scaleY, 784.99 * scaleX, 273.668 * scaleY);
    path_28.arcToPoint(
        Offset(790.661 * scaleX, 267.185 * scaleY),
        radius: Radius.elliptical(25.258 * scaleX, 25.258 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(793.004 * scaleX, 259.905 * scaleY),
        radius: Radius.elliptical(18.332 * scaleX, 18.332 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(789.274 * scaleX, 244.956 * scaleY),
        radius: Radius.elliptical(24.35 * scaleX, 24.35 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(777.152 * scaleX, 233.856 * scaleY),
        radius: Radius.elliptical(29.862 * scaleX, 29.862 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(759.092 * scaleX, 228.907 * scaleY),
        radius: Radius.elliptical(52.331 * scaleX, 52.331 * scaleY),
        clockwise: false,);
    path_28.arcToPoint(
        Offset(739.142 * scaleX, 228.246 * scaleY),
        radius: Radius.elliptical(163.637 * scaleX, 163.637 * scaleY),
        clockwise: false,);
    path_28.quadraticBezierTo(727.954 * scaleX, 228.371 * scaleY, 716.807 * scaleX, 229.23 * scaleY);
    path_28.quadraticBezierTo(705.644 * scaleX, 230.094 * scaleY, 694.57 * scaleX, 231.686 * scaleY);
    path_28.arcToPoint(
        Offset(673.38 * scaleX, 235.568 * scaleY),
        radius: Radius.elliptical(194.042 * scaleX, 194.042 * scaleY),
        clockwise: false,);
    path_28.cubicTo(667.254 * scaleX, 237.16 * scaleY, 661.145 * scaleX, 239.649 * scaleY, 656.57 * scaleX, 244.158 * scaleY);
    path_28.cubicTo(652.5 * scaleX, 248.178 * scaleY, 649.67 * scaleX, 253.664 * scaleY, 650 * scaleX, 259.482 * scaleY);
    path_28.close();
    final Paint paint28Fill = Paint()..style = PaintingStyle.fill;
    paint28Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_28, paint28Fill);

    // Path 29: Cloud foreground
    final Path path_29 = Path();
    path_29.moveTo(688.491 * scaleX, 244.693 * scaleY);
    path_29.cubicTo(681.878 * scaleX, 245.913 * scaleY, 674.956 * scaleX, 247.407 * scaleY, 669.407 * scaleX, 251.025 * scaleY);
    path_29.cubicTo(663.919 * scaleX, 254.604 * scaleY, 660.582 * scaleX, 260.23 * scaleY, 660.907 * scaleX, 265.359 * scaleY);
    path_29.cubicTo(661.381 * scaleX, 272.85 * scaleY, 669.346 * scaleX, 278.453 * scaleY, 676.6 * scaleX, 279.92 * scaleY);
    path_29.cubicTo(683.548 * scaleX, 281.325 * scaleY, 690.786 * scaleX, 280.374 * scaleY, 698.448 * scaleX, 279.365 * scaleY);
    path_29.cubicTo(700.148 * scaleX, 279.142 * scaleY, 701.897 * scaleX, 278.911 * scaleY, 703.632 * scaleX, 278.711 * scaleY);
    path_29.cubicTo(722.494 * scaleX, 276.531 * scaleY, 757.91 * scaleX, 283.246 * scaleY, 759.409 * scaleX, 283.533 * scaleY);
    path_29.lineTo(760.966 * scaleX, 283.833 * scaleY);
    path_29.lineTo(769.21 * scaleX, 294.442 * scaleY);
    path_29.arcToPoint(
        Offset(777.81 * scaleX, 283.779 * scaleY),
        radius: Radius.elliptical(29.9 * scaleX, 29.9 * scaleY),);
    path_29.cubicTo(779.396 * scaleX, 282.512 * scaleY, 781.051 * scaleX, 281.335 * scaleY, 782.651 * scaleX, 280.196 * scaleY);
    path_29.cubicTo(786.734 * scaleX, 277.296 * scaleY, 790.59 * scaleX, 274.55 * scaleY, 792.719 * scaleX, 270.782 * scaleY);
    path_29.cubicTo(797.354 * scaleX, 262.577 * scaleY, 791.877 * scaleX, 251.135 * scaleY, 784.062 * scaleX, 245.999 * scaleY);
    path_29.cubicTo(775.262 * scaleX, 240.212 * scaleY, 763.655 * scaleX, 239.305 * scaleY, 752.428 * scaleX, 239.185 * scaleY);
    path_29.quadraticBezierTo(750.674 * scaleX, 239.166 * scaleY, 748.918 * scaleX, 239.166 * scaleY);
    path_29.arcToPoint(
        Offset(688.535 * scaleX, 244.683 * scaleY),
        radius: Radius.elliptical(333.633 * scaleX, 333.633 * scaleY),
        clockwise: false,);
    path_29.close();
    final Paint paint29Fill = Paint()..style = PaintingStyle.fill;
    paint29Fill.color = const Color(0xffffffff);
    canvas.drawPath(path_29, paint29Fill);

    // Path 30: Cloud line 1
    final Path path_30 = Path();
    path_30.moveTo(711.786 * scaleX, 270.216 * scaleY);
    path_30.arcToPoint(
        Offset(713.516 * scaleX, 268.482 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_30.lineTo(793.13 * scaleX, 268.482 * scaleY);
    path_30.arcToPoint(
        Offset(793.13 * scaleX, 271.946 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),
        largeArc: true,);
    path_30.lineTo(713.516 * scaleX, 271.946 * scaleY);
    path_30.arcToPoint(
        Offset(711.786 * scaleX, 270.216 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_30.close();
    final Paint paint30Fill = Paint()..style = PaintingStyle.fill;
    paint30Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_30, paint30Fill);

    // Path 31: Cloud line 2
    final Path path_31 = Path();
    path_31.moveTo(711.786 * scaleX, 294.453 * scaleY);
    path_31.arcToPoint(
        Offset(713.516 * scaleX, 292.719 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_31.lineTo(793.133 * scaleX, 292.719 * scaleY);
    path_31.arcToPoint(
        Offset(793.133 * scaleX, 296.183 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_31.lineTo(713.516 * scaleX, 296.183 * scaleY);
    path_31.arcToPoint(
        Offset(711.786 * scaleX, 294.453 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_31.close();
    final Paint paint31Fill = Paint()..style = PaintingStyle.fill;
    paint31Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_31, paint31Fill);

    // Path 32: Cloud line 3
    final Path path_32 = Path();
    path_32.moveTo(872.12 * scaleX, 318.69 * scaleY);
    path_32.arcToPoint(
        Offset(873.85 * scaleX, 316.956 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_32.lineTo(883.128 * scaleX, 316.956 * scaleY);
    path_32.arcToPoint(
        Offset(883.128 * scaleX, 320.42 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_32.lineTo(873.85 * scaleX, 320.42 * scaleY);
    path_32.arcToPoint(
        Offset(872.12 * scaleX, 318.69 * scaleY),
        radius: Radius.elliptical(1.732 * scaleX, 1.732 * scaleY),);
    path_32.close();
    final Paint paint32Fill = Paint()..style = PaintingStyle.fill;
    paint32Fill.color = const Color(0xffd6d6e3);
    canvas.drawPath(path_32, paint32Fill);

    // Path 33: Cloud inner
    final Path path_33 = Path();
    path_33.moveTo(538.081 * scaleX, 258.042 * scaleY);
    path_33.cubicTo(538.038 * scaleX, 258.042 * scaleY, 537.994 * scaleX, 258.042 * scaleY, 537.95 * scaleX, 258.042 * scaleY);
    path_33.arcToPoint(
        Offset(535.392 * scaleX, 256.102 * scaleY),
        radius: Radius.elliptical(3.131 * scaleX, 3.131 * scaleY),);
    path_33.arcToPoint(
        Offset(527.826 * scaleX, 245.172 * scaleY),
        radius: Radius.elliptical(45.565 * scaleX, 45.565 * scaleY),
        clockwise: false,);
    path_33.cubicTo(526.05 * scaleX, 243.279 * scaleY, 524.195 * scaleX, 241.52 * scaleY, 522.4 * scaleX, 239.817 * scaleY);
    path_33.cubicTo(517.771 * scaleX, 235.428 * scaleY, 513.411 * scaleX, 231.294 * scaleY, 510.991 * scaleX, 225.581 * scaleY);
    path_33.cubicTo(505.715 * scaleX, 213.125 * scaleY, 511.928 * scaleX, 195.781 * scaleY, 520.805 * scaleX, 187.996 * scaleY);
    path_33.cubicTo(530.762 * scaleX, 179.27 * scaleY, 543.858 * scaleX, 177.901 * scaleY, 556.527 * scaleX, 177.722 * scaleY);
    path_33.quadraticBezierTo(558.502 * scaleX, 177.694 * scaleY, 560.479 * scaleX, 177.694 * scaleY);
    path_33.lineTo(560.479 * scaleX, 177.694 * scaleY);
    path_33.arcToPoint(
        Offset(628.536 * scaleX, 185.994 * scaleY),
        radius: Radius.elliptical(285.784 * scaleX, 285.784 * scaleY),);
    path_33.cubicTo(636.001 * scaleX, 187.831 * scaleY, 643.815 * scaleX, 190.081 * scaleY, 650.095 * scaleX, 195.541 * scaleY);
    path_33.cubicTo(657.735 * scaleX, 202.081 * scaleY, 661.995 * scaleX, 211.881 * scaleY, 658.495 * scaleX, 220.781 * scaleY);
    path_33.cubicTo(655.995 * scaleX, 227.581 * scaleY, 649.695 * scaleX, 232.781 * scaleY, 642.695 * scaleX, 236.781 * scaleY);
    path_33.cubicTo(635.695 * scaleX, 240.781 * scaleY, 627.995 * scaleX, 243.281 * scaleY, 620.095 * scaleX, 244.781 * scaleY);
    path_33.cubicTo(612.195 * scaleX, 246.281 * scaleY, 604.095 * scaleX, 246.781 * scaleY, 596.095 * scaleX, 246.781 * scaleY);
    path_33.cubicTo(588.095 * scaleX, 246.781 * scaleY, 580.095 * scaleX, 246.281 * scaleY, 572.095 * scaleX, 245.781 * scaleY);
    path_33.cubicTo(564.095 * scaleX, 245.281 * scaleY, 556.095 * scaleX, 244.781 * scaleY, 548.095 * scaleX, 244.781 * scaleY);
    path_33.cubicTo(540.095 * scaleX, 244.781 * scaleY, 532.095 * scaleX, 245.281 * scaleY, 524.095 * scaleX, 246.781 * scaleY);
    path_33.cubicTo(516.095 * scaleX, 248.281 * scaleY, 508.095 * scaleX, 250.781 * scaleY, 500.095 * scaleX, 254.781 * scaleY);
    path_33.cubicTo(492.095 * scaleX, 258.781 * scaleY, 484.095 * scaleX, 264.781 * scaleY, 477.095 * scaleX, 272.781 * scaleY);
    path_33.cubicTo(470.095 * scaleX, 280.781 * scaleY, 464.095 * scaleX, 290.781 * scaleY, 460.095 * scaleX, 302.781 * scaleY);
    path_33.cubicTo(456.095 * scaleX, 314.781 * scaleY, 454.095 * scaleX, 328.781 * scaleY, 454.095 * scaleX, 344.781 * scaleY);
    path_33.cubicTo(454.095 * scaleX, 360.781 * scaleY, 456.095 * scaleX, 376.781 * scaleY, 460.095 * scaleX, 392.781 * scaleY);
    path_33.cubicTo(464.095 * scaleX, 408.781 * scaleY, 470.095 * scaleX, 424.781 * scaleY, 477.095 * scaleX, 440.781 * scaleY);
    path_33.cubicTo(484.095 * scaleX, 456.781 * scaleY, 492.095 * scaleX, 472.781 * scaleY, 500.095 * scaleX, 488.781 * scaleY);
    path_33.cubicTo(508.095 * scaleX, 504.781 * scaleY, 516.095 * scaleX, 520.781 * scaleY, 524.095 * scaleX, 536.781 * scaleY);
    path_33.cubicTo(532.095 * scaleX, 552.781 * scaleY, 540.095 * scaleX, 568.781 * scaleY, 548.095 * scaleX, 584.781 * scaleY);
    path_33.cubicTo(556.095 * scaleX, 600.781 * scaleY, 564.095 * scaleX, 616.781 * scaleY, 572.095 * scaleX, 632.781 * scaleY);
    path_33.cubicTo(580.095 * scaleX, 648.781 * scaleY, 588.095 * scaleX, 664.781 * scaleY, 596.095 * scaleX, 680.781 * scaleY);
    path_33.cubicTo(604.095 * scaleX, 696.781 * scaleY, 612.195 * scaleX, 712.781 * scaleY, 620.095 * scaleX, 728.781 * scaleY);
    path_33.cubicTo(627.995 * scaleX, 744.781 * scaleY, 635.695 * scaleX, 760.781 * scaleY, 642.695 * scaleX, 776.781 * scaleY);
    path_33.cubicTo(649.695 * scaleX, 792.781 * scaleY, 655.995 * scaleX, 808.781 * scaleY, 658.495 * scaleX, 824.781 * scaleY);
    path_33.cubicTo(661.995 * scaleX, 840.781 * scaleY, 657.735 * scaleX, 856.781 * scaleY, 650.095 * scaleX, 872.781 * scaleY);
    path_33.cubicTo(643.815 * scaleX, 888.781 * scaleY, 636.001 * scaleX, 904.781 * scaleY, 628.536 * scaleX, 920.781 * scaleY);
    path_33.arcToPoint(
        Offset(560.479 * scaleX, 929.081 * scaleY),
        radius: Radius.elliptical(285.784 * scaleX, 285.784 * scaleY),);
    path_33.lineTo(560.479 * scaleX, 929.081 * scaleY);
    path_33.quadraticBezierTo(558.502 * scaleX, 929.081 * scaleY, 556.527 * scaleX, 929.081 * scaleY);
    path_33.cubicTo(543.858 * scaleX, 928.902 * scaleY, 530.762 * scaleX, 927.533 * scaleY, 520.805 * scaleX, 918.807 * scaleY);
    path_33.cubicTo(511.928 * scaleX, 911.022 * scaleY, 505.715 * scaleX, 893.678 * scaleY, 510.991 * scaleX, 881.222 * scaleY);
    path_33.cubicTo(513.411 * scaleX, 875.509 * scaleY, 517.771 * scaleX, 871.375 * scaleY, 522.4 * scaleX, 866.986 * scaleY);
    path_33.cubicTo(524.195 * scaleX, 865.283 * scaleY, 526.05 * scaleX, 863.524 * scaleY, 527.826 * scaleX, 861.631 * scaleY);
    path_33.arcToPoint(
        Offset(535.392 * scaleX, 850.701 * scaleY),
        radius: Radius.elliptical(45.565 * scaleX, 45.565 * scaleY),
        clockwise: false,);
    path_33.arcToPoint(
        Offset(537.95 * scaleX, 848.761 * scaleY),
        radius: Radius.elliptical(3.131 * scaleX, 3.131 * scaleY),);
    path_33.cubicTo(537.994 * scaleX, 848.761 * scaleY, 538.038 * scaleX, 848.761 * scaleY, 538.081 * scaleX, 848.761 * scaleY);
    path_33.cubicTo(538.124 * scaleX, 848.761 * scaleY, 538.168 * scaleX, 848.761 * scaleY, 538.211 * scaleX, 848.761 * scaleY);
    path_33.arcToPoint(
        Offset(540.769 * scaleX, 850.701 * scaleY),
        radius: Radius.elliptical(3.131 * scaleX, 3.131 * scaleY),);
    path_33.arcToPoint(
        Offset(548.335 * scaleX, 861.631 * scaleY),
        radius: Radius.elliptical(45.565 * scaleX, 45.565 * scaleY),
        clockwise: false,);
    path_33.cubicTo(550.111 * scaleX, 863.524 * scaleY, 551.966 * scaleX, 865.283 * scaleY, 553.761 * scaleX, 866.986 * scaleY);
    path_33.cubicTo(558.39 * scaleX, 871.375 * scaleY, 562.75 * scaleX, 875.509 * scaleY, 565.17 * scaleX, 881.222 * scaleY);
    path_33.cubicTo(570.446 * scaleX, 893.678 * scaleY, 564.233 * scaleX, 911.022 * scaleY, 555.356 * scaleX, 918.807 * scaleY);
    path_33.cubicTo(545.399 * scaleX, 927.533 * scaleY, 532.303 * scaleX, 928.902 * scaleY, 519.634 * scaleX, 929.081 * scaleY);
    path_33.quadraticBezierTo(517.659 * scaleX, 929.081 * scaleY, 515.682 * scaleX, 929.081 * scaleY);
    path_33.lineTo(515.682 * scaleX, 929.081 * scaleY);
    path_33.arcToPoint(
        Offset(447.625 * scaleX, 920.781 * scaleY),
        radius: Radius.elliptical(285.784 * scaleX, 285.784 * scaleY),);
    path_33.cubicTo(440.16 * scaleX, 904.781 * scaleY, 432.346 * scaleX, 888.781 * scaleY, 426.066 * scaleX, 872.781 * scaleY);
    path_33.cubicTo(418.426 * scaleX, 856.781 * scaleY, 414.166 * scaleX, 840.781 * scaleY, 416.666 * scaleX, 824.781 * scaleY);
    path_33.cubicTo(419.166 * scaleX, 808.781 * scaleY, 425.466 * scaleX, 792.781 * scaleY, 432.466 * scaleX, 776.781 * scaleY);
    path_33.cubicTo(439.466 * scaleX, 760.781 * scaleY, 447.166 * scaleX, 744.781 * scaleY, 455.066 * scaleX, 728.781 * scaleY);
    path_33.cubicTo(462.966 * scaleX, 712.781 * scaleY, 471.066 * scaleX, 696.781 * scaleY, 479.066 * scaleX, 680.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 664.781 * scaleY, 495.066 * scaleX, 648.781 * scaleY, 503.066 * scaleX, 632.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 616.781 * scaleY, 519.066 * scaleX, 600.781 * scaleY, 527.066 * scaleX, 584.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 568.781 * scaleY, 543.066 * scaleX, 552.781 * scaleY, 551.066 * scaleX, 536.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 520.781 * scaleY, 567.066 * scaleX, 504.781 * scaleY, 575.066 * scaleX, 488.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 472.781 * scaleY, 591.066 * scaleX, 456.781 * scaleY, 598.066 * scaleX, 440.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 424.781 * scaleY, 611.066 * scaleX, 408.781 * scaleY, 615.066 * scaleX, 392.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 376.781 * scaleY, 621.066 * scaleX, 360.781 * scaleY, 621.066 * scaleX, 344.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 328.781 * scaleY, 619.066 * scaleX, 314.781 * scaleY, 615.066 * scaleX, 302.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 290.781 * scaleY, 605.066 * scaleX, 280.781 * scaleY, 598.066 * scaleX, 272.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 264.781 * scaleY, 583.066 * scaleX, 258.781 * scaleY, 575.066 * scaleX, 254.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 250.781 * scaleY, 559.066 * scaleX, 248.281 * scaleY, 551.066 * scaleX, 246.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 245.281 * scaleY, 535.066 * scaleX, 244.781 * scaleY, 527.066 * scaleX, 244.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 244.781 * scaleY, 511.066 * scaleX, 245.281 * scaleY, 503.066 * scaleX, 245.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 246.281 * scaleY, 487.066 * scaleX, 246.781 * scaleY, 479.066 * scaleX, 246.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 246.781 * scaleY, 463.066 * scaleX, 247.281 * scaleY, 455.066 * scaleX, 248.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 250.281 * scaleY, 439.066 * scaleX, 252.781 * scaleY, 431.066 * scaleX, 256.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 260.781 * scaleY, 415.066 * scaleX, 266.781 * scaleY, 408.066 * scaleX, 274.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 282.781 * scaleY, 395.066 * scaleX, 292.781 * scaleY, 391.066 * scaleX, 304.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 316.781 * scaleY, 385.066 * scaleX, 330.781 * scaleY, 385.066 * scaleX, 346.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 362.781 * scaleY, 387.066 * scaleX, 378.781 * scaleY, 391.066 * scaleX, 394.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 410.781 * scaleY, 401.066 * scaleX, 426.781 * scaleY, 408.066 * scaleX, 442.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 458.781 * scaleY, 423.066 * scaleX, 474.781 * scaleY, 431.066 * scaleX, 490.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 506.781 * scaleY, 447.066 * scaleX, 522.781 * scaleY, 455.066 * scaleX, 538.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 554.781 * scaleY, 471.066 * scaleX, 570.781 * scaleY, 479.066 * scaleX, 586.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 602.781 * scaleY, 495.066 * scaleX, 618.781 * scaleY, 503.066 * scaleX, 634.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 650.781 * scaleY, 519.066 * scaleX, 666.781 * scaleY, 527.066 * scaleX, 682.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 698.781 * scaleY, 543.066 * scaleX, 714.781 * scaleY, 551.066 * scaleX, 730.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 746.781 * scaleY, 567.066 * scaleX, 762.781 * scaleY, 575.066 * scaleX, 778.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 794.781 * scaleY, 591.066 * scaleX, 810.781 * scaleY, 598.066 * scaleX, 826.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 842.781 * scaleY, 611.066 * scaleX, 858.781 * scaleY, 615.066 * scaleX, 874.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 890.781 * scaleY, 621.066 * scaleX, 906.781 * scaleY, 621.066 * scaleX, 922.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 938.781 * scaleY, 619.066 * scaleX, 954.781 * scaleY, 615.066 * scaleX, 970.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 986.781 * scaleY, 605.066 * scaleX, 1002.781 * scaleY, 598.066 * scaleX, 1018.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 1034.781 * scaleY, 583.066 * scaleX, 1050.781 * scaleY, 575.066 * scaleX, 1066.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 1082.781 * scaleY, 559.066 * scaleX, 1098.781 * scaleY, 551.066 * scaleX, 1114.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 1130.781 * scaleY, 535.066 * scaleX, 1146.781 * scaleY, 527.066 * scaleX, 1162.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 1178.781 * scaleY, 511.066 * scaleX, 1194.781 * scaleY, 503.066 * scaleX, 1210.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 1226.781 * scaleY, 487.066 * scaleX, 1242.781 * scaleY, 479.066 * scaleX, 1258.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 1274.781 * scaleY, 463.066 * scaleX, 1290.781 * scaleY, 455.066 * scaleX, 1306.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 1322.781 * scaleY, 439.066 * scaleX, 1338.781 * scaleY, 431.066 * scaleX, 1354.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 1370.781 * scaleY, 415.066 * scaleX, 1386.781 * scaleY, 408.066 * scaleX, 1402.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 1418.781 * scaleY, 395.066 * scaleX, 1434.781 * scaleY, 391.066 * scaleX, 1450.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 1466.781 * scaleY, 385.066 * scaleX, 1482.781 * scaleY, 385.066 * scaleX, 1498.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 1514.781 * scaleY, 387.066 * scaleX, 1530.781 * scaleY, 391.066 * scaleX, 1546.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 1562.781 * scaleY, 401.066 * scaleX, 1578.781 * scaleY, 408.066 * scaleX, 1594.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 1610.781 * scaleY, 423.066 * scaleX, 1626.781 * scaleY, 431.066 * scaleX, 1642.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 1658.781 * scaleY, 447.066 * scaleX, 1674.781 * scaleY, 455.066 * scaleX, 1690.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 1706.781 * scaleY, 471.066 * scaleX, 1722.781 * scaleY, 479.066 * scaleX, 1738.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 1754.781 * scaleY, 495.066 * scaleX, 1770.781 * scaleY, 503.066 * scaleX, 1786.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 1802.781 * scaleY, 519.066 * scaleX, 1818.781 * scaleY, 527.066 * scaleX, 1834.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 1850.781 * scaleY, 543.066 * scaleX, 1866.781 * scaleY, 551.066 * scaleX, 1882.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 1898.781 * scaleY, 567.066 * scaleX, 1914.781 * scaleY, 575.066 * scaleX, 1930.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 1946.781 * scaleY, 591.066 * scaleX, 1962.781 * scaleY, 598.066 * scaleX, 1978.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 1994.781 * scaleY, 611.066 * scaleX, 2010.781 * scaleY, 615.066 * scaleX, 2026.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 2042.781 * scaleY, 621.066 * scaleX, 2058.781 * scaleY, 621.066 * scaleX, 2074.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 2090.781 * scaleY, 619.066 * scaleX, 2106.781 * scaleY, 615.066 * scaleX, 2122.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 2138.781 * scaleY, 605.066 * scaleX, 2154.781 * scaleY, 598.066 * scaleX, 2170.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 2186.781 * scaleY, 583.066 * scaleX, 2202.781 * scaleY, 575.066 * scaleX, 2218.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 2234.781 * scaleY, 559.066 * scaleX, 2250.781 * scaleY, 551.066 * scaleX, 2266.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 2282.781 * scaleY, 535.066 * scaleX, 2298.781 * scaleY, 527.066 * scaleX, 2314.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 2330.781 * scaleY, 511.066 * scaleX, 2346.781 * scaleY, 503.066 * scaleX, 2362.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 2378.781 * scaleY, 487.066 * scaleX, 2394.781 * scaleY, 479.066 * scaleX, 2410.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 2426.781 * scaleY, 463.066 * scaleX, 2442.781 * scaleY, 455.066 * scaleX, 2458.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 2474.781 * scaleY, 439.066 * scaleX, 2490.781 * scaleY, 431.066 * scaleX, 2506.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 2522.781 * scaleY, 415.066 * scaleX, 2538.781 * scaleY, 408.066 * scaleX, 2554.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 2570.781 * scaleY, 395.066 * scaleX, 2586.781 * scaleY, 391.066 * scaleX, 2602.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 2618.781 * scaleY, 385.066 * scaleX, 2634.781 * scaleY, 385.066 * scaleX, 2650.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 2666.781 * scaleY, 387.066 * scaleX, 2682.781 * scaleY, 391.066 * scaleX, 2698.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 2714.781 * scaleY, 401.066 * scaleX, 2730.781 * scaleY, 408.066 * scaleX, 2746.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 2762.781 * scaleY, 423.066 * scaleX, 2778.781 * scaleY, 431.066 * scaleX, 2794.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 2810.781 * scaleY, 447.066 * scaleX, 2826.781 * scaleY, 455.066 * scaleX, 2842.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 2858.781 * scaleY, 471.066 * scaleX, 2874.781 * scaleY, 479.066 * scaleX, 2890.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 2906.781 * scaleY, 495.066 * scaleX, 2922.781 * scaleY, 503.066 * scaleX, 2938.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 2954.781 * scaleY, 519.066 * scaleX, 2970.781 * scaleY, 527.066 * scaleX, 2986.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 3002.781 * scaleY, 543.066 * scaleX, 3018.781 * scaleY, 551.066 * scaleX, 3034.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 3050.781 * scaleY, 567.066 * scaleX, 3066.781 * scaleY, 575.066 * scaleX, 3082.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 3098.781 * scaleY, 591.066 * scaleX, 3114.781 * scaleY, 598.066 * scaleX, 3130.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 3146.781 * scaleY, 611.066 * scaleX, 3162.781 * scaleY, 615.066 * scaleX, 3178.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 3194.781 * scaleY, 621.066 * scaleX, 3210.781 * scaleY, 621.066 * scaleX, 3226.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 3242.781 * scaleY, 619.066 * scaleX, 3258.781 * scaleY, 615.066 * scaleX, 3274.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 3290.781 * scaleY, 605.066 * scaleX, 3306.781 * scaleY, 598.066 * scaleX, 3322.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 3338.781 * scaleY, 583.066 * scaleX, 3354.781 * scaleY, 575.066 * scaleX, 3370.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 3386.781 * scaleY, 559.066 * scaleX, 3402.781 * scaleY, 551.066 * scaleX, 3418.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 3434.781 * scaleY, 535.066 * scaleX, 3450.781 * scaleY, 527.066 * scaleX, 3466.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 3482.781 * scaleY, 511.066 * scaleX, 3498.781 * scaleY, 503.066 * scaleX, 3514.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 3530.781 * scaleY, 487.066 * scaleX, 3546.781 * scaleY, 479.066 * scaleX, 3562.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 3578.781 * scaleY, 463.066 * scaleX, 3594.781 * scaleY, 455.066 * scaleX, 3610.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 3626.781 * scaleY, 439.066 * scaleX, 3642.781 * scaleY, 431.066 * scaleX, 3658.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 3674.781 * scaleY, 415.066 * scaleX, 3690.781 * scaleY, 408.066 * scaleX, 3706.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 3722.781 * scaleY, 395.066 * scaleX, 3738.781 * scaleY, 391.066 * scaleX, 3754.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 3770.781 * scaleY, 385.066 * scaleX, 3786.781 * scaleY, 385.066 * scaleX, 3802.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 3818.781 * scaleY, 387.066 * scaleX, 3834.781 * scaleY, 391.066 * scaleX, 3850.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 3866.781 * scaleY, 401.066 * scaleX, 3882.781 * scaleY, 408.066 * scaleX, 3898.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 3914.781 * scaleY, 423.066 * scaleX, 3930.781 * scaleY, 431.066 * scaleX, 3946.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 3962.781 * scaleY, 447.066 * scaleX, 3978.781 * scaleY, 455.066 * scaleX, 3994.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 4010.781 * scaleY, 471.066 * scaleX, 4026.781 * scaleY, 479.066 * scaleX, 4042.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 4058.781 * scaleY, 495.066 * scaleX, 4074.781 * scaleY, 503.066 * scaleX, 4090.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 4106.781 * scaleY, 519.066 * scaleX, 4122.781 * scaleY, 527.066 * scaleX, 4138.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 4154.781 * scaleY, 543.066 * scaleX, 4170.781 * scaleY, 551.066 * scaleX, 4186.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 4202.781 * scaleY, 567.066 * scaleX, 4218.781 * scaleY, 575.066 * scaleX, 4234.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 4250.781 * scaleY, 591.066 * scaleX, 4266.781 * scaleY, 598.066 * scaleX, 4282.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 4298.781 * scaleY, 611.066 * scaleX, 4314.781 * scaleY, 615.066 * scaleX, 4330.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 4346.781 * scaleY, 621.066 * scaleX, 4362.781 * scaleY, 621.066 * scaleX, 4378.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 4394.781 * scaleY, 619.066 * scaleX, 4410.781 * scaleY, 615.066 * scaleX, 4426.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 4442.781 * scaleY, 605.066 * scaleX, 4458.781 * scaleY, 598.066 * scaleX, 4474.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 4490.781 * scaleY, 583.066 * scaleX, 4506.781 * scaleY, 575.066 * scaleX, 4522.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 4538.781 * scaleY, 559.066 * scaleX, 4554.781 * scaleY, 551.066 * scaleX, 4570.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 4586.781 * scaleY, 535.066 * scaleX, 4602.781 * scaleY, 527.066 * scaleX, 4618.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 4634.781 * scaleY, 511.066 * scaleX, 4650.781 * scaleY, 503.066 * scaleX, 4666.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 4682.781 * scaleY, 487.066 * scaleX, 4698.781 * scaleY, 479.066 * scaleX, 4714.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 4730.781 * scaleY, 463.066 * scaleX, 4746.781 * scaleY, 455.066 * scaleX, 4762.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 4778.781 * scaleY, 439.066 * scaleX, 4794.781 * scaleY, 431.066 * scaleX, 4810.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 4826.781 * scaleY, 415.066 * scaleX, 4842.781 * scaleY, 408.066 * scaleX, 4858.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 4874.781 * scaleY, 395.066 * scaleX, 4890.781 * scaleY, 391.066 * scaleX, 4906.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 4922.781 * scaleY, 385.066 * scaleX, 4938.781 * scaleY, 385.066 * scaleX, 4954.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 4970.781 * scaleY, 387.066 * scaleX, 4986.781 * scaleY, 391.066 * scaleX, 5002.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 5018.781 * scaleY, 401.066 * scaleX, 5034.781 * scaleY, 408.066 * scaleX, 5050.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 5066.781 * scaleY, 423.066 * scaleX, 5082.781 * scaleY, 431.066 * scaleX, 5098.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 5114.781 * scaleY, 447.066 * scaleX, 5130.781 * scaleY, 455.066 * scaleX, 5146.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 5162.781 * scaleY, 471.066 * scaleX, 5178.781 * scaleY, 479.066 * scaleX, 5194.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 5210.781 * scaleY, 495.066 * scaleX, 5226.781 * scaleY, 503.066 * scaleX, 5242.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 5258.781 * scaleY, 519.066 * scaleX, 5274.781 * scaleY, 527.066 * scaleX, 5290.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 5306.781 * scaleY, 543.066 * scaleX, 5322.781 * scaleY, 551.066 * scaleX, 5338.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 5354.781 * scaleY, 567.066 * scaleX, 5370.781 * scaleY, 575.066 * scaleX, 5386.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 5402.781 * scaleY, 591.066 * scaleX, 5418.781 * scaleY, 598.066 * scaleX, 5434.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 5450.781 * scaleY, 611.066 * scaleX, 5466.781 * scaleY, 615.066 * scaleX, 5482.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 5498.781 * scaleY, 621.066 * scaleX, 5514.781 * scaleY, 621.066 * scaleX, 5530.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 5546.781 * scaleY, 619.066 * scaleX, 5562.781 * scaleY, 615.066 * scaleX, 5578.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 5594.781 * scaleY, 605.066 * scaleX, 5610.781 * scaleY, 598.066 * scaleX, 5626.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 5642.781 * scaleY, 583.066 * scaleX, 5658.781 * scaleY, 575.066 * scaleX, 5674.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 5690.781 * scaleY, 559.066 * scaleX, 5706.781 * scaleY, 551.066 * scaleX, 5722.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 5738.781 * scaleY, 535.066 * scaleX, 5754.781 * scaleY, 527.066 * scaleX, 5770.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 5786.781 * scaleY, 511.066 * scaleX, 5802.781 * scaleY, 503.066 * scaleX, 5818.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 5834.781 * scaleY, 487.066 * scaleX, 5850.781 * scaleY, 479.066 * scaleX, 5866.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 5882.781 * scaleY, 463.066 * scaleX, 5898.781 * scaleY, 455.066 * scaleX, 5914.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 5930.781 * scaleY, 439.066 * scaleX, 5946.781 * scaleY, 431.066 * scaleX, 5962.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 5978.781 * scaleY, 415.066 * scaleX, 5994.781 * scaleY, 408.066 * scaleX, 6010.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 6026.781 * scaleY, 395.066 * scaleX, 6042.781 * scaleY, 391.066 * scaleX, 6058.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 6074.781 * scaleY, 385.066 * scaleX, 6090.781 * scaleY, 385.066 * scaleX, 6106.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 6122.781 * scaleY, 387.066 * scaleX, 6138.781 * scaleY, 391.066 * scaleX, 6154.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 6170.781 * scaleY, 401.066 * scaleX, 6186.781 * scaleY, 408.066 * scaleX, 6202.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 6218.781 * scaleY, 423.066 * scaleX, 6234.781 * scaleY, 431.066 * scaleX, 6250.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 6266.781 * scaleY, 447.066 * scaleX, 6282.781 * scaleY, 455.066 * scaleX, 6298.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 6314.781 * scaleY, 471.066 * scaleX, 6330.781 * scaleY, 479.066 * scaleX, 6346.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 6362.781 * scaleY, 495.066 * scaleX, 6378.781 * scaleY, 503.066 * scaleX, 6394.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 6410.781 * scaleY, 519.066 * scaleX, 6426.781 * scaleY, 527.066 * scaleX, 6442.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 6458.781 * scaleY, 543.066 * scaleX, 6474.781 * scaleY, 551.066 * scaleX, 6490.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 6506.781 * scaleY, 567.066 * scaleX, 6522.781 * scaleY, 575.066 * scaleX, 6538.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 6554.781 * scaleY, 591.066 * scaleX, 6570.781 * scaleY, 598.066 * scaleX, 6586.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 6602.781 * scaleY, 611.066 * scaleX, 6618.781 * scaleY, 615.066 * scaleX, 6634.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 6650.781 * scaleY, 621.066 * scaleX, 6666.781 * scaleY, 621.066 * scaleX, 6682.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 6698.781 * scaleY, 619.066 * scaleX, 6714.781 * scaleY, 615.066 * scaleX, 6730.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 6746.781 * scaleY, 605.066 * scaleX, 6762.781 * scaleY, 598.066 * scaleX, 6778.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 6794.781 * scaleY, 583.066 * scaleX, 6810.781 * scaleY, 575.066 * scaleX, 6826.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 6842.781 * scaleY, 559.066 * scaleX, 6858.781 * scaleY, 551.066 * scaleX, 6874.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 6890.781 * scaleY, 535.066 * scaleX, 6906.781 * scaleY, 527.066 * scaleX, 6922.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 6938.781 * scaleY, 511.066 * scaleX, 6954.781 * scaleY, 503.066 * scaleX, 6970.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 6986.781 * scaleY, 487.066 * scaleX, 7002.781 * scaleY, 479.066 * scaleX, 7018.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 7034.781 * scaleY, 463.066 * scaleX, 7050.781 * scaleY, 455.066 * scaleX, 7066.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 7082.781 * scaleY, 439.066 * scaleX, 7098.781 * scaleY, 431.066 * scaleX, 7114.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 7130.781 * scaleY, 415.066 * scaleX, 7146.781 * scaleY, 408.066 * scaleX, 7162.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 7178.781 * scaleY, 395.066 * scaleX, 7194.781 * scaleY, 391.066 * scaleX, 7210.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 7226.781 * scaleY, 385.066 * scaleX, 7242.781 * scaleY, 385.066 * scaleX, 7258.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 7274.781 * scaleY, 387.066 * scaleX, 7290.781 * scaleY, 391.066 * scaleX, 7306.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 7322.781 * scaleY, 401.066 * scaleX, 7338.781 * scaleY, 408.066 * scaleX, 7354.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 7370.781 * scaleY, 423.066 * scaleX, 7386.781 * scaleY, 431.066 * scaleX, 7402.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 7418.781 * scaleY, 447.066 * scaleX, 7434.781 * scaleY, 455.066 * scaleX, 7450.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 7466.781 * scaleY, 471.066 * scaleX, 7482.781 * scaleY, 479.066 * scaleX, 7498.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 7514.781 * scaleY, 495.066 * scaleX, 7530.781 * scaleY, 503.066 * scaleX, 7546.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 7562.781 * scaleY, 519.066 * scaleX, 7578.781 * scaleY, 527.066 * scaleX, 7594.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 7610.781 * scaleY, 543.066 * scaleX, 7626.781 * scaleY, 551.066 * scaleX, 7642.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 7658.781 * scaleY, 567.066 * scaleX, 7674.781 * scaleY, 575.066 * scaleX, 7690.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 7706.781 * scaleY, 591.066 * scaleX, 7722.781 * scaleY, 598.066 * scaleX, 7738.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 7754.781 * scaleY, 611.066 * scaleX, 7770.781 * scaleY, 615.066 * scaleX, 7786.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 7802.781 * scaleY, 621.066 * scaleX, 7818.781 * scaleY, 621.066 * scaleX, 7834.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 7850.781 * scaleY, 619.066 * scaleX, 7866.781 * scaleY, 615.066 * scaleX, 7882.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 7898.781 * scaleY, 605.066 * scaleX, 7914.781 * scaleY, 598.066 * scaleX, 7930.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 7946.781 * scaleY, 583.066 * scaleX, 7962.781 * scaleY, 575.066 * scaleX, 7978.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 7994.781 * scaleY, 559.066 * scaleX, 8010.781 * scaleY, 551.066 * scaleX, 8026.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 8042.781 * scaleY, 535.066 * scaleX, 8058.781 * scaleY, 527.066 * scaleX, 8074.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 8090.781 * scaleY, 511.066 * scaleX, 8106.781 * scaleY, 503.066 * scaleX, 8122.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 8138.781 * scaleY, 487.066 * scaleX, 8154.781 * scaleY, 479.066 * scaleX, 8170.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 8186.781 * scaleY, 463.066 * scaleX, 8202.781 * scaleY, 455.066 * scaleX, 8218.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 8234.781 * scaleY, 439.066 * scaleX, 8250.781 * scaleY, 431.066 * scaleX, 8266.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 8282.781 * scaleY, 415.066 * scaleX, 8298.781 * scaleY, 408.066 * scaleX, 8314.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 8330.781 * scaleY, 395.066 * scaleX, 8346.781 * scaleY, 391.066 * scaleX, 8362.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 8378.781 * scaleY, 385.066 * scaleX, 8394.781 * scaleY, 385.066 * scaleX, 8410.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 8426.781 * scaleY, 387.066 * scaleX, 8442.781 * scaleY, 391.066 * scaleX, 8458.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 8474.781 * scaleY, 401.066 * scaleX, 8490.781 * scaleY, 408.066 * scaleX, 8506.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 8522.781 * scaleY, 423.066 * scaleX, 8538.781 * scaleY, 431.066 * scaleX, 8554.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 8570.781 * scaleY, 447.066 * scaleX, 8586.781 * scaleY, 455.066 * scaleX, 8602.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 8618.781 * scaleY, 471.066 * scaleX, 8634.781 * scaleY, 479.066 * scaleX, 8650.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 8666.781 * scaleY, 495.066 * scaleX, 8682.781 * scaleY, 503.066 * scaleX, 8698.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 8714.781 * scaleY, 519.066 * scaleX, 8730.781 * scaleY, 527.066 * scaleX, 8746.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 8762.781 * scaleY, 543.066 * scaleX, 8778.781 * scaleY, 551.066 * scaleX, 8794.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 8810.781 * scaleY, 567.066 * scaleX, 8826.781 * scaleY, 575.066 * scaleX, 8842.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 8858.781 * scaleY, 591.066 * scaleX, 8874.781 * scaleY, 598.066 * scaleX, 8890.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 8906.781 * scaleY, 611.066 * scaleX, 8922.781 * scaleY, 615.066 * scaleX, 8938.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 8954.781 * scaleY, 621.066 * scaleX, 8970.781 * scaleY, 621.066 * scaleX, 8986.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 9002.781 * scaleY, 619.066 * scaleX, 9018.781 * scaleY, 615.066 * scaleX, 9034.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 9050.781 * scaleY, 605.066 * scaleX, 9066.781 * scaleY, 598.066 * scaleX, 9082.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 9098.781 * scaleY, 583.066 * scaleX, 9114.781 * scaleY, 575.066 * scaleX, 9130.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 9146.781 * scaleY, 559.066 * scaleX, 9162.781 * scaleY, 551.066 * scaleX, 9178.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 9194.781 * scaleY, 535.066 * scaleX, 9210.781 * scaleY, 527.066 * scaleX, 9226.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 9242.781 * scaleY, 511.066 * scaleX, 9258.781 * scaleY, 503.066 * scaleX, 9274.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 9290.781 * scaleY, 487.066 * scaleX, 9306.781 * scaleY, 479.066 * scaleX, 9322.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 9338.781 * scaleY, 463.066 * scaleX, 9354.781 * scaleY, 455.066 * scaleX, 9370.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 9386.781 * scaleY, 439.066 * scaleX, 9402.781 * scaleY, 431.066 * scaleX, 9418.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 9434.781 * scaleY, 415.066 * scaleX, 9450.781 * scaleY, 408.066 * scaleX, 9466.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 9482.781 * scaleY, 395.066 * scaleX, 9498.781 * scaleY, 391.066 * scaleX, 9514.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 9530.781 * scaleY, 385.066 * scaleX, 9546.781 * scaleY, 385.066 * scaleX, 9562.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 9578.781 * scaleY, 387.066 * scaleX, 9594.781 * scaleY, 391.066 * scaleX, 9610.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 9626.781 * scaleY, 401.066 * scaleX, 9642.781 * scaleY, 408.066 * scaleX, 9658.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 9674.781 * scaleY, 423.066 * scaleX, 9690.781 * scaleY, 431.066 * scaleX, 9706.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 9722.781 * scaleY, 447.066 * scaleX, 9738.781 * scaleY, 455.066 * scaleX, 9754.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 9770.781 * scaleY, 471.066 * scaleX, 9786.781 * scaleY, 479.066 * scaleX, 9802.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 9818.781 * scaleY, 495.066 * scaleX, 9834.781 * scaleY, 503.066 * scaleX, 9850.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 9866.781 * scaleY, 519.066 * scaleX, 9882.781 * scaleY, 527.066 * scaleX, 9898.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 9914.781 * scaleY, 543.066 * scaleX, 9930.781 * scaleY, 551.066 * scaleX, 9946.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 9962.781 * scaleY, 567.066 * scaleX, 9978.781 * scaleY, 575.066 * scaleX, 9994.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 10010.781 * scaleY, 591.066 * scaleX, 10026.781 * scaleY, 598.066 * scaleX, 10042.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 10058.781 * scaleY, 611.066 * scaleX, 10074.781 * scaleY, 615.066 * scaleX, 10090.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 10106.781 * scaleY, 621.066 * scaleX, 10122.781 * scaleY, 621.066 * scaleX, 10138.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 10154.781 * scaleY, 619.066 * scaleX, 10170.781 * scaleY, 615.066 * scaleX, 10186.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 10202.781 * scaleY, 605.066 * scaleX, 10218.781 * scaleY, 598.066 * scaleX, 10234.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 10250.781 * scaleY, 583.066 * scaleX, 10266.781 * scaleY, 575.066 * scaleX, 10282.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 10298.781 * scaleY, 559.066 * scaleX, 10314.781 * scaleY, 551.066 * scaleX, 10330.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 10346.781 * scaleY, 535.066 * scaleX, 10362.781 * scaleY, 527.066 * scaleX, 10378.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 10394.781 * scaleY, 511.066 * scaleX, 10410.781 * scaleY, 503.066 * scaleX, 10426.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 10442.781 * scaleY, 487.066 * scaleX, 10458.781 * scaleY, 479.066 * scaleX, 10474.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 10490.781 * scaleY, 463.066 * scaleX, 10506.781 * scaleY, 455.066 * scaleX, 10522.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 10538.781 * scaleY, 439.066 * scaleX, 10554.781 * scaleY, 431.066 * scaleX, 10570.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 10586.781 * scaleY, 415.066 * scaleX, 10602.781 * scaleY, 408.066 * scaleX, 10618.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 10634.781 * scaleY, 395.066 * scaleX, 10650.781 * scaleY, 391.066 * scaleX, 10666.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 10682.781 * scaleY, 385.066 * scaleX, 10698.781 * scaleY, 385.066 * scaleX, 10714.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 10730.781 * scaleY, 387.066 * scaleX, 10746.781 * scaleY, 391.066 * scaleX, 10762.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 10778.781 * scaleY, 401.066 * scaleX, 10794.781 * scaleY, 408.066 * scaleX, 10810.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 10826.781 * scaleY, 423.066 * scaleX, 10842.781 * scaleY, 431.066 * scaleX, 10858.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 10874.781 * scaleY, 447.066 * scaleX, 10890.781 * scaleY, 455.066 * scaleX, 10906.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 10922.781 * scaleY, 471.066 * scaleX, 10938.781 * scaleY, 479.066 * scaleX, 10954.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 10970.781 * scaleY, 495.066 * scaleX, 10986.781 * scaleY, 503.066 * scaleX, 11002.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 11018.781 * scaleY, 519.066 * scaleX, 11034.781 * scaleY, 527.066 * scaleX, 11050.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 11066.781 * scaleY, 543.066 * scaleX, 11082.781 * scaleY, 551.066 * scaleX, 11098.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 11114.781 * scaleY, 567.066 * scaleX, 11130.781 * scaleY, 575.066 * scaleX, 11146.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 11162.781 * scaleY, 591.066 * scaleX, 11178.781 * scaleY, 598.066 * scaleX, 11194.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 11210.781 * scaleY, 611.066 * scaleX, 11226.781 * scaleY, 615.066 * scaleX, 11242.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 11258.781 * scaleY, 621.066 * scaleX, 11274.781 * scaleY, 621.066 * scaleX, 11290.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 11306.781 * scaleY, 619.066 * scaleX, 11322.781 * scaleY, 615.066 * scaleX, 11338.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 11354.781 * scaleY, 605.066 * scaleX, 11370.781 * scaleY, 598.066 * scaleX, 11386.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 11402.781 * scaleY, 583.066 * scaleX, 11418.781 * scaleY, 575.066 * scaleX, 11434.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 11450.781 * scaleY, 559.066 * scaleX, 11466.781 * scaleY, 551.066 * scaleX, 11482.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 11498.781 * scaleY, 535.066 * scaleX, 11514.781 * scaleY, 527.066 * scaleX, 11530.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 11546.781 * scaleY, 511.066 * scaleX, 11562.781 * scaleY, 503.066 * scaleX, 11578.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 11594.781 * scaleY, 487.066 * scaleX, 11610.781 * scaleY, 479.066 * scaleX, 11626.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 11642.781 * scaleY, 463.066 * scaleX, 11658.781 * scaleY, 455.066 * scaleX, 11674.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 11690.781 * scaleY, 439.066 * scaleX, 11706.781 * scaleY, 431.066 * scaleX, 11722.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 11738.781 * scaleY, 415.066 * scaleX, 11754.781 * scaleY, 408.066 * scaleX, 11770.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 11786.781 * scaleY, 395.066 * scaleX, 11802.781 * scaleY, 391.066 * scaleX, 11818.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 11834.781 * scaleY, 385.066 * scaleX, 11850.781 * scaleY, 385.066 * scaleX, 11866.781 * scaleY);
    path_33.cubicTo(385.066 * scaleX, 11882.781 * scaleY, 387.066 * scaleX, 11898.781 * scaleY, 391.066 * scaleX, 11914.781 * scaleY);
    path_33.cubicTo(395.066 * scaleX, 11930.781 * scaleY, 401.066 * scaleX, 11946.781 * scaleY, 408.066 * scaleX, 11962.781 * scaleY);
    path_33.cubicTo(415.066 * scaleX, 11978.781 * scaleY, 423.066 * scaleX, 11994.781 * scaleY, 431.066 * scaleX, 12010.781 * scaleY);
    path_33.cubicTo(439.066 * scaleX, 12026.781 * scaleY, 447.066 * scaleX, 12042.781 * scaleY, 455.066 * scaleX, 12058.781 * scaleY);
    path_33.cubicTo(463.066 * scaleX, 12074.781 * scaleY, 471.066 * scaleX, 12090.781 * scaleY, 479.066 * scaleX, 12106.781 * scaleY);
    path_33.cubicTo(487.066 * scaleX, 12122.781 * scaleY, 495.066 * scaleX, 12138.781 * scaleY, 503.066 * scaleX, 12154.781 * scaleY);
    path_33.cubicTo(511.066 * scaleX, 12170.781 * scaleY, 519.066 * scaleX, 12186.781 * scaleY, 527.066 * scaleX, 12202.781 * scaleY);
    path_33.cubicTo(535.066 * scaleX, 12218.781 * scaleY, 543.066 * scaleX, 12234.781 * scaleY, 551.066 * scaleX, 12250.781 * scaleY);
    path_33.cubicTo(559.066 * scaleX, 12266.781 * scaleY, 567.066 * scaleX, 12282.781 * scaleY, 575.066 * scaleX, 12298.781 * scaleY);
    path_33.cubicTo(583.066 * scaleX, 12314.781 * scaleY, 591.066 * scaleX, 12330.781 * scaleY, 598.066 * scaleX, 12346.781 * scaleY);
    path_33.cubicTo(605.066 * scaleX, 12362.781 * scaleY, 611.066 * scaleX, 12378.781 * scaleY, 615.066 * scaleX, 12394.781 * scaleY);
    path_33.cubicTo(619.066 * scaleX, 12410.781 * scaleY, 621.066 * scaleX, 12426.781 * scaleY, 621.066 * scaleX, 12442.781 * scaleY);
    path_33.cubicTo(621.066 * scaleX, 12458.781 * scaleY, 619.066 * scaleX, 12474.781 * scaleY, 615.066 * scaleX, 12490.781 * scaleY);
    path_33.cubicTo(611.066 * scaleX, 12506.781 * scaleY, 605.066 * scaleX, 12522.781 * scaleY, 598.066 * scaleX, 12538.781 * scaleY);
    path_33.cubicTo(591.066 * scaleX, 12554.781 * scaleY, 583.066 * scaleX, 12570.781 * scaleY, 575.066 * scaleX, 12586.781 * scaleY);
    path_33.cubicTo(567.066 * scaleX, 12602.781 * scaleY, 559.066 * scaleX, 12618.781 * scaleY, 551.066 * scaleX, 12634.781 * scaleY);
    path_33.cubicTo(543.066 * scaleX, 12650.781 * scaleY, 535.066 * scaleX, 12666.781 * scaleY, 527.066 * scaleX, 12682.781 * scaleY);
    path_33.cubicTo(519.066 * scaleX, 12698.781 * scaleY, 511.066 * scaleX, 12714.781 * scaleY, 503.066 * scaleX, 12730.781 * scaleY);
    path_33.cubicTo(495.066 * scaleX, 12746.781 * scaleY, 487.066 * scaleX, 12762.781 * scaleY, 479.066 * scaleX, 12778.781 * scaleY);
    path_33.cubicTo(471.066 * scaleX, 12794.781 * scaleY, 463.066 * scaleX, 12810.781 * scaleY, 455.066 * scaleX, 12826.781 * scaleY);
    path_33.cubicTo(447.066 * scaleX, 12842.781 * scaleY, 439.066 * scaleX, 12858.781 * scaleY, 431.066 * scaleX, 12874.781 * scaleY);
    path_33.cubicTo(423.066 * scaleX, 12890.781 * scaleY, 415.066 * scaleX, 12906.781 * scaleY, 408.066 * scaleX, 12922.781 * scaleY);
    path_33.cubicTo(401.066 * scaleX, 12938.781 * scaleY, 395.066 * scaleX, 12954.781 * scaleY, 391.066 * scaleX, 12970.781 * scaleY);
    path_33.cubicTo(387.066 * scaleX, 12986.781 * scaleY, 385.066 * scaleX, 13002.781 * scaleY, 385.066 * scaleX, 13018.781 * scaleY);
    path_33.close();

    // Paint Path 33 (Cloud inner)
    final Paint paint33Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff17B8A6);
    canvas.drawPath(path_33, paint33Fill);

    // Complete the paint method (no additional paths based on SVG)
    canvas.restore();
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
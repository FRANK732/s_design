import 'package:flutter/material.dart';

class AddNotesPainter extends CustomPainter {
  final Color primaryColor;
  
  const AddNotesPainter({required this.primaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    // Normalize coordinates based on SVG viewBox (485.83373 x 483.5)
    final double scaleX = size.width / 485.83373;
    final double scaleY = size.height / 483.5;
    final double translateX = -357.08314 * scaleX;
    final double translateY = -208.25 * scaleY;

    // Apply transformation to align with SVG coordinate system
    canvas.save();
    canvas.translate(translateX, translateY);
    canvas.scale(scaleX, scaleY);

    // Path 0: First card (top-left)
    final Path path_0 = Path();
    path_0.moveTo(677.54186, 336.34717);
    path_0.lineTo(597.80041, 336.34717);
    path_0.arcToPoint(
      const Offset(588.73474, 331.95361),
      radius: const Radius.elliptical(11.47812, 11.47812),
    );
    path_0.arcToPoint(
      const Offset(586.55822, 321.98584),
      radius: const Radius.elliptical(11.62154, 11.62154),
    );
    path_0.arcToPoint(
      const Offset(586.55773, 228.33884),
      radius: const Radius.elliptical(201.63052, 201.63052),
      clockwise: false,
    );
    path_0.arcToPoint(
      const Offset(588.73449, 218.37155),
      radius: const Radius.elliptical(11.62425, 11.62425),
    );
    path_0.arcToPoint(
      const Offset(597.80041, 213.978),
      radius: const Radius.elliptical(11.47753, 11.47753),
    );
    path_0.lineTo(677.54186, 213.978);
    path_0.arcToPoint(
      const Offset(688.98086, 223.73337),
      radius: const Radius.elliptical(11.6235, 11.6235),
    );
    path_0.arcToPoint(
      const Offset(688.98086, 326.59177),
      radius: const Radius.elliptical(337.96108, 337.96108),
    );
    path_0.arcToPoint(
      const Offset(677.54186, 336.34717),
      radius: const Radius.elliptical(11.6235, 11.6235),
    );
    path_0.close();
    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    // Path 1: Inner fill of first card
    final Path path_1 = Path();
    path_1.moveTo(597.80041, 219.978);
    path_1.arcToPoint(
      const Offset(593.44592, 222.0864),
      radius: const Radius.elliptical(5.51264, 5.51264),
      clockwise: false,
    );
    path_1.arcToPoint(
      const Offset(592.39221, 226.93991),
      radius: const Radius.elliptical(5.65943, 5.65943),
      clockwise: false,
    );
    path_1.arcToPoint(
      const Offset(592.39269, 323.38522),
      radius: const Radius.elliptical(207.656, 207.656),
    );
    path_1.arcToPoint(
      const Offset(593.44569, 328.23776),
      radius: const Radius.elliptical(5.65638, 5.65638),
      clockwise: false,
    );
    path_1.lineTo(593.44618, 328.23825);
    path_1.arcToPoint(
      const Offset(597.80043, 330.34714),
      radius: const Radius.elliptical(5.5112, 5.5112),
      clockwise: false,
    );
    path_1.lineTo(677.54188, 330.34714);
    path_1.arcToPoint(
      const Offset(683.05067, 325.68014),
      radius: const Radius.elliptical(5.58248, 5.58248),
      clockwise: false,
    );
    path_1.arcToPoint(
      const Offset(683.05067, 224.64498),
      radius: const Radius.elliptical(331.9854, 331.9854),
      clockwise: false,
    );
    path_1.arcToPoint(
      const Offset(677.54188, 219.978),
      radius: const Radius.elliptical(5.58248, 5.58248),
      clockwise: false,
    );
    path_1.close();
    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    // Path 2: First horizontal bar on first card
    final Path path_2 = Path();
    path_2.moveTo(660.14054, 248.82872);
    path_2.lineTo(618.29554, 248.82872);
    path_2.arcToPoint(
      const Offset(612.29577, 242.82895),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_2.lineTo(612.29577, 240.48432);
    path_2.arcToPoint(
      const Offset(618.29554, 234.48455),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_2.lineTo(660.14054, 234.48455);
    path_2.arcToPoint(
      const Offset(666.1403, 240.48432),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_2.lineTo(666.1403, 242.82895);
    path_2.arcToPoint(
      const Offset(660.14054, 248.82872),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_2.close();
    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    // Path 3: Second horizontal bar on first card
    final Path path_3 = Path();
    path_3.moveTo(660.14054, 278.4545);
    path_3.lineTo(618.29554, 278.4545);
    path_3.arcToPoint(
      const Offset(612.29577, 272.45474),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_3.lineTo(612.29577, 270.1101);
    path_3.arcToPoint(
      const Offset(618.29554, 264.11034),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_3.lineTo(660.14054, 264.11034);
    path_3.arcToPoint(
      const Offset(666.1403, 270.1101),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_3.lineTo(666.1403, 272.45474);
    path_3.arcToPoint(
      const Offset(660.14054, 278.4545),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_3.close();
    final Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    // Path 4: Third horizontal bar on first card
    final Path path_4 = Path();
    path_4.moveTo(660.14054, 308.08029);
    path_4.lineTo(618.29554, 308.08029);
    path_4.arcToPoint(
      const Offset(612.29577, 302.08052),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_4.lineTo(612.29577, 299.73589);
    path_4.arcToPoint(
      const Offset(618.29554, 293.73613),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_4.lineTo(660.14054, 293.73613);
    path_4.arcToPoint(
      const Offset(666.1403, 299.73589),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_4.lineTo(666.1403, 302.08052);
    path_4.arcToPoint(
      const Offset(660.14054, 308.08029),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_4.close();
    final Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    // Path 5: Second card (middle-right)
    final Path path_5 = Path();
    path_5.moveTo(827.54186, 412.34717);
    path_5.lineTo(747.80041, 412.34717);
    path_5.arcToPoint(
      const Offset(738.73474, 407.95361),
      radius: const Radius.elliptical(11.47812, 11.47812),
    );
    path_5.arcToPoint(
      const Offset(736.55822, 397.98584),
      radius: const Radius.elliptical(11.62154, 11.62154),
    );
    path_5.arcToPoint(
      const Offset(736.55773, 304.33884),
      radius: const Radius.elliptical(201.63052, 201.63052),
      clockwise: false,
    );
    path_5.arcToPoint(
      const Offset(738.73449, 294.37155),
      radius: const Radius.elliptical(11.62425, 11.62425),
    );
    path_5.arcToPoint(
      const Offset(747.80041, 289.978),
      radius: const Radius.elliptical(11.47753, 11.47753),
    );
    path_5.lineTo(827.54186, 289.978);
    path_5.arcToPoint(
      const Offset(838.98086, 299.73337),
      radius: const Radius.elliptical(11.6235, 11.6235),
    );
    path_5.arcToPoint(
      const Offset(838.98086, 402.59177),
      radius: const Radius.elliptical(337.96108, 337.96108),
    );
    path_5.arcToPoint(
      const Offset(827.54186, 412.34717),
      radius: const Radius.elliptical(11.6235, 11.6235),
    );
    path_5.close();
    final Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);

    // Path 6: Inner fill of second card
    final Path path_6 = Path();
    path_6.moveTo(747.80041, 295.978);
    path_6.arcToPoint(
      const Offset(743.44592, 298.0864),
      radius: const Radius.elliptical(5.51264, 5.51264),
      clockwise: false,
    );
    path_6.arcToPoint(
      const Offset(742.39221, 302.93991),
      radius: const Radius.elliptical(5.65943, 5.65943),
      clockwise: false,
    );
    path_6.arcToPoint(
      const Offset(742.39269, 399.38522),
      radius: const Radius.elliptical(207.656, 207.656),
    );
    path_6.arcToPoint(
      const Offset(743.44569, 404.23776),
      radius: const Radius.elliptical(5.65638, 5.65638),
      clockwise: false,
    );
    path_6.lineTo(743.44618, 404.23825);
    path_6.arcToPoint(
      const Offset(747.80043, 406.34714),
      radius: const Radius.elliptical(5.5112, 5.5112),
      clockwise: false,
    );
    path_6.lineTo(827.54188, 406.34714);
    path_6.arcToPoint(
      const Offset(833.05067, 401.68014),
      radius: const Radius.elliptical(5.58248, 5.58248),
      clockwise: false,
    );
    path_6.arcToPoint(
      const Offset(833.05067, 300.64498),
      radius: const Radius.elliptical(331.9854, 331.9854),
      clockwise: false,
    );
    path_6.arcToPoint(
      const Offset(827.54188, 295.978),
      radius: const Radius.elliptical(5.58248, 5.58248),
      clockwise: false,
    );
    path_6.close();
    final Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_6, paint6Fill);

    // Path 7: Third card (bottom-left)
    final Path path_7 = Path();
    path_7.moveTo(668.54186, 498.84717);
    path_7.lineTo(588.80041, 498.84717);
    path_7.arcToPoint(
      const Offset(579.34216, 494.26317),
      radius: const Radius.elliptical(11.97546, 11.97546),
    );
    path_7.arcToPoint(
      const Offset(577.07216, 483.86917),
      radius: const Radius.elliptical(12.1192, 12.1192),
    );
    path_7.arcToPoint(
      const Offset(577.07167, 390.4556),
      radius: const Radius.elliptical(201.13112, 201.13112),
      clockwise: false,
    );
    path_7.arcToPoint(
      const Offset(579.34193, 380.06204),
      radius: const Radius.elliptical(12.12077, 12.12077),
    );
    path_7.arcToPoint(
      const Offset(588.80041, 375.47804),
      radius: const Radius.elliptical(11.97561, 11.97561),
    );
    path_7.lineTo(668.54186, 375.47804);
    path_7.arcToPoint(
      const Offset(680.47497, 385.65724),
      radius: const Radius.elliptical(12.12667, 12.12667),
    );
    path_7.arcToPoint(
      const Offset(680.47497, 488.66798),
      radius: const Radius.elliptical(338.45925, 338.45925),
    );
    path_7.arcToPoint(
      const Offset(668.54186, 498.84717),
      radius: const Radius.elliptical(12.12668, 12.12668),
    );
    path_7.close();
    final Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xfff2f2f2).withOpacity(1.0);
    canvas.drawPath(path_7, paint7Fill);

    // Path 8: First horizontal bar on second card
    final Path path_8 = Path();
    path_8.moveTo(810.14054, 339.82872);
    path_8.lineTo(768.29554, 339.82872);
    path_8.arcToPoint(
      const Offset(762.29577, 333.82895),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_8.lineTo(762.29577, 331.48432);
    path_8.arcToPoint(
      const Offset(768.29554, 325.48455),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_8.lineTo(810.14054, 325.48455);
    path_8.arcToPoint(
      const Offset(816.1403, 331.48432),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_8.lineTo(816.1403, 333.82895);
    path_8.arcToPoint(
      const Offset(810.14054, 339.82872),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_8.close();
    final Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_8, paint8Fill);

    // Path 9: Second horizontal bar on second card
    final Path path_9 = Path();
    path_9.moveTo(810.14054, 369.4545);
    path_9.lineTo(768.29554, 369.4545);
    path_9.arcToPoint(
      const Offset(762.29577, 363.45474),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_9.lineTo(762.29577, 361.1101);
    path_9.arcToPoint(
      const Offset(768.29554, 355.11034),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_9.lineTo(810.14054, 355.11034);
    path_9.arcToPoint(
      const Offset(816.1403, 361.1101),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_9.lineTo(816.1403, 363.45474);
    path_9.arcToPoint(
      const Offset(810.14054, 369.4545),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_9.close();
    final Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_9, paint9Fill);

    // Circle: White circle (top-left)
    final Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(const Offset(271.81102 + 357.08314, 228.5 + 208.25), 23, paint10Fill);

    // Path 11: Plus sign on third card
    final Path path_11 = Path();
    path_11.moveTo(639.89416, 433.75);
    path_11.lineTo(631.89416, 433.75);
    path_11.lineTo(631.89416, 425.75);
    path_11.arcToPoint(
      const Offset(625.89416, 425.75),
      radius: const Radius.elliptical(3, 3),
      clockwise: false,
    );
    path_11.lineTo(625.89416, 433.75);
    path_11.lineTo(617.89416, 433.75);
    path_11.arcToPoint(
      const Offset(617.89416, 439.75),
      radius: const Radius.elliptical(3, 3),
      clockwise: false,
    );
    path_11.lineTo(625.89416, 439.75);
    path_11.lineTo(625.89416, 447.75);
    path_11.arcToPoint(
      const Offset(631.89416, 447.75),
      radius: const Radius.elliptical(3, 3),
      clockwise: false,
    );
    path_11.lineTo(631.89416, 439.75);
    path_11.lineTo(639.89416, 439.75);
    path_11.arcToPoint(
      const Offset(639.89416, 433.75),
      radius: const Radius.elliptical(3, 3),
      clockwise: false,
    );
    path_11.close();
    final Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_11, paint11Fill);

    // Path 12: Button on first card
    final Path path_12 = Path();
    path_12.moveTo(657.89416, 225.25);
    path_12.lineTo(615.89416, 225.25);
    path_12.arcToPoint(
      const Offset(611.39416, 220.75),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_12.lineTo(611.39416, 212.75);
    path_12.arcToPoint(
      const Offset(615.89416, 208.25),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_12.lineTo(657.89416, 208.25);
    path_12.arcToPoint(
      const Offset(662.39416, 212.75),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_12.lineTo(662.39416, 220.75);
    path_12.arcToPoint(
      const Offset(657.89416, 225.25),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_12.close();
    final Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = const Color(0xffcccccc).withOpacity(1.0);
    canvas.drawPath(path_12, paint12Fill);

    // Path 13: Button on second card
    final Path path_13 = Path();
    path_13.moveTo(809.89416, 302.25);
    path_13.lineTo(767.89416, 302.25);
    path_13.arcToPoint(
      const Offset(763.39416, 297.75),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_13.lineTo(763.39416, 289.75);
    path_13.arcToPoint(
      const Offset(767.89416, 285.25),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_13.lineTo(809.89416, 285.25);
    path_13.arcToPoint(
      const Offset(814.39416, 289.75),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_13.lineTo(814.39416, 297.75);
    path_13.arcToPoint(
      const Offset(809.89416, 302.25),
      radius: const Radius.elliptical(4.50508, 4.50508),
    );
    path_13.close();
    final Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = const Color(0xffcccccc).withOpacity(1.0);
    canvas.drawPath(path_13, paint13Fill);

    // Path 14: Left hand
    final Path path_14 = Path();
    path_14.moveTo(88.596 + 357.08314, 471.061 + 208.25);
    path_14.lineTo(100.856 + 357.08314, 471.061 + 208.25);
    path_14.lineTo(104.689 + 357.08314, 423.773 + 208.25);
    path_14.lineTo(88.594 + 357.08314, 423.773 + 208.25);
    path_14.lineTo(88.596 + 357.08314, 471.061 + 208.25);
    path_14.close();
    final Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawPath(path_14, paint14Fill);

    // Path 15: Right shoe
    final Path path_15 = Path();
    path_15.moveTo(442.55234, 675.30845);
    path_15.lineTo(466.69614, 675.30745);
    path_15.lineTo(466.69714, 675.30745);
    path_15.arcToPoint(
      const Offset(482.08361, 690.69468),
      radius: const Radius.elliptical(15.38605, 15.38605),
    );
    path_15.lineTo(482.08361, 691.19468);
    path_15.lineTo(442.5531, 691.19614);
    path_15.close();
    final Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_15, paint15Fill);

    // Path 16: Right hand
    final Path path_16 = Path();
    path_16.moveTo(22.596 + 357.08314, 471.061 + 208.25);
    path_16.lineTo(34.856 + 357.08314, 471.061 + 208.25);
    path_16.lineTo(40.689 + 357.08314, 423.773 + 208.25);
    path_16.lineTo(22.594 + 357.08314, 423.773 + 208.25);
    path_16.lineTo(22.596 + 357.08314, 471.061 + 208.25);
    path_16.close();
    final Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawPath(path_16, paint16Fill);

    // Path 17: Left shoe
    final Path path_17 = Path();
    path_17.moveTo(376.55234, 675.30845);
    path_17.lineTo(400.69614, 675.30745);
    path_17.lineTo(400.69714, 675.30745);
    path_17.arcToPoint(
      const Offset(416.08361, 690.69468),
      radius: const Radius.elliptical(15.38605, 15.38605),
    );
    path_17.lineTo(416.08361, 691.19468);
    path_17.lineTo(376.5531, 691.19614);
    path_17.close();
    final Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_17, paint17Fill);

    // Path 18: Body with detailed comments
// Path 18: Body with reduced stomach
    final Path path_18 = Path();
// Start at the left hip, slightly shifted inward for a slimmer profile
    path_18.moveTo(385.85436, 664.37256); // Adjusted X from 381.85436 to 385.85436
// Draw a small arc to smooth the transition from the hip to the left side of the lower torso
    path_18.arcToPoint(
      const Offset(382.47936, 663.0542), // Slightly adjusted X from 378.47936 to 382.47936
      radius: const Radius.elliptical(4.98141, 4.98141),
    );
// Continue the arc to form the left side of the lower torso
    path_18.lineTo(382.47936, 663.0542);
// Draw another small arc to round the transition to the left side of the upper torso
    path_18.arcToPoint(
      const Offset(380.86364, 659.51709), // Adjusted X from 376.86364 to 380.86364
      radius: const Radius.elliptical(4.961, 4.961),
    );
// Draw a straight line upward along the left side of the torso
    path_18.lineTo(375.947, 483.30371); // Unchanged, maintains upper torso
// Move diagonally to the right shoulder area
    path_18.lineTo(441.75815, 500.75586); // Unchanged
// Draw a line downward to the right side of the stomach/waist area
    path_18.lineTo(463.2977, 565.37354); // Unchanged
// Draw a smaller arc to reduce the stomach's protrusion
    path_18.arcToPoint(
      const Offset(466.84311, 591.19775),
      radius: const Radius.elliptical(50.0, 50.0), // Reduced from 70.461 to 50.0
    );
// Continue downward along the right side of the lower torso
    path_18.lineTo(464.16855, 653.83447); // Unchanged
// Draw a small arc to smooth the transition to the right hip
    path_18.arcToPoint(
      const Offset(459.17417, 658.59326),
      radius: const Radius.elliptical(4.996, 4.996),
    );
// Move to the right hip, slightly shifted inward
    path_18.lineTo(451.46517, 658.59326); // Adjusted X from 447.46517 to 451.46517
// Draw a small arc to round the right hip
    path_18.arcToPoint(
      const Offset(446.51034, 654.26367), // Adjusted X from 442.51034 to 446.51034
      radius: const Radius.elliptical(5.02349, 5.02349),
    );
// Draw a line to the inner right thigh, tightened for a slimmer waist
    path_18.lineTo(438.14144, 585.12207); // Adjusted X from 434.14144 to 438.14144
// Draw an arc to form a tighter crotch and lower stomach area
    path_18.arcToPoint(
      const Offset(432.60971, 569.95701), // Adjusted X from 428.60971 to 432.60971
      radius: const Radius.elliptical(30.0, 30.0), // Reduced from 37.82338 to 30.0
      clockwise: false,
    );
// Draw a line to the inner left thigh
    path_18.lineTo(416.14022, 543.88084); // Adjusted X from 412.14022 to 416.14022
// Draw a small arc to smooth the transition to the left lower stomach
    path_18.arcToPoint(
      const Offset(414.30258, 544.29099), // Adjusted X from 410.30258 to 414.30258
      radius: const Radius.elliptical(1.00011, 1.00011),
      clockwise: false,
    );
// Draw a line upward to the left hip
    path_18.lineTo(401.378, 659.38037); // Adjusted X from 397.378 to 401.378
// Draw a small arc to round the left hip
    path_18.arcToPoint(
      const Offset(396.691, 663.77686), // Adjusted X from 392.691 to 396.691
      radius: const Radius.elliptical(4.99328, 4.99328),
    );
// Move to the left hip, closing the path
    path_18.lineTo(386.139, 664.36377); // Adjusted X from 382.139 to 386.139
// Use a cubic curve to finely adjust the connection
    path_18.cubicTo(
      386.04366,
      664.36719,
      385.94894,
      664.36914,
      385.85436,
      664.37256,
    );
    path_18.close();
    final Paint paint18Fill = Paint()..style = PaintingStyle.fill;
    paint18Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_18, paint18Fill);

    // Circle: Head
    final Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawCircle(const Offset(73.05767 + 357.08314, 136.40609 + 208.25), 24.56103, paint19Fill);

    // Path 20: Shirt
    final Path path_20 = Path();
    path_20.moveTo(441.4237, 507.92236);
    path_20.arcToPoint(
      const Offset(440.17077, 507.76318),
      radius: const Radius.elliptical(5.07628, 5.07628),
    );
    path_20.lineTo(440.16927, 507.76318);
    path_20.lineTo(370.905, 490.00342);
    path_20.arcToPoint(
      const Offset(367.24214, 484.188),
      radius: const Radius.elliptical(4.9985, 4.9985),
    );
    path_20.lineTo(383.15, 398.49707);
    path_20.arcToPoint(
      const Offset(401.39975, 375.95752),
      radius: const Radius.elliptical(31.21377, 31.21377),
    );
    path_20.arcToPoint(
      const Offset(429.66538, 378.03271),
      radius: const Radius.elliptical(30.11308, 30.11308),
    );
    path_20.cubicTo(
      430.63511,
      378.63771,
      431.61191,
      379.29736,
      432.56797,
      480.99365,
    );
    path_20.arcToPoint(
      const Offset(445.43287, 502.99316),
      radius: const Radius.elliptical(30.96046, 30.96046),
    );
    path_20.lineTo(446.41177, 502.85176);
    path_20.arcToPoint(
      const Offset(441.4237, 507.92236),
      radius: const Radius.elliptical(5.00656, 5.00656),
    );
    path_20.close();
    final Paint paint20Fill = Paint()..style = PaintingStyle.fill;
    paint20Fill.color = primaryColor;
    canvas.drawPath(path_20, paint20Fill);

    // Path 21: Left arm
    final Path path_21 = Path();
    path_21.moveTo(378.03248, 508.93008);
    path_21.arcToPoint(
      const Offset(382.24648, 494.09775),
      radius: const Radius.elliptical(10.05576, 10.05576),
    );
    path_21.lineTo(375.16569, 458.49595);
    path_21.lineTo(391.49169, 467.34443);
    path_21.lineTo(391.91431, 499.79593);
    path_21.arcToPoint(
      const Offset(378.03251, 508.93008),
      radius: const Radius.elliptical(10.11027, 10.11027),
    );
    path_21.close();
    final Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawPath(path_21, paint21Fill);

    // Path 22: Left sleeve
    final Path path_22 = Path();
    path_22.moveTo(383.86511, 489.38916);
    path_22.arcToPoint(
      const Offset(382.49938, 489.21631),
      radius: const Radius.elliptical(5.53224, 5.53224),
    );
    path_22.arcToPoint(
      const Offset(378.89319, 485.40283),
      radius: const Radius.elliptical(5.49559, 5.49559),
    );
    path_22.lineTo(370.87, 453.51904);
    path_22.arcToPoint(
      const Offset(374.63123, 420.38428),
      radius: const Radius.elliptical(47.37028, 47.37028),
    );
    path_22.lineTo(391.44, 387.50244);
    path_22.arcToPoint(
      const Offset(410.2481, 376.48389),
      radius: const Radius.elliptical(15.54083, 15.54083),
    );
    path_22.arcToPoint(
      const Offset(419.72295, 383.58447),
      radius: const Radius.elliptical(15.35574, 15.35574),
    );
    path_22.arcToPoint(
      const Offset(421.37701, 395.49756),
      radius: const Radius.elliptical(15.56707, 15.56707),
    );
    path_22.lineTo(397.44952, 448.99842);
    path_22.lineTo(397.7337, 481.03406);
    path_22.arcToPoint(
      const Offset(394.14922, 486.23865),
      radius: const Radius.elliptical(5.5186, 5.5186),
    );
    path_22.lineTo(386.1419, 489.21228);
    path_22.arcToPoint(
      const Offset(383.86511, 489.38916),
      radius: const Radius.elliptical(5.48, 5.48),
    );
    path_22.close();
    final Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = primaryColor;
    canvas.drawPath(path_22, paint22Fill);

    // Path 23: Right arm
    final Path path_23 = Path();
    path_23.moveTo(498.40087, 495.83467);
    path_23.arcToPoint(
      const Offset(489.90787, 482.96513),
      radius: const Radius.elliptical(10.05578, 10.05578),
    );
    path_23.lineTo(460.91446, 462.07587);
    path_23.lineTo(478.271, 455.47405);
    path_23.lineTo(503.1427, 476.32298);
    path_23.arcToPoint(
      const Offset(498.40084, 495.83467),
      radius: const Radius.elliptical(10.11027, 10.11027),
    );
    path_23.close();
    final Paint paint23Fill = Paint()..style = PaintingStyle.fill;
    paint23Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawPath(path_23, paint23Fill);

    // Path 24: Right sleeve
    final Path path_24 = Path();
    path_24.moveTo(483.223, 480.58057);
    path_24.arcToPoint(
      const Offset(480.76035, 479.99902),
      radius: const Radius.elliptical(5.52249, 5.52249),
    );
    path_24.lineTo(451.3612, 465.28174);
    path_24.arcToPoint(
      const Offset(428.70056, 440.81641),
      radius: const Radius.elliptical(47.381, 47.381),
    );
    path_24.lineTo(414.74328, 406.626);
    path_24.arcToPoint(
      const Offset(418.661, 385.18166),
      radius: const Radius.elliptical(15.54363, 15.54363),
    );
    path_24.arcToPoint(
      const Offset(430.25134, 382.6382),
      radius: const Radius.elliptical(15.35158, 15.35158),
    );
    path_24.arcToPoint(
      const Offset(440.33215, 389.15041),
      radius: const Radius.elliptical(15.56975, 15.56975),
    );
    path_24.lineTo(465.27722, 442.18996);
    path_24.lineTo(489.743, 462.87256);
    path_24.arcToPoint(
      const Offset(491.34969, 468.98438),
      radius: const Radius.elliptical(5.51764, 5.51764),
    );
    path_24.lineTo(488.37996, 476.99268);
    path_24.arcToPoint(
      const Offset(486.37312, 479.58887),
      radius: const Radius.elliptical(5.474, 5.474),
    );
    path_24.arcToPoint(
      const Offset(483.223, 480.58057),
      radius: const Radius.elliptical(5.49717, 5.49717),
    );
    path_24.close();
    final Paint paint24Fill = Paint()..style = PaintingStyle.fill;
    paint24Fill.color = primaryColor;
    canvas.drawPath(path_24, paint24Fill);

    // Path 25: Hair
    final Path path_25 = Path();
    path_25.moveTo(424.98332, 369.5931);
    path_25.cubicTo(
      426.28832,
      370.1641,
      428.96064,
      359.76578,
      427.76357,
      357.68603,
    );
    path_25.cubicTo(
      425.98332,
      354.5931,
      426.18832,
      354.61531,
      425.00651,
      352.56838,
    );
    path_25.cubicTo(
      423.8247,
      350.52145,
      423.56049,
      347.72073,
      425.09089,
      345.92024,
    );
    path_25.cubicTo(
      426.62129,
      344.11975,
      429.16262,
      344.35862,
      429.86104,
      346.61606,
    );
    path_25.cubicTo(
      429.41174,
      342.32826,
      433.65293,
      338.88152,
      437.85404,
      337.91293,
    );
    path_25.cubicTo(
      442.05515,
      336.94434,
      446.48659,
      337.54671,
      450.71083,
      336.68477,
    );
    path_25.cubicTo(
      455.61326,
      335.68445,
      460.714,
      331.57505,
      458.75802,
      326.18407,
    );
    path_25.arcToPoint(
      const Offset(457.27696, 323.74999),
      radius: const Radius.elliptical(7.5931, 7.5931),
      clockwise: false,
    );
    path_25.cubicTo(
      455.01703,
      321.20905,
      451.85579,
      320.12405,
      448.76479,
      319.07499,
    );
    path_25.cubicTo(
      442.33473,
      316.89253,
      435.72867,
      314.68266,
      429.94255,
      314.92398,
    );
    path_25.arcToPoint(
      const Offset(404.3967, 333.533),
      radius: const Radius.elliptical(28.7977, 28.7977),
      clockwise: false,
    );
    path_25.arcToPoint(
      const Offset(403.31326, 337.55834),
      radius: const Radius.elliptical(26.15571, 26.15571),
      clockwise: false,
    );
    path_25.cubicTo(
      400.98402,
      350.08257,
      408.25694,
      362.43628,
      420.06949,
      367.20543,
    );
    path_25.close();
    final Paint paint25Fill = Paint()..style = PaintingStyle.fill;
    paint25Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_25, paint25Fill);

    // Path 26: Shadow (opacity 0.2)
    final Path path_26 = Path();
    path_26.moveTo(38.9 + 357.08314, 273.343 + 208.25);
    path_26.lineTo(39.457 + 357.08314, 240.414 + 208.25);
    path_26.lineTo(56.9 + 357.08314, 205.343 + 208.25);
    path_26.lineTo(42.9 + 357.08314, 241.343 + 208.25);
    path_26.lineTo(38.9 + 357.08314, 273.343 + 208.25);
    path_26.close();
    final Paint paint26Fill = Paint()..style = PaintingStyle.fill;
    paint26Fill.color = const Color(0xff000000).withOpacity(0.2);
    canvas.drawPath(path_26, paint26Fill);

    // Path 27: Fourth card (bottom-right)
    final Path path_27 = Path();
    path_27.moveTo(554.16035, 564.23244);
    path_27.lineTo(480.522, 533.63692);
    path_27.arcToPoint(
      const Offset(473.83591, 526.10127),
      radius: const Radius.elliptical(11.47817, 11.47817),
    );
    path_27.arcToPoint(
      const Offset(475.65045, 516.06127),
      radius: const Radius.elliptical(11.62155, 11.62155),
    );
    path_27.arcToPoint(
      const Offset(511.58085, 429.58144),
      radius: const Radius.elliptical(201.63062, 201.63062),
      clockwise: false,
    );
    path_27.arcToPoint(
      const Offset(517.4153, 421.21219),
      radius: const Radius.elliptical(11.62422, 11.62422),
    );
    path_27.arcToPoint(
      const Offset(527.47309, 420.63335),
      radius: const Radius.elliptical(11.47751, 11.47751),
    );
    path_27.lineTo(601.11148, 451.22887);
    path_27.arcToPoint(
      const Offset(607.93198, 464.62656),
      radius: const Radius.elliptical(11.62349, 11.62349),
    );
    path_27.arcToPoint(
      const Offset(568.46686, 559.61263),
      radius: const Radius.elliptical(337.96147, 337.96147),
    );
    path_27.arcToPoint(
      const Offset(554.16035, 564.23244),
      radius: const Radius.elliptical(11.6235, 11.6235),
    );
    path_27.close();
    final Paint paint27Fill = Paint()..style = PaintingStyle.fill;
    paint27Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_27, paint27Fill);

    // Path 28: Inner fill of fourth card
    final Path path_28 = Path();
    path_28.moveTo(525.17093, 426.17415);
    path_28.arcToPoint(
      const Offset(520.34076, 426.45044),
      radius: const Radius.elliptical(5.51263, 5.51263),
      clockwise: false,
    );
    path_28.arcToPoint(
      const Offset(517.50547, 430.52819),
      radius: const Radius.elliptical(5.65945, 5.65945),
      clockwise: false,
    );
    path_28.arcToPoint(
      const Offset(480.5014, 519.59219),
      radius: const Radius.elliptical(207.65608, 207.65608),
    );
    path_28.arcToPoint(
      const Offset(479.61194, 524.47734),
      radius: const Radius.elliptical(5.65636, 5.65636),
      clockwise: false,
    );
    path_28.lineTo(479.61221, 524.47798);
    path_28.arcToPoint(
      const Offset(482.82373, 528.09612),
      radius: const Radius.elliptical(5.51116, 5.51116),
      clockwise: false,
    );
    path_28.lineTo(556.46212, 558.69164);
    path_28.arcToPoint(
      const Offset(563.33994, 557.49548),
      radius: const Radius.elliptical(5.58247, 5.58247),
      clockwise: false,
    );
    path_28.arcToPoint(
      const Offset(602.10552, 464.1931),
      radius: const Radius.elliptical(331.98566, 331.98566),
      clockwise: false,
    );
    path_28.arcToPoint(
      const Offset(598.809, 461.99694),
      radius: const Radius.elliptical(5.58248, 5.58248),
      clockwise: false,
    );
    path_28.close();
    final Paint paint28Fill = Paint()..style = PaintingStyle.fill;
    paint28Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_28, paint28Fill);

    // Path 29: First diagonal bar on fourth card
    final Path path_29 = Path();
    path_29.moveTo(564.38028, 494.28148);
    path_29.lineTo(525.73788, 478.22621);
    path_29.arcToPoint(
      const Offset(522.49933, 470.38362),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_29.lineTo(523.39893, 468.21844);
    path_29.arcToPoint(
      const Offset(531.24151, 464.97989),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_29.lineTo(569.88391, 481.03516);
    path_29.arcToPoint(
      const Offset(573.12246, 488.87775),
      radius: const Radius.elliptical(6.00634, 6.00634),
    );
    path_29.lineTo(572.22286, 491.04293);
    path_29.arcToPoint(
      const Offset(564.38028, 494.28148),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_29.close();
    final Paint paint29Fill = Paint()..style = PaintingStyle.fill;
    paint29Fill.color = primaryColor;
    canvas.drawPath(path_29, paint29Fill);

    // Path 30: Second diagonal bar on fourth card
    final Path path_30 = Path();
    path_30.moveTo(553.01334, 521.63984);
    path_30.lineTo(514.37094, 505.58457);
    path_30.arcToPoint(
      const Offset(511.13239, 497.74198),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_30.lineTo(512.03198, 495.5768);
    path_30.arcToPoint(
      const Offset(519.87457, 492.33825),
      radius: const Radius.elliptical(6.00634, 6.00634),
    );
    path_30.lineTo(558.51697, 508.39352);
    path_30.arcToPoint(
      const Offset(561.75552, 516.23611),
      radius: const Radius.elliptical(6.00633, 6.00633),
    );
    path_30.lineTo(560.85593, 518.40129);
    path_30.arcToPoint(
      const Offset(553.01334, 521.63984),
      radius: const Radius.elliptical(6.00632, 6.00632),
    );
    path_30.close();
    final Paint paint30Fill = Paint()..style = PaintingStyle.fill;
    paint30Fill.color = primaryColor;
    canvas.drawPath(path_30, paint30Fill);

    // Path 31: Button on fourth card
    final Path path_31 = Path();
    path_31.moveTo(579.86437, 455.832);
    path_31.arcToPoint(
      const Offset(578.17712, 455.50143),
      radius: const Radius.elliptical(4.48944, 4.48944),
    );
    path_31.lineTo(539.23912, 439.75876);
    path_31.arcToPoint(
      const Offset(536.75377, 433.90036),
      radius: const Radius.elliptical(4.50518, 4.50518),
    );
    path_31.lineTo(539.75255, 426.48336);
    path_31.arcToPoint(
      const Offset(545.61119, 423.9985),
      radius: const Radius.elliptical(4.50027, 4.50027),
    );
    path_31.lineTo(584.54919, 439.74117);
    path_31.arcToPoint(
      const Offset(587.03454, 445.59957),
      radius: const Radius.elliptical(4.50518, 4.50518),
    );
    path_31.lineTo(584.03576, 453.01657);
    path_31.arcToPoint(
      const Offset(579.86437, 455.832),
      radius: const Radius.elliptical(4.51079, 4.51079),
    );
    path_31.close();
    final Paint paint31Fill = Paint()..style = PaintingStyle.fill;
    paint31Fill.color = const Color(0xffcccccc).withOpacity(1.0);
    canvas.drawPath(path_31, paint31Fill);

    // Path 32: Ground line
    final Path path_32 = Path();
    path_32.moveTo(498.08314, 691.75);
    path_32.lineTo(358.08314, 691.75);
    path_32.arcToPoint(
      const Offset(358.08314, 689.75),
      radius: const Radius.elliptical(1, 1),
      largeArc: true,
    );
    path_32.lineTo(498.08314, 689.75);
    path_32.arcToPoint(
      const Offset(498.08314, 691.75),
      radius: const Radius.elliptical(1, 1),
    );
    path_32.close();
    final Paint paint32Fill = Paint()..style = PaintingStyle.fill;
    paint32Fill.color = const Color(0xffcccccc).withOpacity(1.0);
    canvas.drawPath(path_32, paint32Fill);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
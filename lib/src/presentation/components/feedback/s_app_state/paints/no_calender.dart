import 'dart:math';

import 'package:flutter/material.dart';

class NoCalenderPainter extends CustomPainter {
  final Color primaryColor;
  
  const NoCalenderPainter({required this.primaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    // SVG viewBox dimensions
    const double svgWidth = 971.55619;
    const double svgHeight = 781.4172;

    // Calculate scaling factors to preserve aspect ratio
    final double scaleX = size.width / svgWidth;
    final double scaleY = size.height / svgHeight;
    final double scale = min(scaleX, scaleY);

    // Calculate offsets to center the content
    final double offsetX = (size.width - svgWidth * scale) / 2;
    final double offsetY = (size.height - svgHeight * scale) / 2;

    // Apply transformations: center, scale, and SVG translation
    canvas.translate(offsetX, offsetY);
    canvas.scale(scale, scale);
    canvas.translate(-114.22191, -59.2914);

    // Path 0: Calendar background
    final Path path_0 = Path();
    path_0.moveTo(svgWidth * 1.110158, svgHeight * 0.6555448);
    path_0.lineTo(svgWidth * 0.3466175, svgHeight * 0.6555448);
    path_0.arcToPoint(const Offset(svgWidth * 0.3392093, svgHeight * 0.6463340),
        radius: const Radius.elliptical(svgWidth * 0.007416318, svgHeight * 0.009220900),);
    path_0.lineTo(svgWidth * 0.3392093, svgHeight * 0.08508758);
    path_0.arcToPoint(const Offset(svgWidth * 0.3466175, svgHeight * 0.07587675),
        radius: const Radius.elliptical(svgWidth * 0.007416318, svgHeight * 0.009220900),);
    path_0.lineTo(svgWidth * 1.110158, svgHeight * 0.07587675);
    path_0.arcToPoint(const Offset(svgWidth * 1.117566, svgHeight * 0.08508758),
        radius: const Radius.elliptical(svgWidth * 0.007416308, svgHeight * 0.009220887),);
    path_0.lineTo(svgWidth * 1.117566, svgHeight * 0.6463340);
    path_0.arcToPoint(const Offset(svgWidth * 1.110158, svgHeight * 0.6555448),
        radius: const Radius.elliptical(svgWidth * 0.007416308, svgHeight * 0.009220887),);
    path_0.close();
    path_0.moveTo(svgWidth * 0.3466175, svgHeight * 0.07956108);
    path_0.arcToPoint(const Offset(svgWidth * 0.3421726, svgHeight * 0.08508758),
        radius: const Radius.elliptical(svgWidth * 0.004449789, svgHeight * 0.005532538),
        clockwise: false,);
    path_0.lineTo(svgWidth * 0.3421726, svgHeight * 0.6463340);
    path_0.arcToPoint(const Offset(svgWidth * 0.3466175, svgHeight * 0.6518605),
        radius: const Radius.elliptical(svgWidth * 0.004449789, svgHeight * 0.005532538),
        clockwise: false,);
    path_0.lineTo(svgWidth * 1.110158, svgHeight * 0.6518605);
    path_0.arcToPoint(const Offset(svgWidth * 1.114603, svgHeight * 0.6463340),
        radius: const Radius.elliptical(svgWidth * 0.004449779, svgHeight * 0.005532525),
        clockwise: false,);
    path_0.lineTo(svgWidth * 1.114603, svgHeight * 0.08508758);
    path_0.arcToPoint(const Offset(svgWidth * 1.110158, svgHeight * 0.07956108),
        radius: const Radius.elliptical(svgWidth * 0.004449779, svgHeight * 0.005532525),
        clockwise: false,);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    // Path 1: Horizontal bar
    final Path path_1 = Path();
    path_1.moveTo(svgWidth * 0.6547881, svgHeight * 0.1207008);
    path_1.arcToPoint(const Offset(svgWidth * 0.6547881, svgHeight * 0.1353055),
        radius: const Radius.elliptical(svgWidth * 0.005874081, svgHeight * 0.007303397),
        clockwise: false,);
    path_1.lineTo(svgWidth * 0.8020493, svgHeight * 0.1353055);
    path_1.arcToPoint(const Offset(svgWidth * 0.8022594, svgHeight * 0.1207011),
        radius: const Radius.elliptical(svgWidth * 0.005874081, svgHeight * 0.007303397),
        clockwise: false,);
    path_1.lineTo(svgWidth * 0.8022422, svgHeight * 0.1207008);
    path_1.quadraticBezierTo(svgWidth * 0.8021458, svgHeight * 0.1206987,
        svgWidth * 0.8020493, svgHeight * 0.1207008,);
    path_1.close();

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    // Path 2: Right arrow
    final Path path_2 = Path();
    path_2.moveTo(svgWidth * 0.8354446, svgHeight * 0.1186674);
    path_2.arcToPoint(const Offset(svgWidth * 0.8354445, svgHeight * 0.1206995),
        radius: const Radius.elliptical(svgWidth * 0.001155754, svgHeight * 0.001436979),
        clockwise: false,);
    path_2.lineTo(svgWidth * 0.8354446, svgHeight * 0.1206996);
    path_2.lineTo(svgWidth * 0.8404060, svgHeight * 0.1268683);
    path_2.lineTo(svgWidth * 0.8281717, svgHeight * 0.1268683);
    path_2.arcToPoint(const Offset(svgWidth * 0.8281717, svgHeight * 0.1297422),
        radius: const Radius.elliptical(svgWidth * 0.001155744, svgHeight * 0.001436966),
        clockwise: false,);
    path_2.lineTo(svgWidth * 0.8404060, svgHeight * 0.1297422);
    path_2.lineTo(svgWidth * 0.8354446, svgHeight * 0.1359108);
    path_2.arcToPoint(const Offset(svgWidth * 0.8370790, svgHeight * 0.1379430),
        radius: const Radius.elliptical(svgWidth * 0.001155723, svgHeight * 0.001436940),
        clockwise: false,);
    path_2.lineTo(svgWidth * 0.8370790, svgHeight * 0.1379430);
    path_2.lineTo(svgWidth * 0.8440134, svgHeight * 0.1293214);
    path_2.arcToPoint(const Offset(svgWidth * 0.8440134, svgHeight * 0.1272891),
        radius: const Radius.elliptical(svgWidth * 0.001155816, svgHeight * 0.001437056),
        clockwise: false,);
    path_2.lineTo(svgWidth * 0.8370790, svgHeight * 0.1186675);
    path_2.arcToPoint(const Offset(svgWidth * 0.8354447, svgHeight * 0.1186675),
        radius: const Radius.elliptical(svgWidth * 0.001155651, svgHeight * 0.001436851),
        clockwise: false,);
    path_2.close();

    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    // Path 3: Left arrow
    final Path path_3 = Path();
    path_3.moveTo(svgWidth * 0.6213306, svgHeight * 0.1186674);
    path_3.arcToPoint(const Offset(svgWidth * 0.6213307, svgHeight * 0.1206995),
        radius: const Radius.elliptical(svgWidth * 0.001155703, svgHeight * 0.001436915),);
    path_3.lineTo(svgWidth * 0.6213306, svgHeight * 0.1206996);
    path_3.lineTo(svgWidth * 0.6163693, svgHeight * 0.1268683);
    path_3.lineTo(svgWidth * 0.6286035, svgHeight * 0.1268683);
    path_3.arcToPoint(const Offset(svgWidth * 0.6286062, svgHeight * 0.1297422),
        radius: const Radius.elliptical(svgWidth * 0.001155744, svgHeight * 0.001436966),
        largeArc: true,);
    path_3.lineTo(svgWidth * 0.6163693, svgHeight * 0.1297422);
    path_3.lineTo(svgWidth * 0.6213306, svgHeight * 0.1359108);
    path_3.arcToPoint(const Offset(svgWidth * 0.6196962, svgHeight * 0.1379430),
        radius: const Radius.elliptical(svgWidth * 0.001155733, svgHeight * 0.001436953),
        largeArc: true,);
    path_3.lineTo(svgWidth * 0.6196962, svgHeight * 0.1379430);
    path_3.lineTo(svgWidth * 0.6127618, svgHeight * 0.1293214);
    path_3.arcToPoint(const Offset(svgWidth * 0.6127618, svgHeight * 0.1272891),
        radius: const Radius.elliptical(svgWidth * 0.001155816, svgHeight * 0.001437056),);
    path_3.lineTo(svgWidth * 0.6196962, svgHeight * 0.1186675);
    path_3.arcToPoint(const Offset(svgWidth * 0.6213306, svgHeight * 0.1186674),
        radius: const Radius.elliptical(svgWidth * 0.001155713, svgHeight * 0.001436928),);
    path_3.close();

    final Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffe6e6e6).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    // Path 4: Calendar circle
    final Path path_4 = Path();
    path_4.moveTo(svgWidth * 0.3387673, svgHeight * 0.6864602);
    path_4.arcToPoint(const Offset(svgWidth * 0.3726204, svgHeight * 0.6443699),
        radius: const Radius.elliptical(svgWidth * 0.03385306, svgHeight * 0.04209038),
        largeArc: true,);
    path_4.arcToPoint(const Offset(svgWidth * 0.3387673, svgHeight * 0.6864602),
        radius: const Radius.elliptical(svgWidth * 0.03385308, svgHeight * 0.04209041),);
    path_4.close();

    final Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xff17B8A6).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    // Path 5: Plus icon
    final Path path_5 = Path();
    path_5.moveTo(svgWidth * 0.3521248, svgHeight * 0.6402180);
    path_5.lineTo(svgWidth * 0.3421067, svgHeight * 0.6402180);
    path_5.lineTo(svgWidth * 0.3421067, svgHeight * 0.6277621);
    path_5.arcToPoint(const Offset(svgWidth * 0.3354279, svgHeight * 0.6277621),
        radius: const Radius.elliptical(svgWidth * 0.003339436, svgHeight * 0.004152007),
        largeArc: true,
        clockwise: false,);
    path_5.lineTo(svgWidth * 0.3354279, svgHeight * 0.6402180);
    path_5.lineTo(svgWidth * 0.3254097, svgHeight * 0.6402180);
    path_5.arcToPoint(const Offset(svgWidth * 0.3254097, svgHeight * 0.6485219),
        radius: const Radius.elliptical(svgWidth * 0.003339385, svgHeight * 0.004151943),
        largeArc: true,
        clockwise: false,);
    path_5.lineTo(svgWidth * 0.3354278, svgHeight * 0.6485219);
    path_5.lineTo(svgWidth * 0.3354278, svgHeight * 0.6609778);
    path_5.arcToPoint(const Offset(svgWidth * 0.3421067, svgHeight * 0.6609778),
        radius: const Radius.elliptical(svgWidth * 0.003339436, svgHeight * 0.004152007),
        clockwise: false,);
    path_5.lineTo(svgWidth * 0.3421067, svgHeight * 0.6485219);
    path_5.lineTo(svgWidth * 0.3521248, svgHeight * 0.6485219);
    path_5.arcToPoint(const Offset(svgWidth * 0.3521248, svgHeight * 0.6402180),
        radius: const Radius.elliptical(svgWidth * 0.003339385, svgHeight * 0.004151943),
        largeArc: true,
        clockwise: false,);
    path_5.close();

    final Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_5, paint5Fill);

    // Rectangles: Calendar grid
    final Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.2833785, svgHeight * 0.1195904,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint6Fill,);

    final Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.4216652, svgHeight * 0.1195904,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint7Fill,);

    final Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.5599519, svgHeight * 0.1195904,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint8Fill,);

    final Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.6982386, svgHeight * 0.1195904,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint9Fill,);

    final Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.8365253, svgHeight * 0.1195904,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint10Fill,);

    final Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.2837516, svgHeight * 0.2706479,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint11Fill,);

    final Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.4220383, svgHeight * 0.2706479,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint12Fill,);

    final Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.5603250, svgHeight * 0.2706479,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint13Fill,);

    final Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.6986117, svgHeight * 0.2706479,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint14Fill,);

    final Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.8368984, svgHeight * 0.2706479,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint15Fill,);

    final Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.2841246, svgHeight * 0.4217055,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint16Fill,);

    final Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.4224113, svgHeight * 0.4217055,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint17Fill,);

    final Paint paint18Fill = Paint()..style = PaintingStyle.fill;
    paint18Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.5606980, svgHeight * 0.4217055,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint18Fill,);

    final Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.6989848, svgHeight * 0.4217055,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint19Fill,);

    final Paint paint20Fill = Paint()..style = PaintingStyle.fill;
    paint20Fill.color = const Color(0xfff1f1f1).withOpacity(1.0);
    canvas.drawRect(
        const Rect.fromLTWH(svgWidth * 0.8372715, svgHeight * 0.4217055,
            svgWidth * 0.1017395, svgHeight * 0.08596773,),
        paint20Fill,);

    // Circles: Calendar markers
    final Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = const Color(0xff17B8A6).withOpacity(1.0);
    canvas.drawCircle(const Offset(svgWidth * 0.5810680, svgHeight * 0.1466088),
        svgWidth * 0.01284090, paint21Fill,);

    final Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = const Color(0xff17B8A6).withOpacity(1.0);
    canvas.drawCircle(const Offset(svgWidth * 0.4408058, svgHeight * 0.2976664),
        svgWidth * 0.01284090, paint22Fill,);

    final Paint paint23Fill = Paint()..style = PaintingStyle.fill;
    paint23Fill.color = const Color(0xff17B8A6).withOpacity(1.0);
    canvas.drawCircle(const Offset(svgWidth * 0.5810680, svgHeight * 0.4487239),
        svgWidth * 0.01284090, paint23Fill,);

    final Paint paint24Fill = Paint()..style = PaintingStyle.fill;
    paint24Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawCircle(const Offset(svgWidth * 0.7223180, svgHeight * 0.2976664),
        svgWidth * 0.01284090, paint24Fill,);

    final Paint paint25Fill = Paint()..style = PaintingStyle.fill;
    paint25Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawCircle(const Offset(svgWidth * 0.8596169, svgHeight * 0.2976664),
        svgWidth * 0.01284090, paint25Fill,);

    final Paint paint26Fill = Paint()..style = PaintingStyle.fill;
    paint26Fill.color = const Color(0xff3f3d56).withOpacity(1.0);
    canvas.drawCircle(const Offset(svgWidth * 0.4408058, svgHeight * 0.4487239),
        svgWidth * 0.01284090, paint26Fill,);

    // Circle: Person's head
    final Paint paint27Fill = Paint()..style = PaintingStyle.fill;
    paint27Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawCircle(const Offset(svgWidth * 0.2311264, svgHeight * 0.6425599),
        svgWidth * 0.02385005, paint27Fill,);

    // Path 28: Person's left arm
    final Path path_28 = Path();
    path_28.moveTo(svgWidth * 0.2130813, svgHeight * 0.8229011);
    path_28.quadraticBezierTo(svgWidth * 0.2126308, svgHeight * 0.8229011,
        svgWidth * 0.2121762, svgHeight * 0.8228516,);
    path_28.arcToPoint(const Offset(svgWidth * 0.2025871, svgHeight * 0.8070159),
        radius: const Radius.elliptical(svgWidth * 0.01068418, svgHeight * 0.01328392),);
    path_28.arcToPoint(const Offset(svgWidth * 0.2028493, svgHeight * 0.8057532),
        radius: const Radius.elliptical(svgWidth * 0.01000367, svgHeight * 0.01243782),);
    path_28.lineTo(svgWidth * 0.1676486, svgHeight * 0.7539911);
    path_28.arcToPoint(const Offset(svgWidth * 0.1670713, svgHeight * 0.7416949),
        radius: const Radius.elliptical(svgWidth * 0.008297328, svgHeight * 0.01031628),);
    path_28.lineTo(svgWidth * 0.1671351, svgHeight * 0.7415982);
    path_28.lineTo(svgWidth * 0.1988200, svgHeight * 0.7027536);
    path_28.arcToPoint(const Offset(svgWidth * 0.2116811, svgHeight * 0.7189715),
        radius: const Radius.elliptical(svgWidth * 0.009159048, svgHeight * 0.01138768),);
    path_28.quadraticBezierTo(svgWidth * 0.2116215, svgHeight * 0.7190446,
        svgWidth * 0.2115608, svgHeight * 0.7191163,);
    path_28.lineTo(svgWidth * 0.1886125, svgHeight * 0.7462413);
    path_28.lineTo(svgWidth * 0.2137352, svgHeight * 0.7963739);
    path_28.arcToPoint(const Offset(svgWidth * 0.2151522, svgHeight * 0.7965909),
        radius: const Radius.elliptical(svgWidth * 0.01016773, svgHeight * 0.01264180),);
    path_28.arcToPoint(const Offset(svgWidth * 0.2130813, svgHeight * 0.8229011),
        radius: const Radius.elliptical(svgWidth * 0.01068389, svgHeight * 0.01328356),);
    path_28.close();

    final Paint paint28Fill = Paint()..style = PaintingStyle.fill;
    paint28Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawPath(path_28, paint28Fill);

    // Path 29: Person's left foot
    final Path path_29 = Path();
    path_29.moveTo(svgWidth * 0.1434070, svgHeight * 0.9842604);
    path_29.lineTo(svgWidth * 0.1553127, svgHeight * 0.9842604);
    path_29.lineTo(svgWidth * 0.1609758, svgHeight * 0.9271680);
    path_29.lineTo(svgWidth * 0.1434050, svgHeight * 0.9271693);
    path_29.lineTo(svgWidth * 0.1434070, svgHeight * 0.9842604);
    path_29.close();

    // Paint paint_29_fill = Paint()..style = PaintingStyle.fill;
    // paint_29_fill.color = Color(0xffffb8b8).withOpacity(1.0);
    // canvas.drawPath(path_29, paint_29_fill);

    // Path 30: Person's right shoe
    final Path path_30 = Path();
    path_30.moveTo(svgWidth * 0.2579368, svgHeight * 1.055305);
    path_30.lineTo(svgWidth * 0.2813816, svgHeight * 1.055304);
    path_30.lineTo(svgWidth * 0.2813826, svgHeight * 1.055304);
    path_30.arcToPoint(const Offset(svgWidth * 0.2963237, svgHeight * 1.073880),
        radius: const Radius.elliptical(svgWidth * 0.01494066, svgHeight * 0.01857611),);
    path_30.lineTo(svgWidth * 0.2963237, svgHeight * 1.074484);
    path_30.lineTo(svgWidth * 0.2579375, svgHeight * 1.074486);
    path_30.close();

    final Paint paint30Fill = Paint()..style = PaintingStyle.fill;
    paint30Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_30, paint30Fill);

    // Path 31: Person's right hand
    final Path path_31 = Path();
    path_31.moveTo(svgWidth * 0.02507935, svgHeight * 0.9637963);
    path_31.lineTo(svgWidth * 0.03530830, svgHeight * 0.9713684);
    path_31.lineTo(svgWidth * 0.06366796, svgHeight * 0.9259164);
    path_31.lineTo(svgWidth * 0.04857053, svgHeight * 0.9147406);
    path_31.lineTo(svgWidth * 0.02507935, svgHeight * 0.9637963);
    path_31.close();

    // Paint paint_31_fill = Paint()..style = PaintingStyle.fill;
    // paint_31_fill.color = Color(0xffffb8b8).withOpacity(1.0);
    // canvas.drawPath(path_31, paint_31_fill);

    // Path 32: Person's left shoe
    final Path path_32 = Path();
    path_32.moveTo(svgWidth * 0.1420245, svgHeight * 1.033589);
    path_32.lineTo(svgWidth * 0.1621692, svgHeight * 1.048501);
    path_32.lineTo(svgWidth * 0.1621700, svgHeight * 1.048502);
    path_32.arcToPoint(const Offset(svgWidth * 0.1673638, svgHeight * 1.073967),
        radius: const Radius.elliptical(svgWidth * 0.01494069, svgHeight * 0.01857615),);
    path_32.lineTo(svgWidth * 0.1673635, svgHeight * 1.073967);
    path_32.lineTo(svgWidth * 0.1671151, svgHeight * 1.074486);
    path_32.lineTo(svgWidth * 0.1341325, svgHeight * 1.050070);
    path_32.close();

    final Paint paint32Fill = Paint()..style = PaintingStyle.fill;
    paint32Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_32, paint32Fill);

    // Path 33: Person's body
    final Path path_33 = Path();
    path_33.moveTo(svgWidth * 0.2756874, svgHeight * 1.039973);
    path_33.lineTo(svgWidth * 0.2623566, svgHeight * 1.039973);
    path_33.arcToPoint(const Offset(svgWidth * 0.2580115, svgHeight * 1.035114),
        radius: const Radius.elliptical(svgWidth * 0.004361776, svgHeight * 0.005423108),);
    path_33.lineTo(svgWidth * 0.2445720, svgHeight * 0.8780435);
    path_33.arcToPoint(const Offset(svgWidth * 0.2417959, svgHeight * 0.8774893),
        radius: const Radius.elliptical(svgWidth * 0.001456859, svgHeight * 0.001811350),
        clockwise: false,);
    path_33.lineTo(svgWidth * 0.2175509, svgHeight * 0.9442382);
    path_33.lineTo(svgWidth * 0.1746263, svgHeight * 1.031263);
    path_33.arcToPoint(const Offset(svgWidth * 0.1691414, svgHeight * 1.033395),
        radius: const Radius.elliptical(svgWidth * 0.004390534, svgHeight * 0.005458864),);
    path_33.lineTo(svgWidth * 0.1519934, svgHeight * 1.024014);
    path_33.arcToPoint(const Offset(svgWidth * 0.1500020, svgHeight * 1.016254),
        radius: const Radius.elliptical(svgWidth * 0.004371090, svgHeight * 0.005434690),);
    path_33.lineTo(svgWidth * 0.1894614, svgHeight * 0.9341056);
    path_33.lineTo(svgWidth * 0.2015633, svgHeight * 0.8648914);
    path_33.cubicTo(
        svgWidth * 0.1977571,
        svgHeight * 0.8348754,
        svgWidth * 0.2140742,
        svgHeight * 0.7902501,
        svgWidth * 0.2142397,
        svgHeight * 0.7898020,);
    path_33.lineTo(svgWidth * 0.2143205, svgHeight * 0.7895839);
    path_33.lineTo(svgWidth * 0.2592664, svgHeight * 0.7677420);
    path_33.lineTo(svgWidth * 0.2594919, svgHeight * 0.7680851);
    path_33.cubicTo(
        svgWidth * 0.2772173,
        svgHeight * 0.8404071,
        svgWidth * 0.2880183,
        svgHeight * 0.9182380,
        svgWidth * 0.2800432,
        svgHeight * 1.034995,);
    path_33.arcToPoint(const Offset(svgWidth * 0.2756874, svgHeight * 1.039973),
        radius: const Radius.elliptical(svgWidth * 0.004399272, svgHeight * 0.005469729),);
    path_33.close();

    final Paint paint33Fill = Paint()..style = PaintingStyle.fill;
    paint33Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_33, paint33Fill);

    // Path 34: Person's shirt
    final Path path_34 = Path();
    path_34.moveTo(svgWidth * 0.2125097, svgHeight * 0.7968974);
    path_34.lineTo(svgWidth * 0.2123004, svgHeight * 0.7963503);
    path_34.cubicTo(
        svgWidth * 0.2122004,
        svgHeight * 0.7960886,
        svgWidth * 0.2022063,
        svgHeight * 0.7698809,
        svgWidth * 0.1945022,
        svgHeight * 0.7418705,);
    path_34.arcToPoint(const Offset(svgWidth * 0.1968063, svgHeight * 0.7087596),
        radius: const Radius.elliptical(svgWidth * 0.03323019, svgHeight * 0.04131596),);
    path_34.arcToPoint(const Offset(svgWidth * 0.2182282, svgHeight * 0.6882785),
        radius: const Radius.elliptical(svgWidth * 0.03359280, svgHeight * 0.04176679),);
    path_34.lineTo(svgWidth * 0.2182282, svgHeight * 0.6882785);
    path_34.arcToPoint(const Offset(svgWidth * 0.2572664, svgHeight * 0.7133224),
        radius: const Radius.elliptical(svgWidth * 0.03363367, svgHeight * 0.04181761),);
    path_34.cubicTo(
        svgWidth * 0.2633774,
        svgHeight * 0.7323226,
        svgWidth * 0.2614298,
        svgHeight * 0.7526030,
        svgWidth * 0.2595970,
        svgHeight * 0.7685519,);
    path_34.lineTo(svgWidth * 0.2595605, svgHeight * 0.7688714);
    path_34.lineTo(svgWidth * 0.2593267, svgHeight * 0.7690105);
    path_34.close();

    final Paint paint34Fill = Paint()..style = PaintingStyle.fill;
    paint34Fill.color = const Color(0xff17B8A6).withOpacity(1.0);
    canvas.drawPath(path_34, paint34Fill);

    // Path 35: Person's collar
    final Path path_35 = Path();
    path_35.moveTo(svgWidth * 0.2506098, svgHeight * 0.6306861);
    path_35.lineTo(svgWidth * 0.2127388, svgHeight * 0.6306861);
    path_35.lineTo(svgWidth * 0.2127388, svgHeight * 0.6101614);
    path_35.cubicTo(
        svgWidth * 0.2210510,
        svgHeight * 0.6060555,
        svgWidth * 0.2291850,
        svgHeight * 0.6025638,
        svgWidth * 0.2341019,
        svgHeight * 0.6101614,);
    path_35.arcToPoint(const Offset(svgWidth * 0.2506098, svgHeight * 0.6306861),
        radius: const Radius.elliptical(svgWidth * 0.01650802, svgHeight * 0.02052485),);
    path_35.close();

    final Paint paint35Fill = Paint()..style = PaintingStyle.fill;
    paint35Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_35, paint35Fill);

    // Path 36: Person's hair
    final Path path_36 = Path();
    path_36.moveTo(svgWidth * 0.2106421, svgHeight * 0.6065394);
    path_36.cubicTo(
        svgWidth * 0.1880020,
        svgHeight * 0.6065394,
        svgWidth * 0.1816651,
        svgHeight * 0.6418230,
        svgWidth * 0.1816651,
        svgHeight * 0.6617282,);
    path_36.cubicTo(
        svgWidth * 0.1816651,
        svgHeight * 0.6728292,
        svgWidth * 0.1857029,
        svgHeight * 0.6767996,
        svgWidth * 0.1920479,
        svgHeight * 0.6781430,);
    path_36.lineTo(svgWidth * 0.1942888, svgHeight * 0.6632841);
    path_36.lineTo(svgWidth * 0.1995371, svgHeight * 0.6787824);
    path_36.cubicTo(
        svgWidth * 0.2013194,
        svgHeight * 0.6787935,
        svgWidth * 0.2031918,
        svgHeight * 0.6787506,
        svgWidth * 0.2051329,
        svgHeight * 0.6787058,);
    path_36.lineTo(svgWidth * 0.2069124, svgHeight * 0.6741501);
    path_36.lineTo(svgWidth * 0.2108805, svgHeight * 0.6786241);
    path_36.cubicTo(
        svgWidth * 0.2267734,
        svgHeight * 0.6786535,
        svgWidth * 0.2396186,
        svgHeight * 0.6815339,
        svgWidth * 0.2396186,
        svgHeight * 0.6617282,);
    path_36.cubicTo(
        svgWidth * 0.2396186,
        svgHeight * 0.6418230,
        svgWidth * 0.2340611,
        svgHeight * 0.6065394,
        svgWidth * 0.2106421,
        svgHeight * 0.6065394,);
    path_36.close();

    final Paint paint36Fill = Paint()..style = PaintingStyle.fill;
    paint36Fill.color = const Color(0xff2f2e41).withOpacity(1.0);
    canvas.drawPath(path_36, paint36Fill);

    // Path 37: Person's right arm
    final Path path_37 = Path();
    path_37.moveTo(svgWidth * 0.3112752, svgHeight * 0.6460285);
    path_37.quadraticBezierTo(svgWidth * 0.3114912, svgHeight * 0.6465201,
        svgWidth * 0.3116742, svgHeight * 0.6470399,);
    path_37.arcToPoint(const Offset(svgWidth * 0.3050944, svgHeight * 0.6650949),
        radius: const Radius.elliptical(svgWidth * 0.01068422, svgHeight * 0.01328397),);
    path_37.arcToPoint(const Offset(svgWidth * 0.3040774, svgHeight * 0.6654142),
        radius: const Radius.elliptical(svgWidth * 0.01000815, svgHeight * 0.01244339),);
    path_37.lineTo(svgWidth * 0.2844188, svgHeight * 0.7286389);
    path_37.arcToPoint(const Offset(svgWidth * 0.2760166, svgHeight * 0.7351641),
        radius: const Radius.elliptical(svgWidth * 0.008297338, svgHeight * 0.01031629),);
    path_37.lineTo(svgWidth * 0.2759178, svgHeight * 0.7351408);
    path_37.lineTo(svgWidth * 0.2333092, svgHeight * 0.7191927);
    path_37.arcToPoint(const Offset(svgWidth * 0.2385909, svgHeight * 0.6973846),
        radius: const Radius.elliptical(svgWidth * 0.009159038, svgHeight * 0.01138767),);
    path_37.quadraticBezierTo(svgWidth * 0.2386706, svgHeight * 0.6974145,
        svgWidth * 0.2387500, svgHeight * 0.6974461,);
    path_37.lineTo(svgWidth * 0.2688978, svgHeight * 0.7094804);
    path_37.lineTo(svgWidth * 0.2922381, svgHeight * 0.6580332);
    path_37.arcToPoint(const Offset(svgWidth * 0.2917119, svgHeight * 0.6563831),
        radius: const Radius.elliptical(svgWidth * 0.01016480, svgHeight * 0.01263815),);
    path_37.arcToPoint(const Offset(svgWidth * 0.3112753, svgHeight * 0.6460284),
        radius: const Radius.elliptical(svgWidth * 0.01068394, svgHeight * 0.01328362),);
    path_37.close();

    final Paint paint37Fill = Paint()..style = PaintingStyle.fill;
    paint37Fill.color = const Color(0xffffb8b8).withOpacity(1.0);
    canvas.drawPath(path_37, paint37Fill);

    // Path 38: Shadow
    final Path path_38 = Path();
    path_38.moveTo(svgWidth * 0.3162163, svgHeight * 1.075877);
    path_38.lineTo(svgWidth * 0.1185952, svgHeight * 1.075877);
    path_38.arcToPoint(const Offset(svgWidth * 0.1185952, svgHeight * 1.073317),
        radius: const Radius.elliptical(svgWidth * 0.001029277, svgHeight * 0.001279726),
        largeArc: true,);
    path_38.lineTo(svgWidth * 0.3162163, svgHeight * 1.073317);
    path_38.arcToPoint(const Offset(svgWidth * 0.3162163, svgHeight * 1.075877),
        radius: const Radius.elliptical(svgWidth * 0.001029277, svgHeight * 0.001279726),
        largeArc: true,);
    path_38.close();

    final Paint paint38Fill = Paint()..style = PaintingStyle.fill;
    paint38Fill.color = const Color(0xffcccccc).withOpacity(1.0);
    canvas.drawPath(path_38, paint38Fill);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
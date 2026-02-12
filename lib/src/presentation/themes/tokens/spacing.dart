import 'package:flutter/material.dart';
import 's_dimension.dart';

class Spacers {
  static const Widget xSmallWidth = SizedBox(width: SDimensions.xSmall);
  static const Widget smallWidth = SizedBox(width: SDimensions.small);
  static const Widget mediumWidth = SizedBox(width: SDimensions.medium);
  static const Widget largeWidth = SizedBox(width: SDimensions.large);
  static const Widget xLargeWidth = SizedBox(width: SDimensions.xLarge);

  static const Widget xSmallHeight = SizedBox(height: SDimensions.xSmall);
  static const Widget smallHeight = SizedBox(height: SDimensions.small);
  static const Widget mediumHeight = SizedBox(height: SDimensions.medium);
  static const Widget largeHeight = SizedBox(height: SDimensions.large);
  static const Widget xLargeHeight = SizedBox(height: SDimensions.xLarge);


  static const BorderRadiusGeometry radiusSmall = BorderRadius.all(Radius.circular(SDimensions.borderRadiusSmall));
  static const BorderRadiusGeometry radiusMedium = BorderRadius.all(Radius.circular(SDimensions.borderRadiusMedium));
  static const BorderRadiusGeometry radiusLarge = BorderRadius.all(Radius.circular(SDimensions.borderRadiusLarge));


  // Alternatively, you can use functions for more flexibility
  static SizedBox height(double height) => SizedBox(height: height);
  static SizedBox width(double width) => SizedBox(width: width);


}

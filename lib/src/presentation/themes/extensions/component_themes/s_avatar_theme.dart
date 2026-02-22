import 'dart:ui';
import 'package:flutter/material.dart';

@immutable
class SAvatarThemeData
    extends ThemeExtension<
        SAvatarThemeData> {
  const SAvatarThemeData({
    this.backgroundColor,
    this.foregroundColor,
    this.borderWidth,
    this.borderColor,
    this.largeSize,
    this.middleSize,
    this.smallSize,
    this.largeRadius,
    this.middleRadius,
    this.smallRadius,
    this.textStyle,
  });

  /// The default background color for avatars that contain text or icons.
  final Color?
      backgroundColor;

  /// The default color for text or icons inside the avatar.
  final Color?
      foregroundColor;

  /// The border width. Usually only used when avatars overlap in an SAvatarGroup.
  final double?
      borderWidth;

  /// The border color. Usually overlaps in a group use a white (or theme background) border.
  final Color?
      borderColor;

  /// Diameter for size: `SAvatarSize.large`
  final double?
      largeSize;

  /// Diameter for size: `SAvatarSize.middle`
  final double?
      middleSize;

  /// Diameter for size: `SAvatarSize.small`
  final double?
      smallSize;

  /// Border radius for `shape: SAvatarShape.square` with `size: large`
  final BorderRadius?
      largeRadius;

  /// Border radius for `shape: SAvatarShape.square` with `size: middle`
  final BorderRadius?
      middleRadius;

  /// Border radius for `shape: SAvatarShape.square` with `size: small`
  final BorderRadius?
      smallRadius;

  /// Default text style for string avatars
  final TextStyle?
      textStyle;

  @override
  SAvatarThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        foregroundColor,
    double?
        borderWidth,
    Color?
        borderColor,
    double?
        largeSize,
    double?
        middleSize,
    double?
        smallSize,
    BorderRadius?
        largeRadius,
    BorderRadius?
        middleRadius,
    BorderRadius?
        smallRadius,
    TextStyle?
        textStyle,
  }) {
    return SAvatarThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      foregroundColor:
          foregroundColor ?? this.foregroundColor,
      borderWidth:
          borderWidth ?? this.borderWidth,
      borderColor:
          borderColor ?? this.borderColor,
      largeSize:
          largeSize ?? this.largeSize,
      middleSize:
          middleSize ?? this.middleSize,
      smallSize:
          smallSize ?? this.smallSize,
      largeRadius:
          largeRadius ?? this.largeRadius,
      middleRadius:
          middleRadius ?? this.middleRadius,
      smallRadius:
          smallRadius ?? this.smallRadius,
      textStyle:
          textStyle ?? this.textStyle,
    );
  }

  @override
  SAvatarThemeData lerp(
      ThemeExtension<SAvatarThemeData>?
          other,
      double
          t) {
    if (other
        is! SAvatarThemeData)
      return this;
    return SAvatarThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t),
      foregroundColor: Color.lerp(
          foregroundColor,
          other.foregroundColor,
          t),
      borderWidth: lerpDouble(
          borderWidth,
          other.borderWidth,
          t),
      borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t),
      largeSize: lerpDouble(
          largeSize,
          other.largeSize,
          t),
      middleSize: lerpDouble(
          middleSize,
          other.middleSize,
          t),
      smallSize: lerpDouble(
          smallSize,
          other.smallSize,
          t),
      largeRadius: BorderRadius.lerp(
          largeRadius,
          other.largeRadius,
          t),
      middleRadius: BorderRadius.lerp(
          middleRadius,
          other.middleRadius,
          t),
      smallRadius: BorderRadius.lerp(
          smallRadius,
          other.smallRadius,
          t),
      textStyle: TextStyle.lerp(
          textStyle,
          other.textStyle,
          t),
    );
  }
}

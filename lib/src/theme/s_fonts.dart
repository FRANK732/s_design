import 'package:flutter/material.dart';


class SFonts {
  static const String roboto = 'Roboto';

  /// Font Weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  /// Font Styles (Optional)
  static const FontStyle normal = FontStyle.normal;
  static const FontStyle italic = FontStyle.italic;

  /// Default Font Family
  static const String defaultFontFamily = roboto;

  static TextStyle getTextStyle({
    required String fontFamily,
    required FontWeight fontWeight,
    FontStyle fontStyle = FontStyle.normal,
    double fontSize = 14.0,
    Color color = Colors.black,
    double? letterSpacing,
    double? wordSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }
}

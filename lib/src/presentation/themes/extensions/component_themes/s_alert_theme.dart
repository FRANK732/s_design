import 'package:flutter/material.dart';

/// Theme extension for [SAlert].
///
/// Provides global defaults for all [SAlert] instances.
/// Every property can also be overridden per-instance directly on the [SAlert] widget.
class SAlertThemeData
    extends ThemeExtension<
        SAlertThemeData> {
  const SAlertThemeData({
    this.successBackgroundColor,
    this.infoBackgroundColor,
    this.warningBackgroundColor,
    this.errorBackgroundColor,
    this.successBorderColor,
    this.infoBorderColor,
    this.warningBorderColor,
    this.errorBorderColor,
    this.successIconColor,
    this.infoIconColor,
    this.warningIconColor,
    this.errorIconColor,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.elevation,
    this.shadowColor,
  });

  // ── Per-type background colors ───────────────────────────────────────────
  final Color?
      successBackgroundColor;
  final Color?
      infoBackgroundColor;
  final Color?
      warningBackgroundColor;
  final Color?
      errorBackgroundColor;

  // ── Per-type border colors ────────────────────────────────────────────────
  final Color?
      successBorderColor;
  final Color?
      infoBorderColor;
  final Color?
      warningBorderColor;
  final Color?
      errorBorderColor;

  // ── Per-type icon colors ──────────────────────────────────────────────────
  final Color?
      successIconColor;
  final Color?
      infoIconColor;
  final Color?
      warningIconColor;
  final Color?
      errorIconColor;

  // ── Shared style tokens ───────────────────────────────────────────────────
  final BorderRadius?
      borderRadius;
  final double?
      borderWidth;
  final EdgeInsetsGeometry?
      padding;
  final double?
      iconSize;
  final TextStyle?
      titleStyle;
  final TextStyle?
      descriptionStyle;
  final double?
      elevation;
  final Color?
      shadowColor;

  @override
  SAlertThemeData copyWith({
    Color?
        successBackgroundColor,
    Color?
        infoBackgroundColor,
    Color?
        warningBackgroundColor,
    Color?
        errorBackgroundColor,
    Color?
        successBorderColor,
    Color?
        infoBorderColor,
    Color?
        warningBorderColor,
    Color?
        errorBorderColor,
    Color?
        successIconColor,
    Color?
        infoIconColor,
    Color?
        warningIconColor,
    Color?
        errorIconColor,
    BorderRadius?
        borderRadius,
    double?
        borderWidth,
    EdgeInsetsGeometry?
        padding,
    double?
        iconSize,
    TextStyle?
        titleStyle,
    TextStyle?
        descriptionStyle,
    double?
        elevation,
    Color?
        shadowColor,
  }) =>
      SAlertThemeData(
        successBackgroundColor: successBackgroundColor ?? this.successBackgroundColor,
        infoBackgroundColor: infoBackgroundColor ?? this.infoBackgroundColor,
        warningBackgroundColor: warningBackgroundColor ?? this.warningBackgroundColor,
        errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
        successBorderColor: successBorderColor ?? this.successBorderColor,
        infoBorderColor: infoBorderColor ?? this.infoBorderColor,
        warningBorderColor: warningBorderColor ?? this.warningBorderColor,
        errorBorderColor: errorBorderColor ?? this.errorBorderColor,
        successIconColor: successIconColor ?? this.successIconColor,
        infoIconColor: infoIconColor ?? this.infoIconColor,
        warningIconColor: warningIconColor ?? this.warningIconColor,
        errorIconColor: errorIconColor ?? this.errorIconColor,
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        padding: padding ?? this.padding,
        iconSize: iconSize ?? this.iconSize,
        titleStyle: titleStyle ?? this.titleStyle,
        descriptionStyle: descriptionStyle ?? this.descriptionStyle,
        elevation: elevation ?? this.elevation,
        shadowColor: shadowColor ?? this.shadowColor,
      );

  @override
  SAlertThemeData lerp(
      SAlertThemeData?
          other,
      double
          t) {
    if (other ==
        null)
      return this;
    return SAlertThemeData(
      successBackgroundColor: Color.lerp(
          successBackgroundColor,
          other.successBackgroundColor,
          t),
      infoBackgroundColor: Color.lerp(
          infoBackgroundColor,
          other.infoBackgroundColor,
          t),
      warningBackgroundColor: Color.lerp(
          warningBackgroundColor,
          other.warningBackgroundColor,
          t),
      errorBackgroundColor: Color.lerp(
          errorBackgroundColor,
          other.errorBackgroundColor,
          t),
      successBorderColor: Color.lerp(
          successBorderColor,
          other.successBorderColor,
          t),
      infoBorderColor: Color.lerp(
          infoBorderColor,
          other.infoBorderColor,
          t),
      warningBorderColor: Color.lerp(
          warningBorderColor,
          other.warningBorderColor,
          t),
      errorBorderColor: Color.lerp(
          errorBorderColor,
          other.errorBorderColor,
          t),
      successIconColor: Color.lerp(
          successIconColor,
          other.successIconColor,
          t),
      infoIconColor: Color.lerp(
          infoIconColor,
          other.infoIconColor,
          t),
      warningIconColor: Color.lerp(
          warningIconColor,
          other.warningIconColor,
          t),
      errorIconColor: Color.lerp(
          errorIconColor,
          other.errorIconColor,
          t),
      borderRadius: BorderRadius.lerp(
          borderRadius,
          other.borderRadius,
          t),
      borderWidth: lerpDouble(
          borderWidth,
          other.borderWidth,
          t),
      iconSize: lerpDouble(
          iconSize,
          other.iconSize,
          t),
      titleStyle: TextStyle.lerp(
          titleStyle,
          other.titleStyle,
          t),
      descriptionStyle: TextStyle.lerp(
          descriptionStyle,
          other.descriptionStyle,
          t),
      elevation: lerpDouble(
          elevation,
          other.elevation,
          t),
      shadowColor: Color.lerp(
          shadowColor,
          other.shadowColor,
          t),
    );
  }

  // ignore: avoid_returning_this
  static double? lerpDouble(
      double?
          a,
      double?
          b,
      double
          t) {
    if (a == null &&
        b == null)
      return null;
    return (a ?? 0.0) +
        ((b ?? 0.0) - (a ?? 0.0)) * t;
  }
}

/// Extension to read [SAlertThemeData] from [ThemeData].
extension SAlertThemeExtension
    on ThemeData {
  SAlertThemeData get sAlertTheme =>
      extension<SAlertThemeData>() ??
      const SAlertThemeData();
}

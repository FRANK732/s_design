import 'package:flutter/material.dart';

/// Theme data for [STooltip].
class STooltipThemeData
    extends ThemeExtension<
        STooltipThemeData> {
  const STooltipThemeData({
    required this.backgroundColor,
    required this.textColor,
    this.padding,
    this.borderRadius,
    this.showArrow =
        true,
    this.arrowSize =
        5.0,
    this.elevation =
        2.0,
    this.animationDuration =
        const Duration(milliseconds: 200),
    this.textStyle,
    this.shadowColor,
  });

  /// The background color of the tooltip bubble.
  final Color
      backgroundColor;

  /// The color of the text inside the tooltip.
  final Color
      textColor;

  /// The padding inside the tooltip bubble.
  final EdgeInsetsGeometry?
      padding;

  /// The border radius of the tooltip bubble.
  final BorderRadiusGeometry?
      borderRadius;

  /// Whether to show the orientation arrow.
  final bool
      showArrow;

  /// The size (height/base) of the triangle arrow.
  final double
      arrowSize;

  /// The elevation of the tooltip (box shadow).
  final double
      elevation;

  /// The duration of the fade/scale animation.
  final Duration
      animationDuration;

  /// The text style for the tooltip label.
  final TextStyle?
      textStyle;

  /// The shadow color.
  final Color?
      shadowColor;

  @override
  STooltipThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        textColor,
    EdgeInsetsGeometry?
        padding,
    BorderRadiusGeometry?
        borderRadius,
    bool?
        showArrow,
    double?
        arrowSize,
    double?
        elevation,
    Duration?
        animationDuration,
    TextStyle?
        textStyle,
    Color?
        shadowColor,
  }) {
    return STooltipThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      textColor:
          textColor ?? this.textColor,
      padding:
          padding ?? this.padding,
      borderRadius:
          borderRadius ?? this.borderRadius,
      showArrow:
          showArrow ?? this.showArrow,
      arrowSize:
          arrowSize ?? this.arrowSize,
      elevation:
          elevation ?? this.elevation,
      animationDuration:
          animationDuration ?? this.animationDuration,
      textStyle:
          textStyle ?? this.textStyle,
      shadowColor:
          shadowColor ?? this.shadowColor,
    );
  }

  @override
  STooltipThemeData lerp(
      ThemeExtension<STooltipThemeData>?
          other,
      double
          t) {
    if (other
        is! STooltipThemeData) {
      return this;
    }
    return STooltipThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      textColor: Color.lerp(
          textColor,
          other.textColor,
          t)!,
      padding: EdgeInsetsGeometry.lerp(
          padding,
          other.padding,
          t),
      borderRadius: BorderRadiusGeometry.lerp(
          borderRadius,
          other.borderRadius,
          t),
      showArrow: t < 0.5
          ? showArrow
          : other.showArrow,
      arrowSize:
          arrowSize + (other.arrowSize - arrowSize) * t,
      elevation:
          elevation + (other.elevation - elevation) * t,
      animationDuration: t < 0.5
          ? animationDuration
          : other.animationDuration,
      textStyle: TextStyle.lerp(
          textStyle,
          other.textStyle,
          t),
      shadowColor: Color.lerp(
          shadowColor,
          other.shadowColor,
          t),
    );
  }

  @override
  bool operator ==(
      Object
          other) {
    if (identical(
        this,
        other)) {
      return true;
    }
    if (other.runtimeType !=
        runtimeType) {
      return false;
    }
    return other is STooltipThemeData &&
        other.backgroundColor == backgroundColor &&
        other.textColor == textColor &&
        other.padding == padding &&
        other.borderRadius == borderRadius &&
        other.showArrow == showArrow &&
        other.arrowSize == arrowSize &&
        other.elevation == elevation &&
        other.animationDuration == animationDuration &&
        other.textStyle == textStyle &&
        other.shadowColor == shadowColor;
  }

  @override
  int get hashCode {
    return Object
        .hash(
      backgroundColor,
      textColor,
      padding,
      borderRadius,
      showArrow,
      arrowSize,
      elevation,
      animationDuration,
      textStyle,
      shadowColor,
    );
  }
}

/// Extension to access [STooltipThemeData] from [ThemeData].
extension STooltipThemeExtension
    on ThemeData {
  STooltipThemeData get sTooltipTheme =>
      extension<STooltipThemeData>() ??
      STooltipThemeData(
        backgroundColor: colorScheme.inverseSurface.withOpacity(0.9),
        textColor: colorScheme.onInverseSurface,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        borderRadius: BorderRadius.circular(4),
        shadowColor: Colors.black26,
        textStyle: textTheme.bodySmall?.copyWith(fontSize: 12),
      );
}

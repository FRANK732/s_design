import 'package:flutter/material.dart';

/// Theme data for [SLoadingIndicator].
@immutable
class SLoadingIndicatorThemeData
    extends ThemeExtension<
        SLoadingIndicatorThemeData> {
  const SLoadingIndicatorThemeData({
    required this.spinnerColor,
    required this.spinnerSize,
    required this.messageStyle,
    required this.useGradient,
    this.gradient,
    required this.backgroundColor,
    required this.shadowColor,
    required this.shadowBlurRadius,
    required this.shadowOffset,
    required this.animationCurve,
    required this.spinnerSpeed,
    required this.padding,
    required this.margin,
    required this.borderRadius,
  });

  /// Creates a [SLoadingIndicatorThemeData] from [ColorScheme].
  factory SLoadingIndicatorThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SLoadingIndicatorThemeData(
      spinnerColor:
          colorScheme.primary,
      spinnerSize:
          25.0,
      messageStyle:
          TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      useGradient:
          false,
      backgroundColor:
          colorScheme.surfaceContainerHighest,
      shadowColor:
          colorScheme.shadow.withOpacity(0.2),
      shadowBlurRadius:
          10.0,
      shadowOffset:
          const Offset(0, 4),
      animationCurve:
          Curves.easeInOut,
      spinnerSpeed:
          1.0,
      padding:
          const EdgeInsets.all(20.0),
      margin:
          EdgeInsets.zero,
      borderRadius:
          const BorderRadius.all(Radius.circular(20)),
    );
  }

  /// Default color for the loading spinner.
  final Color
      spinnerColor;

  /// Default size for the loading spinner.
  final double
      spinnerSize;

  /// Default text style for the loading message.
  final TextStyle
      messageStyle;

  /// Whether to use a gradient background for the loading container.
  final bool
      useGradient;

  /// Gradient colors for the loading container background.
  final Gradient?
      gradient;

  /// Background color for the loading container (used if [useGradient] is false).
  final Color
      backgroundColor;

  /// Shadow color for the loading container.
  final Color
      shadowColor;

  /// Blur radius for the container shadow.
  final double
      shadowBlurRadius;

  /// Offset for the container shadow.
  final Offset
      shadowOffset;

  /// Animation curve for the fade transition.
  final Curve
      animationCurve;

  /// Speed multiplier for the spinner animation.
  final double
      spinnerSpeed;

  /// Padding inside the loading indicator container.
  final EdgeInsetsGeometry
      padding;

  /// Margin around the loading indicator container.
  final EdgeInsetsGeometry
      margin;

  /// Border radius of the loading indicator container.
  final BorderRadiusGeometry
      borderRadius;

  @override
  SLoadingIndicatorThemeData
      copyWith({
    Color?
        spinnerColor,
    double?
        spinnerSize,
    TextStyle?
        messageStyle,
    bool?
        useGradient,
    Gradient?
        gradient,
    Color?
        backgroundColor,
    Color?
        shadowColor,
    double?
        shadowBlurRadius,
    Offset?
        shadowOffset,
    Curve?
        animationCurve,
    double?
        spinnerSpeed,
    EdgeInsetsGeometry?
        padding,
    EdgeInsetsGeometry?
        margin,
    BorderRadiusGeometry?
        borderRadius,
  }) {
    return SLoadingIndicatorThemeData(
      spinnerColor:
          spinnerColor ?? this.spinnerColor,
      spinnerSize:
          spinnerSize ?? this.spinnerSize,
      messageStyle:
          messageStyle ?? this.messageStyle,
      useGradient:
          useGradient ?? this.useGradient,
      gradient:
          gradient ?? this.gradient,
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      shadowColor:
          shadowColor ?? this.shadowColor,
      shadowBlurRadius:
          shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset:
          shadowOffset ?? this.shadowOffset,
      animationCurve:
          animationCurve ?? this.animationCurve,
      spinnerSpeed:
          spinnerSpeed ?? this.spinnerSpeed,
      padding:
          padding ?? this.padding,
      margin:
          margin ?? this.margin,
      borderRadius:
          borderRadius ?? this.borderRadius,
    );
  }

  @override
  SLoadingIndicatorThemeData lerp(
      ThemeExtension<SLoadingIndicatorThemeData>?
          other,
      double
          t) {
    if (other
        is! SLoadingIndicatorThemeData) {
      return this;
    }
    return SLoadingIndicatorThemeData(
      spinnerColor: Color.lerp(
          spinnerColor,
          other.spinnerColor,
          t)!,
      spinnerSize: _lerpDouble(
          spinnerSize,
          other.spinnerSize,
          t),
      messageStyle: TextStyle.lerp(
          messageStyle,
          other.messageStyle,
          t)!,
      useGradient: t < 0.5
          ? useGradient
          : other.useGradient,
      gradient:
          gradient, // Gradient lerp is complex, keeping simple for now
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      shadowColor: Color.lerp(
          shadowColor,
          other.shadowColor,
          t)!,
      shadowBlurRadius: _lerpDouble(
          shadowBlurRadius,
          other.shadowBlurRadius,
          t),
      shadowOffset: Offset.lerp(
          shadowOffset,
          other.shadowOffset,
          t)!,
      animationCurve: t < 0.5
          ? animationCurve
          : other.animationCurve,
      spinnerSpeed: _lerpDouble(
          spinnerSpeed,
          other.spinnerSpeed,
          t),
      padding: EdgeInsetsGeometry.lerp(
          padding,
          other.padding,
          t)!,
      margin: EdgeInsetsGeometry.lerp(
          margin,
          other.margin,
          t)!,
      borderRadius: BorderRadiusGeometry.lerp(
          borderRadius,
          other.borderRadius,
          t)!,
    );
  }

  double _lerpDouble(
      double
          a,
      double
          b,
      double
          t) {
    return a +
        (b - a) * t;
  }
}

/// Extension to access [SLoadingIndicatorThemeData] from [ThemeData].
extension SLoadingIndicatorThemeExtension
    on ThemeData {
  /// Retrieves the current [SLoadingIndicatorThemeData].
  SLoadingIndicatorThemeData get sLoadingIndicatorTheme =>
      extension<SLoadingIndicatorThemeData>() ??
      SLoadingIndicatorThemeData.fromColorScheme(colorScheme);
}

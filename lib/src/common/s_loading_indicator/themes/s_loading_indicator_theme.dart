import 'package:flutter/material.dart';

/// Theme data for [SLoadingIndicator].
@immutable
class SLoadingIndicatorThemeData {
  /// Default color for the loading spinner.
  final Color spinnerColor;

  /// Default size for the loading spinner.
  final double spinnerSize;

  /// Default text style for the loading message.
  final TextStyle messageStyle;

  /// Whether to use a gradient background for the loading container.
  final bool useGradient;

  /// Gradient colors for the loading container background.
  final Gradient? gradient;

  /// Background color for the loading container (used if [useGradient] is false).
  final Color backgroundColor;

  /// Shadow color for the loading container.
  final Color shadowColor;

  /// Blur radius for the container shadow.
  final double shadowBlurRadius;

  /// Offset for the container shadow.
  final Offset shadowOffset;

  /// Animation curve for the fade transition.
  final Curve animationCurve;

  /// Speed multiplier for the spinner animation.
  final double spinnerSpeed;

  /// Padding inside the loading indicator container.
  final EdgeInsetsGeometry padding;

  /// Margin around the loading indicator container.
  final EdgeInsetsGeometry margin;

  /// Border radius of the loading indicator container.
  final BorderRadiusGeometry borderRadius;

  /// Creates an instance of [SLoadingIndicatorThemeData].
  const SLoadingIndicatorThemeData({
    this.spinnerColor = Colors.teal,
    this.spinnerSize = 25.0,
    this.messageStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    this.useGradient = false,
    this.gradient,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.black26,
    this.shadowBlurRadius = 10.0,
    this.shadowOffset = const Offset(0, 4),
    this.animationCurve = Curves.easeInOut,
    this.spinnerSpeed = 1.0,
    this.padding = const EdgeInsets.all(20.0),
    this.margin = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  /// Provides a default light theme.
  factory SLoadingIndicatorThemeData.light() {
    return const SLoadingIndicatorThemeData();
  }

  /// Provides a default dark theme.
  factory SLoadingIndicatorThemeData.dark() {
    return SLoadingIndicatorThemeData(
      spinnerColor: Colors.white,
      messageStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      backgroundColor: Colors.grey[900]!,
      shadowColor: Colors.black54,
    );
  }

  /// Creates a copy of this theme with the given fields replaced with the new values.
  SLoadingIndicatorThemeData copyWith({
    Color? spinnerColor,
    double? spinnerSize,
    TextStyle? messageStyle,
    bool? useGradient,
    Gradient? gradient,
    Color? backgroundColor,
    Color? shadowColor,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    Curve? animationCurve,
    double? spinnerSpeed,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SLoadingIndicatorThemeData(
      spinnerColor: spinnerColor ?? this.spinnerColor,
      spinnerSize: spinnerSize ?? this.spinnerSize,
      messageStyle: messageStyle ?? this.messageStyle,
      useGradient: useGradient ?? this.useGradient,
      gradient: gradient ?? this.gradient,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      animationCurve: animationCurve ?? this.animationCurve,
      spinnerSpeed: spinnerSpeed ?? this.spinnerSpeed,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}

/// Extension to access [SLoadingIndicatorThemeData] from [ThemeData].
extension SLoadingIndicatorThemeExtension on ThemeData {
  /// Retrieves the current [SLoadingIndicatorThemeData].
  SLoadingIndicatorThemeData get sLoadingIndicatorTheme =>
      extension<SLoadingIndicatorThemeData>() ??
           SLoadingIndicatorThemeData.light();
}

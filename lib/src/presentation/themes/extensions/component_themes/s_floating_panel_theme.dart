import 'dart:ui';
import 'package:flutter/material.dart';

/// Theme data for [SFloatingPanel].
class SFloatingPanelThemeData
    extends ThemeExtension<
        SFloatingPanelThemeData> {
  /// Creates an instance of [SFloatingPanelThemeData].
  const SFloatingPanelThemeData({
    this.backgroundColor,
    this.barrierColor,
    this.panelSpacing,
    this.elevation,
    this.borderRadius,
    this.animationDuration,
    this.margin,
    this.constraints,
    this.contentPadding,
    this.backdropBlur,
    this.shadowColor,
    this.shape,
  });

  /// Creates a [SFloatingPanelThemeData] from [ColorScheme].
  factory SFloatingPanelThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SFloatingPanelThemeData(
      backgroundColor:
          colorScheme.surfaceContainerHigh,
      barrierColor:
          Colors.black.withOpacity(0.5),
      panelSpacing:
          16.0,
      elevation:
          0.0,
      borderRadius:
          BorderRadius.circular(16),
      animationDuration:
          const Duration(milliseconds: 300),
      margin:
          const EdgeInsets.all(16.0),
      backdropBlur:
          0.0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  /// Background color of the panel content.
  final Color?
      backgroundColor;

  /// Color of the barrier behind the panel.
  final Color?
      barrierColor;

  /// Margin around the panel.
  final EdgeInsetsGeometry?
      margin;

  /// Spacing between the main content and the bottom widget.
  final double?
      panelSpacing;

  /// Elevation of the panel.
  final double?
      elevation;

  /// Border radius of the panel.
  final BorderRadiusGeometry?
      borderRadius;

  /// Animation duration for showing/hiding the panel.
  final Duration?
      animationDuration;

  /// Constraints for the panel (e.g., max width).
  final BoxConstraints?
      constraints;

  /// Padding for the content.
  final EdgeInsetsGeometry?
      contentPadding;

  /// Blur amount for the backdrop.
  final double?
      backdropBlur;

  /// Color of the shadow.
  final Color?
      shadowColor;

  /// Shape of the panel.
  final ShapeBorder?
      shape;

  @override
  SFloatingPanelThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        barrierColor,
    double?
        panelSpacing,
    double?
        elevation,
    BorderRadiusGeometry?
        borderRadius,
    Duration?
        animationDuration,
    EdgeInsetsGeometry?
        margin,
    BoxConstraints?
        constraints,
    EdgeInsetsGeometry?
        contentPadding,
    double?
        backdropBlur,
    Color?
        shadowColor,
    ShapeBorder?
        shape,
  }) {
    return SFloatingPanelThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      barrierColor:
          barrierColor ?? this.barrierColor,
      panelSpacing:
          panelSpacing ?? this.panelSpacing,
      elevation:
          elevation ?? this.elevation,
      borderRadius:
          borderRadius ?? this.borderRadius,
      animationDuration:
          animationDuration ?? this.animationDuration,
      margin:
          margin ?? this.margin,
      constraints:
          constraints ?? this.constraints,
      contentPadding:
          contentPadding ?? this.contentPadding,
      backdropBlur:
          backdropBlur ?? this.backdropBlur,
      shadowColor:
          shadowColor ?? this.shadowColor,
      shape:
          shape ?? this.shape,
    );
  }

  @override
  SFloatingPanelThemeData lerp(
      ThemeExtension<SFloatingPanelThemeData>?
          other,
      double
          t) {
    if (other
        is! SFloatingPanelThemeData) {
      return this;
    }
    return SFloatingPanelThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t),
      barrierColor: Color.lerp(
          barrierColor,
          other.barrierColor,
          t),
      panelSpacing: lerpDouble(
          panelSpacing,
          other.panelSpacing,
          t),
      elevation: lerpDouble(
          elevation,
          other.elevation,
          t),
      borderRadius: BorderRadiusGeometry.lerp(
          borderRadius,
          other.borderRadius,
          t),
      animationDuration: t < 0.5
          ? animationDuration
          : other.animationDuration,
      margin: EdgeInsetsGeometry.lerp(
          margin,
          other.margin,
          t),
      constraints: BoxConstraints.lerp(
          constraints,
          other.constraints,
          t),
      contentPadding: EdgeInsetsGeometry.lerp(
          contentPadding,
          other.contentPadding,
          t),
      backdropBlur: lerpDouble(
          backdropBlur,
          other.backdropBlur,
          t),
      shadowColor: Color.lerp(
          shadowColor,
          other.shadowColor,
          t),
      shape: ShapeBorder.lerp(
          shape,
          other.shape,
          t),
    );
  }
}

/// Extension to access [SFloatingPanelThemeData] from [ThemeData].
extension SFloatingPanelThemeExtension
    on ThemeData {
  /// Retrieves the current [SFloatingPanelThemeData].
  SFloatingPanelThemeData get sFloatingPanelTheme =>
      extension<SFloatingPanelThemeData>() ??
      SFloatingPanelThemeData.fromColorScheme(colorScheme);
}

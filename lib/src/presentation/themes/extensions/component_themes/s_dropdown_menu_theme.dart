import 'package:flutter/material.dart';
import '../../../../core/constants/design_constants.dart';

@immutable
class SDropdownMenuThemeData
    extends ThemeExtension<
        SDropdownMenuThemeData> {
  const SDropdownMenuThemeData({
    this.backgroundColor,
    this.borderRadius,
    this.borderColor,
    this.elevation,
  });
  factory SDropdownMenuThemeData.fromColorScheme(
      ColorScheme?
          colorScheme) {
    return SDropdownMenuThemeData(
      backgroundColor:
          colorScheme?.surface,
      borderColor:
          colorScheme?.outlineVariant.withOpacity(0.5),
      borderRadius:
          BorderRadius.circular(DesignConstants.borderRadiusMedium),
      elevation:
          0,
    );
  }

  /// Background color of the dropdown menu.
  final Color?
      backgroundColor;

  /// Corner radius of the dropdown menu.
  final BorderRadius?
      borderRadius;

  /// Border color of the dropdown menu.
  final Color?
      borderColor;

  /// Elevation of the dropdown menu.
  final double?
      elevation;

  @override
  SDropdownMenuThemeData
      copyWith({
    Color?
        backgroundColor,
    BorderRadius?
        borderRadius,
    Color?
        borderColor,
    double?
        elevation,
  }) {
    return SDropdownMenuThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      borderRadius:
          borderRadius ?? this.borderRadius,
      borderColor:
          borderColor ?? this.borderColor,
      elevation:
          elevation ?? this.elevation,
    );
  }

  @override
  SDropdownMenuThemeData lerp(
      ThemeExtension<SDropdownMenuThemeData>?
          other,
      double
          t) {
    if (other
        is! SDropdownMenuThemeData) {
      return this;
    }
    return SDropdownMenuThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t),
      borderRadius: BorderRadius.lerp(
          borderRadius,
          other.borderRadius,
          t),
      borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t),
      elevation: lerpDouble(
          elevation,
          other.elevation,
          t),
    );
  }

  static double? lerpDouble(
      double?
          a,
      double?
          b,
      double
          t) {
    if (a == null &&
        b == null) {
      return null;
    }
    return (a ?? 0.0) +
        ((b ?? 0.0) - (a ?? 0.0)) * t;
  }

  @override
  bool operator ==(Object other) =>
      identical(this,
          other) ||
      other is SDropdownMenuThemeData &&
          other.backgroundColor == backgroundColor &&
          other.borderRadius == borderRadius &&
          other.borderColor == borderColor &&
          other.elevation == elevation;

  @override
  int get hashCode =>
      Object.hash(
        backgroundColor,
        borderRadius,
        borderColor,
        elevation,
      );
}

import 'package:flutter/material.dart';

/// Theme extension for [SPagination].
///
/// Provides global defaults for all [SPagination] instances.
/// Every property can be overridden per-instance directly on [SPagination].
class SPaginationThemeData
    extends ThemeExtension<
        SPaginationThemeData> {
  const SPaginationThemeData({
    this.activeColor,
    this.activeBorderColor,
    this.activeTextColor,
    this.defaultBorderColor,
    this.defaultTextColor,
    this.disabledColor,
    this.disabledTextColor,
    this.hoverBorderColor,
    this.hoverTextColor,
    this.itemSize,
    this.itemSpacing,
    this.borderRadius,
    this.itemTextStyle,
    this.totalTextStyle,
  });

  // ── Active (selected page) ───────────────────────────────────────────────
  final Color?
      activeColor;
  final Color?
      activeBorderColor;
  final Color?
      activeTextColor;

  // ── Default state ────────────────────────────────────────────────────────
  final Color?
      defaultBorderColor;
  final Color?
      defaultTextColor;

  // ── Disabled state ───────────────────────────────────────────────────────
  final Color?
      disabledColor;
  final Color?
      disabledTextColor;

  // ── Hover state ──────────────────────────────────────────────────────────
  final Color?
      hoverBorderColor;
  final Color?
      hoverTextColor;

  // ── Layout tokens ────────────────────────────────────────────────────────
  final double?
      itemSize;
  final double?
      itemSpacing;
  final BorderRadius?
      borderRadius;
  final TextStyle?
      itemTextStyle;
  final TextStyle?
      totalTextStyle;

  @override
  SPaginationThemeData copyWith({
    Color?
        activeColor,
    Color?
        activeBorderColor,
    Color?
        activeTextColor,
    Color?
        defaultBorderColor,
    Color?
        defaultTextColor,
    Color?
        disabledColor,
    Color?
        disabledTextColor,
    Color?
        hoverBorderColor,
    Color?
        hoverTextColor,
    double?
        itemSize,
    double?
        itemSpacing,
    BorderRadius?
        borderRadius,
    TextStyle?
        itemTextStyle,
    TextStyle?
        totalTextStyle,
  }) =>
      SPaginationThemeData(
        activeColor: activeColor ?? this.activeColor,
        activeBorderColor: activeBorderColor ?? this.activeBorderColor,
        activeTextColor: activeTextColor ?? this.activeTextColor,
        defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
        defaultTextColor: defaultTextColor ?? this.defaultTextColor,
        disabledColor: disabledColor ?? this.disabledColor,
        disabledTextColor: disabledTextColor ?? this.disabledTextColor,
        hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
        hoverTextColor: hoverTextColor ?? this.hoverTextColor,
        itemSize: itemSize ?? this.itemSize,
        itemSpacing: itemSpacing ?? this.itemSpacing,
        borderRadius: borderRadius ?? this.borderRadius,
        itemTextStyle: itemTextStyle ?? this.itemTextStyle,
        totalTextStyle: totalTextStyle ?? this.totalTextStyle,
      );

  @override
  SPaginationThemeData lerp(
      SPaginationThemeData?
          other,
      double
          t) {
    if (other ==
        null)
      return this;
    return SPaginationThemeData(
      activeColor: Color.lerp(
          activeColor,
          other.activeColor,
          t),
      activeBorderColor: Color.lerp(
          activeBorderColor,
          other.activeBorderColor,
          t),
      activeTextColor: Color.lerp(
          activeTextColor,
          other.activeTextColor,
          t),
      defaultBorderColor: Color.lerp(
          defaultBorderColor,
          other.defaultBorderColor,
          t),
      defaultTextColor: Color.lerp(
          defaultTextColor,
          other.defaultTextColor,
          t),
      disabledColor: Color.lerp(
          disabledColor,
          other.disabledColor,
          t),
      disabledTextColor: Color.lerp(
          disabledTextColor,
          other.disabledTextColor,
          t),
      hoverBorderColor: Color.lerp(
          hoverBorderColor,
          other.hoverBorderColor,
          t),
      hoverTextColor: Color.lerp(
          hoverTextColor,
          other.hoverTextColor,
          t),
      itemSize: _lerpDouble(
          itemSize,
          other.itemSize,
          t),
      itemSpacing: _lerpDouble(
          itemSpacing,
          other.itemSpacing,
          t),
      borderRadius: BorderRadius.lerp(
          borderRadius,
          other.borderRadius,
          t),
      itemTextStyle: TextStyle.lerp(
          itemTextStyle,
          other.itemTextStyle,
          t),
      totalTextStyle: TextStyle.lerp(
          totalTextStyle,
          other.totalTextStyle,
          t),
    );
  }

  static double? _lerpDouble(
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

/// Extension to read [SPaginationThemeData] from [ThemeData].
extension SPaginationThemeExtension
    on ThemeData {
  SPaginationThemeData get sPaginationTheme =>
      extension<SPaginationThemeData>() ??
      const SPaginationThemeData();
}

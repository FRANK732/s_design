import 'dart:ui';
import 'package:flutter/material.dart';

/// Theme data for [SDialog].
class SDialogThemeData
    extends ThemeExtension<
        SDialogThemeData> {
  /// Creates an instance of [SDialogThemeData].
  /// Creates an instance of [SDialogThemeData].
  const SDialogThemeData({
    required this.backgroundColor,
    required this.titleColor,
    required this.descriptionColor,
    required this.actionTextColor,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
    this.borderRadius,
    this.elevation,
    this.contentPadding,
    this.actionsPadding,
    this.titleStyle,
    this.descriptionStyle,
    this.dividerColor,
    this.dividerThickness,
    this.showDivider,
    this.shape,
    this.insetPadding,
    this.alignment,
    this.actionsAlignment,
    this.shadowColor,
    this.surfaceTintColor,
    this.clipBehavior,
  });

  factory SDialogThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SDialogThemeData(
      backgroundColor:
          colorScheme.surface,
      titleColor:
          colorScheme.onSurface,
      descriptionColor:
          colorScheme.onSurfaceVariant,
      actionTextColor:
          colorScheme.primary,
      buttonBackgroundColor:
          colorScheme.primaryContainer,
      buttonTextColor:
          colorScheme.onPrimaryContainer,
      borderRadius:
          BorderRadius.circular(16),
      elevation:
          6.0,
      contentPadding:
          const EdgeInsets.all(24.0),
      actionsPadding:
          const EdgeInsets.all(16.0),
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      alignment:
          Alignment.center,
      actionsAlignment:
          MainAxisAlignment.end,
      clipBehavior:
          Clip.none,
    );
  }

  final Color
      backgroundColor;
  final Color
      titleColor;
  final Color
      descriptionColor;
  final Color
      actionTextColor;
  final Color
      buttonBackgroundColor;
  final Color
      buttonTextColor;
  final BorderRadiusGeometry?
      borderRadius;
  final double?
      elevation;
  final EdgeInsetsGeometry?
      contentPadding;
  final EdgeInsetsGeometry?
      actionsPadding;
  final TextStyle?
      titleStyle;
  final TextStyle?
      descriptionStyle;
  final Color?
      dividerColor;
  final double?
      dividerThickness;
  final bool?
      showDivider;
  final ShapeBorder?
      shape;
  final EdgeInsets?
      insetPadding;
  final AlignmentGeometry?
      alignment;
  final MainAxisAlignment?
      actionsAlignment;
  final Color?
      shadowColor;
  final Color?
      surfaceTintColor;
  final Clip?
      clipBehavior;

  @override
  SDialogThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        titleColor,
    Color?
        descriptionColor,
    Color?
        actionTextColor,
    Color?
        buttonBackgroundColor,
    Color?
        buttonTextColor,
    BorderRadiusGeometry?
        borderRadius,
    double?
        elevation,
    EdgeInsetsGeometry?
        contentPadding,
    EdgeInsetsGeometry?
        actionsPadding,
    TextStyle?
        titleStyle,
    TextStyle?
        descriptionStyle,
    Color?
        dividerColor,
    double?
        dividerThickness,
    bool?
        showDivider,
    ShapeBorder?
        shape,
    EdgeInsets?
        insetPadding,
    AlignmentGeometry?
        alignment,
    MainAxisAlignment?
        actionsAlignment,
    Color?
        shadowColor,
    Color?
        surfaceTintColor,
    Clip?
        clipBehavior,
  }) {
    return SDialogThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      titleColor:
          titleColor ?? this.titleColor,
      descriptionColor:
          descriptionColor ?? this.descriptionColor,
      actionTextColor:
          actionTextColor ?? this.actionTextColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonTextColor:
          buttonTextColor ?? this.buttonTextColor,
      borderRadius:
          borderRadius ?? this.borderRadius,
      elevation:
          elevation ?? this.elevation,
      contentPadding:
          contentPadding ?? this.contentPadding,
      actionsPadding:
          actionsPadding ?? this.actionsPadding,
      titleStyle:
          titleStyle ?? this.titleStyle,
      descriptionStyle:
          descriptionStyle ?? this.descriptionStyle,
      dividerColor:
          dividerColor ?? this.dividerColor,
      dividerThickness:
          dividerThickness ?? this.dividerThickness,
      showDivider:
          showDivider ?? this.showDivider,
      shape:
          shape ?? this.shape,
      insetPadding:
          insetPadding ?? this.insetPadding,
      alignment:
          alignment ?? this.alignment,
      actionsAlignment:
          actionsAlignment ?? this.actionsAlignment,
      shadowColor:
          shadowColor ?? this.shadowColor,
      surfaceTintColor:
          surfaceTintColor ?? this.surfaceTintColor,
      clipBehavior:
          clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  SDialogThemeData lerp(
      SDialogThemeData?
          other,
      double
          t) {
    if (other
        is! SDialogThemeData) {
      return this;
    }
    return SDialogThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      titleColor: Color.lerp(
          titleColor,
          other.titleColor,
          t)!,
      descriptionColor: Color.lerp(
          descriptionColor,
          other.descriptionColor,
          t)!,
      actionTextColor: Color.lerp(
          actionTextColor,
          other.actionTextColor,
          t)!,
      buttonBackgroundColor: Color.lerp(
          buttonBackgroundColor,
          other.buttonBackgroundColor,
          t)!,
      buttonTextColor: Color.lerp(
          buttonTextColor,
          other.buttonTextColor,
          t)!,
      borderRadius: BorderRadiusGeometry.lerp(
          borderRadius,
          other.borderRadius,
          t),
      elevation: lerpDouble(
          elevation,
          other.elevation,
          t),
      contentPadding: EdgeInsetsGeometry.lerp(
          contentPadding,
          other.contentPadding,
          t),
      actionsPadding: EdgeInsetsGeometry.lerp(
          actionsPadding,
          other.actionsPadding,
          t),
      titleStyle: TextStyle.lerp(
          titleStyle,
          other.titleStyle,
          t),
      descriptionStyle: TextStyle.lerp(
          descriptionStyle,
          other.descriptionStyle,
          t),
      dividerColor: Color.lerp(
          dividerColor,
          other.dividerColor,
          t),
      dividerThickness: lerpDouble(
          dividerThickness,
          other.dividerThickness,
          t),
      showDivider: t < 0.5
          ? showDivider
          : other.showDivider,
      shape: ShapeBorder.lerp(
          shape,
          other.shape,
          t),
      insetPadding: EdgeInsets.lerp(
          insetPadding,
          other.insetPadding,
          t),
      alignment: AlignmentGeometry.lerp(
          alignment,
          other.alignment,
          t),
      actionsAlignment: t < 0.5
          ? actionsAlignment
          : other.actionsAlignment,
      shadowColor: Color.lerp(
          shadowColor,
          other.shadowColor,
          t),
      surfaceTintColor: Color.lerp(
          surfaceTintColor,
          other.surfaceTintColor,
          t),
      clipBehavior: t < 0.5
          ? clipBehavior
          : other.clipBehavior,
    );
  }
}

/// Extension to access [SDialogThemeData] from [ThemeData].
extension SDialogThemeExtension
    on ThemeData {
  /// Retrieves the current [SDialogThemeData].
  SDialogThemeData get sDialogTheme =>
      extension<SDialogThemeData>() ??
      SDialogThemeData.fromColorScheme(colorScheme);
}

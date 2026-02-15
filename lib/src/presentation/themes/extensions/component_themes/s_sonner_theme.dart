import 'package:flutter/material.dart';

/// Theme data for [SSonner].
/// Theme data for [SSonner].
class SSonnerThemeData
    extends ThemeExtension<
        SSonnerThemeData> {
  /// Creates an instance of [SSonnerThemeData].
  const SSonnerThemeData({
    required this.backgroundColor,
    required this.textColor,
    required this.successColor,
    required this.errorColor,
    required this.infoColor,
    required this.warningColor,
    required this.iconColor,
    required this.borderRadius,
    required this.elevation,
    this.shadowColor,
    this.padding,
    this.margin,
    this.closeIconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.actionButtonStyle,
  });

  /// Background color of the sonner notification.
  final Color
      backgroundColor;

  /// Text color of the sonner notification.
  final Color
      textColor;

  /// Color for success notifications.
  final Color
      successColor;

  /// Color for error notifications.
  final Color
      errorColor;

  /// Color for info notifications.
  final Color
      infoColor;

  /// Color for warning notifications.
  final Color
      warningColor;

  /// Icon color for notifications.
  final Color
      iconColor;

  /// Border radius of the notification card.
  final BorderRadiusGeometry
      borderRadius;

  /// Elevation of the notification card.
  final double
      elevation;

  /// Shadow color of the notification card.
  final Color?
      shadowColor;

  /// Padding inside the notification card.
  final EdgeInsetsGeometry?
      padding;

  /// Margin around the notification card.
  final EdgeInsetsGeometry?
      margin;

  /// Color of the close icon.
  final Color?
      closeIconColor;

  /// Style for the title text.
  final TextStyle?
      titleStyle;

  /// Style for the description text.
  final TextStyle?
      descriptionStyle;

  /// Style for the action button.
  final ButtonStyle?
      actionButtonStyle;

  @override
  SSonnerThemeData
      copyWith({
    Color?
        backgroundColor,
    Color?
        textColor,
    Color?
        successColor,
    Color?
        errorColor,
    Color?
        infoColor,
    Color?
        warningColor,
    Color?
        iconColor,
    BorderRadiusGeometry?
        borderRadius,
    double?
        elevation,
    Color?
        shadowColor,
    EdgeInsetsGeometry?
        padding,
    EdgeInsetsGeometry?
        margin,
    Color?
        closeIconColor,
    TextStyle?
        titleStyle,
    TextStyle?
        descriptionStyle,
    ButtonStyle?
        actionButtonStyle,
  }) {
    return SSonnerThemeData(
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      textColor:
          textColor ?? this.textColor,
      successColor:
          successColor ?? this.successColor,
      errorColor:
          errorColor ?? this.errorColor,
      infoColor:
          infoColor ?? this.infoColor,
      warningColor:
          warningColor ?? this.warningColor,
      iconColor:
          iconColor ?? this.iconColor,
      borderRadius:
          borderRadius ?? this.borderRadius,
      elevation:
          elevation ?? this.elevation,
      shadowColor:
          shadowColor ?? this.shadowColor,
      padding:
          padding ?? this.padding,
      margin:
          margin ?? this.margin,
      closeIconColor:
          closeIconColor ?? this.closeIconColor,
      titleStyle:
          titleStyle ?? this.titleStyle,
      descriptionStyle:
          descriptionStyle ?? this.descriptionStyle,
      actionButtonStyle:
          actionButtonStyle ?? this.actionButtonStyle,
    );
  }

  @override
  SSonnerThemeData lerp(
      ThemeExtension<SSonnerThemeData>?
          other,
      double
          t) {
    if (other
        is! SSonnerThemeData) {
      return this;
    }
    return SSonnerThemeData(
      backgroundColor: Color.lerp(
          backgroundColor,
          other.backgroundColor,
          t)!,
      textColor: Color.lerp(
          textColor,
          other.textColor,
          t)!,
      successColor: Color.lerp(
          successColor,
          other.successColor,
          t)!,
      errorColor: Color.lerp(
          errorColor,
          other.errorColor,
          t)!,
      infoColor: Color.lerp(
          infoColor,
          other.infoColor,
          t)!,
      warningColor: Color.lerp(
          warningColor,
          other.warningColor,
          t)!,
      iconColor: Color.lerp(
          iconColor,
          other.iconColor,
          t)!,
      borderRadius: BorderRadiusGeometry.lerp(
          borderRadius,
          other.borderRadius,
          t)!,
      elevation:
          (elevation + (other.elevation - elevation) * t),
      shadowColor: Color.lerp(
          shadowColor,
          other.shadowColor,
          t),
      padding: EdgeInsetsGeometry.lerp(
          padding,
          other.padding,
          t),
      margin: EdgeInsetsGeometry.lerp(
          margin,
          other.margin,
          t),
      closeIconColor: Color.lerp(
          closeIconColor,
          other.closeIconColor,
          t),
      titleStyle: TextStyle.lerp(
          titleStyle,
          other.titleStyle,
          t),
      descriptionStyle: TextStyle.lerp(
          descriptionStyle,
          other.descriptionStyle,
          t),
      actionButtonStyle: ButtonStyle.lerp(
          actionButtonStyle,
          other.actionButtonStyle,
          t),
    );
  }

  @override
  bool operator ==(
      Object
          other) {
    if (identical(
        this,
        other))
      return true;
    if (other.runtimeType !=
        runtimeType)
      return false;
    return other is SSonnerThemeData &&
        other.backgroundColor == backgroundColor &&
        other.textColor == textColor &&
        other.successColor == successColor &&
        other.errorColor == errorColor &&
        other.infoColor == infoColor &&
        other.warningColor == warningColor &&
        other.iconColor == iconColor &&
        other.borderRadius == borderRadius &&
        other.elevation == elevation &&
        other.shadowColor == shadowColor &&
        other.padding == padding &&
        other.margin == margin &&
        other.closeIconColor == closeIconColor &&
        other.titleStyle == titleStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.actionButtonStyle == actionButtonStyle;
  }

  @override
  int get hashCode {
    return Object
        .hash(
      backgroundColor,
      textColor,
      successColor,
      errorColor,
      infoColor,
      warningColor,
      iconColor,
      borderRadius,
      elevation,
      shadowColor,
      padding,
      margin,
      closeIconColor,
      titleStyle,
      descriptionStyle,
      actionButtonStyle,
    );
  }
}

/// Extension to access [SSonnerThemeData] from [ThemeData].
extension SSonnerThemeExtension
    on ThemeData {
  /// Retrieves the current [SSonnerThemeData].
  SSonnerThemeData get sSonnerTheme =>
      extension<SSonnerThemeData>() ??
      SSonnerThemeData(
        backgroundColor: colorScheme.inverseSurface,
        textColor: colorScheme.onInverseSurface,
        successColor: colorScheme.primary,
        errorColor: colorScheme.error,
        infoColor: colorScheme.secondary,
        warningColor: const Color(0xFFFFA726),
        iconColor: colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(8.0),
        elevation: 4.0,
        shadowColor: Colors.black26,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        closeIconColor: colorScheme.onInverseSurface.withOpacity(0.6),
        titleStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        descriptionStyle: textTheme.bodyMedium,
      );
}

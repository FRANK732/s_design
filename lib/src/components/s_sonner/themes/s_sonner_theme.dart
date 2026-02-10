import 'package:flutter/material.dart';
import '../../../theme/s_colors.dart';

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
  });

  /// Creates a [SSonnerThemeData] from [SColorsBase].
  factory SSonnerThemeData.fromColors(
      SColorsBase
          colors) {
    return SSonnerThemeData(
      backgroundColor:
          colors.toasterBackground,
      textColor:
          colors.toasterText,
      successColor:
          colors.primary,
      errorColor:
          colors.error,
      infoColor:
          colors.secondary,
      warningColor:
          const Color(0xFFFFA726), // Orange warning color
      iconColor:
          colors.textPrimary,
    );
  }

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
    );
  }
}

/// Extension to access [SSonnerThemeData] from [ThemeData].
extension SSonnerThemeExtension
    on ThemeData {
  /// Retrieves the current [SSonnerThemeData].
  SSonnerThemeData get sSonnerTheme =>
      extension<SSonnerThemeData>() ??
      SSonnerThemeData.fromColors(SLightColors());
}

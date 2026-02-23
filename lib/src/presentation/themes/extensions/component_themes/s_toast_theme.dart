import 'package:flutter/material.dart';

/// Theme data for [SToast].
class SToastThemeData
    extends ThemeExtension<
        SToastThemeData> {
  /// Creates an instance of [SToastThemeData].
  const SToastThemeData({
    required this.backgroundColor,
    required this.textColor,
    required this.successColor,
    required this.errorColor,
    required this.infoColor,
    required this.warningColor,
  });

  /// Background color of the toast.
  final Color
      backgroundColor;

  /// Text color of the toast.
  final Color
      textColor;

  /// Color for success toasts.
  final Color
      successColor;

  /// Color for error toasts.
  final Color
      errorColor;

  /// Color for info toasts.
  final Color
      infoColor;

  /// Color for warning toasts.
  final Color
      warningColor;

  @override
  SToastThemeData
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
  }) {
    return SToastThemeData(
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
    );
  }

  @override
  SToastThemeData lerp(
      ThemeExtension<SToastThemeData>?
          other,
      double
          t) {
    if (other
        is! SToastThemeData) {
      return this;
    }
    return SToastThemeData(
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
    return other is SToastThemeData &&
        other.backgroundColor == backgroundColor &&
        other.textColor == textColor &&
        other.successColor == successColor &&
        other.errorColor == errorColor &&
        other.infoColor == infoColor &&
        other.warningColor == warningColor;
  }

  @override
  int get hashCode {
    return Object
        .hashAll(<Object?>[
      backgroundColor,
      textColor,
      successColor,
      errorColor,
      infoColor,
      warningColor,
    ]);
  }
}

/// Extension to access [SToastThemeData] from [ThemeData].
extension SToastThemeExtension
    on ThemeData {
  /// Retrieves the current [SToastThemeData].
  SToastThemeData get sToastTheme =>
      extension<SToastThemeData>() ??
      SToastThemeData(
        backgroundColor: colorScheme.inverseSurface,
        textColor: colorScheme.onInverseSurface,
        successColor: colorScheme.primary,
        errorColor: colorScheme.error,
        infoColor: colorScheme.secondary,
        warningColor: const Color(0xFFFFA726),
      );
}

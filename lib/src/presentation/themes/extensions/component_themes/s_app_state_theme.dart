import 'dart:ui';
import 'package:flutter/material.dart';

/// Theme data for [SAppState].
@immutable
class SAppStateThemeData extends ThemeExtension<SAppStateThemeData> {
  /// Creates an instance of [SAppStateThemeData].
  const SAppStateThemeData({
    required this.illustrationSize,
    required this.elementSpacing,
    required this.titleStyle,
    required this.descriptionStyle,
    required this.padding,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.illustrationColor,
  });

  /// Creates a [SAppStateThemeData] with default values.
  factory SAppStateThemeData.fromTheme(ThemeData theme) {
    return SAppStateThemeData(
      illustrationSize: const Size(150, 150),
      elementSpacing: 32.0, // SDimensions.xLarge
      titleStyle: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ) ??
          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      descriptionStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ) ??
          const TextStyle(fontSize: 16),
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      illustrationColor: theme.colorScheme.primary,
    );
  }

  /// The size of the illustration.
  final Size illustrationSize;

  /// Vertical spacing between elements.
  final double elementSpacing;

  /// Style for the title text.
  final TextStyle titleStyle;

  /// Style for the description text.
  final TextStyle descriptionStyle;

  /// Padding around the entire state widget.
  final EdgeInsetsGeometry padding;

  /// Main axis alignment of the elements.
  final MainAxisAlignment mainAxisAlignment;

  /// Cross axis alignment of the elements.
  final CrossAxisAlignment crossAxisAlignment;

  /// Primary color used for the illustration.
  final Color illustrationColor;

  @override
  SAppStateThemeData copyWith({
    Size? illustrationSize,
    double? elementSpacing,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    EdgeInsetsGeometry? padding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    Color? illustrationColor,
  }) {
    return SAppStateThemeData(
      illustrationSize: illustrationSize ?? this.illustrationSize,
      elementSpacing: elementSpacing ?? this.elementSpacing,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      padding: padding ?? this.padding,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      illustrationColor: illustrationColor ?? this.illustrationColor,
    );
  }

  @override
  SAppStateThemeData lerp(ThemeExtension<SAppStateThemeData>? other, double t) {
    if (other is! SAppStateThemeData) {
      return this;
    }
    return SAppStateThemeData(
      illustrationSize: Size.lerp(illustrationSize, other.illustrationSize, t)!,
      elementSpacing: lerpDouble(elementSpacing, other.elementSpacing, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      descriptionStyle: TextStyle.lerp(descriptionStyle, other.descriptionStyle, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      mainAxisAlignment: t < 0.5 ? mainAxisAlignment : other.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? crossAxisAlignment : other.crossAxisAlignment,
      illustrationColor: Color.lerp(illustrationColor, other.illustrationColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is SAppStateThemeData &&
        other.illustrationSize == illustrationSize &&
        other.elementSpacing == elementSpacing &&
        other.titleStyle == titleStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.padding == padding &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.illustrationColor == illustrationColor;
  }

  @override
  int get hashCode {
    return Object.hash(
      illustrationSize,
      elementSpacing,
      titleStyle,
      descriptionStyle,
      padding,
      mainAxisAlignment,
      crossAxisAlignment,
      illustrationColor,
    );
  }
}

/// Extension to access [SAppStateThemeData] from [ThemeData].
extension SAppStateThemeExtension on ThemeData {
  /// Retrieves the current [SAppStateThemeData].
  SAppStateThemeData get sAppStateTheme =>
      extension<SAppStateThemeData>() ?? SAppStateThemeData.fromTheme(this);
}

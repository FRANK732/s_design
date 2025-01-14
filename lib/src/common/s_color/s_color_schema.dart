import 'package:flutter/material.dart';

class SColorScheme extends ThemeExtension<SColorScheme> {
  final Color primary;
  final Color primaryAccent;
  final Color secondary;
  final Color secondaryAccent;
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color link;

  const SColorScheme({
    required this.primary,
    required this.primaryAccent,
    required this.secondary,
    required this.secondaryAccent,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.link,
  });

  /// Light color scheme
  static const light = SColorScheme(
    primary: Colors.teal,
    primaryAccent: Colors.tealAccent,
    secondary: Colors.blue,
    secondaryAccent: Colors.lightBlueAccent,
    background: Colors.white,
    surface: Colors.transparent,
    textPrimary: Colors.white,
    textSecondary: Colors.teal,
    border: Colors.teal,
    link: Colors.blue,
  );

  /// Dark color scheme
  static const dark = SColorScheme(
    primary: Colors.teal,
    primaryAccent: Colors.tealAccent,
    secondary: Colors.blue,
    secondaryAccent: Colors.lightBlueAccent,
    background: Colors.black,
    surface: Colors.transparent,
    textPrimary: Colors.white,
    textSecondary: Colors.tealAccent,
    border: Colors.tealAccent,
    link: Colors.lightBlueAccent,
  );

  @override
  SColorScheme copyWith({
    Color? primary,
    Color? primaryAccent,
    Color? secondary,
    Color? secondaryAccent,
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? link,
  }) {
    return SColorScheme(
      primary: primary ?? this.primary,
      primaryAccent: primaryAccent ?? this.primaryAccent,
      secondary: secondary ?? this.secondary,
      secondaryAccent: secondaryAccent ?? this.secondaryAccent,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      link: link ?? this.link,
    );
  }

  @override
  SColorScheme lerp(ThemeExtension<SColorScheme>? other, double t) {
    if (other is! SColorScheme) return this;
    return SColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryAccent: Color.lerp(primaryAccent, other.primaryAccent, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryAccent: Color.lerp(secondaryAccent, other.secondaryAccent, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      link: Color.lerp(link, other.link, t)!,
    );
  }
}

extension SThemeDataExtension on ThemeData {
  SColorScheme get sColors => extension<SColorScheme>() ?? SColorScheme.light;
}

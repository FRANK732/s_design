import 'package:flutter/material.dart';

/// Theme data for [SSwitch].
class SSwitchThemeData
    extends ThemeExtension<
        SSwitchThemeData> {
  /// Creates an instance of [SSwitchThemeData].
  const SSwitchThemeData({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    required this.disabledTrackColor,
    required this.disabledThumbColor,
  });

  /// Creates a [SSwitchThemeData] from [ColorScheme].
  factory SSwitchThemeData.fromColorScheme(
      ColorScheme
          colorScheme) {
    return SSwitchThemeData(
      activeTrackColor:
          colorScheme.primary,
      inactiveTrackColor:
          colorScheme.surfaceVariant,
      activeThumbColor:
          colorScheme.onPrimary,
      inactiveThumbColor:
          colorScheme.outline,
      disabledTrackColor:
          colorScheme.onSurface.withOpacity(0.12),
      disabledThumbColor:
          colorScheme.onSurface.withOpacity(0.38),
    );
  }

  /// Track color when the switch is active/on.
  final Color
      activeTrackColor;

  /// Track color when the switch is inactive/off.
  final Color
      inactiveTrackColor;

  /// Thumb color when the switch is active/on.
  final Color
      activeThumbColor;

  /// Thumb color when the switch is inactive/off.
  final Color
      inactiveThumbColor;

  /// Track color when the switch is disabled.
  final Color
      disabledTrackColor;

  /// Thumb color when the switch is disabled.
  final Color
      disabledThumbColor;

  @override
  SSwitchThemeData
      copyWith({
    Color?
        activeTrackColor,
    Color?
        inactiveTrackColor,
    Color?
        activeThumbColor,
    Color?
        inactiveThumbColor,
    Color?
        disabledTrackColor,
    Color?
        disabledThumbColor,
  }) {
    return SSwitchThemeData(
      activeTrackColor:
          activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor:
          inactiveTrackColor ?? this.inactiveTrackColor,
      activeThumbColor:
          activeThumbColor ?? this.activeThumbColor,
      inactiveThumbColor:
          inactiveThumbColor ?? this.inactiveThumbColor,
      disabledTrackColor:
          disabledTrackColor ?? this.disabledTrackColor,
      disabledThumbColor:
          disabledThumbColor ?? this.disabledThumbColor,
    );
  }

  @override
  SSwitchThemeData lerp(
      ThemeExtension<SSwitchThemeData>?
          other,
      double
          t) {
    if (other
        is! SSwitchThemeData) {
      return this;
    }
    return SSwitchThemeData(
      activeTrackColor: Color.lerp(
          activeTrackColor,
          other.activeTrackColor,
          t)!,
      inactiveTrackColor: Color.lerp(
          inactiveTrackColor,
          other.inactiveTrackColor,
          t)!,
      activeThumbColor: Color.lerp(
          activeThumbColor,
          other.activeThumbColor,
          t)!,
      inactiveThumbColor: Color.lerp(
          inactiveThumbColor,
          other.inactiveThumbColor,
          t)!,
      disabledTrackColor: Color.lerp(
          disabledTrackColor,
          other.disabledTrackColor,
          t)!,
      disabledThumbColor: Color.lerp(
          disabledThumbColor,
          other.disabledThumbColor,
          t)!,
    );
  }
}

/// Extension to access [SSwitchThemeData] from [ThemeData].
extension SSwitchThemeExtension
    on ThemeData {
  /// Retrieves the current [SSwitchThemeData].
  SSwitchThemeData get sSwitchTheme =>
      extension<SSwitchThemeData>() ??
      SSwitchThemeData.fromColorScheme(colorScheme);
}

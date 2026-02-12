import 'package:flutter/material.dart';

/// Theme data for [SSwitch].
class SSwitchThemeData
    extends ThemeExtension<
        SSwitchThemeData> {
  /// Creates an instance of [SSwitchThemeData].
  const SSwitchThemeData({
    required this.activeColor,
    required this.inactiveColor,
    required this.disabledColor,
    required this.thumbColor,
    required this.activeTrackColor,
    required this.inactiveTrackColor,
  });

  /// Creates a [SSwitchThemeData] from [ColorScheme].
  factory SSwitchThemeData.fromColorScheme(
      ColorScheme
          colors) {
    return SSwitchThemeData(
      activeColor:
          colors.switchActive,
      inactiveColor:
          colors.switchInactive,
      disabledColor:
          colors.switchDisabled,
      thumbColor:
          colorScheme.onPrimary,
      activeTrackColor:
          colors.switchActive.withOpacity(0.5),
      inactiveTrackColor:
          colors.switchInactive,
    );
  }

  /// Color when switch is in active/on state.
  final Color
      activeColor;

  /// Color when switch is in inactive/off state.
  final Color
      inactiveColor;

  /// Color when switch is disabled.
  final Color
      disabledColor;

  /// Color of the switch thumb/toggle.
  final Color
      thumbColor;

  /// Color of the track when active.
  final Color
      activeTrackColor;

  /// Color of the track when inactive.
  final Color
      inactiveTrackColor;

  @override
  SSwitchThemeData
      copyWith({
    Color?
        activeColor,
    Color?
        inactiveColor,
    Color?
        disabledColor,
    Color?
        thumbColor,
    Color?
        activeTrackColor,
    Color?
        inactiveTrackColor,
  }) {
    return SSwitchThemeData(
      activeColor:
          activeColor ?? this.activeColor,
      inactiveColor:
          inactiveColor ?? this.inactiveColor,
      disabledColor:
          disabledColor ?? this.disabledColor,
      thumbColor:
          thumbColor ?? this.thumbColor,
      activeTrackColor:
          activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor:
          inactiveTrackColor ?? this.inactiveTrackColor,
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
      activeColor: Color.lerp(
          activeColor,
          other.activeColor,
          t)!,
      inactiveColor: Color.lerp(
          inactiveColor,
          other.inactiveColor,
          t)!,
      disabledColor: Color.lerp(
          disabledColor,
          other.disabledColor,
          t)!,
      thumbColor: Color.lerp(
          thumbColor,
          other.thumbColor,
          t)!,
      activeTrackColor: Color.lerp(
          activeTrackColor,
          other.activeTrackColor,
          t)!,
      inactiveTrackColor: Color.lerp(
          inactiveTrackColor,
          other.inactiveTrackColor,
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

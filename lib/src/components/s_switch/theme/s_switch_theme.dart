import 'package:flutter/material.dart';
import '../enums/s_switch_enums.dart';

/// Theme data for the SSwitch component.
class SSwitchThemeData {
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double width;
  final double height;
  final Duration animationDuration;
  final SSwitchVariant variant;

  SSwitchThemeData({
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.thumbColor = Colors.white,
    this.width = 50.0,
    this.height = 30.0,
    this.animationDuration = const Duration(milliseconds: 200),
    this.variant = SSwitchVariant.filled,
  });

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  SSwitchThemeData copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    double? width,
    double? height,
    Duration? animationDuration,
    SSwitchVariant? variant,
  }) {
    return SSwitchThemeData(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      thumbColor: thumbColor ?? this.thumbColor,
      width: width ?? this.width,
      height: height ?? this.height,
      animationDuration: animationDuration ?? this.animationDuration,
      variant: variant ?? this.variant,
    );
  }

  /// Default theme for the SSwitch.
  static SSwitchThemeData defaultTheme(BuildContext context) {
    // You can extend this to adapt to the app's theme
    return SSwitchThemeData();
  }
}

/// Inherited widget to provide SSwitchThemeData down the widget tree.
class SSwitchTheme extends InheritedWidget {
  final SSwitchThemeData data;

  const SSwitchTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static SSwitchThemeData of(BuildContext context) {
    final SSwitchTheme? theme =
    context.dependOnInheritedWidgetOfExactType<SSwitchTheme>();
    return theme?.data ?? SSwitchThemeData.defaultTheme(context);
  }

  @override
  bool updateShouldNotify(covariant SSwitchTheme oldWidget) {
    return data != oldWidget.data;
  }
}

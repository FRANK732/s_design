import 'package:flutter/material.dart';

@immutable
class TabsTheme extends ThemeExtension<TabsTheme> {
  final TabsListStyle listStyle;
  final TabsTriggerStyle triggerStyle;

  const TabsTheme({
    this.listStyle = const TabsListStyle(),
    this.triggerStyle = const TabsTriggerStyle(),
  });

  @override
  TabsTheme copyWith({
    TabsListStyle? listStyle,
    TabsTriggerStyle? triggerStyle,
  }) {
    return TabsTheme(
      listStyle: listStyle ?? this.listStyle,
      triggerStyle: triggerStyle ?? this.triggerStyle,
    );
  }

  @override
  TabsTheme lerp(ThemeExtension<TabsTheme>? other, double t) {
    if (other is! TabsTheme) return this;
    return TabsTheme(
      listStyle: listStyle.lerp(other.listStyle, t),
      triggerStyle: triggerStyle.lerp(other.triggerStyle, t),
    );
  }

  static TabsTheme of(BuildContext context) {
    return Theme.of(context).extension<TabsTheme>() ??
        const TabsTheme(); // Default Theme
  }
}

class TabsListStyle {
  final Color backgroundColor;
  final BorderRadius borderRadius;

  const TabsListStyle({
    this.backgroundColor = const Color(0xFF1F1F1F), // Dark background
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
  });

  TabsListStyle lerp(TabsListStyle? other, double t) {
    if (other == null) return this;
    return TabsListStyle(
      backgroundColor:
      Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t) ??
          borderRadius,
    );
  }
}

class TabsTriggerStyle {
  final TextStyle activeTextStyle;
  final TextStyle inactiveTextStyle;
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const TabsTriggerStyle({
    this.activeTextStyle = const TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
    this.inactiveTextStyle = const TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    this.activeBackgroundColor = Colors.black,
    this.inactiveBackgroundColor = const Color(0xFF2C2C2C),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  });

  TabsTriggerStyle lerp(TabsTriggerStyle? other, double t) {
    if (other == null) return this;
    return TabsTriggerStyle(
      activeTextStyle: TextStyle.lerp(activeTextStyle, other.activeTextStyle, t) ??
          activeTextStyle,
      inactiveTextStyle:
      TextStyle.lerp(inactiveTextStyle, other.inactiveTextStyle, t) ??
          inactiveTextStyle,
      activeBackgroundColor: Color.lerp(
          activeBackgroundColor, other.activeBackgroundColor, t) ??
          activeBackgroundColor,
      inactiveBackgroundColor: Color.lerp(
          inactiveBackgroundColor, other.inactiveBackgroundColor, t) ??
          inactiveBackgroundColor,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t) ??
          borderRadius,
      padding: EdgeInsets.lerp(padding, other.padding, t) ?? padding,
    );
  }
}

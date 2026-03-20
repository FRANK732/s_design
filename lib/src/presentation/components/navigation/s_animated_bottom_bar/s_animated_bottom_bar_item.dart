import 'package:flutter/material.dart';

/// A tab to display in an SAnimatedBottomBar (e.g., SCapsuleBottomBar, SDotBottomBar)
class SAnimatedBottomBarItem {
  /// An icon to display when this tab is active.
  final Widget?
      activeIcon;

  /// An icon to display.
  final Widget
      icon;

  /// A primary color to use for this tab.
  final Color?
      selectedColor;

  /// Text to display, ie `Home`
  final Widget
      title;

  /// The color to display when this tab is not selected.
  final Color?
      unselectedColor;

  SAnimatedBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}

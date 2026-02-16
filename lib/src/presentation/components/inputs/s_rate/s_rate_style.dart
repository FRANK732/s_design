import 'package:flutter/material.dart';

class SRateStyle {
  const SRateStyle({
    this.color,
    this.unselectedColor,
    this.disabledColor,
    this.size,
    this.gap,
  });

  /// Color for selected items.
  final Color?
      color;

  /// Color for unselected items.
  final Color?
      unselectedColor;

  /// Color for disabled items.
  final Color?
      disabledColor;

  /// Size of the icons.
  final double?
      size;

  /// Gap between items.
  final double?
      gap;
}

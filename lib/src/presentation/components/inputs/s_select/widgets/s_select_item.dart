import 'package:flutter/material.dart';

/// Represents an item in the SSelect widget.
class SSelectItem<
    T> {
  const SSelectItem({
    required this.value,
    required this.label,
    this.disabled =
        false,
    this.subtitle,
    this.icon,
  });

  /// The value of the item.
  final T
      value;

  /// The label to display.
  final String
      label;

  /// Whether the item is disabled.
  final bool
      disabled;

  /// Optional subtitle.
  final String?
      subtitle;

  /// Optional icon.
  final Widget
          Function(bool selected)?
      icon;
}

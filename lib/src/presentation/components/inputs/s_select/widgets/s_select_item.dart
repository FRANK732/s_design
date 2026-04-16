import 'package:flutter/material.dart';

/// Represents an item or a group of items in the SSelect widget.
class SSelectItem<
    T> {
  const SSelectItem({
    this.value,
    this.label,
    this.disabled =
        false,
    this.subtitle,
    this.icon,
    this.options,
    this.groupLabel,
  }) : assert(options != null || (value != null && label != null), 'Either options must be provided (for a group) or both value and label must be provided (for an item).');

  /// The value of the item. Null if this is a group.
  final T?
      value;

  /// The label to display for the item or group header.
  final String?
      label;

  /// Whether the item is disabled.
  final bool
      disabled;

  /// Optional subtitle (only for items).
  final String?
      subtitle;

  /// Optional icon builder.
  final Widget
          Function(bool selected)?
      icon;

  /// Nested options if this is a group (OptGroup).
  final List<SSelectItem<T>>?
      options;

  /// @deprecated Use [options] for hierarchical grouping.
  /// This remains for backward compatibility but nested [options] is preferred.
  final String?
      groupLabel;

  /// Whether this item represents a group.
  bool get isGroup =>
      options !=
      null;
}

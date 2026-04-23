import 'package:flutter/material.dart';

import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../../domain/entities/config/s_button_selectable_config.dart';
import 's_button_selectable.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SButtonSelectGroupItem
// ─────────────────────────────────────────────────────────────────────────────

/// Describes a single item inside an [SButtonSelectGroup].
///
/// Each item mirrors the key visual props of [SButtonSelectable] so the
/// group can apply consistent defaults while still allowing per-item overrides.
class SButtonSelectGroupItem {
  const SButtonSelectGroupItem({
    /// The label widget rendered as the button's child.
    required this.label,

    /// Optional leading icon for this item.
    this.leadingIcon,

    /// Optional trailing icon for this item.
    this.trailingIcon,

    /// Per-item selectable config — overrides the group-level config.
    this.config,

    /// Tooltip for this item when enabled.
    this.tooltip,

    /// Tooltip shown when this item is disabled.
    this.disabledTooltip,

    /// Whether this individual item is disabled regardless of group state.
    this.disabled = false,

    /// Unique semantic key for this item (optional).
    this.key,
  });

  final Widget label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final SButtonSelectableConfig? config;
  final String? tooltip;
  final String? disabledTooltip;
  final bool disabled;
  final Key? key;
}

// ─────────────────────────────────────────────────────────────────────────────
// SButtonSelectGroup
// ─────────────────────────────────────────────────────────────────────────────

/// Selection mode for [SButtonSelectGroup].
enum SButtonSelectMode {
  /// Only one item may be selected at a time (radio behaviour).
  single,

  /// Any number of items may be selected simultaneously.
  multi,
}

/// A group of [SButtonSelectable] buttons that coordinate their selection state.
///
/// ### Single-select (radio)
/// ```dart
/// SButtonSelectGroup(
///   mode: SButtonSelectMode.single,
///   initialSelection: {1},
///   onChanged: (indices) => setState(() => _selected = indices),
///   children: [
///     SButtonSelectGroupItem(label: Text('Day')),
///     SButtonSelectGroupItem(label: Text('Week')),
///     SButtonSelectGroupItem(label: Text('Month')),
///   ],
/// )
/// ```
///
/// ### Multi-select
/// ```dart
/// SButtonSelectGroup(
///   mode: SButtonSelectMode.multi,
///   onChanged: (indices) => setState(() => _tags = indices),
///   children: [
///     SButtonSelectGroupItem(label: Text('Flutter'), leadingIcon: Icon(Icons.flutter_dash)),
///     SButtonSelectGroupItem(label: Text('Dart')),
///     SButtonSelectGroupItem(label: Text('Firebase')),
///   ],
/// )
/// ```
class SButtonSelectGroup
    extends StatefulWidget {
  /// Creates a coordinated selectable button group.
  const SButtonSelectGroup({
    super.key,

    /// Selection behaviour — single (radio) or multi.
    this.mode = SButtonSelectMode.single,

    /// Indices of pre-selected items. In [SButtonSelectMode.single] only the
    /// first value is respected.
    this.initialSelection = const <int>{},

    /// Called whenever the selection set changes.
    this.onChanged,

    /// The items to render as selectable buttons.
    required this.children,

    /// Variant applied to every item.
    this.variant = SButtonVariant.outline,

    /// Size applied to every item.
    this.size = SButtonSize.defaultSize,

    /// Shared [SButtonSelectableConfig] applied to all items.
    /// Per-item configs from [SButtonSelectGroupItem.config] take precedence.
    this.config = const SButtonSelectableConfig(),

    /// Horizontal gap between buttons.
    this.spacing = 8.0,

    /// Vertical gap between rows when wrapping.
    this.runSpacing = 8.0,

    /// If true, every button stretches to fill the same width (column layout).
    this.isFullWidth = false,

    /// Whether ALL items are disabled.
    this.disabled = false,

    /// Whether at least one item must always remain selected (in single mode).
    ///
    /// When true, tapping the currently selected item is a no-op.
    this.requiresSelection = false,
  });

  /// Creates a radio-style (single-selection) group.
  const SButtonSelectGroup.single({
    Key? key,
    Set<int> initialSelection = const <int>{},
    ValueChanged<Set<int>>? onChanged,
    required List<SButtonSelectGroupItem> children,
    SButtonVariant variant = SButtonVariant.outline,
    SButtonSize size = SButtonSize.defaultSize,
    SButtonSelectableConfig config = const SButtonSelectableConfig(),
    double spacing = 8.0,
    double runSpacing = 8.0,
    bool isFullWidth = false,
    bool disabled = false,
    bool requiresSelection = false,
  }) : this(
          key: key,
          mode: SButtonSelectMode.single,
          initialSelection: initialSelection,
          onChanged: onChanged,
          children: children,
          variant: variant,
          size: size,
          config: config,
          spacing: spacing,
          runSpacing: runSpacing,
          isFullWidth: isFullWidth,
          disabled: disabled,
          requiresSelection: requiresSelection,
        );

  /// Creates a multi-selection group.
  const SButtonSelectGroup.multi({
    Key? key,
    Set<int> initialSelection = const <int>{},
    ValueChanged<Set<int>>? onChanged,
    required List<SButtonSelectGroupItem> children,
    SButtonVariant variant = SButtonVariant.outline,
    SButtonSize size = SButtonSize.defaultSize,
    SButtonSelectableConfig config = const SButtonSelectableConfig(),
    double spacing = 8.0,
    double runSpacing = 8.0,
    bool isFullWidth = false,
    bool disabled = false,
  }) : this(
          key: key,
          mode: SButtonSelectMode.multi,
          initialSelection: initialSelection,
          onChanged: onChanged,
          children: children,
          variant: variant,
          size: size,
          config: config,
          spacing: spacing,
          runSpacing: runSpacing,
          isFullWidth: isFullWidth,
          disabled: disabled,
        );

  final SButtonSelectMode mode;
  final Set<int> initialSelection;
  final ValueChanged<Set<int>>? onChanged;
  final List<SButtonSelectGroupItem> children;
  final SButtonVariant variant;
  final SButtonSize size;
  final SButtonSelectableConfig config;
  final double spacing;
  final double runSpacing;
  final bool isFullWidth;
  final bool disabled;
  final bool requiresSelection;

  @override
  State<SButtonSelectGroup>
      createState() =>
          _SButtonSelectGroupState();
}

class _SButtonSelectGroupState
    extends State<SButtonSelectGroup> {
  late Set<int> _selected;

  @override
  void initState() {
    super.initState();
    if (widget.mode == SButtonSelectMode.single &&
        widget.initialSelection.length > 1) {
      _selected =
          <int>{widget.initialSelection.first};
    } else {
      _selected =
          Set<int>.from(widget.initialSelection);
    }
  }

  @override
  void didUpdateWidget(
      SButtonSelectGroup old) {
    super.didUpdateWidget(old);
    // Sync if the caller changes initialSelection from outside.
    if (widget.initialSelection !=
        old.initialSelection) {
      setState(() {
        _selected =
            Set<int>.from(widget.initialSelection);
      });
    }
  }

  void _onItemTapped(int index) {
    if (widget.disabled ||
        widget.children[index].disabled) {
      return;
    }

    final Set<int> next;

    switch (widget.mode) {
      case SButtonSelectMode.single:
        if (_selected.contains(index)) {
          // Already selected — honour requiresSelection guard.
          if (widget.requiresSelection) {
            return;
          }
          next = <int>{};
        } else {
          next = <int>{index};
        }
      case SButtonSelectMode.multi:
        final Set<int> mutable =
            Set<int>.from(_selected);
        if (mutable.contains(index)) {
          mutable.remove(index);
        } else {
          mutable.add(index);
        }
        next = mutable;
    }

    setState(() => _selected = next);
    widget.onChanged
        ?.call(Set<int>.unmodifiable(next));
  }

  @override
  Widget build(
      BuildContext context) {
    if (widget.isFullWidth) {
      return Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        mainAxisSize:
            MainAxisSize.min,
        children:
            _buildItems(fullWidth: true),
      );
    }

    return Wrap(
      spacing:
          widget.spacing,
      runSpacing:
          widget.runSpacing,
      children:
          _buildItems(fullWidth: false),
    );
  }

  List<Widget> _buildItems({
    required bool fullWidth,
  }) {
    final List<Widget> items =
        <Widget>[];
    for (int i = 0;
        i < widget.children.length;
        i++) {
      final SButtonSelectGroupItem item =
          widget.children[i];
      final SButtonSelectableConfig effectiveConfig =
          item.config ?? widget.config;
      final bool isSelected =
          _selected.contains(i);
      final bool isDisabled =
          widget.disabled || item.disabled;

      final Widget btn =
          SButtonSelectable(
        key:
            item.key ??
            ValueKey<String>('s_select_group_item_$i'),
        isSelected:
            isSelected,
        onSelectionChanged:
            isDisabled ? null : (_) => _onItemTapped(i),
        config:
            effectiveConfig,
        variant:
            widget.variant,
        size:
            widget.size,
        state:
            isDisabled ? SButtonState.disabled : null,
        leadingIcon:
            item.leadingIcon,
        trailingIcon:
            item.trailingIcon,
        tooltip:
            item.tooltip,
        disabledTooltip:
            item.disabledTooltip,
        isFullWidth:
            fullWidth,
        child:
            item.label,
      );

      items.add(btn);
      if (fullWidth &&
          i < widget.children.length - 1) {
        items.add(
          SizedBox(height: widget.runSpacing),
        );
      }
    }
    return items;
  }
}

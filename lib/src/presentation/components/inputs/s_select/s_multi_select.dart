import 'dart:async';
import 'dart:developer'
    as developer;

import 'package:flutter/material.dart';
import '../../../../../s_design.dart';
import 'widgets/s_select_item.dart';
import 'widgets/s_select_menu.dart';
import 'widgets/s_select_sheet.dart';
import 'widgets/s_select_trigger.dart';

/// An advanced select widget supporting multiple selection, async search, and adaptive UI.
class SMultiSelect<
        T>
    extends StatefulWidget {
  const SMultiSelect({
    super.key,
    required this.items,
    this.values,
    this.onChanged,
    this.triggerBuilder,
    this.contentBuilder,
    this.disabled =
        false,
    this.style,
    this.placeholder,
    this.dropdownDirection =
        SSelectDropdownDirection.down,
    this.animationDuration =
        const Duration(milliseconds: 200),
    this.animationCurve =
        Curves.easeInOut,
    this.dropdownIcon,
    this.dropdownMaxHeight =
        300.0,
    this.searchPlaceholder =
        'Search...',
    this.onSearch,
    this.isAsync =
        false,
    this.isAdaptive =
        true,
    this.sheetTitle,
  })  : assert(
          dropdownMaxHeight > 0,
          'Dropdown max height must be positive.',
        ),
        assert(
          animationDuration >= Duration.zero,
          'Animation duration must not be negative.',
        );

  /// The current selected values.
  final List<T>?
      values;

  /// The list of items to display in the dropdown.
  final List<SSelectItem<T>>
      items;

  /// Callback invoked when the selected values change.
  final ValueChanged<List<T>>?
      onChanged;

  /// Custom builder for the trigger widget.
  final Widget Function(
      BuildContext
          context,
      List<T>
          values)? triggerBuilder;

  /// Custom builder for the dropdown content.
  final Widget Function(
      BuildContext
          context,
      SSelectMenu<T>
          menu)? contentBuilder;

  /// Whether the select widget is disabled.
  final bool
      disabled;

  /// Custom style for the default trigger button.
  final ButtonStyle?
      style;

  /// Placeholder text shown when no item is selected.
  final String?
      placeholder;

  /// Direction in which the dropdown opens (up or down).
  final SSelectDropdownDirection
      dropdownDirection;

  /// Duration of the dropdown animation.
  final Duration
      animationDuration;

  /// Curve for the dropdown animation.
  final Curve
      animationCurve;

  /// Custom icon for the dropdown trigger.
  final Widget?
      dropdownIcon;

  /// Maximum height of the dropdown.
  final double
      dropdownMaxHeight;

  /// Placeholder for search input.
  final String
      searchPlaceholder;

  /// Callback for searching items. If [isAsync] is true, this handles remote fetching.
  final FutureOr<List<SSelectItem<T>>>
          Function(String query)?
      onSearch;

  /// Whether searching is asynchronous.
  final bool
      isAsync;

  /// Whether to use a Bottom Sheet on mobile devices.
  final bool
      isAdaptive;

  /// Title for the Bottom Sheet when [isAdaptive] is true.
  final String?
      sheetTitle;

  @override
  State<
      SMultiSelect<
          T>> createState() =>
      _SMultiSelectState<T>();
}

class _SMultiSelectState<
        T>
    extends State<
        SMultiSelect<T>> {
  List<T>
      _selectedValues =
      [];
  OverlayEntry?
      _overlayEntry;
  final LayerLink
      _layerLink =
      LayerLink();
  bool
      _isDropdownOpen =
      false;

  @override
  void
      initState() {
    super
        .initState();
    _selectedValues =
        widget.values ?? [];
  }

  @override
  void didUpdateWidget(
      covariant SMultiSelect<T>
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.values !=
        oldWidget.values) {
      _selectedValues =
          widget.values ?? [];
    }
  }

  @override
  void
      dispose() {
    _removeOverlay();
    super
        .dispose();
  }

  void
      _onTrigger() {
    if (widget
        .disabled)
      return;

    final bool
        isMobile =
        Theme.of(context).platform == TargetPlatform.android || Theme.of(context).platform == TargetPlatform.iOS;

    if (widget.isAdaptive &&
        isMobile) {
      _showBottomSheet();
    } else {
      _toggleDropdown();
    }
  }

  void
      _showBottomSheet() {
    SSelectSheet.show<
        T>(
      context,
      items:
          widget.items,
      multiValues:
          _selectedValues,
      onMultiSelect:
          (values) {
        setState(() {
          _selectedValues = values;
          widget.onChanged?.call(values);
        });
      },
      isMultiSelect:
          true,
      searchPlaceholder:
          widget.searchPlaceholder,
      title:
          widget.sheetTitle ?? widget.placeholder,
    );
  }

  void
      _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void
      _showOverlay() {
    final OverlayState
        overlay =
        Overlay.of(context);
    final RenderBox
        renderBox =
        context.findRenderObject()! as RenderBox;
    final Size
        size =
        renderBox.size;
    final Offset
        offset =
        renderBox.localToGlobal(Offset.zero);

    final bool
        showDown =
        widget.dropdownDirection == SSelectDropdownDirection.down;

    _overlayEntry =
        OverlayEntry(
      builder: (BuildContext context) =>
          GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: <Widget>[
            Positioned(
              width: size.width,
              left: offset.dx,
              top: showDown ? offset.dy + size.height + 5.0 : offset.dy - widget.dropdownMaxHeight - 5.0,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(
                  0.0,
                  showDown ? size.height + 5.0 : -widget.dropdownMaxHeight - 5.0,
                ),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: AnimatedContainer(
                    duration: widget.animationDuration,
                    curve: widget.animationCurve,
                    constraints: BoxConstraints(
                      maxHeight: widget.dropdownMaxHeight,
                    ),
                    child: widget.contentBuilder != null ? widget.contentBuilder!(context, _buildMenu()) : _buildMenu(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    overlay
        .insert(_overlayEntry!);
    setState(() =>
        _isDropdownOpen = true);
  }

  SSelectMenu<T>
      _buildMenu() {
    return SSelectMenu<
        T>(
      items:
          widget.items,
      multiValues:
          _selectedValues,
      onMultiSelect:
          (List<T> values) {
        setState(() {
          _selectedValues = values;
          widget.onChanged?.call(values);
          developer.log('SMultiSelect: Items selected: $values', name: 'SMultiSelect');
        });
      },
      isMultiSelect:
          true,
      dropdownMaxHeight:
          widget.dropdownMaxHeight,
      searchPlaceholder:
          widget.searchPlaceholder,
      onSearch:
          widget.onSearch,
      isAsync:
          widget.isAsync,
    );
  }

  void
      _removeOverlay() {
    if (_overlayEntry !=
        null) {
      _overlayEntry?.remove();
      _overlayEntry =
          null;
      if (mounted) {
        setState(() => _isDropdownOpen = false);
      }
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    return CompositedTransformTarget(
      link:
          _layerLink,
      child:
          GestureDetector(
        onTap: _onTrigger,
        child: widget.triggerBuilder != null ? widget.triggerBuilder!(context, _selectedValues) : _defaultTrigger(context),
      ),
    );
  }

  Widget _defaultTrigger(
      BuildContext
          context) {
    String?
        label;
    if (_selectedValues
        .isNotEmpty) {
      if (_selectedValues.length ==
          1) {
        try {
          label = widget.items.firstWhere((SSelectItem<T> item) => item.value == _selectedValues.first).label;
        } catch (_) {
          label = _selectedValues.first.toString();
        }
      } else {
        label = '${_selectedValues.length} items selected';
      }
    }

    return SSelectTrigger(
      text:
          label,
      placeholder:
          widget.placeholder,
      disabled:
          widget.disabled,
      onPressed:
          _onTrigger,
      style:
          widget.style,
      icon:
          widget.dropdownIcon,
    );
  }
}

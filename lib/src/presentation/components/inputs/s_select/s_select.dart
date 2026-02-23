import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../s_design.dart';
import '../../../localizations/s_localizations.dart';
import 'widgets/s_select_dropdown.dart';
import 'widgets/s_select_trigger.dart';

/// An advanced select widget.
/// Supports single selection, multiple selection, tags, search, and custom styling.
class SSelect<
        T>
    extends StatefulWidget {
  const SSelect({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.mode,
    this.allowClear =
        false,
    this.autoClearSearchValue =
        true,
    this.defaultActiveFirstOption =
        true,
    this.defaultOpen =
        false,
    this.defaultValue,
    this.disabled =
        false,
    this.dropdownMaxHeight =
        256,
    this.dropdownRender,
    this.filterOption,
    this.loading =
        false,
    this.maxTagCount,
    this.notFoundContent,
    this.onClear,
    this.onDropdownVisibleChange,
    this.onSearch,
    this.placeholder,
    this.placement =
        SSelectDropdownDirection.down,
    this.showSearch =
        false,
    this.size =
        SSelectSize.middle,
    this.status =
        SSelectStatus.none,
    this.variant =
        SSelectVariant.outlined,
    this.suffixIcon,
    this.tagRender,
    this.triggerBuilder,
    this.contentBuilder,
    this.prefix,
  });

  /// The list of items to display in the dropdown.
  final List<SSelectItem<T>>
      items;

  /// Current selected value.
  /// - If [mode] is null or [SSelectMode.single], expected type is `T?`.
  /// - If [mode] is [SSelectMode.multiple] or [SSelectMode.tags], expected type is `List<T>?`.
  final dynamic
      value;

  /// Callback when value changes.
  /// - If [mode] is null or [SSelectMode.single], callback returns `T?`.
  /// - If [mode] is [SSelectMode.multiple] or [SSelectMode.tags], callback returns `List<T>`.
  final ValueChanged<dynamic>?
      onChanged;

  /// Mode of selection.
  final SSelectMode?
      mode;

  /// Whether to show a clear button.
  final bool
      allowClear;

  /// Whether to clear search input on selection (multiple/tags mode).
  final bool
      autoClearSearchValue;

  /// Whether to highlight the first option by default.
  final bool
      defaultActiveFirstOption;

  /// Initial open state of dropdown.
  final bool
      defaultOpen;

  /// Initial selected value (same type rules as [value]).
  final dynamic
      defaultValue;

  /// Whether the select is disabled.
  final bool
      disabled;

  /// Maximum height of the dropdown menu.
  final double
      dropdownMaxHeight;

  /// Custom builder for the dropdown content.
  final WidgetBuilder?
      dropdownRender;

  /// Custom filter function: `bool Function(String inputValue, SSelectItem<T> option)`.
  final bool Function(
      String,
      SSelectItem<T>)? filterOption;

  /// Whether the component is in a loading state.
  final bool
      loading;

  /// Max tag count to show.
  final int?
      maxTagCount;

  /// Content to show when no items match.
  final Widget?
      notFoundContent;

  /// Callback when clear button is clicked.
  final VoidCallback?
      onClear;

  /// Callback when dropdown visibility changes.
  final ValueChanged<bool>?
      onDropdownVisibleChange;

  /// Callback when search input changes.
  final ValueChanged<String>?
      onSearch;

  /// Placeholder text.
  final String?
      placeholder;

  /// Direction of dropdown placement.
  final SSelectDropdownDirection
      placement;

  /// Whether search is enabled.
  final bool
      showSearch;

  /// Size of the select input.
  final SSelectSize
      size;

  /// Validation status.
  final SSelectStatus
      status;

  /// Visual variant.
  final SSelectVariant
      variant;

  /// Custom suffix icon.
  final Widget?
      suffixIcon;

  /// Custom prefix widget.
  final Widget?
      prefix;

  /// Custom tag renderer.
  final Widget Function(
      String
          label,
      VoidCallback
          onClose)? tagRender;

  /// Custom trigger builder.
  final Widget Function(
      BuildContext
          context,
      dynamic
          value)? triggerBuilder;

  /// Legacy custom content builder (deprecated, prefer dropdownRender).
  final Widget Function(
      BuildContext
          context,
      Widget
          menu)? contentBuilder;

  @override
  State<
      SSelect<
          T>> createState() =>
      _SSelectState<T>();
}

class _SSelectState<
        T>
    extends State<
        SSelect<T>>
    with
        SingleTickerProviderStateMixin {
  bool
      _isOpen =
      false;
  OverlayEntry?
      _overlayEntry;
  final LayerLink
      _layerLink =
      LayerLink();
  late List<T>
      _selectedValues;
  String
      _searchValue =
      '';
  final FocusNode
      _focusNode =
      FocusNode();
  late AnimationController
      _animationController;
  late Animation<double>
      _fadeAnimation;
  late Animation<double>
      _scaleAnimation;

  @override
  void
      initState() {
    super
        .initState();
    _initSelectedValues();
    _animationController =
        AnimationController(
      vsync:
          this,
      duration:
          const Duration(milliseconds: 200),
      reverseDuration:
          const Duration(milliseconds: 150),
    );
    _fadeAnimation =
        CurvedAnimation(
      parent:
          _animationController,
      curve:
          Curves.easeOut,
    );
    _scaleAnimation =
        Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    if (widget
        .defaultOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          _toggleDropdown());
    }
    _focusNode
        .addListener(_handleFocusChange);
  }

  @override
  @override
  void didUpdateWidget(
      covariant SSelect<T>
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.value !=
        oldWidget.value) {
      setState(() {
        _initSelectedValues();
      });
      if (_isOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _overlayEntry?.markNeedsBuild();
        });
      }
    }
  }

  void
      _initSelectedValues() {
    if (widget.value ==
        null) {
      if (widget.defaultValue !=
          null) {
        _selectedValues = _normalizeValue(widget.defaultValue);
      } else {
        _selectedValues = [];
      }
    } else {
      _selectedValues =
          _normalizeValue(widget.value);
    }
  }

  List<T> _normalizeValue(
      dynamic
          val) {
    if (val ==
        null)
      return [];
    if (val
        is List)
      return List<T>.from(val);
    return [
      val as T
    ];
  }

  void
      _handleFocusChange() {
    if (!_focusNode.hasFocus &&
        _isOpen) {
      // Delay closing to allow tap events on dropdown items to register
      Future.delayed(const Duration(milliseconds: 100),
          () {
        if (mounted && !_focusNode.hasFocus && _isOpen) {
          _closeDropdown();
        }
      });
    }
    setState(
        () {}); // Rebuild for border color change
  }

  @override
  void
      dispose() {
    _removeOverlay();
    _animationController
        .dispose();
    _focusNode
        .removeListener(_handleFocusChange);
    _focusNode
        .dispose();
    super
        .dispose();
  }

  void
      _toggleDropdown() {
    if (widget
        .disabled)
      return;

    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void
      _openDropdown() {
    if (_isOpen)
      return;
    final RenderBox?
        renderBox =
        context.findRenderObject() as RenderBox?;
    if (renderBox ==
        null)
      return;

    final Size
        size =
        renderBox.size;

    _overlayEntry =
        OverlayEntry(
      builder: (context) =>
          Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _closeDropdown,
            ),
          ),
          Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 4),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  alignment: Alignment.topCenter,
                  child: Material(
                    elevation: 4,
                    shadowColor: STheme.of(context).colorToken.shadow,
                    borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
                    child: _buildDropdown(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context)
        .insert(_overlayEntry!);
    setState(
        () {
      _isOpen =
          true;
    });
    _animationController
        .forward();
    widget
        .onDropdownVisibleChange
        ?.call(true);
    _focusNode
        .requestFocus();
  }

  void
      _closeDropdown() async {
    await _animationController
        .reverse();
    if (!mounted)
      return;

    _removeOverlay();
    setState(
        () {
      _isOpen =
          false;
      _searchValue =
          '';
    });
    widget
        .onDropdownVisibleChange
        ?.call(false);
    // _focusNode.unfocus(); // Keep focus logic flexible
  }

  void
      _removeOverlay() {
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
  }

  Widget
      _buildDropdown() {
    // Filter items based on search
    final filteredItems = widget
        .items
        .where((item) {
      if (!widget.showSearch ||
          _searchValue.isEmpty)
        return true;
      if (widget.filterOption !=
          null) {
        return widget.filterOption!(_searchValue, item);
      }
      return item.label.toLowerCase().contains(_searchValue.toLowerCase());
    }).toList();

    return SSelectDropdown<
        T>(
      items:
          filteredItems,
      selectedValues:
          _selectedValues,
      mode:
          widget.mode ?? SSelectMode.single,
      maxHeight:
          widget.dropdownMaxHeight,
      loading:
          widget.loading,
      emptyContent:
          widget.notFoundContent,
      onSelect:
          _handleSelection,
    );
  }

  void _handleSelection(
      T value) {
    if (widget.mode == null ||
        widget.mode == SSelectMode.single) {
      setState(() {
        _selectedValues = [
          value
        ];
      });
      widget.onChanged?.call(value);
      _closeDropdown();
    } else {
      setState(() {
        if (_selectedValues.contains(value)) {
          _selectedValues.remove(value);
        } else {
          _selectedValues.add(value);
        }
      });
      _overlayEntry?.markNeedsBuild(); // Update dropdown UI
      widget.onChanged?.call(_selectedValues);
      if (widget.autoClearSearchValue) {
        _searchValue = '';
      }
    }
  }

  void
      _handleClear() {
    setState(
        () {
      _selectedValues =
          [];
    });
    _overlayEntry
        ?.markNeedsBuild(); // Update dropdown UI
    widget
        .onClear
        ?.call();

    if (widget.mode == null ||
        widget.mode == SSelectMode.single) {
      widget.onChanged?.call(null);
    } else {
      widget.onChanged?.call(<T>[]);
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    return CompositedTransformTarget(
      link:
          _layerLink,
      child: widget.triggerBuilder != null
          ? widget.triggerBuilder!(context, widget.value)
          : SSelectTrigger<T>(
              values: _selectedValues,
              items: widget.items,
              mode: widget.mode ?? SSelectMode.single,
              onPressed: _toggleDropdown,
              placeholder: widget.placeholder ?? SLocalizations.ofContext(context).selectPlaceholder,
              disabled: widget.disabled,
              loading: widget.loading,
              allowClear: widget.allowClear,
              onClear: _handleClear,
              size: widget.size,
              status: widget.status,
              variant: widget.variant,
              showSearch: widget.showSearch,
              prefix: widget.prefix,
              suffixIcon: widget.suffixIcon,
              focusNode: _focusNode,
              onSearch: (value) {
                setState(() {
                  _searchValue = value;
                });
                _overlayEntry?.markNeedsBuild();
                widget.onSearch?.call(value);
              },
              searchValue: _searchValue,
              maxTagCount: widget.maxTagCount,
              onItemRemove: _handleSelection, // Re-use handleSelection to toggle/remove
            ),
    );
  }
}

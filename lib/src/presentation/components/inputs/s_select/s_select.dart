import 'package:flutter/material.dart';

import '../../../../../s_design.dart';
import 'widgets/s_select_dropdown.dart';
import 'widgets/s_select_trigger.dart';

/// An advanced select widget.
/// Supports single, multiple, tags modes with search, custom renders, and more.
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
    this.optionRender,
    this.triggerBuilder,
    this.prefix,
    this.maxCount,
    this.labelInValue =
        false,
    this.tokenSeparators,
    this.filterSort,
  });

  /// The list of items to display in the dropdown.
  final List<SSelectItem<T>>
      items;

  /// Current selected value (controlled).
  /// - Single mode: `T?`
  /// - Multiple/tags mode: `List<T>?`
  final dynamic
      value;

  /// Callback when value changes.
  final ValueChanged<dynamic>?
      onChanged;

  /// Mode of selection.
  final SSelectMode?
      mode;

  /// Whether to show a clear button.
  final bool
      allowClear;

  /// Whether to clear search input after selection in multiple/tags mode.
  final bool
      autoClearSearchValue;

  /// Whether to highlight the first option by default.
  final bool
      defaultActiveFirstOption;

  /// Initial open state.
  final bool
      defaultOpen;

  /// Initial selected value (uncontrolled).
  final dynamic
      defaultValue;

  /// Whether the select is disabled.
  final bool
      disabled;

  /// Maximum height of the dropdown panel.
  final double
      dropdownMaxHeight;

  /// Custom dropdown panel builder. Receives `(context, menu)` where `menu` is the
  /// default options list — wrap or augment it as needed.
  final Widget Function(
      BuildContext
          context,
      Widget
          menu)? dropdownRender;

  /// Custom filter predicate: `bool Function(String inputValue, SSelectItem<T> option)`.
  final bool Function(
      String,
      SSelectItem<T>)? filterOption;

  /// Whether the component is in loading state.
  final bool
      loading;

  /// Max tag count to display in multiple/tags mode.
  final int?
      maxTagCount;

  /// Widget to show when no items match.
  final Widget?
      notFoundContent;

  /// Callback when the clear button is tapped.
  final VoidCallback?
      onClear;

  /// Callback when dropdown visibility changes.
  final ValueChanged<bool>?
      onDropdownVisibleChange;

  /// Callback when the search input changes.
  final ValueChanged<String>?
      onSearch;

  /// Placeholder text.
  final String?
      placeholder;

  /// Direction of dropdown placement.
  final SSelectDropdownDirection
      placement;

  /// Whether text search is enabled.
  final bool
      showSearch;

  /// Size of the select input.
  final SSelectSize
      size;

  /// Validation status.
  final SSelectStatus
      status;

  /// Visual variant (outlined, filled, borderless).
  final SSelectVariant
      variant;

  /// Custom suffix icon.
  final Widget?
      suffixIcon;

  /// Custom prefix widget.
  final Widget?
      prefix;

  /// Custom tag renderer in multiple/tags mode.
  /// Signature: `Widget Function(String label, VoidCallback onClose)`
  final Widget Function(
      String
          label,
      VoidCallback
          onClose)? tagRender;

  /// Custom renderer for each dropdown option row.
  /// Signature: `Widget Function(BuildContext context, SSelectItem<T> option, int index)`
  final Widget Function(
      BuildContext
          context,
      SSelectItem<T>
          option,
      int index)? optionRender;

  /// Custom trigger builder — replaces the default SSelectTrigger entirely.
  /// Signature: `Widget Function(BuildContext context, dynamic value)`
  final Widget Function(
      BuildContext
          context,
      dynamic
          value)? triggerBuilder;

  /// Max number of selectable items. Only applies in multiple/tags mode.
  final int?
      maxCount;

  /// If true, `onChanged` receives `SSelectItem<T>` instead of `T`.
  final bool
      labelInValue;

  /// Token separators for auto-tokenizing input in tags mode.
  final List<String>?
      tokenSeparators;

  /// Comparator to sort filtered options.
  final int Function(
      SSelectItem<T>
          a,
      SSelectItem<T>
          b)? filterSort;

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
        Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOutCubic),
    );

    if (widget
        .defaultOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          _openDropdown());
    }
    _focusNode
        .addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(
      covariant SSelect<T>
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.value !=
        oldWidget.value) {
      setState(() =>
          _initSelectedValues());
      if (_isOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _overlayEntry?.markNeedsBuild();
        });
      }
    }
  }

  void
      _initSelectedValues() {
    final dynamic
        raw =
        widget.value ?? widget.defaultValue;
    _selectedValues =
        _normalizeValue(raw);
  }

  List<T> _normalizeValue(
      dynamic
          val) {
    if (val ==
        null) {
      return <T>[];
    }
    if (val
        is List) {
      return List<T>.from(val);
    }
    return <T>[
      val as T
    ];
  }

  void
      _handleFocusChange() {
    // Close dropdown if focus moves completely outside
    if (!_focusNode.hasFocus &&
        _isOpen) {
      Future<void>.delayed(const Duration(milliseconds: 150),
          () {
        if (mounted && !_focusNode.hasFocus && _isOpen) {
          _closeDropdown();
        }
      });
    }
    setState(
        () {});
  }

  @override
  void
      dispose() {
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
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
        .disabled) {
      return;
    }
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void
      _openDropdown() {
    if (_isOpen ||
        widget.disabled) {
      return;
    }
    final RenderBox?
        renderBox =
        context.findRenderObject() as RenderBox?;
    if (renderBox ==
        null) {
      return;
    }
    final Size
        size =
        renderBox.size;

    _overlayEntry =
        OverlayEntry(
      builder:
          (BuildContext ctx) {
        if (!mounted) {
          return const SizedBox.shrink();
        }
        return Stack(
          children: <Widget>[
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
                      shadowColor: STheme.of(ctx).colorToken.shadow,
                      borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
                      child: _buildDropdownContent(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context)
        .insert(_overlayEntry!);
    setState(() =>
        _isOpen = true);
    _animationController
        .forward();
    widget
        .onDropdownVisibleChange
        ?.call(true);
    _focusNode
        .requestFocus();
  }

  Future<void>
      _closeDropdown() async {
    if (!_isOpen ||
        !mounted) {
      return;
    }
    await _animationController
        .reverse();
    if (!mounted) {
      return;
    }
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
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
  }

  Widget
      _buildDropdownContent() {
    final List<SSelectItem<T>>
        filteredItems =
        widget.items.where((SSelectItem<T> item) {
      if (!widget.showSearch ||
          _searchValue.isEmpty) {
        return true;
      }
      if (widget.filterOption !=
          null) {
        return widget.filterOption!(_searchValue, item);
      }
      return item.label.toLowerCase().contains(_searchValue.toLowerCase());
    }).toList();

    if (widget.filterSort !=
        null) {
      filteredItems.sort(widget.filterSort);
    }

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
      dropdownRender:
          widget.dropdownRender,
      optionRender:
          widget.optionRender,
    );
  }

  void _handleSelection(
      T value) {
    if (widget.mode == null ||
        widget.mode == SSelectMode.single) {
      setState(() =>
          _selectedValues = <T>[
            value
          ]);
      _emitOnChanged();
      _closeDropdown();
    } else {
      setState(() {
        if (_selectedValues.contains(value)) {
          _selectedValues.remove(value);
        } else {
          if (widget.maxCount == null || _selectedValues.length < widget.maxCount!) {
            _selectedValues.add(value);
          }
        }
      });
      _overlayEntry?.markNeedsBuild();
      _emitOnChanged();
      if (widget.autoClearSearchValue) {
        setState(() => _searchValue = '');
      }
    }
  }

  void
      _emitOnChanged() {
    if (widget.onChanged ==
        null) {
      return;
    }
    if (widget.mode == null ||
        widget.mode == SSelectMode.single) {
      if (_selectedValues.isEmpty) {
        widget.onChanged!(null);
      } else if (widget.labelInValue) {
        final SSelectItem<T>? item = widget.items.where((SSelectItem<T> i) => i.value == _selectedValues.first).firstOrNull;
        widget.onChanged!(item);
      } else {
        widget.onChanged!(_selectedValues.first);
      }
    } else {
      if (widget.labelInValue) {
        final List<SSelectItem<T>> items = widget.items.where((SSelectItem<T> i) => _selectedValues.contains(i.value)).toList();
        widget.onChanged!(items);
      } else {
        widget.onChanged!(List<T>.from(_selectedValues));
      }
    }
  }

  void
      _handleClear() {
    setState(() =>
        _selectedValues = <T>[]);
    _overlayEntry
        ?.markNeedsBuild();
    widget
        .onClear
        ?.call();
    _emitOnChanged();
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
              tagRender: widget.tagRender,
              onSearch: (String value) {
                String currentValue = value;
                // Token separator support for tags mode
                if (widget.mode == SSelectMode.tags && widget.tokenSeparators != null && widget.tokenSeparators!.isNotEmpty) {
                  for (final String sep in widget.tokenSeparators!) {
                    if (currentValue.contains(sep)) {
                      final List<String> parts = currentValue.split(sep);
                      for (int i = 0; i < parts.length - 1; i++) {
                        final String token = parts[i].trim();
                        if (token.isNotEmpty && !_selectedValues.contains(token as T)) {
                          if (widget.maxCount == null || _selectedValues.length < widget.maxCount!) {
                            setState(() => _selectedValues.add(token as T));
                          }
                        }
                      }
                      currentValue = parts.last;
                      _emitOnChanged();
                    }
                  }
                }
                setState(() => _searchValue = currentValue);
                _overlayEntry?.markNeedsBuild();
                widget.onSearch?.call(currentValue);
              },
              searchValue: _searchValue,
              maxTagCount: widget.maxTagCount,
              onItemRemove: _handleSelection,
            ),
    );
  }
}

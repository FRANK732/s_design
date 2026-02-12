import 'dart:developer'
    as developer;

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'utils/s_select_extension.dart';

// An advanced select widget with customizable trigger and content, supporting single or multi-select dropdowns.
class SSelect<
        T>
    extends StatefulWidget {
  const SSelect({
    super.key,
    required this.items,
    this.value,
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
    this.isMultiSelect =
        false,
    this.dropdownMaxHeight =
        300.0,
  })  : assert(
          dropdownMaxHeight > 0,
          'Dropdown max height must be positive.',
        ),
        assert(
          animationDuration >= Duration.zero,
          'Animation duration must not be negative.',
        ),
        assert(
          !isMultiSelect || value == null,
          'Single value is not supported with multi-select. Use a list for multi-select values.',
        );

  /// The current selected value for single-select mode.
  final T?
      value;

  /// The list of items to display in the dropdown.
  final List<SSelectItem<T>>
      items;

  /// Callback invoked when the selected value changes.
  final ValueChanged<T?>?
      onChanged;

  /// Custom builder for the trigger widget (e.g., the button that opens the dropdown).
  final Widget Function(
      BuildContext
          context,
      T? value)? triggerBuilder;

  /// Custom builder for the dropdown content.
  final Widget Function(
      BuildContext
          context,
      SSelectContent<T>
          content)? contentBuilder;

  /// Whether the select widget is disabled. Defaults to false.
  final bool
      disabled;

  /// Custom style for the default trigger button.
  final ButtonStyle?
      style;

  /// Placeholder text shown when no item is selected.
  final String?
      placeholder;

  /// Direction in which the dropdown opens (up or down). Defaults to down.
  final SSelectDropdownDirection
      dropdownDirection;

  /// Duration of the dropdown animation. Defaults to 200ms.
  final Duration
      animationDuration;

  /// Curve for the dropdown animation. Defaults to Curves.easeInOut.
  final Curve
      animationCurve;

  /// Custom icon for the dropdown trigger. Defaults to an arrow drop-down icon.
  final Widget?
      dropdownIcon;

  /// Whether multiple items can be selected. Defaults to false.
  final bool
      isMultiSelect;

  /// Maximum height of the dropdown. Defaults to 300.0.
  final double
      dropdownMaxHeight;

  @override
  State<
      SSelect<
          dynamic>> createState() =>
      _SSelectState<dynamic>();
}

class _SSelectState<
        T>
    extends State<
        SSelect<T>> {
  T? _selectedValue;
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
    _selectedValue =
        widget.value;
    developer
        .log(
      'SSelect: Initialized with value: $_selectedValue, items count: ${widget.items.length}',
      name:
          'SSelect',
    );
  }

  @override
  void didUpdateWidget(
      covariant SSelect<T>
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.value !=
        oldWidget.value) {
      _selectedValue =
          widget.value;
      developer.log(
        'SSelect: Updated selected value to: $_selectedValue',
        name: 'SSelect',
      );
    }
  }

  @override
  void
      dispose() {
    _removeOverlay();
    developer.log(
        'SSelect: Disposed',
        name: 'SSelect');
    super
        .dispose();
  }

  void
      _toggleDropdown() {
    if (widget
        .disabled) {
      developer.log(
        'SSelect: Toggle ignored, widget is disabled',
        name: 'SSelect',
      );
      return;
    }
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    developer
        .log(
      'SSelect: Dropdown toggled, isOpen: $_isDropdownOpen',
      name:
          'SSelect',
    );
  }

  void
      _showOverlay() {
    final OverlayState
        overlay =
        Overlay.of(context);
    // if (overlay == null) return;

    final RenderBox
        renderBox =
        context.findRenderObject()! as RenderBox;
    final Size
        size =
        renderBox.size;
    final Offset
        offset =
        renderBox.localToGlobal(Offset.zero);

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
              top: widget.dropdownDirection == SSelectDropdownDirection.down ? offset.dy + size.height + 5.0 : offset.dy - widget.dropdownMaxHeight - 5.0,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(
                  0.0,
                  widget.dropdownDirection == SSelectDropdownDirection.down ? size.height + 5.0 : -widget.dropdownMaxHeight - 5.0,
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
                    child: widget.contentBuilder != null
                        ? widget.contentBuilder!(
                            context,
                            SSelectContent<T>(
                              items: widget.items,
                              selectedValue: _selectedValue,
                              onItemSelected: (T? value) {
                                setState(() {
                                  _selectedValue = value;
                                  widget.onChanged?.call(value);
                                  _removeOverlay();
                                  developer.log(
                                    'SSelect: Item selected: $value',
                                    name: 'SSelect',
                                  );
                                });
                              },
                              isMultiSelect: widget.isMultiSelect,
                            ),
                          )
                        : SSelectContent<T>(
                            items: widget.items,
                            selectedValue: _selectedValue,
                            onItemSelected: (T? value) {
                              setState(() {
                                _selectedValue = value;
                                widget.onChanged?.call(value);
                                _removeOverlay();
                                developer.log(
                                  'SSelect: Item selected: $value',
                                  name: 'SSelect',
                                );
                              });
                            },
                            isMultiSelect: widget.isMultiSelect,
                          ),
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
    setState(
        () {
      _isDropdownOpen =
          true;
    });
    developer
        .log(
      'SSelect: Overlay shown, direction: ${widget.dropdownDirection}',
      name:
          'SSelect',
    );
  }

  void
      _removeOverlay() {
    if (_overlayEntry !=
        null) {
      _overlayEntry?.remove();
      _overlayEntry =
          null;
      setState(() {
        _isDropdownOpen = false;
      });
      developer.log('SSelect: Overlay removed',
          name: 'SSelect');
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
        onTap: _toggleDropdown,
        child: widget.triggerBuilder != null ? widget.triggerBuilder!(context, _selectedValue) : _defaultTrigger(context),
      ),
    );
  }

  Widget _defaultTrigger(
      BuildContext
          context) {
    final String buttonText = _selectedValue != null
        ? widget.items.firstWhere((SSelectItem<T> item) => item.value == _selectedValue).label
        : widget.placeholder ?? 'Select an option';

    return OutlinedButton(
      onPressed: widget.disabled
          ? null
          : _toggleDropdown,
      style: widget.style ??
          OutlinedButton.styleFrom(
            minimumSize: const Size(200, 40),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
      child:
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(buttonText),
          widget.dropdownIcon ?? const Icon(Icons.arrow_drop_down, size: 24),
        ],
      ),
    );
  }
}

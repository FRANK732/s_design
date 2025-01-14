import 'package:flutter/material.dart';
import 'package:s_design/src/components/s_select/enums/s_select_direction.dart';
import 'package:s_design/src/components/s_select/utils/s_select_extension.dart';

/// An advanced select widget with customizable trigger and content.
class SSelect<T> extends StatefulWidget {
  /// The current selected value.
  final T? value;

  /// The list of items to display in the dropdown.
  final List<SSelectItem<T>> items;

  /// Callback when the value changes.
  final ValueChanged<T?>? onChanged;

  /// The trigger widget builder.
  final Widget Function(BuildContext context, T? value)? triggerBuilder;

  /// The content widget builder.
  final Widget Function(BuildContext context, SSelectContent<T> content)?
      contentBuilder;

  /// Whether the select is disabled.
  final bool disabled;

  /// Custom style for the trigger.
  final ButtonStyle? style;

  /// Placeholder text when no item is selected.
  final String? placeholder;

  /// Direction in which the dropdown should open.
  final SSelectDropdownDirection dropdownDirection;

  /// Animation duration for the dropdown.
  final Duration animationDuration;

  /// Curve for the dropdown animation.
  final Curve animationCurve;

  /// Custom icon for the dropdown.
  final Widget? dropdownIcon;

  /// Whether multiple items can be selected.
  final bool isMultiSelect;

  /// The maximum height of the dropdown.
  final double dropdownMaxHeight;

  /// Creates an advanced select widget.
  const SSelect({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.triggerBuilder,
    this.contentBuilder,
    this.disabled = false,
    this.style,
    this.placeholder,
    this.dropdownDirection = SSelectDropdownDirection.down,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.dropdownIcon,
    this.isMultiSelect = false,
    this.dropdownMaxHeight = 300.0,
  });

  @override
  _SSelectState<T> createState() => _SSelectState<T>();
}

class _SSelectState<T> extends State<SSelect<T>> {
  T? _selectedValue;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant SSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedValue = widget.value;
    }
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    // if (overlay == null) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: [
            Positioned(
              width: size.width,
              left: offset.dx,
              top: widget.dropdownDirection == SSelectDropdownDirection.down
                  ? offset.dy + size.height + 5.0
                  : offset.dy - widget.dropdownMaxHeight - 5.0,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(
                  0.0,
                  widget.dropdownDirection == SSelectDropdownDirection.down
                      ? size.height + 5.0
                      : -widget.dropdownMaxHeight - 5.0,
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
                              onItemSelected: (value) {
                                setState(() {
                                  _selectedValue = value;
                                  widget.onChanged?.call(value);
                                  _removeOverlay();
                                });
                              },
                              isMultiSelect: widget.isMultiSelect,
                            ),
                          )
                        : SSelectContent<T>(
                            items: widget.items,
                            selectedValue: _selectedValue,
                            onItemSelected: (value) {
                              setState(() {
                                _selectedValue = value;
                                widget.onChanged?.call(value);
                                _removeOverlay();
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

    overlay.insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: widget.disabled ? null : _toggleDropdown,
        child: widget.triggerBuilder != null
            ? widget.triggerBuilder!(context, _selectedValue)
            : _defaultTrigger(context),
      ),
    );
  }

  Widget _defaultTrigger(BuildContext context) {
    String buttonText = _selectedValue != null
        ? widget.items.firstWhere((item) => item.value == _selectedValue).label
        : widget.placeholder ?? 'Select an option';

    return OutlinedButton(
      onPressed: widget.disabled ? null : _toggleDropdown,
      style: widget.style ??
          OutlinedButton.styleFrom(
            minimumSize: const Size(200, 40),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(buttonText),
          widget.dropdownIcon ?? const Icon(Icons.arrow_drop_down, size: 24),
        ],
      ),
    );
  }
}

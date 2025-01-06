import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_check_box/enums/s_checkbox_state.dart';
import 'package:s_design/src/widgets/s_check_box/themes/s_checkbox_theme.dart';
import 'package:s_design/src/widgets/s_check_box/utils/s_checkbox_util.dart';

///
/// The [SCheckbox] widget allows for three states: unchecked, checked, and indeterminate.
/// It supports customization of colors, sizes, and integrates with theming for consistent styling.
///
/// Example usage:
/// ```dart
/// SCheckbox(
///   value: SCheckboxState.checked,
///   onChanged: (newState) {
///     // Handle state change
///   },
///   size: 24.0,
///   activeColor: Colors.green,
///   checkColor: Colors.white,
///   borderColor: Colors.green,
/// )
/// ```
class SCheckbox extends StatefulWidget {
  /// The current state of the checkbox.
  final SCheckboxState value;

  /// Callback invoked when the checkbox state changes.
  final ValueChanged<SCheckboxState>? onChanged;

  /// The size of the checkbox.
  final double size;

  /// The active color when the checkbox is checked or indeterminate.
  final Color? activeColor;

  /// The color of the check mark or indeterminate line.
  final Color? checkColor;

  /// The color of the checkbox border.
  final Color? borderColor;

  /// Whether the checkbox is disabled.
  final bool isDisabled;

  const SCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.size = 18.0,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  _SCheckboxState createState() => _SCheckboxState();
}

class _SCheckboxState extends State<SCheckbox>
    with SingleTickerProviderStateMixin {
  late SCheckboxState _currentValue;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_currentValue != SCheckboxState.unchecked) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(SCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _currentValue) {
      setState(() {
        _currentValue = widget.value;
      });

      if (_currentValue != SCheckboxState.unchecked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  void _handleTap() {
    if (widget.isDisabled || widget.onChanged == null) {
      return;
    }

    final SCheckboxState newValue = SCheckboxUtils.toggleState(_currentValue);

    widget.onChanged?.call(newValue);
  }

  @override
  Widget build(BuildContext context) {
    final SCheckboxThemeData theme = Theme.of(context).sCheckboxTheme;

    final Color effectiveActiveColor = widget.activeColor ?? theme.activeColor;
    final Color effectiveCheckColor = widget.checkColor ?? theme.checkColor;
    final Color effectiveBorderColor = widget.borderColor ?? theme.borderColor;

    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: _currentValue != SCheckboxState.unchecked
                  ? effectiveActiveColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: _currentValue != SCheckboxState.unchecked
                    ? effectiveActiveColor
                    : effectiveBorderColor,
                width: 2.0,
              ),
            ),
            child: Center(
              child: _buildInnerIcon(effectiveCheckColor),
            ),
          );
        },
      ),
    );
  }

  /// Builds the inner icon based on the current state.
  Widget _buildInnerIcon(Color checkColor) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: _currentValue == SCheckboxState.indeterminate
          ? Container(
              width: widget.size * 0.6,
              height: 2.0,
              color: checkColor,
            )
          : _currentValue == SCheckboxState.checked
              ? Icon(
                  Icons.check,
                  size: widget.size * 0.7,
                  color: checkColor,
                )
              : const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

import '../../../../../s_design.dart';
import 'utils/s_checkbox_util.dart';

///
/// The [SCheckbox] widget allows for two or three states: unchecked, checked, and optionally indeterminate.
/// It supports customization of colors, sizes, and integrates with theming for consistent styling.
///
class SCheckbox
    extends StatefulWidget {
  const SCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.intermediate =
        true,
    this.size =
        18.0,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.disabledColor,
    this.isDisabled =
        false,
    this.isError =
        false,
    this.focusNode,
    this.autofocus =
        false,
    this.semanticLabel,
  });

  /// The current state of the checkbox.
  final SCheckboxState
      value;

  /// Callback invoked when the checkbox state changes.
  final ValueChanged<SCheckboxState>?
      onChanged;

  /// The size of the checkbox.
  final double
      size;

  /// Whether to include the indeterminate state.
  final bool
      intermediate;

  /// The active color when the checkbox is checked or indeterminate.
  final Color?
      activeColor;

  /// The color of the check mark or indeterminate line.
  final Color?
      checkColor;

  /// The color of the checkbox border.
  final Color?
      borderColor;

  /// Whether the checkbox is disabled.
  final Color?
      disabledColor;

  /// Whether the checkbox is disabled.
  final bool
      isDisabled;

  /// Whether the checkbox is in an error state.
  final bool
      isError;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode?
      focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool
      autofocus;

  /// The semantic label for the checkbox.
  final String?
      semanticLabel;

  @override
  State<SCheckbox>
      createState() =>
          _SCheckboxState();
}

class _SCheckboxState
    extends State<
        SCheckbox>
    with
        SingleTickerProviderStateMixin {
  late SCheckboxState
      _currentValue;
  late AnimationController
      _animationController;
  late Animation<double>
      _scaleAnimation;
  late Map<
      Type,
      Action<Intent>> _actionMap;

  FocusNode?
      _focusNode;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ??
      (_focusNode ??=
          FocusNode());

  @override
  void
      initState() {
    super
        .initState();
    _currentValue =
        widget.value;

    _animationController =
        AnimationController(
      duration:
          const Duration(milliseconds: 200),
      vsync:
          this,
    );

    _scaleAnimation =
        CurvedAnimation(
      parent:
          _animationController,
      curve:
          Curves.easeInOut,
    );

    if (_currentValue !=
        SCheckboxState.unchecked) {
      _animationController.forward();
    }

    _actionMap =
        <Type, Action<Intent>>{
      ActivateIntent:
          CallbackAction<ActivateIntent>(
        onInvoke: (ActivateIntent intent) => _handleTap(),
      ),
    };
  }

  @override
  void didUpdateWidget(
      SCheckbox
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.value !=
        _currentValue) {
      setState(() {
        _currentValue = widget.value;
      });

      if (_currentValue !=
          SCheckboxState.unchecked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  void
      _handleTap() {
    if (widget.isDisabled ||
        widget.onChanged == null) {
      return;
    }

    final SCheckboxState
        newState =
        SCheckboxUtils.toggleState(_currentValue, widget.intermediate);

    setState(
        () {
      _currentValue =
          newState;
    });

    if (newState !=
        SCheckboxState.unchecked) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    widget
        .onChanged
        ?.call(newState);
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SCheckboxThemeData
        theme =
        Theme.of(context).sCheckboxTheme;

    final Color
        effectiveActiveColor =
        widget.activeColor ?? theme.activeColor;
    final Color
        effectiveCheckColor =
        widget.checkColor ?? theme.checkColor;
    final Color effectiveBorderColor = widget.isError
        ? theme.errorColor
        : (widget.borderColor ?? theme.borderColor);

    // Determine overlay color for focus/hover - handled by InkResponse splash/highlight
    // but we might want to keep focus ring logic if InkResponse doesn't do it perfectly for non-touch focus.
    // However, InkResponse handles focusColor/hoverColor if configured.
    // Let's rely on InkResponse for hover/splash, but keep focus ring on the container if needed.
    // Actually, SCheckbox usually has a custom focus ring.

    return Semantics(
      checked:
          _currentValue == SCheckboxState.checked,
      label:
          widget.semanticLabel,
      enabled:
          !widget.isDisabled,
      button:
          true,
      child:
          FocusableActionDetector(
        focusNode: _effectiveFocusNode,
        autofocus: widget.autofocus,
        actions: _actionMap,
        mouseCursor: widget.isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        child: InkResponse(
          onTap: _handleTap,
          canRequestFocus: false,
          radius: widget.size,
          containedInkWell: false,
          highlightShape: BoxShape.circle,
          splashColor: theme.activeColor.withOpacity(0.1),
          highlightColor: theme.activeColor.withOpacity(0.1),
          hoverColor: theme.hoverColor,
          focusColor: theme.focusColor,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              // visual focus ring could be here if needed, or rely on InkResponse focusColor
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    color: _currentValue != SCheckboxState.unchecked ? effectiveActiveColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: _currentValue != SCheckboxState.unchecked ? effectiveActiveColor : effectiveBorderColor,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    child: _buildInnerIcon(effectiveCheckColor),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the inner icon based on the current state.
  Widget _buildInnerIcon(
      Color
          checkColor) {
    return ScaleTransition(
      scale:
          _scaleAnimation,
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
  void
      dispose() {
    _animationController
        .dispose();
    _focusNode
        ?.dispose();
    super
        .dispose();
  }
}

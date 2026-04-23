import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../../domain/entities/config/s_button_selectable_config.dart';
import '../../../themes/extensions/component_themes/s_button_theme.dart';
import 's_button.dart';
import 's_button_style_helper.dart';

/// Maps [SSelectableCurve] enum values to Flutter [Curve] instances.
Curve _resolveCurve(
    SSelectableCurve c) {
  switch (c) {
    case SSelectableCurve.linear:
      return Curves.linear;
    case SSelectableCurve.easeIn:
      return Curves.easeIn;
    case SSelectableCurve.easeOut:
      return Curves.easeOut;
    case SSelectableCurve.easeInOut:
      return Curves.easeInOut;
    case SSelectableCurve.elasticOut:
      return Curves.elasticOut;
    case SSelectableCurve.bounceOut:
      return Curves.bounceOut;
  }
}

/// Maps a [SColorValue] domain color to a Flutter [Color].
Color? _resolveColor(
    SColorValue? v) =>
    v == null ? null : Color(v.value);

/// A production-grade selectable / toggle button.
///
/// Can be used in two modes:
///
/// **Uncontrolled** — manages its own selection state internally:
/// ```dart
/// SButtonSelectable(
///   child: const Text('Dark Mode'),
///   onSelectionChanged: (selected) => debugPrint('$selected'),
/// )
/// ```
///
/// **Controlled** — drives state from outside:
/// ```dart
/// SButtonSelectable(
///   isSelected: _bold,
///   onSelectionChanged: (v) => setState(() => _bold = v),
///   child: const Text('Bold'),
/// )
/// ```
class SButtonSelectable
    extends StatefulWidget {
  const SButtonSelectable({
    super.key,
    this.isSelected = false,
    this.onSelectionChanged,
    this.config = const SButtonSelectableConfig(),
    this.variant = SButtonVariant.outline,
    this.size = SButtonSize.defaultSize,
    this.state,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.loading = false,
    this.onLongPress,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.tooltip,
    this.buttonStyle,
    this.isFullWidth = false,
    this.debounceDuration,
    this.enableHapticFeedback = false,
    this.leadingIcon,
    this.trailingIcon,
    this.loadingText,
    this.disabledTooltip,
    this.badge,
    this.shortcut,
  });

  // ── Selection ─────────────────────────────────────────────────────────────

  /// Whether the button is currently selected.
  ///
  /// When provided alongside [onSelectionChanged], the button operates in
  /// **controlled** mode — the caller is responsible for updating this value.
  /// When omitted the button manages selection state internally.
  final bool isSelected;

  /// Called when the user taps the button and the selection state changes.
  ///
  /// The bool argument is the **new** selected state after the tap.
  final ValueChanged<bool>? onSelectionChanged;

  /// Rich customization config for the selected state.
  final SButtonSelectableConfig config;

  // ── Shared SButton props ──────────────────────────────────────────────────
  final SButtonVariant variant;
  final SButtonSize size;
  final SButtonState? state;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool loading;
  final VoidCallback? onLongPress;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final String? tooltip;
  final ButtonStyle? buttonStyle;
  final bool isFullWidth;
  final Duration? debounceDuration;
  final bool enableHapticFeedback;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? loadingText;
  final String? disabledTooltip;
  final Widget? badge;
  final SingleActivator? shortcut;

  @override
  State<SButtonSelectable>
      createState() =>
          _SButtonSelectableState();
}

class _SButtonSelectableState
    extends State<SButtonSelectable>
    with SingleTickerProviderStateMixin {
  /// Internal selection state — only used in uncontrolled mode.
  late bool _internalSelected;

  late AnimationController _animController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _internalSelected =
        widget.isSelected;
    _animController =
        AnimationController(
      vsync:
          this,
      duration:
          widget.config.animationDuration,
    );
    _scaleAnim =
        TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween:
              Tween<double>(begin: 1.0, end: 0.93),
          weight:
              40,
        ),
        TweenSequenceItem<double>(
          tween:
              Tween<double>(begin: 0.93, end: 1.0),
          weight:
              60,
        ),
      ],
    ).animate(
          CurvedAnimation(
            parent:
                _animController,
            curve:
                _resolveCurve(widget.config.animationCurve),
          ),
        );
  }

  @override
  void didUpdateWidget(
      SButtonSelectable old) {
    super.didUpdateWidget(old);
    // Sync internal state when parent changes isSelected in controlled mode.
    if (widget.onSelectionChanged !=
            null &&
        widget.isSelected !=
            old.isSelected) {
      _internalSelected =
          widget.isSelected;
    }
    if (widget.config.animationDuration !=
        old.config.animationDuration) {
      _animController.duration =
          widget.config.animationDuration;
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  bool get _effectiveSelected =>
      widget.onSelectionChanged !=
          null
      ? widget.isSelected
      : _internalSelected;

  bool get _isDisabled =>
      widget.state ==
          SButtonState.disabled ||
      widget.loading;

  void _handleTap() {
    if (_isDisabled) {
      return;
    }

    // Trigger press animation.
    _animController.forward(from: 0.0);

    if (widget.enableHapticFeedback) {
      HapticFeedback.selectionClick();
    }

    final bool newValue =
        !_effectiveSelected;

    if (widget.onSelectionChanged !=
        null) {
      // Controlled — let the caller update isSelected.
      widget.onSelectionChanged!(newValue);
    } else {
      // Uncontrolled — update internal state.
      setState(() =>
          _internalSelected = newValue);
    }
  }

  // ── Derived styling ───────────────────────────────────────────────────────

  Color? _resolvedSelectedBg(
      SButtonThemeData theme,
      ColorScheme cs) {
    final Color? explicit =
        _resolveColor(widget.config.selectedBackgroundColor);
    if (explicit != null) {
      return explicit;
    }
    // Derive a pleasant tint from the button's foreground color.
    return Color.alphaBlend(
      SButtonStyleHelper.getForegroundColor(
        theme:
            theme,
        variant:
            widget.variant,
        isDisabled:
            false,
        colorScheme:
            cs,
      ).withOpacity(0.12),
      widget.backgroundColor ??
          SButtonStyleHelper.getBackgroundColor(
            theme:
                theme,
            variant:
                widget.variant,
            isDisabled:
                false,
            colorScheme:
                cs,
          ),
    );
  }

  Color? _resolvedSelectedFg(
      SButtonThemeData theme,
      ColorScheme cs) {
    final Color? explicit =
        _resolveColor(widget.config.selectedForegroundColor);
    if (explicit != null) {
      return explicit;
    }
    return SButtonStyleHelper.getForegroundColor(
      theme:
          theme,
      variant:
          widget.variant,
      isDisabled:
          false,
      colorScheme:
          cs,
    );
  }

  Color? _resolvedSelectedBorder(
      SButtonThemeData theme,
      ColorScheme cs) {
    final Color? explicit =
        _resolveColor(widget.config.selectedBorderColor);
    if (explicit != null) {
      return explicit;
    }
    return SButtonStyleHelper.getForegroundColor(
      theme:
          theme,
      variant:
          widget.variant,
      isDisabled:
          false,
      colorScheme:
          cs,
    );
  }

  // ── Check icon helpers ────────────────────────────────────────────────────

  Widget? _buildCheckIcon(
      Color fg) {
    if (!widget.config.showCheckIcon ||
        !_effectiveSelected) {
      return null;
    }
    return AnimatedSwitcher(
      duration:
          widget.config.animationDuration,
      transitionBuilder:
          (Widget child, Animation<double> anim) =>
              ScaleTransition(
        scale:
            anim,
        child:
            FadeTransition(
          opacity:
              anim,
          child:
              child,
        ),
      ),
      child:
          Icon(
        Icons.check_rounded,
        size:
            14,
        color:
            fg,
        key:
            const ValueKey<String>('check_icon'),
      ),
    );
  }

  @override
  Widget build(
      BuildContext context) {
    final SButtonThemeData theme =
        Theme.of(context).sButtonTheme;
    final ColorScheme cs =
        Theme.of(context).colorScheme;
    final bool selected =
        _effectiveSelected;

    final Color effectiveBg =
        selected
        ? (_resolvedSelectedBg(
                theme, cs) ??
            widget.backgroundColor ??
            cs.primary)
        : (widget.backgroundColor ??
            SButtonStyleHelper.getBackgroundColor(
              theme:
                  theme,
              variant:
                  widget.variant,
              isDisabled:
                  _isDisabled,
              colorScheme:
                  cs,
            ));

    final Color effectiveFg =
        selected
        ? (_resolvedSelectedFg(
                theme, cs) ??
            widget.foregroundColor ??
            cs.onPrimary)
        : (widget.foregroundColor ??
            SButtonStyleHelper.getForegroundColor(
              theme:
                  theme,
              variant:
                  widget.variant,
              isDisabled:
                  _isDisabled,
              colorScheme:
                  cs,
            ));

    final Color? selectedBorderColor =
        selected
        ? _resolvedSelectedBorder(theme, cs)
        : null;

    // Compute per-side border for selected state overlay.
    final BorderSide? selectedBorder =
        selected && selectedBorderColor != null
        ? BorderSide(
            color:
                selectedBorderColor,
            width:
                widget.config.selectedBorderWidth,
          )
        : SButtonStyleHelper.getBorderSide(
            theme:
                theme,
            variant:
                widget.variant,
            isDisabled:
                _isDisabled,
            colorScheme:
                cs,
          );

    // Build leading/trailing with optional check icon.
    final Widget? checkWidget =
        _buildCheckIcon(effectiveFg);
    Widget? effectiveLeading =
        widget.leadingIcon;
    Widget? effectiveTrailing =
        widget.trailingIcon;

    if (checkWidget != null) {
      if (widget.config.checkAlignment ==
          SSelectableCheckAlignment.leading) {
        effectiveLeading =
            checkWidget;
      } else {
        effectiveTrailing =
            checkWidget;
      }
    }

    // Build the animated border/bg style on top of default.
    final ButtonStyle selectStyle =
        SButtonStyleHelper.getButtonStyle(
      theme:
          theme,
      variant:
          widget.variant,
      size:
          widget.size,
      isDisabled:
          _isDisabled,
      isSelected:
          selected,
      backgroundColor:
          effectiveBg,
      foregroundColor:
          effectiveFg,
      borderSide:
          selectedBorder,
      padding:
          widget.padding ??
          SButtonStyleHelper.getPaddingForSize(widget.size),
      elevation:
          widget.elevation,
      shadowColor:
          widget.shadowColor,
      borderRadius:
          widget.borderRadius,
    );

    return ScaleTransition(
      scale:
          _scaleAnim,
      child:
          Semantics(
        selected:
            selected,
        button:
            true,
        child:
            SButton(
          key:
              widget.key,
          variant:
              widget.variant,
          size:
              widget.size,
          state:
              _isDisabled
              ? SButtonState.disabled
              : widget.state,
          icon:
              widget.icon,
          backgroundColor:
              effectiveBg,
          foregroundColor:
              effectiveFg,
          loading:
              widget.loading,
          onPressed:
              _isDisabled ? null : _handleTap,
          onLongPress:
              widget.onLongPress,
          height:
              widget.height,
          width:
              widget.width,
          padding:
              widget.padding,
          borderRadius:
              widget.borderRadius,
          elevation:
              widget.elevation,
          shadowColor:
              widget.shadowColor,
          focusNode:
              widget.focusNode,
          autofocus:
              widget.autofocus,
          textStyle:
              widget.textStyle,
          tooltip:
              widget.tooltip,
          buttonStyle:
              widget.buttonStyle ?? selectStyle,
          isFullWidth:
              widget.isFullWidth,
          debounceDuration:
              widget.debounceDuration,
          // Haptic is handled by this widget, not delegated to SButton.
          leadingIcon:
              effectiveLeading,
          trailingIcon:
              effectiveTrailing,
          loadingText:
              widget.loadingText,
          disabledTooltip:
              widget.disabledTooltip,
          isSelected:
              selected,
          badge:
              widget.badge,
          shortcut:
              widget.shortcut,
          child:
              widget.child,
        ),
      ),
    );
  }
}

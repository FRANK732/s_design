import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../../domain/entities/config/s_button_selectable_config.dart';
import '../../../themes/extensions/component_themes/s_button_theme.dart';
import 's_button.dart';
import 's_button_style_helper.dart';

/// Maps [SSelectableCurve] enum values to Flutter [Curve] instances.
Curve _resolveCurve(
    SSelectableCurve
        c) {
  switch (
      c) {
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
Color? _resolveColor(SColorValue? v) => v ==
        null
    ? null
    : Color(
        v.value);

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
    this.isSelected =
        false,
    this.onSelectionChanged,
    this.config =
        const SButtonSelectableConfig(),
    this.variant =
        SButtonVariant.outline,
    this.size =
        SButtonSize.defaultSize,
    this.state,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.loading =
        false,
    this.onLongPress,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.focusNode,
    this.autofocus =
        false,
    this.textStyle,
    this.tooltip,
    this.buttonStyle,
    this.isFullWidth =
        false,
    this.debounceDuration,
    this.enableHapticFeedback =
        false,
    this.leadingIcon,
    this.trailingIcon,
    this.loadingText,
    this.disabledTooltip,
    this.badge,
    this.shortcut,
  })  : assert(height == null || height >= 0.0, 'SButtonSelectable: height must be >= 0.0 if provided.'),
        assert(width == null || width >= 0.0, 'SButtonSelectable: width must be >= 0.0 if provided.');

  // ── Selection ─────────────────────────────────────────────────────────────

  /// Whether the button is currently selected.
  ///
  /// When provided alongside [onSelectionChanged], the button operates in
  /// **controlled** mode — the caller is responsible for updating this value.
  /// When omitted the button manages selection state internally.
  final bool
      isSelected;

  /// Called when the user taps the button and the selection state changes.
  ///
  /// The bool argument is the **new** selected state after the tap.
  final ValueChanged<bool>?
      onSelectionChanged;

  /// Rich customization config for the selected state.
  final SButtonSelectableConfig
      config;

  // ── Shared SButton props ──────────────────────────────────────────────────
  
  /// The visual variant of the button (e.g., primary, secondary, outline, text).
  final SButtonVariant
      variant;

  /// The sizing scale of the button (e.g., small, medium, large, icon).
  final SButtonSize
      size;

  /// Explicitly forces the button into a specific state logically (e.g., [SButtonState.disabled]).
  final SButtonState?
      state;

  /// An icon to display centered within the button.
  final Widget?
      icon;

  /// The overarching background fill color. Hard overrides the color mapped by [variant] and [size].
  final Color?
      backgroundColor;

  /// The overarching foreground color for text and icons. Hard overrides the color mapped by [variant].
  final Color?
      foregroundColor;

  /// If `true`, the button replaces its content with a loading spinner and becomes unclickable.
  final bool
      loading;

  /// Callback triggered when a long-press gesture resolves.
  final VoidCallback?
      onLongPress;

  /// The primary content of the button, usually a [Text] widget or a complex custom layout.
  final Widget?
      child;

  /// Explicit pixel height of the button. Overrides the innate [size] metric.
  final double?
      height;

  /// Explicit pixel width of the button. Overrides the innate [size] metric.
  final double?
      width;

  /// The explicit padding mapped tightly around the button's internal child content.
  final EdgeInsetsGeometry?
      padding;

  /// The curvature radius of the button's outer shell.
  final BorderRadiusGeometry?
      borderRadius;

  /// The z-axis elevation driving the depth of the casting shadow.
  final double?
      elevation;

  /// The tint color of the cast shadow.
  final Color?
      shadowColor;

  /// Focus node mapped to the button to manually drive native focus mechanisms.
  final FocusNode?
      focusNode;

  /// If `true`, automatically requests focus when the button is injected into the widget tree.
  final bool
      autofocus;

  /// Manual text styling overriding the defaults provided by the [size] config.
  final TextStyle?
      textStyle;

  /// Standard semantic tooltip string deployed when hovering over the button.
  final String?
      tooltip;

  /// A manual [ButtonStyle] injection for overriding fine-grained material behavior natively.
  final ButtonStyle?
      buttonStyle;

  /// Whether the button should stretch to fill the available width.
  final bool
      isFullWidth;

  /// Duration to debounce the button press, preventing rapid accidental double-clicks.
  final Duration?
      debounceDuration;

  /// Whether to trigger haptic feedback on press.
  final bool
      enableHapticFeedback;

  /// Icon to display before the label.
  final Widget?
      leadingIcon;

  /// Icon to display after the label.
  final Widget?
      trailingIcon;

  /// Text to show alongside the spinner when loading.
  final String?
      loadingText;

  /// Tooltip to show when the button is disabled.
  final String?
      disabledTooltip;

  /// Badge to display on the button (usually a count or status).
  final Widget?
      badge;

  /// Keyboard shortcut to trigger the button.
  final SingleActivator?
      shortcut;

  @override
  State<SButtonSelectable>
      createState() =>
          _SButtonSelectableState();
}

class _SButtonSelectableState
    extends State<
        SButtonSelectable>
    with
        SingleTickerProviderStateMixin {
  /// Internal selection state — only used in uncontrolled mode.
  late bool
      _internalSelected;

  late AnimationController
      _animController;
  late Animation<double>
      _scaleAnim;

  @override
  void
      initState() {
    super
        .initState();
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
          tween: Tween<double>(begin: 1.0, end: 0.93),
          weight: 40,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.93, end: 1.0),
          weight: 60,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _animController,
        curve: _resolveCurve(widget.config.animationCurve),
      ),
    );
  }

  @override
  void didUpdateWidget(
      SButtonSelectable
          old) {
    super.didUpdateWidget(
        old);
    if (widget.onSelectionChanged != null &&
        widget.isSelected != old.isSelected) {
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
  void
      dispose() {
    _animController
        .dispose();
    super
        .dispose();
  }

  bool get _effectiveSelected => widget.onSelectionChanged !=
          null
      ? widget.isSelected
      : _internalSelected;

  bool get _isDisabled =>
      widget.state ==
          SButtonState.disabled ||
      widget.loading;

  void
      _handleTap() {
    if (_isDisabled) {
      return;
    }

    _animController.forward(
        from: 0.0);

    if (widget
        .enableHapticFeedback) {
      HapticFeedback.selectionClick();
    }

    final bool
        newValue =
        !_effectiveSelected;

    if (widget.onSelectionChanged !=
        null) {
      widget.onSelectionChanged!(newValue);
    } else {
      setState(() =>
          _internalSelected = newValue);
    }
  }


  Color? _resolvedSelectedBg(
      SButtonThemeData
          theme,
      ColorScheme
          cs) {
    final Color?
        explicit =
        _resolveColor(widget.config.selectedBackgroundColor);
    if (explicit !=
        null) {
      return explicit;
    }
    return Color
        .alphaBlend(
      SButtonStyleHelper.getForegroundColor(
        theme: theme,
        variant: widget.variant,
        isDisabled: false,
        colorScheme: cs,
      ).withOpacity(0.12),
      widget.backgroundColor ??
          SButtonStyleHelper.getBackgroundColor(
            theme: theme,
            variant: widget.variant,
            isDisabled: false,
            colorScheme: cs,
          ),
    );
  }

  Color? _resolvedSelectedFg(
      SButtonThemeData
          theme,
      ColorScheme
          cs) {
    final Color?
        explicit =
        _resolveColor(widget.config.selectedForegroundColor);
    if (explicit !=
        null) {
      return explicit;
    }
    return SButtonStyleHelper
        .getForegroundColor(
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
      SButtonThemeData
          theme,
      ColorScheme
          cs) {
    final Color?
        explicit =
        _resolveColor(widget.config.selectedBorderColor);
    if (explicit !=
        null) {
      return explicit;
    }
    return SButtonStyleHelper
        .getForegroundColor(
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


  Widget? _buildCheckIcon(
      Color
          fg) {
    if (!widget.config.showCheckIcon ||
        !_effectiveSelected) {
      return null;
    }
    return AnimatedSwitcher(
      duration:
          widget.config.animationDuration,
      transitionBuilder: (Widget child, Animation<double> anim) =>
          ScaleTransition(
        scale: anim,
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      ),
      child:
          Icon(
        Icons.check_rounded,
        size: 14,
        color: fg,
        key: const ValueKey<String>('check_icon'),
      ),
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SButtonThemeData
        theme =
        Theme.of(context).sButtonTheme;
    final ColorScheme
        cs =
        Theme.of(context).colorScheme;
    final bool
        selected =
        _effectiveSelected;

    final Color effectiveBg = selected
        ? (_resolvedSelectedBg(theme, cs) ?? widget.backgroundColor ?? cs.primary)
        : (widget.backgroundColor ??
            SButtonStyleHelper.getBackgroundColor(
              theme: theme,
              variant: widget.variant,
              isDisabled: _isDisabled,
              colorScheme: cs,
            ));

    final Color effectiveFg = selected
        ? (_resolvedSelectedFg(theme, cs) ?? widget.foregroundColor ?? cs.onPrimary)
        : (widget.foregroundColor ??
            SButtonStyleHelper.getForegroundColor(
              theme: theme,
              variant: widget.variant,
              isDisabled: _isDisabled,
              colorScheme: cs,
            ));

    final Color? selectedBorderColor = selected
        ? _resolvedSelectedBorder(theme, cs)
        : null;

    final BorderSide? selectedBorder = selected && selectedBorderColor != null
        ? BorderSide(
            color: selectedBorderColor,
            width: widget.config.selectedBorderWidth,
          )
        : SButtonStyleHelper.getBorderSide(
            theme: theme,
            variant: widget.variant,
            isDisabled: _isDisabled,
            colorScheme: cs,
          );

    final Widget?
        checkWidget =
        _buildCheckIcon(effectiveFg);
    Widget?
        effectiveLeading =
        widget.leadingIcon;
    Widget?
        effectiveTrailing =
        widget.trailingIcon;

    if (checkWidget !=
        null) {
      if (widget.config.checkAlignment ==
          SSelectableCheckAlignment.leading) {
        effectiveLeading = checkWidget;
      } else {
        effectiveTrailing = checkWidget;
      }
    }

    final ButtonStyle
        selectStyle =
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
          widget.padding ?? SButtonStyleHelper.getPaddingForSize(widget.size),
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
        selected: selected,
        button: true,
        child: SButton(
          key: widget.key,
          variant: widget.variant,
          size: widget.size,
          state: _isDisabled ? SButtonState.disabled : widget.state,
          icon: widget.icon,
          backgroundColor: effectiveBg,
          foregroundColor: effectiveFg,
          loading: widget.loading,
          onPressed: _isDisabled ? null : _handleTap,
          onLongPress: widget.onLongPress,
          height: widget.height,
          width: widget.width,
          padding: widget.padding,
          borderRadius: widget.borderRadius,
          elevation: widget.elevation,
          shadowColor: widget.shadowColor,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          textStyle: widget.textStyle,
          tooltip: widget.tooltip,
          buttonStyle: widget.buttonStyle ?? selectStyle,
          isFullWidth: widget.isFullWidth,
          debounceDuration: widget.debounceDuration,
          leadingIcon: effectiveLeading,
          trailingIcon: effectiveTrailing,
          loadingText: widget.loadingText,
          disabledTooltip: widget.disabledTooltip,
          isSelected: selected,
          badge: widget.badge,
          shortcut: widget.shortcut,
          child: widget.child,
        ),
      ),
    );
  }
}

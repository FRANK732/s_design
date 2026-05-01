import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../../domain/entities/config/s_button_selectable_config.dart';
import '../../../themes/extensions/component_themes/s_button_theme.dart';
import 's_button_content.dart';
import 's_button_select_group.dart';
import 's_button_selectable.dart';
import 's_button_style_helper.dart';

/// Presentation layer button widget following clean architecture.
///
/// This widget is purely concerned with UI rendering and delegates
/// business logic to the domain layer. It uses domain entities for
/// configuration and has no knowledge of data sources.
class SButton
    extends StatefulWidget {
  /// Creates a button widget.
  const SButton({
    super.key,

    /// The visual variant of the button (e.g., primary, secondary, outline, text).
    this.variant =
        SButtonVariant.defaultVariant,

    /// The sizing scale of the button (e.g., small, medium, large, icon).
    this.size =
        SButtonSize.defaultSize,

    /// Explicitly forces the button into a specific state logically (e.g., [SButtonState.disabled]).
    this.state,

    /// An icon to display centered within the button. Primarily used by the [SButton.icon] constructor.
    this.icon,

    /// The overarching background fill color. Hard overrides the color mapped by [variant] and [size].
    this.backgroundColor,

    /// The overarching foreground color for text and icons. Hard overrides the color mapped by [variant].
    this.foregroundColor,

    /// If `true`, the button replaces its content with a loading spinner and becomes completely unclickable.
    this.loading =
        false,

    /// Callback triggered when the standard tap gesture resolves. If `null`, the button becomes implicitly disabled.
    required this.onPressed,

    /// Callback triggered when a long-press gesture resolves.
    this.onLongPress,

    /// The primary content of the button, usually a [Text] widget or a complex custom layout.
    this.child,

    /// Explicit pixel height of the button. Overrides the innate [size] metric.
    this.height,

    /// Explicit pixel width of the button. Overrides the innate [size] metric.
    this.width,

    /// The explicit padding mapped tightly around the button's internal child content.
    this.padding,

    /// The curvature radius of the button's outer shell.
    this.borderRadius,

    /// The z-axis elevation driving the depth of the casting shadow.
    this.elevation,

    /// The tint color of the cast shadow.
    this.shadowColor,

    /// Focus node mapped to the button to manually drive native focus mechanisms.
    this.focusNode,

    /// If `true`, automatically requests focus when the button is injected into the widget tree.
    this.autofocus =
        false,

    /// Manual text styling overriding the defaults provided by the [size] config.
    this.textStyle,

    /// The duration of the visual state transition animations (e.g., hovering or pressing).
    this.animationDuration,

    /// Standard semantic tooltip string deployed when hovering over the button.
    this.tooltip,

    /// A manual [ButtonStyle] injection for overriding fine-grained material behavior natively.
    this.buttonStyle,

    /// Whether the button should stretch to fill the available width.
    this.isFullWidth =
        false,

    /// Duration to debounce the button press.
    this.debounceDuration,

    /// Whether to trigger haptic feedback on press.
    this.enableHapticFeedback =
        false,

    /// Icon to display before the label.
    this.leadingIcon,

    /// Icon to display after the label.
    this.trailingIcon,

    /// Text to show alongside the spinner when loading.
    this.loadingText,

    /// Tooltip to show when the button is disabled.
    this.disabledTooltip,

    /// Whether the button is in a selected/toggled state.
    this.isSelected =
        false,

    /// Badge to display on the button (usually a count or status).
    this.badge,

    /// Keyboard shortcut to trigger the button.
    this.shortcut,
  });

  /// Creates an icon button variant.
  factory SButton.icon({
    Key?
        key,
    required Widget
        icon,
    Widget?
        label,
    SButtonVariant variant =
        SButtonVariant.defaultVariant,
    SButtonState?
        state,
    Color?
        backgroundColor,
    Color?
        foregroundColor,
    bool loading =
        false,
    required VoidCallback?
        onPressed,
    VoidCallback?
        onLongPress,
    double?
        height,
    double?
        width,
    EdgeInsetsGeometry?
        padding,
    BorderRadiusGeometry?
        borderRadius,
    double?
        elevation,
    Color?
        shadowColor,
    FocusNode?
        focusNode,
    bool autofocus =
        false,
    TextStyle?
        textStyle,
    Duration?
        animationDuration,
    String?
        tooltip,
    ButtonStyle?
        buttonStyle,
    bool isFullWidth =
        false,
    Duration?
        debounceDuration,
    bool enableHapticFeedback =
        false,
    Widget?
        leadingIcon,
    Widget?
        trailingIcon,
    String?
        loadingText,
    String?
        disabledTooltip,
    bool isSelected =
        false,
    Widget?
        badge,
    SingleActivator?
        shortcut,
  }) {
    return SButton(
      key:
          key,
      variant:
          variant,
      size:
          SButtonSize.icon,
      state:
          state,
      icon:
          icon,
      backgroundColor:
          backgroundColor,
      foregroundColor:
          foregroundColor,
      loading:
          loading,
      onPressed:
          onPressed,
      onLongPress:
          onLongPress,
      height:
          height,
      width:
          width,
      padding:
          padding,
      borderRadius:
          borderRadius,
      elevation:
          elevation,
      shadowColor:
          shadowColor,
      focusNode:
          focusNode,
      autofocus:
          autofocus,
      textStyle:
          textStyle,
      animationDuration:
          animationDuration,
      tooltip:
          tooltip,
      buttonStyle:
          buttonStyle,
      isFullWidth:
          isFullWidth,
      debounceDuration:
          debounceDuration,
      enableHapticFeedback:
          enableHapticFeedback,
      leadingIcon:
          leadingIcon,
      trailingIcon:
          trailingIcon,
      loadingText:
          loadingText,
      disabledTooltip:
          disabledTooltip,
      isSelected:
          isSelected,
      badge:
          badge,
      shortcut:
          shortcut,
      child:
          label,
    );
  }

  /// Creates a selectable / toggle button via [SButtonSelectable].
  ///
  /// Works in **uncontrolled** mode (manages its own state) when only
  /// [onSelectionChanged] is provided, or in **controlled** mode when the
  /// caller also supplies [isSelected] and updates it externally.
  ///
  /// ```dart
  /// // Uncontrolled
  /// SButton.selectable(
  ///   child: const Text('Notifications'),
  ///   config: SButtonSelectableConfig(showCheckIcon: true),
  ///   onSelectionChanged: (v) => debugPrint('$v'),
  /// )
  ///
  /// // Controlled
  /// SButton.selectable(
  ///   isSelected: _bold,
  ///   onSelectionChanged: (v) => setState(() => _bold = v),
  ///   child: const Text('Bold'),
  /// )
  /// ```
  static SButtonSelectable
      selectable({
    Key?
        key,
    bool isSelected =
        false,
    ValueChanged<bool>?
        onSelectionChanged,
    SButtonSelectableConfig config =
        const SButtonSelectableConfig(),
    SButtonVariant variant =
        SButtonVariant.outline,
    SButtonSize size =
        SButtonSize.defaultSize,
    SButtonState?
        state,
    Widget?
        icon,
    Color?
        backgroundColor,
    Color?
        foregroundColor,
    bool loading =
        false,
    VoidCallback?
        onLongPress,
    Widget?
        child,
    double?
        height,
    double?
        width,
    EdgeInsetsGeometry?
        padding,
    BorderRadiusGeometry?
        borderRadius,
    double?
        elevation,
    Color?
        shadowColor,
    FocusNode?
        focusNode,
    bool autofocus =
        false,
    TextStyle?
        textStyle,
    String?
        tooltip,
    ButtonStyle?
        buttonStyle,
    bool isFullWidth =
        false,
    Duration?
        debounceDuration,
    bool enableHapticFeedback =
        false,
    Widget?
        leadingIcon,
    Widget?
        trailingIcon,
    String?
        loadingText,
    String?
        disabledTooltip,
    Widget?
        badge,
    SingleActivator?
        shortcut,
  }) {
    return SButtonSelectable(
      key:
          key,
      isSelected:
          isSelected,
      onSelectionChanged:
          onSelectionChanged,
      config:
          config,
      variant:
          variant,
      size:
          size,
      state:
          state,
      icon:
          icon,
      backgroundColor:
          backgroundColor,
      foregroundColor:
          foregroundColor,
      loading:
          loading,
      onLongPress:
          onLongPress,
      height:
          height,
      width:
          width,
      padding:
          padding,
      borderRadius:
          borderRadius,
      elevation:
          elevation,
      shadowColor:
          shadowColor,
      focusNode:
          focusNode,
      autofocus:
          autofocus,
      textStyle:
          textStyle,
      tooltip:
          tooltip,
      buttonStyle:
          buttonStyle,
      isFullWidth:
          isFullWidth,
      debounceDuration:
          debounceDuration,
      enableHapticFeedback:
          enableHapticFeedback,
      leadingIcon:
          leadingIcon,
      trailingIcon:
          trailingIcon,
      loadingText:
          loadingText,
      disabledTooltip:
          disabledTooltip,
      badge:
          badge,
      shortcut:
          shortcut,
      child:
          child,
    );
  }

  /// Creates a coordinated selectable button group.
  /// This is a convenience forwarder to [SButtonSelectGroup].
  static SButtonSelectGroup selectGroup({
    Key? key,
    SButtonSelectMode mode = SButtonSelectMode.single,
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
  }) {
    return SButtonSelectGroup(
      key: key,
      mode: mode,
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
  }

  /// Creates a single-selection (radio) group.
  /// This is a convenience forwarder to [SButtonSelectGroup.single].
  static SButtonSelectGroup selectGroupSingle({
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
  }) {
    return SButtonSelectGroup.single(
      key: key,
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
  }

  /// Creates a multi-selection group.
  /// This is a convenience forwarder to [SButtonSelectGroup.multi].
  static SButtonSelectGroup selectGroupMulti({
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
  }) {
    return SButtonSelectGroup.multi(
      key: key,
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
  }

  /// Creates a data item for an [SButtonSelectGroup].
  /// This is a convenience forwarder to [SButtonSelectGroupItem].
  static SButtonSelectGroupItem selectGroupItem({
    required Widget label,
    Widget? leadingIcon,
    Widget? trailingIcon,
    SButtonSelectableConfig? config,
    String? tooltip,
    String? disabledTooltip,
    bool disabled = false,
    Key? key,
  }) {
    return SButtonSelectGroupItem(
      label: label,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      config: config,
      tooltip: tooltip,
      disabledTooltip: disabledTooltip,
      disabled: disabled,
      key: key,
    );
  }

  /// The visual variant of the button (e.g., primary, secondary, outline, text).
  /// Modifies the overall look and feel by mapping to `sButtonTheme` definitions.
  final SButtonVariant
      variant;

  /// The sizing scale of the button (e.g., small, medium, large, icon).
  final SButtonSize
      size;

  /// Explicitly forces the button into a specific state logically (e.g., [SButtonState.disabled]).
  final SButtonState?
      state;

  /// Whether the button should stretch to fill the available width.
  final bool
      isFullWidth;

  /// Duration to debounce the button press.
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

  /// Whether the button is in a selected/toggled state.
  final bool
      isSelected;

  /// Badge to display on the button (usually a count or status).
  final Widget?
      badge;

  /// Keyboard shortcut to trigger the button.
  final SingleActivator?
      shortcut;

  // UI-specific properties (presentation layer)

  /// An icon to display centered within the button. Primarily used by the [SButton.icon] constructor.
  final Widget?
      icon;

  /// The primary content of the button, usually a [Text] widget or a complex custom layout.
  final Widget?
      child;

  /// If `true`, the button replaces its content with a loading spinner and becomes completely unclickable.
  final bool
      loading;

  /// Callback triggered when the standard tap gesture resolves. If `null`, the button becomes implicitly disabled.
  final VoidCallback?
      onPressed;

  /// Callback triggered when a long-press gesture resolves.
  final VoidCallback?
      onLongPress;

  /// Explicit pixel height of the button. Overrides the innate [size] metric.
  final double?
      height;

  /// Explicit pixel width of the button. Overrides the innate [size] metric.
  final double?
      width;

  /// The explicit padding mapped tightly around the button's internal child content.
  final EdgeInsetsGeometry?
      padding;

  /// The overarching background fill color. Hard overrides the color mapped by [variant] and [size].
  final Color?
      backgroundColor;

  /// The overarching foreground color for text and icons. Hard overrides the color mapped by [variant].
  final Color?
      foregroundColor;

  /// A manual [ButtonStyle] injection for overriding fine-grained material behavior natively.
  final ButtonStyle?
      buttonStyle;

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

  /// The duration of the visual state transition animations (e.g., hovering or pressing).
  final Duration?
      animationDuration;

  /// Standard semantic tooltip string deployed when hovering over the button.
  final String?
      tooltip;

  @override
  State<SButton>
      createState() =>
          _SButtonState();
}

class _SButtonState
    extends State<
        SButton> {
  Timer?
      _debounceTimer;
  bool
      _isDebouncing =
      false;

  @override
  void
      dispose() {
    _debounceTimer
        ?.cancel();
    super
        .dispose();
  }

  void
      _handlePressed() {
    if (widget.onPressed ==
        null) {
      return;
    }

    if (widget.debounceDuration !=
        null) {
      if (_isDebouncing) {
        return;
      }

      setState(() =>
          _isDebouncing = true);
      _executeWithHaptics();

      _debounceTimer =
          Timer(widget.debounceDuration!, () {
        if (mounted) {
          setState(() => _isDebouncing = false);
        }
      });
    } else {
      _executeWithHaptics();
    }
  }

  void
      _executeWithHaptics() {
    if (widget
        .enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
    widget
        .onPressed
        ?.call();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final bool
        isDisabled =
        _isDisabled();

    final SButtonThemeData
        theme =
        Theme.of(context).sButtonTheme;
    final ColorScheme
        colorScheme =
        Theme.of(context).colorScheme;

    final Color
        defaultBackgroundColor =
        SButtonStyleHelper.getBackgroundColor(
      theme:
          theme,
      variant:
          widget.variant,
      isDisabled:
          isDisabled,
      colorScheme:
          colorScheme,
    );
    final Color
        defaultForegroundColor =
        SButtonStyleHelper.getForegroundColor(
      theme:
          theme,
      variant:
          widget.variant,
      isDisabled:
          isDisabled,
      colorScheme:
          colorScheme,
    );
    final BorderSide?
        defaultBorderSide =
        SButtonStyleHelper.getBorderSide(
      theme:
          theme,
      variant:
          widget.variant,
      isDisabled:
          isDisabled,
      colorScheme:
          colorScheme,
    );

    final EdgeInsetsGeometry
        computedPadding =
        widget.padding ?? SButtonStyleHelper.getPaddingForSize(widget.size);

    final Widget
        content =
        SButtonContent(
      theme:
          theme,
      variant:
          widget.variant,
      size:
          widget.size,
      loading:
          widget.loading,
      loadingText:
          widget.loadingText,
      leadingIcon:
          widget.leadingIcon,
      trailingIcon:
          widget.trailingIcon,
      icon:
          widget.icon,
      badge:
          widget.badge,
      textStyle:
          widget.textStyle,
      animationDuration:
          widget.animationDuration,
      child:
          widget.child,
    );

    final ButtonStyle
        defaultStyle =
        SButtonStyleHelper.getButtonStyle(
      theme:
          theme,
      variant:
          widget.variant,
      size:
          widget.size,
      isDisabled:
          isDisabled,
      isSelected:
          widget.isSelected,
      backgroundColor:
          widget.backgroundColor ?? defaultBackgroundColor,
      foregroundColor:
          widget.foregroundColor ?? defaultForegroundColor,
      borderSide:
          defaultBorderSide,
      padding:
          computedPadding,
      elevation:
          widget.elevation,
      shadowColor:
          widget.shadowColor,
      borderRadius:
          widget.borderRadius,
    );

    final VoidCallback? effectiveOnPressed = isDisabled
        ? null
        : _handlePressed;
    final VoidCallback? effectiveOnLongPress = isDisabled
        ? null
        : widget.onLongPress;

    Widget
        buttonWidget =
        SButtonStyleHelper.createButtonWidget(
      variant:
          widget.variant,
      content:
          content,
      style:
          widget.buttonStyle ?? defaultStyle,
      onPressed:
          effectiveOnPressed,
      onLongPress:
          effectiveOnLongPress,
      focusNode:
          widget.focusNode,
      autofocus:
          widget.autofocus,
    );

    double?
        effectiveWidth =
        widget.width;
    if (widget
        .isFullWidth) {
      effectiveWidth =
          double.infinity;
    }

    if (widget.height != null ||
        effectiveWidth != null) {
      buttonWidget =
          SizedBox(
        height: widget.height,
        width: effectiveWidth,
        child: buttonWidget,
      );
    }

    final String? effectiveTooltip = isDisabled
        ? (widget.disabledTooltip ?? widget.tooltip)
        : widget.tooltip;

    if (effectiveTooltip !=
        null) {
      buttonWidget =
          Tooltip(
        message: effectiveTooltip,
        child: buttonWidget,
      );
    }

    if (widget.shortcut != null &&
        !isDisabled &&
        widget.onPressed != null) {
      buttonWidget =
          CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          widget.shortcut!: _handlePressed,
        },
        child: buttonWidget,
      );
    }

    return buttonWidget;
  }

  /// Determines if button is disabled
  bool
      _isDisabled() {
    return (widget.state == SButtonState.disabled) ||
        widget.loading ||
        widget.onPressed == null;
  }
}

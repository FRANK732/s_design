import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../themes/extensions/component_themes/s_button_theme.dart';
import 's_button_content.dart';
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
    this.variant =
        SButtonVariant.defaultVariant,
    this.size =
        SButtonSize.defaultSize,
    this.state,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.loading =
        false,
    required this.onPressed,
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
    this.animationDuration,
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
    this.isSelected =
        false,
    this.badge,
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

  // Configuration from domain layer
  final SButtonVariant
      variant;
  final SButtonSize
      size;
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
  final Widget?
      icon;
  final Widget?
      child;
  final bool
      loading;
  final VoidCallback?
      onPressed;
  final VoidCallback?
      onLongPress;
  final double?
      height;
  final double?
      width;
  final EdgeInsetsGeometry?
      padding;
  final Color?
      backgroundColor;
  final Color?
      foregroundColor;
  final ButtonStyle?
      buttonStyle;
  final BorderRadiusGeometry?
      borderRadius;
  final double?
      elevation;
  final Color?
      shadowColor;
  final FocusNode?
      focusNode;
  final bool
      autofocus;
  final TextStyle?
      textStyle;
  final Duration?
      animationDuration;
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
        null)
      return;

    if (widget.debounceDuration !=
        null) {
      if (_isDebouncing)
        return;

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
    // Determine if button is disabled
    final bool
        isDisabled =
        _isDisabled();

    // Retrieve theme data
    final SButtonThemeData
        theme =
        Theme.of(context).sButtonTheme;

    // Get colors based on variant and state
    final Color
        defaultBackgroundColor =
        SButtonStyleHelper.getBackgroundColor(
      theme:
          theme,
      variant:
          widget.variant,
      isDisabled:
          isDisabled,
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
    );

    // Get padding
    final EdgeInsetsGeometry
        computedPadding =
        widget.padding ?? SButtonStyleHelper.getPaddingForSize(widget.size);

    // Build content
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
      child:
          widget.child,
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
    );

    // Create button style
    final ButtonStyle
        defaultStyle =
        SButtonStyleHelper.getButtonStyle(
      theme:
          theme,
      variant:
          widget.variant,
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

    // Select button type based on variant
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

    // Apply sizing
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

    // Apply tooltip
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

    // Apply shortcut
    if (widget.shortcut != null &&
        !isDisabled &&
        widget.onPressed != null) {
      buttonWidget =
          CallbackShortcuts(
        bindings: {
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

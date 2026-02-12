import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/constants/design_constants.dart';
import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../themes/extensions/component_themes/s_button_theme.dart';

/// Presentation layer button widget following clean architecture.
///
/// This widget is purely concerned with UI rendering and delegates
/// business logic to the domain layer. It uses domain entities for
/// configuration and has no knowledge of data sources.
class SButton
    extends StatelessWidget {
  /// Creates an icon button variant.
  factory SButton.icon({
    Key?
        key,
    required Widget
        icon,
    Widget?
        label,
    ButtonVariant variant =
        ButtonVariant.defaultVariant,
    ButtonState?
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
  }) {
    return SButton(
      key:
          key,
      variant:
          variant,
      size:
          ButtonSize.icon,
      state:
          state,
      icon:
          icon,
      child:
          label,
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
    );
  }

  /// Creates a button widget.
  const SButton({
    super.key,
    this.variant =
        ButtonVariant.defaultVariant,
    this.size =
        ButtonSize.defaultSize,
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
  });

  // Configuration from domain layer
  final ButtonVariant
      variant;
  final ButtonSize
      size;
  final ButtonState?
      state;

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
    final Color defaultBackgroundColor = _getBackgroundColor(
        theme,
        isDisabled,
        context);
    final Color defaultForegroundColor = _getForegroundColor(
        theme,
        isDisabled,
        context);
    final BorderSide? defaultBorderSide = _getBorderSide(
        theme,
        isDisabled,
        context);

    // Get padding
    final EdgeInsetsGeometry
        computedPadding =
        padding ?? _getPaddingForSize(size);

    // Build content
    final Widget content = loading
        ? _buildLoader(theme)
        : _buildContent(theme);

    // Create button style
    final ButtonStyle
        defaultStyle =
        _getButtonStyle(
      theme,
      backgroundColor ??
          defaultBackgroundColor,
      foregroundColor ??
          defaultForegroundColor,
      defaultBorderSide,
      computedPadding,
      context,
    );

    // Select button type based on variant
    Widget
        buttonWidget =
        _buildButtonByVariant(
      variant,
      isDisabled,
      defaultStyle,
      content,
    );

    // Apply sizing
    if (height != null ||
        width != null) {
      buttonWidget =
          SizedBox(
        height: height,
        width: width,
        child: buttonWidget,
      );
    }

    // Apply tooltip
    if (tooltip !=
        null) {
      buttonWidget =
          Tooltip(
        message: tooltip,
        child: buttonWidget,
      );
    }

    return buttonWidget;
  }

  /// Builds the appropriate button widget based on variant
  Widget
      _buildButtonByVariant(
    ButtonVariant
        variant,
    bool
        isDisabled,
    ButtonStyle
        style,
    Widget
        content,
  ) {
    switch (
        variant) {
      case ButtonVariant.defaultVariant:
      case ButtonVariant.destructive:
      case ButtonVariant.secondary:
        return ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          onLongPress: isDisabled ? null : onLongPress,
          style: buttonStyle ?? style,
          focusNode: focusNode,
          autofocus: autofocus,
          child: content,
        );
      case ButtonVariant.outline:
      case ButtonVariant.destructiveOutline:
        return OutlinedButton(
          onPressed: isDisabled ? null : onPressed,
          onLongPress: isDisabled ? null : onLongPress,
          style: buttonStyle ?? style,
          focusNode: focusNode,
          autofocus: autofocus,
          child: content,
        );
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return TextButton(
          onPressed: isDisabled ? null : onPressed,
          onLongPress: isDisabled ? null : onLongPress,
          style: buttonStyle ?? style,
          focusNode: focusNode,
          autofocus: autofocus,
          child: content,
        );
    }
  }

  /// Determines if button is disabled
  bool
      _isDisabled() {
    return (state == ButtonState.disabled) ||
        loading ||
        onPressed == null;
  }

  /// Gets background color based on variant
  Color
      _getBackgroundColor(
    SButtonThemeData
        theme,
    bool
        isDisabled,
    BuildContext
        context,
  ) {
    if (_isOutlineVariant()) {
      return Colors.transparent;
    }

    switch (
        variant) {
      case ButtonVariant.defaultVariant:
        return isDisabled ? Colors.grey.shade400 : theme.defaultBackgroundColor;
      case ButtonVariant.destructive:
        return isDisabled ? Colors.grey.shade400 : Colors.red;
      case ButtonVariant.secondary:
        return isDisabled ? Colors.grey.shade400 : Colors.grey.shade400;
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return Colors.transparent;
      case ButtonVariant.outline:
      case ButtonVariant.destructiveOutline:
        return Colors.transparent;
    }
  }

  /// Gets foreground color based on variant
  Color
      _getForegroundColor(
    SButtonThemeData
        theme,
    bool
        isDisabled,
    BuildContext
        context,
  ) {
    if (_isOutlineVariant()) {
      switch (variant) {
        case ButtonVariant.outline:
          return isDisabled ? Colors.grey : theme.outlineForegroundColor;
        case ButtonVariant.destructiveOutline:
          return isDisabled ? Colors.grey : Colors.red;
        default:
          return theme.outlineForegroundColor;
      }
    }

    switch (
        variant) {
      case ButtonVariant.defaultVariant:
      case ButtonVariant.destructive:
      case ButtonVariant.secondary:
        return theme.defaultForegroundColor;
      case ButtonVariant.ghost:
        return isDisabled ? Colors.grey : theme.ghostForegroundColor;
      case ButtonVariant.link:
        return isDisabled ? Colors.grey : theme.linkForegroundColor;
      case ButtonVariant.outline:
      case ButtonVariant.destructiveOutline:
        return isDisabled ? Colors.grey : theme.outlineForegroundColor;
    }
  }

  /// Gets border side for outline variants
  BorderSide?
      _getBorderSide(
    SButtonThemeData
        theme,
    bool
        isDisabled,
    BuildContext
        context,
  ) {
    if (_isOutlineVariant()) {
      switch (variant) {
        case ButtonVariant.outline:
          return BorderSide(
            color: isDisabled ? Colors.grey : theme.outlineBorderColor,
          );
        case ButtonVariant.destructiveOutline:
          return BorderSide(
            color: isDisabled ? Colors.grey : Colors.red,
          );
        default:
          return null;
      }
    }
    return null;
  }

  /// Checks if variant is outline
  bool
      _isOutlineVariant() {
    return variant == ButtonVariant.outline ||
        variant == ButtonVariant.destructiveOutline;
  }

  /// Gets padding for the given size (using domain constants)
  EdgeInsetsGeometry
      _getPaddingForSize(ButtonSize size) {
    switch (
        size) {
      case ButtonSize.defaultSize:
        return const EdgeInsets.symmetric(
          horizontal: DesignConstants.buttonPaddingHorizontalDefault,
          vertical: DesignConstants.buttonPaddingVerticalDefault,
        );
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(
          horizontal: DesignConstants.buttonPaddingHorizontalSm,
          vertical: DesignConstants.buttonPaddingVerticalSm,
        );
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(
          horizontal: DesignConstants.buttonPaddingHorizontalLg,
          vertical: DesignConstants.buttonPaddingVerticalLg,
        );
      case ButtonSize.icon:
        return const EdgeInsets.all(DesignConstants.buttonPaddingIcon);
    }
  }

  /// Builds loading indicator
  Widget _buildLoader(
      SButtonThemeData
          theme) {
    return Center(
      child:
          SpinKitThreeBounce(
        color: _getLoaderColor(theme),
        size: _getLoaderSize(),
        duration: animationDuration ?? const Duration(milliseconds: DesignConstants.animationDurationMs),
      ),
    );
  }

  /// Gets loader size based on button size
  double
      _getLoaderSize() {
    switch (
        size) {
      case ButtonSize.sm:
        return DesignConstants.loaderSizeSm;
      case ButtonSize.defaultSize:
        return DesignConstants.loaderSizeDefault;
      case ButtonSize.lg:
        return DesignConstants.loaderSizeLg;
      case ButtonSize.icon:
        return DesignConstants.loaderSizeDefault;
    }
  }

  /// Gets loader color
  Color _getLoaderColor(
      SButtonThemeData
          theme) {
    switch (
        variant) {
      case ButtonVariant.destructive:
      case ButtonVariant.destructiveOutline:
        return Colors.white;
      case ButtonVariant.secondary:
        return Colors.black;
      case ButtonVariant.link:
        return theme.linkForegroundColor;
      default:
        return theme.defaultForegroundColor;
    }
  }

  /// Builds button content
  Widget _buildContent(
      SButtonThemeData
          theme) {
    final List<Widget>
        contentWidgets =
        [];

    if (icon !=
        null) {
      contentWidgets.add(icon!);
      if (child !=
          null) {
        contentWidgets.add(const SizedBox(width: 8));
      }
    }

    if (child !=
        null) {
      if (textStyle != null &&
          child is Text) {
        contentWidgets.add(
          Text(
            (child as Text).data ?? '',
            style: textStyle,
          ),
        );
      } else {
        contentWidgets.add(child!);
      }
    }

    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children:
          contentWidgets,
    );
  }

  /// Creates button style
  ButtonStyle
      _getButtonStyle(
    SButtonThemeData
        theme,
    Color
        backgroundColor,
    Color
        foregroundColor,
    BorderSide?
        borderSide,
    EdgeInsetsGeometry
        padding,
    BuildContext
        context,
  ) {
    return ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all(backgroundColor),
      foregroundColor:
          WidgetStateProperty.all(foregroundColor),
      overlayColor:
          WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return foregroundColor.withOpacity(DesignConstants.opacityPressed);
          }
          if (states.contains(WidgetState.focused)) {
            return foregroundColor.withOpacity(DesignConstants.opacityFocused);
          }
          return null;
        },
      ),
      padding:
          WidgetStateProperty.all(padding),
      side: borderSide != null
          ? WidgetStateProperty.all(borderSide)
          : null,
      shape:
          WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius as BorderRadius? ?? BorderRadius.circular(DesignConstants.buttonBorderRadiusDefault),
        ),
      ),
      minimumSize:
          WidgetStateProperty.all(Size.zero),
      tapTargetSize:
          MaterialTapTargetSize.shrinkWrap,
    );
  }
}

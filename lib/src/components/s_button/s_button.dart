import 'package:flutter/material.dart';
import 'package:s_design/src/components/s_button/enums/s_button_size.dart';
import 'package:s_design/src/components/s_button/enums/s_button_state.dart';
import 'package:s_design/src/components/s_button/enums/s_button_variant.dart';
import 'package:s_design/src/components/s_button/themes/s_button_theme.dart';
import 'package:s_design/src/components/s_button/utils/s_button_util.dart';

/// A customizable and versatile button widget for Flutter applications.
///
/// The [SButton] widget supports various styles, sizes, states, and includes options
/// for displaying icons and loading indicators. It adapts its appearance based on the
/// current theme and provided customization parameters.
///
/// Example usage:
/// ```dart
/// SButton(
///   variant: SButtonVariant.destructive,
///   size: SButtonSize.lg,
///   state: SButtonState.enabled,
///   icon: Icon(Icons.delete),
///   onPressed: () {
///     // Handle button press
///   },
///   child: Text('Delete'),
/// )
/// ```
class SButton extends StatelessWidget {
  /// The variant of the button, determining its style.
  final SButtonVariant variant;

  /// The size of the button, affecting its padding and font size.
  final SButtonSize size;

  /// The current state of the button, affecting its interactivity and appearance.
  final SButtonState? state;

  /// An optional icon to display alongside the button's content.
  final Widget? icon;

  /// Whether to show a loading indicator instead of the button's content.
  final bool loading;

  /// The callback invoked when the button is pressed.
  final VoidCallback? onPressed;

  /// The fixed height of the button.
  final double? height;

  /// The fixed width of the button.
  final double? width;

  /// The main content of the button, typically a [Text] widget.
  final Widget? child;

  /// The padding inside the button.
  final EdgeInsetsGeometry? padding;

  /// Changes the background color of the button
  final Color? backgroundColor;

  /// Changes the foreground color of the button
  final Color? foregroundColor;

  /// Custom you own button style
  final ButtonStyle? buttonStyle;

  /// Border radius
  final BorderRadiusGeometry? borderRadius;

  ///

  /// Creates an [SButton] widget.
  const SButton(
      {super.key,
      this.variant = SButtonVariant.defaultVariant,
      this.size = SButtonSize.defaultSize,
      this.state,
      this.icon,
      this.backgroundColor,
      this.foregroundColor,
      this.loading = false,
      required this.onPressed,
      this.child,
      this.height,
      this.buttonStyle,
      this.width,
      this.padding,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    // Determine if the button is disabled
    final bool isDisabled = _isDisabled();

    // Retrieve theme data
    final SButtonThemeData theme = Theme.of(context).sButtonTheme;

    // Determine effective colors based on variant and state
    final Color defaultBackgroundColor =
        _getBackgroundColor(theme, isDisabled, context);
    final Color defaultForegroundColor =
        _getForegroundColor(theme, isDisabled, context);
    final BorderSide? defaultBorderSide =
        _getBorderSide(theme, isDisabled, context);

    // Determine padding based on size or custom padding
    final EdgeInsetsGeometry computedPadding =
        padding ?? _getPadding(theme, isDisabled, context);

    // Build button content
    final Widget content = loading ? _buildLoader(theme) : _buildContent(theme);

    // Choose the appropriate button type based on variant
    final ButtonStyle defaultStyle = _getButtonStyle(
      theme,
      backgroundColor ?? defaultBackgroundColor,
      foregroundColor ?? defaultForegroundColor,
      defaultBorderSide,
      computedPadding,
    );

    Widget buttonWidget;

    switch (variant) {
      case SButtonVariant.defaultVariant:
      case SButtonVariant.destructive:
      case SButtonVariant.secondary:
        buttonWidget = ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: buttonStyle ?? defaultStyle,
          child: content,
        );
        break;
      case SButtonVariant.outline:
      case SButtonVariant.destructiveOutline:
        buttonWidget = OutlinedButton(
          onPressed: isDisabled ? null : onPressed,
          style: buttonStyle ?? defaultStyle,
          child: content,
        );
        break;
      case SButtonVariant.ghost:
      case SButtonVariant.link:
        buttonWidget = TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: buttonStyle ?? defaultStyle,
          child: content,
        );
        break;
    }

    // Wrap the button in a SizedBox if height or width is specified
    if (height != null || width != null) {
      buttonWidget = SizedBox(
        height: height,
        width: width,
        child: buttonWidget,
      );
    }

    return buttonWidget;
  }

  /// Determines if the button should be disabled based on its state and loading status.
  bool _isDisabled() {
    return (state == SButtonState.disabled) || loading || onPressed == null;
  }

  /// Retrieves the appropriate background color based on variant and state.
  Color _getBackgroundColor(
      SButtonThemeData theme, bool isDisabled, BuildContext context) {
    if (_isOutlineVariant()) {
      return Colors.transparent;
    }

    switch (variant) {
      case SButtonVariant.defaultVariant:
        return isDisabled ? Colors.grey.shade400 : theme.defaultBackgroundColor;
      case SButtonVariant.destructive:
        return isDisabled ? Colors.grey.shade400 : Colors.red;
      case SButtonVariant.secondary:
        return isDisabled ? Colors.grey.shade400 : Colors.grey.shade400;
      case SButtonVariant.ghost:
      case SButtonVariant.link:
        return Colors.transparent;
      case SButtonVariant.outline:
      case SButtonVariant.destructiveOutline:
        return Colors.transparent;
    }
  }

  /// Retrieves the appropriate foreground (text and icon) color based on variant and state.
  Color _getForegroundColor(
      SButtonThemeData theme, bool isDisabled, BuildContext context) {
    if (_isOutlineVariant()) {
      switch (variant) {
        case SButtonVariant.outline:
          return isDisabled ? Colors.grey : theme.outlineForegroundColor;
        case SButtonVariant.destructiveOutline:
          return isDisabled ? Colors.grey : Colors.red;
        default:
          return theme.outlineForegroundColor;
      }
    }

    switch (variant) {
      case SButtonVariant.defaultVariant:
      case SButtonVariant.destructive:
      case SButtonVariant.secondary:
        return theme.defaultForegroundColor;
      case SButtonVariant.ghost:
        return isDisabled ? Colors.grey : theme.ghostForegroundColor;
      case SButtonVariant.link:
        return isDisabled ? Colors.grey : theme.linkForegroundColor;
      case SButtonVariant.outline:
      case SButtonVariant.destructiveOutline:
        return isDisabled ? Colors.grey : theme.outlineForegroundColor;
    }
  }

  /// Retrieves the appropriate border side based on variant and state.
  BorderSide? _getBorderSide(
      SButtonThemeData theme, bool isDisabled, BuildContext context) {
    if (_isOutlineVariant()) {
      switch (variant) {
        case SButtonVariant.outline:
          return BorderSide(
            color: isDisabled ? Colors.grey : theme.outlineBorderColor,
          );
        case SButtonVariant.destructiveOutline:
          return BorderSide(
            color: isDisabled ? Colors.grey : Colors.red,
          );
        default:
          return null;
      }
    }
    return null;
  }

  /// Determines if the current variant is an outlined variant.
  bool _isOutlineVariant() {
    return variant == SButtonVariant.outline ||
        variant == SButtonVariant.destructiveOutline;
  }

  /// Retrieves the appropriate padding based on size.
  EdgeInsetsGeometry _getPadding(
      SButtonThemeData theme, bool isDisabled, BuildContext context) {
    switch (size) {
      case SButtonSize.defaultSize:
        return const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
      case SButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case SButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0);
      case SButtonSize.icon:
        return const EdgeInsets.all(12.0);
    }
  }

  /// Builds the loading indicator widget.
  Widget _buildLoader(SButtonThemeData theme) {
    return SizedBox(
      width: 20.0,
      height: 20.0,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          _getLoaderColor(theme),
        ),
      ),
    );
  }

  /// Retrieves the loader color based on the theme.
  Color _getLoaderColor(SButtonThemeData theme) {
    switch (variant) {
      case SButtonVariant.destructive:
      case SButtonVariant.destructiveOutline:
        return Colors.white;
      case SButtonVariant.secondary:
        return Colors.black;
      case SButtonVariant.link:
        return theme.linkForegroundColor;
      default:
        return theme.defaultForegroundColor;
    }
  }

  /// Builds the button content, including icon and child.
  Widget _buildContent(SButtonThemeData theme) {
    List<Widget> contentWidgets =
        SButtonUtils.formatContent(icon: icon, child: child);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: contentWidgets,
    );
  }

  /// Constructs the [ButtonStyle] based on the variant and colors.
  ButtonStyle _getButtonStyle(
    SButtonThemeData theme,
    Color backgroundColor,
    Color foregroundColor,
    BorderSide? borderSide,
    EdgeInsetsGeometry padding,
  ) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(foregroundColor),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return foregroundColor.withOpacity(0.12);
          }
          return null;
        },
      ),
      padding: WidgetStateProperty.all(padding),
      side: borderSide != null ? WidgetStateProperty.all(borderSide) : null,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
      ),
      minimumSize: WidgetStateProperty.all(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

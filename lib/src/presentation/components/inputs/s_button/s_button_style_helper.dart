import 'package:flutter/material.dart';

import '../../../../core/constants/design_constants.dart';
import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../themes/extensions/component_themes/s_button_theme.dart';

/// Helper class to handle SButton styling logic.
class SButtonStyleHelper {
  /// Gets background color based on variant
  static Color
      getBackgroundColor({
    required SButtonThemeData
        theme,
    required ButtonVariant
        variant,
    required bool
        isDisabled,
  }) {
    if (_isOutlineVariant(
        variant)) {
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
  static Color
      getForegroundColor({
    required SButtonThemeData
        theme,
    required ButtonVariant
        variant,
    required bool
        isDisabled,
  }) {
    if (_isOutlineVariant(
        variant)) {
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
  static BorderSide?
      getBorderSide({
    required SButtonThemeData
        theme,
    required ButtonVariant
        variant,
    required bool
        isDisabled,
  }) {
    if (_isOutlineVariant(
        variant)) {
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

  /// Gets padding for the given size
  static EdgeInsetsGeometry
      getPaddingForSize(ButtonSize size) {
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

  /// Gets loader size based on button size
  static double
      getLoaderSize(ButtonSize size) {
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
  static Color
      getLoaderColor({
    required SButtonThemeData
        theme,
    required ButtonVariant
        variant,
  }) {
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

  /// Checks if variant is outline
  static bool
      _isOutlineVariant(ButtonVariant variant) {
    return variant == ButtonVariant.outline ||
        variant == ButtonVariant.destructiveOutline;
  }

  /// Creates button style
  static ButtonStyle
      getButtonStyle({
    required SButtonThemeData
        theme,
    required ButtonVariant
        variant,
    required bool
        isDisabled,
    required bool
        isSelected,
    required Color
        backgroundColor,
    required Color
        foregroundColor,
    required BorderSide?
        borderSide,
    required EdgeInsetsGeometry
        padding,
    double?
        elevation,
    Color?
        shadowColor,
    BorderRadiusGeometry?
        borderRadius,
  }) {
    final double
        computedElevation =
        elevation ?? DesignConstants.buttonElevationDefault;
    final BorderRadiusGeometry
        computedBorderRadius =
        borderRadius ?? BorderRadius.circular(DesignConstants.buttonBorderRadiusDefault);

    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return backgroundColor.withOpacity(DesignConstants.opacityDisabled);
        }
        if (isSelected) {
          return Color.alphaBlend(foregroundColor.withOpacity(0.15), backgroundColor);
        }
        return backgroundColor;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return foregroundColor.withOpacity(DesignConstants.opacityDisabled);
        }
        return foregroundColor;
      }),
      elevation:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return 0.0;
        }
        if (states.contains(MaterialState.pressed)) {
          return computedElevation / 2;
        }
        return computedElevation;
      }),
      padding:
          MaterialStateProperty.all(padding),
      shape:
          MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: computedBorderRadius,
          side: borderSide ?? BorderSide.none,
        ),
      ),
      shadowColor:
          MaterialStateProperty.all(shadowColor ?? Colors.black),
      overlayColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return foregroundColor.withOpacity(DesignConstants.opacityPressed);
        }
        if (states.contains(MaterialState.focused)) {
          return foregroundColor.withOpacity(DesignConstants.opacityFocused);
        }
        return null;
      }),
    );
  }

  /// Builds the appropriate button widget based on variant
  static Widget
      createButtonWidget({
    required ButtonVariant
        variant,
    required Widget
        content,
    required ButtonStyle
        style,
    required VoidCallback?
        onPressed,
    required VoidCallback?
        onLongPress,
    required FocusNode?
        focusNode,
    required bool
        autofocus,
  }) {
    switch (
        variant) {
      case ButtonVariant.defaultVariant:
      case ButtonVariant.destructive:
      case ButtonVariant.secondary:
        return ElevatedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          child: content,
        );
      case ButtonVariant.outline:
      case ButtonVariant.destructiveOutline:
        return OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          child: content,
        );
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          child: content,
        );
    }
  }
}

import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// Helper class to handle SSelect styling logic.
class SSelectStyleHelper {
  /// Gets the height of the select trigger based on size.
  static double
      getHeight(SSelectSize size) {
    switch (
        size) {
      case SSelectSize.small:
        return 24.0;
      case SSelectSize.middle:
        return 32.0;
      case SSelectSize.large:
        return 40.0;
    }
  }

  /// Gets the padding for the select items based on size.
  static EdgeInsetsGeometry
      getItemPadding(SSelectSize size) {
    switch (
        size) {
      case SSelectSize.small:
        return const EdgeInsets.symmetric(horizontal: 8.0);
      case SSelectSize.middle:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0);
      case SSelectSize.large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
  }

  /// Gets the border color based on status and focus state.
  static Color
      getBorderColor({
    required SSelectStatus
        status,
    required bool
        isFocused,
    required SSelectVariant
        variant,
    required SThemeData
        theme,
  }) {
    if (variant ==
        SSelectVariant.borderless) {
      return Colors.transparent;
    }

    if (status ==
        SSelectStatus.error) {
      return theme.colorToken.error;
    }
    if (status ==
        SSelectStatus.warning) {
      return const Color(0xFFFAAD14);
    }

    if (isFocused) {
      return theme.colorToken.primary;
    }

    return theme
        .colorToken
        .divider;
  }

  /// Gets the background color based on variant and disabled state.
  static Color
      getBackgroundColor({
    required SSelectVariant
        variant,
    required bool
        disabled,
    required SThemeData
        theme,
  }) {
    if (disabled) {
      return theme.colorToken.background;
    }

    switch (variant) {
      case SSelectVariant.filled:
        // Ant Design "filled" uses a subtle background tint
        return theme.colorToken.primary.withOpacity(0.04);
      case SSelectVariant.borderless:
      case SSelectVariant.outlined:
        return theme.colorToken.surface;
    }
  }

  /// Gets the text style for the select trigger.
  static TextStyle
      getTriggerTextStyle({
    required SSelectSize
        size,
    required bool
        disabled,
    required SThemeData
        theme,
  }) {
    double
        fontSize;
    switch (
        size) {
      case SSelectSize.small:
        fontSize = 12.0;
      case SSelectSize.middle:
        fontSize = 14.0;
      case SSelectSize.large:
        fontSize = 16.0;
    }

    return theme
        .typographyToken
        .bodyMedium
        .copyWith(
      fontSize:
          fontSize,
      color: disabled
          ? theme.colorToken.textSecondary.withOpacity(0.5)
          : theme.colorToken.textPrimary,
    );
  }
}

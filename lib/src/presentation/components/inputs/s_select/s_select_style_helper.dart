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
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0);
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
    required ThemeData
        theme,
  }) {
    if (variant ==
        SSelectVariant.borderless)
      return Colors.transparent;

    if (status ==
        SSelectStatus.error)
      return Colors.red;
    if (status ==
        SSelectStatus.warning)
      return Colors.orange;

    if (isFocused)
      return theme.primaryColor;

    return Colors
        .grey
        .shade300;
  }

  /// Gets the background color based on variant and disabled state.
  static Color
      getBackgroundColor({
    required SSelectVariant
        variant,
    required bool
        disabled,
    required ThemeData
        theme,
  }) {
    if (disabled)
      return Colors.grey.shade100;

    if (variant ==
        SSelectVariant.filled) {
      return Colors.grey.shade100;
    }

    return Colors
        .white;
  }

  /// Gets the text style for the select trigger.
  static TextStyle
      getTriggerTextStyle({
    required SSelectSize
        size,
    required bool
        disabled,
  }) {
    double
        fontSize;
    switch (
        size) {
      case SSelectSize.small:
        fontSize = 12.0;
        break;
      case SSelectSize.middle:
        fontSize = 14.0;
        break;
      case SSelectSize.large:
        fontSize = 16.0;
        break;
    }

    return TextStyle(
      fontSize:
          fontSize,
      color: disabled
          ? Colors.grey.shade400
          : Colors.black87,
    );
  }
}

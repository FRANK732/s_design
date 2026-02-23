import 'package:flutter/material.dart';

import '../../../themes/s_theme_data.dart';
import 's_step_item.dart';

/// Style helper for formatting SSteps based on status and size.
class SStepsStyleHelper {
  static const double
      defaultIconSize =
      32.0; // 'default'
  static const double
      smallIconSize =
      24.0; // 'small'

  static double
      getIconSize(SStepsSize size) {
    return size == SStepsSize.small
        ? smallIconSize
        : defaultIconSize;
  }

  static double
      getIconFontSize(SStepsSize size) {
    return size == SStepsSize.small
        ? 12.0
        : 16.0;
  }

  static double
      getTitleFontSize(SStepsSize size) {
    return size == SStepsSize.small
        ? 14.0
        : 16.0;
  }

  static double
      getDescriptionFontSize(SStepsSize size) {
    return size == SStepsSize.small
        ? 12.0
        : 14.0;
  }

  static Color
      getIconColor({
    required SStepStatus
        status,
    required SThemeData
        theme,
    required bool
        isCustomIcon,
  }) {
    switch (
        status) {
      case SStepStatus.finish:
        // If custom icon, it might not need color override, but usually colors it primary
        return theme.colorToken.primary;
      case SStepStatus.process:
        return theme.colorToken.primary;
      case SStepStatus.error:
        return theme.colorToken.error;
      case SStepStatus.wait:
        return theme.colorToken.divider;
    }
  }

  static Color
      getIconBackgroundColor({
    required SStepStatus
        status,
    required SThemeData
        theme,
  }) {
    switch (
        status) {
      case SStepStatus.process:
        return theme.colorToken.primary;
      case SStepStatus.finish:
      case SStepStatus.error:
      case SStepStatus.wait:
        return Colors.transparent; // Only process has filled background in default style
    }
  }

  static Color
      getIconBorderColor({
    required SStepStatus
        status,
    required SThemeData
        theme,
  }) {
    switch (
        status) {
      case SStepStatus.process:
        return theme.colorToken.primary;
      case SStepStatus.finish:
        return theme.colorToken.primary; // Finish is usually outlined with primary, checkmark inside
      case SStepStatus.error:
        return theme.colorToken.error;
      case SStepStatus.wait:
        return theme.colorToken.divider;
    }
  }

  static Color
      getTitleColor({
    required SStepStatus
        status,
    required SThemeData
        theme,
  }) {
    switch (
        status) {
      case SStepStatus.process:
        return theme.colorToken.textPrimary;
      case SStepStatus.finish:
        return theme.colorToken.textPrimary;
      case SStepStatus.error:
        return theme.colorToken.error;
      case SStepStatus.wait:
        return theme.colorToken.textSecondary;
    }
  }

  static Color
      getDescriptionColor({
    required SStepStatus
        status,
    required SThemeData
        theme,
  }) {
    if (status ==
        SStepStatus.error) {
      return theme.colorToken.error;
    }
    return theme
        .colorToken
        .textSecondary;
  }
}

enum SStepsSize {
  defaultSize,
  small,
}

enum SStepsDirection {
  horizontal,
  vertical,
}

enum SStepsLabelPlacement {
  horizontal,
  vertical,
}

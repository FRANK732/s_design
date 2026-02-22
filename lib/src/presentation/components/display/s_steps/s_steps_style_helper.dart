import 'package:flutter/material.dart';
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
    required ThemeData
        theme,
    required bool
        isCustomIcon,
  }) {
    switch (
        status) {
      case SStepStatus.finish:
        // If custom icon, it might not need color override, but usually colors it primary
        return theme.primaryColor;
      case SStepStatus.process:
        return theme.primaryColor;
      case SStepStatus.error:
        return Colors.red; // SColors.red6
      case SStepStatus.wait:
        return Colors.grey.shade400; // SColors.gray4 placeholder
    }
  }

  static Color
      getIconBackgroundColor({
    required SStepStatus
        status,
    required ThemeData
        theme,
  }) {
    switch (
        status) {
      case SStepStatus.process:
        return theme.primaryColor;
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
    required ThemeData
        theme,
  }) {
    switch (
        status) {
      case SStepStatus.process:
        return theme.primaryColor;
      case SStepStatus.finish:
        return theme.primaryColor; // Finish is usually outlined with primary, checkmark inside
      case SStepStatus.error:
        return Colors.red;
      case SStepStatus.wait:
        return Colors.grey.shade400;
    }
  }

  static Color
      getTitleColor({
    required SStepStatus
        status,
    required ThemeData
        theme,
  }) {
    switch (
        status) {
      case SStepStatus.process:
        return Colors.black87; // SColors.gray9
      case SStepStatus.finish:
        return Colors.black87;
      case SStepStatus.error:
        return Colors.red;
      case SStepStatus.wait:
        return Colors.grey.shade600; // SColors.gray6
    }
  }

  static Color
      getDescriptionColor({
    required SStepStatus
        status,
  }) {
    if (status ==
        SStepStatus.error) {
      return Colors.red;
    }
    return Colors
        .grey
        .shade600;
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

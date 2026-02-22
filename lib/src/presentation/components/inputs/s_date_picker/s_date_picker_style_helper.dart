import 'package:flutter/material.dart';
import '../../../themes/s_theme_data.dart';

class SDatePickerStyleHelper {
  static const double
      defaultInputHeight =
      32.0;
  static const double
      smallInputHeight =
      24.0;
  static const double
      largeInputHeight =
      40.0;

  static const double
      panelWidth =
      280.0; // Standard width
  static const double
      panelPadding =
      8.0;

  static Color
      getHeaderColor(SThemeData theme) {
    return theme
        .colorToken
        .textPrimary;
  }

  static Color
      getWeekDayColor(SThemeData theme) {
    return theme
        .colorToken
        .textSecondary;
  }

  static Color getDayColor(
      SThemeData
          theme,
      {required bool
          isCurrentMonth,
      required bool
          isToday}) {
    if (isToday)
      return theme.colorToken.primary;
    return isCurrentMonth
        ? theme.colorToken.textPrimary
        : theme.colorToken.textSecondary.withOpacity(0.5);
  }
}

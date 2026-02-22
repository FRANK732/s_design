import 'package:flutter/material.dart';

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
      getHeaderColor(ThemeData theme) {
    return theme.textTheme.bodyMedium?.color ??
        Colors.black87;
  }

  static Color
      getWeekDayColor(ThemeData theme) {
    return Colors
        .grey
        .shade600;
  }

  static Color getDayColor(
      ThemeData
          theme,
      {required bool
          isCurrentMonth,
      required bool
          isToday}) {
    if (isToday)
      return theme.primaryColor;
    return isCurrentMonth
        ? (theme.textTheme.bodyMedium?.color ?? Colors.black87)
        : Colors.grey.shade400;
  }
}

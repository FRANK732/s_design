import 'package:flutter/material.dart';

class SDatePickerStyle {
  const SDatePickerStyle({
    this.inputDecoration,
    this.inputTextStyle,
    this.placeholderStyle,
    this.icon,
    this.popupDecoration,
    this.headerTextStyle,
    this.dayTextStyle,
    this.todayTextStyle,
    this.selectedDayTextStyle,
    this.selectedDayBackgroundColor,
    this.weekdayTextStyle,
    this.disabledDayTextStyle,
    this.presetsSidebarDecoration,
    this.presetTextStyle,
    this.rangeHoverColor,
  });

  // Input
  final BoxDecoration?
      inputDecoration;
  final TextStyle?
      inputTextStyle;
  final TextStyle?
      placeholderStyle;
  final Widget?
      icon;

  // Popup / Panel
  final BoxDecoration?
      popupDecoration;

  // Calendar
  final TextStyle?
      headerTextStyle;
  final TextStyle?
      dayTextStyle;
  final TextStyle?
      todayTextStyle;
  final TextStyle?
      selectedDayTextStyle;
  final Color?
      selectedDayBackgroundColor;
  final TextStyle?
      weekdayTextStyle;
  final TextStyle?
      disabledDayTextStyle;

  // Range specifics
  final Color?
      rangeHoverColor;

  // Presets
  final BoxDecoration?
      presetsSidebarDecoration;
  final TextStyle?
      presetTextStyle;
}

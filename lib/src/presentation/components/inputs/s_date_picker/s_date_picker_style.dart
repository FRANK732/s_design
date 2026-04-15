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

  final BoxDecoration?
      inputDecoration;
  final TextStyle?
      inputTextStyle;
  final TextStyle?
      placeholderStyle;
  final Widget?
      icon;

  final BoxDecoration?
      popupDecoration;

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

  final Color?
      rangeHoverColor;

  final BoxDecoration?
      presetsSidebarDecoration;
  final TextStyle?
      presetTextStyle;
}

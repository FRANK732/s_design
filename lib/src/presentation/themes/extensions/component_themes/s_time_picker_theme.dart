import 'package:flutter/material.dart';

/// Global design tokens for [STimePicker], registered as a [ThemeExtension].
///
/// Add to your app's [ThemeData] via:
/// ```dart
/// theme: ThemeData(extensions: [STimePickerThemeData(activeColor: Colors.green)])
/// ```
class STimePickerThemeData
    extends ThemeExtension<
        STimePickerThemeData> {
  const STimePickerThemeData({
    this.activeColor,
    this.panelBackground,
    this.columnHighlightColor,
    this.borderColor,
    this.borderRadius,
    this.fillColor,
    this.textStyle,
    this.placeholderStyle,
    this.itemTextStyle,
    this.itemHeight,
    this.columnWidth,
  });

  /// The accent color used for the selected item and OK button.
  final Color?
      activeColor;

  /// Background color of the picker panel dropdown.
  final Color?
      panelBackground;

  /// Highlight strip color behind the selected row in columns.
  final Color?
      columnHighlightColor;

  /// Border color of the trigger field (outlined/underlined variants).
  final Color?
      borderColor;

  /// Corner radius of the trigger field and popup panel.
  final BorderRadius?
      borderRadius;

  /// Background fill color for the `filled` variant.
  final Color?
      fillColor;

  /// Text style for the selected time displayed in the trigger.
  final TextStyle?
      textStyle;

  /// Text style for the placeholder label.
  final TextStyle?
      placeholderStyle;

  /// Text style for each item in the scroll columns.
  final TextStyle?
      itemTextStyle;

  /// Height of each row in the scroll columns (default: 36).
  final double?
      itemHeight;

  /// Width of each scroll column (default: 56).
  final double?
      columnWidth;

  @override
  STimePickerThemeData copyWith({
    Color?
        activeColor,
    Color?
        panelBackground,
    Color?
        columnHighlightColor,
    Color?
        borderColor,
    BorderRadius?
        borderRadius,
    Color?
        fillColor,
    TextStyle?
        textStyle,
    TextStyle?
        placeholderStyle,
    TextStyle?
        itemTextStyle,
    double?
        itemHeight,
    double?
        columnWidth,
  }) =>
      STimePickerThemeData(
        activeColor: activeColor ?? this.activeColor,
        panelBackground: panelBackground ?? this.panelBackground,
        columnHighlightColor: columnHighlightColor ?? this.columnHighlightColor,
        borderColor: borderColor ?? this.borderColor,
        borderRadius: borderRadius ?? this.borderRadius,
        fillColor: fillColor ?? this.fillColor,
        textStyle: textStyle ?? this.textStyle,
        placeholderStyle: placeholderStyle ?? this.placeholderStyle,
        itemTextStyle: itemTextStyle ?? this.itemTextStyle,
        itemHeight: itemHeight ?? this.itemHeight,
        columnWidth: columnWidth ?? this.columnWidth,
      );

  @override
  STimePickerThemeData lerp(
      STimePickerThemeData?
          other,
      double
          t) {
    if (other ==
        null) {
      return this;
    }
    return STimePickerThemeData(
      activeColor: Color.lerp(
          activeColor,
          other.activeColor,
          t),
      panelBackground: Color.lerp(
          panelBackground,
          other.panelBackground,
          t),
      columnHighlightColor: Color.lerp(
          columnHighlightColor,
          other.columnHighlightColor,
          t),
      borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t),
      borderRadius: BorderRadius.lerp(
          borderRadius,
          other.borderRadius,
          t),
      fillColor: Color.lerp(
          fillColor,
          other.fillColor,
          t),
      textStyle: TextStyle.lerp(
          textStyle,
          other.textStyle,
          t),
      placeholderStyle: TextStyle.lerp(
          placeholderStyle,
          other.placeholderStyle,
          t),
      itemTextStyle: TextStyle.lerp(
          itemTextStyle,
          other.itemTextStyle,
          t),
      itemHeight: t < 0.5
          ? itemHeight
          : other.itemHeight,
      columnWidth: t < 0.5
          ? columnWidth
          : other.columnWidth,
    );
  }
}

/// Convenience extension for reading [STimePickerThemeData] from [ThemeData].
extension STimePickerThemeExtension
    on ThemeData {
  STimePickerThemeData?
      get sTimePickerTheme =>
          extension<STimePickerThemeData>();
}

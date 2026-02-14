import 'package:flutter/material.dart';
import '../../../../../../s_design.dart';

class SInputDecorationHelper {
  static InputDecoration
      resolve({
    required SInputFieldThemeData
        theme,
    required SInputFieldSize
        size,
    required String?
        labelText,
    required String?
        hintText,
    required String?
        helperText,
    required String?
        errorText,
    required String?
        prefixText,
    required TextStyle?
        prefixStyle,
    required String?
        suffixText,
    required TextStyle?
        suffixStyle,
    required Widget?
        startIcon,
    required Widget?
        endIcon,
    required Widget?
        suffixIconOverride,
    required EdgeInsetsGeometry?
        contentPadding,
    required InputDecoration?
        userDecoration,
  }) {
    final OutlineInputBorder
        inputBorder =
        OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(theme.borderRadius),
    );

    final EdgeInsetsGeometry
        defaultContentPadding =
        getContentPadding(size);

    // Base decoration derived from theme and props
    final InputDecoration
        baseDecoration =
        InputDecoration(
      isDense:
          true,
      labelText:
          labelText,
      hintText:
          hintText,
      helperText:
          helperText,
      errorText:
          errorText,
      prefixText:
          prefixText,
      prefixStyle:
          prefixStyle,
      suffixText:
          suffixText,
      suffixStyle:
          suffixStyle,
      contentPadding:
          contentPadding ?? defaultContentPadding,
      border:
          inputBorder.copyWith(
        borderRadius: BorderRadius.circular(theme.borderRadius),
      ),
      enabledBorder:
          inputBorder.copyWith(
        borderSide: BorderSide(
          color: theme.borderColor,
          width: theme.borderWidth,
        ),
      ),
      focusedBorder:
          inputBorder.copyWith(
        borderSide: BorderSide(
          color: theme.focusedBorderColor,
          width: theme.focusedBorderWidth,
        ),
      ),
      disabledBorder:
          inputBorder.copyWith(
        borderSide: BorderSide(
          color: theme.disabledBorderColor,
          width: theme.borderWidth,
        ),
      ),
      prefixIcon:
          startIcon,
      suffixIcon:
          suffixIconOverride ?? endIcon,
    );

    // Merge with user provided decoration
    return _mergeDecorations(
        baseDecoration,
        userDecoration);
  }

  static InputDecoration
      _mergeDecorations(
    InputDecoration
        base,
    InputDecoration?
        override,
  ) {
    if (override ==
        null) {
      return base;
    }
    return base
        .copyWith(
      hintText:
          override.hintText ?? base.hintText,
      hintStyle:
          override.hintStyle ?? base.hintStyle,
      helperText:
          override.helperText ?? base.helperText,
      helperStyle:
          override.helperStyle ?? base.helperStyle,
      errorText:
          override.errorText ?? base.errorText,
      errorStyle:
          override.errorStyle ?? base.errorStyle,
      prefixText:
          override.prefixText ?? base.prefixText,
      prefixStyle:
          override.prefixStyle ?? base.prefixStyle,
      suffixText:
          override.suffixText ?? base.suffixText,
      suffixStyle:
          override.suffixStyle ?? base.suffixStyle,
      filled:
          override.filled ?? base.filled,
      fillColor:
          override.fillColor ?? base.fillColor,
      contentPadding:
          override.contentPadding ?? base.contentPadding,
      enabledBorder:
          override.enabledBorder ?? base.enabledBorder,
      focusedBorder:
          override.focusedBorder ?? base.focusedBorder,
      errorBorder:
          override.errorBorder ?? base.errorBorder,
      disabledBorder:
          override.disabledBorder ?? base.disabledBorder,
      prefixIcon:
          override.prefixIcon ?? base.prefixIcon,
      suffixIcon:
          override.suffixIcon ?? base.suffixIcon,
    );
  }
}

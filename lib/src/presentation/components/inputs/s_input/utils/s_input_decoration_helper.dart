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
    required bool
        filled,
    required bool
        hasBorder,
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
      filled:
          filled,
      fillColor: filled
          ? theme.backgroundColor
          : null,
      contentPadding:
          contentPadding ?? defaultContentPadding,
      border:
          inputBorder.copyWith(
        borderSide: hasBorder ? BorderSide(
          color: theme.borderColor,
          width: theme.borderWidth,
        ) : BorderSide.none,
        borderRadius: BorderRadius.circular(theme.borderRadius),
      ),
      enabledBorder:
          inputBorder.copyWith(
        borderSide: hasBorder ? BorderSide(
          color: theme.borderColor,
          width: theme.borderWidth,
        ) : BorderSide.none,
      ),
      focusedBorder:
          inputBorder.copyWith(
        borderSide: hasBorder ? BorderSide(
          color: theme.focusedBorderColor,
          width: theme.focusedBorderWidth,
        ) : BorderSide.none,
      ),
      disabledBorder:
          inputBorder.copyWith(
        borderSide: hasBorder ? BorderSide(
          color: theme.disabledBorderColor,
          width: theme.borderWidth,
        ) : BorderSide.none,
      ),
      prefixIcon: startIcon != null
          ? _iconWrapper(startIcon)
          : null,
      suffixIcon: suffixIconOverride != null
          ? _iconWrapper(suffixIconOverride)
          : (endIcon != null ? _iconWrapper(endIcon) : null),
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

  /// Wraps [child] so it sits centered and properly padded inside the
  /// `prefixIcon`/`suffixIcon` slot.
  ///
  /// Flutter's default [InputDecoration.prefixIconConstraints] gives the slot
  /// a minimum of 48 px — this wrapper uses [Center] with [heightFactor] and
  /// [widthFactor] both set to 1.0 so the widget is tightly sized to its
  /// child. Flutter's own [InputDecorator] then centers that tight widget
  /// correctly in the field row, making [Text] labels like `$` or `USD`
  /// align identically to [Icon] widgets.
  static Widget _iconWrapper(Widget child) {
    return Center(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: child,
      ),
    );
  }
}

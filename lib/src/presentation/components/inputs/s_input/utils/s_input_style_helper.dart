import 'package:flutter/material.dart';
import '../../../../../../s_design.dart';

class SInputStyleHelper {
  static TextStyle?
      resolveStyle({
    required TextStyle?
        userStyle,
    required SInputFieldSize
        size,
    required SInputFieldThemeData
        theme, // Future proofing if theme has text styles
  }) {
    // Uses the util from core, but wraps it for consistency in the helper pattern
    return buildSizedTextStyle(
        userStyle,
        size);
  }

  static TextInputType
      resolveKeyboardType({
    required TextInputType?
        userKeyboardType,
    required SInputFieldType
        inputType,
  }) {
    return userKeyboardType ??
        mapInputTypeToKeyboard(inputType);
  }
}

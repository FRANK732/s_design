import '../../../components/s_input/enums/s_input_field_size.dart';
import 'package:flutter/material.dart';

/// Helper function that maps an [SInputFieldType] to a
/// suitable [TextInputType] in Flutter.
TextInputType mapInputTypeToKeyboard(SInputFieldType type) {
  switch (type) {
    case SInputFieldType.password:
    case SInputFieldType.search:
    case SInputFieldType.text:
      return TextInputType.text;
    case SInputFieldType.number:
      return TextInputType.number;
    case SInputFieldType.email:
      return TextInputType.emailAddress;
    case SInputFieldType.phone:
      return TextInputType.phone;
  }
}

EdgeInsetsGeometry getContentPadding(SInputFieldSize size) {
  switch (size) {
    case SInputFieldSize.small:
      return const EdgeInsets.all(12.0);
    case SInputFieldSize.medium:
      return const EdgeInsets.all(15.0);
    case SInputFieldSize.large:
      return const EdgeInsets.all(17.0);
    default:
      return const EdgeInsets.all(12.0);
  }
}

/// Text style depending on the [size].
TextStyle? buildSizedTextStyle(TextStyle? base, SInputFieldSize size) {
  double fontSize;
  switch (size) {
    case SInputFieldSize.small:
      fontSize = 13;
      break;
    case SInputFieldSize.medium:
      fontSize = 16;
      break;
    case SInputFieldSize.large:
      fontSize = 20;
      break;
    default:
      fontSize = 10;
  }
  return (base ?? const TextStyle()).copyWith(fontSize: fontSize);
}

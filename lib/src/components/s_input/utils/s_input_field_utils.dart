import '../../../components/s_input/enums/s_input_field_size.dart';
import 'package:flutter/material.dart';

// import '../themes/s_input_field_theme.dart';

// /// Utility functions for [SInputField].
// class SInputFieldUtils {
//   /// Returns the height based on the [SInputFieldSize].
//   static double getHeight(SInputFieldSize size) {
//     switch (size) {
//       case SInputFieldSize.sm:
//         return 40.0;
//       case SInputFieldSize.md:
//         return 48.0;
//       case SInputFieldSize.lg:
//         return 56.0;
//       default:
//         return 40.0;
//     }
//   }

//   /// Returns the appropriate content padding based on the [SInputFieldSize].
//   static EdgeInsets getContentPadding(
//       {required SInputFieldSize size, required SInputFieldTheme theme}) {
//     switch (size) {
//       case SInputFieldSize.sm:
//         return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
//       case SInputFieldSize.md:
//         return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
//       case SInputFieldSize.lg:
//         return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
//       default:
//         return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
//     }
//   }

//   /// Returns the border radius based on the [SInputFieldSize].
//   static OutlineInputBorder getBorderOutline(
//       {required Color borderColor, required SInputFieldTheme theme}) {
//     return OutlineInputBorder(
//       borderRadius: theme.borderRadius,
//       borderSide: BorderSide(color: borderColor),
//     );
//   }
// }

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

/// Adjusts the text style depending on the [size].
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

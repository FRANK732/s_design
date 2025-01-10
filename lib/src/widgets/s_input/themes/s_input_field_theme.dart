// import 'package:flutter/material.dart';

// /// A theming model for controlling color, spacing, shapes, etc.
// /// You can expand this with more fields (e.g., shadows, icon size, etc.)
// class SInputFieldTheme {
//   /// Outline border radius for the input
//   final BorderRadius borderRadius;

//   /// TextStyle for the input text
//   final TextStyle textStyle;

//   /// TextStyle for label
//   final TextStyle labelStyle;

//   /// TextStyle for error text
//   final TextStyle errorStyle;

//   /// Padding for small, medium, large variants
//   final EdgeInsets paddingSm;
//   final EdgeInsets paddingMd;
//   final EdgeInsets paddingLg;

//   /// Colors used across states (hover, focus, disabled, error, etc.)
//   final Color fillColor;
//   final Color hoverColor;
//   final Color focusColor;
//   final Color disabledColor;
//   final Color borderColor;
//   final Color focusedBorderColor;
//   final Color errorBorderColor;

//   /// Example factory for default theme styling based on a Material [ThemeData].
//   factory SInputFieldTheme.defaults(ThemeData theme) {
//     return SInputFieldTheme._(
//       borderRadius: BorderRadius.circular(8),
//       textStyle: theme.textTheme.bodyMedium ?? const TextStyle(fontSize: 16),
//       labelStyle: theme.textTheme.labelLarge ?? const TextStyle(fontSize: 14),
//       errorStyle:
//           theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.error),
//       paddingSm: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       paddingMd: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       paddingLg: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//       fillColor: theme.colorScheme.surfaceContainerHighest,
//       hoverColor: theme.hoverColor,
//       focusColor: theme.focusColor,
//       disabledColor: theme.disabledColor,
//       borderColor: theme.dividerColor,
//       focusedBorderColor: theme.colorScheme.primary,
//       errorBorderColor: theme.colorScheme.error,
//     );
//   }

//   const SInputFieldTheme._({
//     required this.borderRadius,
//     required this.textStyle,
//     required this.labelStyle,
//     required this.errorStyle,
//     required this.paddingSm,
//     required this.paddingMd,
//     required this.paddingLg,
//     required this.fillColor,
//     required this.hoverColor,
//     required this.focusColor,
//     required this.disabledColor,
//     required this.borderColor,
//     required this.focusedBorderColor,
//     required this.errorBorderColor,
//   });
// }

import 'package:flutter/material.dart';

/// A theme class for your SInputField.
/// You can expand this with more styling options (colors, fonts, etc.).
class SInputFieldTheme {
  /// The border color in normal state.
  final Color borderColor;

  /// The border color when focused.
  final Color focusedBorderColor;

  /// The border color when disabled.
  final Color disabledBorderColor;

  /// The width of the border.
  final double borderWidth;

  /// The width of the border when focused.
  final double focusedBorderWidth;

  /// The corner radius of the field.
  final double borderRadius;

  /// Default constructor for the theme.
  const SInputFieldTheme({
    required this.borderColor,
    required this.focusedBorderColor,
    required this.disabledBorderColor,
    required this.borderWidth,
    required this.focusedBorderWidth,
    required this.borderRadius,
  });

  /// A factory constructor providing a nice set of defaults
  /// that you might use for a “shadcn-like” field look.
  factory SInputFieldTheme.defaults() {
    return const SInputFieldTheme(
      borderColor: Colors.grey,
      focusedBorderColor: Colors.blueAccent,
      disabledBorderColor: Colors.grey,
      borderWidth: 1.0,
      focusedBorderWidth: 1.5,
      borderRadius: 6.0,
    );
  }
}

import '../enums/s_input_field_size.dart';
import 'package:flutter/material.dart';

/// Utility functions for [SInputField].
class SInputFieldUtils {
  /// Returns the height based on the [SInputFieldSize].
  static double getHeight(SInputFieldSize size) {
    switch (size) {
      case SInputFieldSize.xs:
        return 32.0;
      case SInputFieldSize.sm:
        return 40.0;
      case SInputFieldSize.md:
        return 48.0;
      case SInputFieldSize.lg:
        return 56.0;
      case SInputFieldSize.xl:
        return 64.0;
      default:
        return 40.0;
    }
  }

  /// Returns the appropriate content padding based on the [SInputFieldSize].
  static EdgeInsets getContentPadding(SInputFieldSize size) {
    switch (size) {
      case SInputFieldSize.xs:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case SInputFieldSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case SInputFieldSize.md:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case SInputFieldSize.lg:
        return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
      case SInputFieldSize.xl:
        return const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0);
      default:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
    }
  }

  /// Returns the border radius based on the [SInputFieldSize].
  static BorderRadius getBorderRadius(SInputFieldSize size) {
    switch (size) {
      case SInputFieldSize.xs:
        return BorderRadius.circular(4.0);
      case SInputFieldSize.sm:
        return BorderRadius.circular(6.0);
      case SInputFieldSize.md:
        return BorderRadius.circular(8.0);
      case SInputFieldSize.lg:
        return BorderRadius.circular(10.0);
      case SInputFieldSize.xl:
        return BorderRadius.circular(12.0);
      default:
        return BorderRadius.circular(6.0);
    }
  }
}

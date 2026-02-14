import 'package:flutter/material.dart';
import '../../../../../domain/entities/config/s_switch_enums.dart';

class SSwitchUtils {
  /// Returns the size dimensions based on the SSwitchSize.
  static Size
      getSwitchSize(SSwitchSize size) {
    switch (
        size) {
      case SSwitchSize.small:
        return const Size(40.0, 20.0);
      case SSwitchSize.medium:
        return const Size(50.0, 30.0);
      case SSwitchSize.large:
        return const Size(60.0, 35.0);
    }
  }

  /// Variant decoration based on SSwitchVariant.
  static BoxDecoration
      getVariantDecoration(
    SSwitchVariant
        variant,
    Color
        activeColor,
    Color
        inactiveColor,
  ) {
    switch (
        variant) {
      case SSwitchVariant.filled:
        return BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(999),
        );
      case SSwitchVariant.outlined:
        return BoxDecoration(
          border: Border.all(color: activeColor),
          borderRadius: BorderRadius.circular(999),
        );
      case SSwitchVariant.ghost:
        return BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        );
    }
  }
}

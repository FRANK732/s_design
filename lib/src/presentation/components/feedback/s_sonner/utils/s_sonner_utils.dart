import 'package:flutter/material.dart';

import '../../../../../domain/entities/config/s_sonner_options.dart';
import '../../../../themes/extensions/component_themes/s_sonner_theme.dart';
import '../../../../themes/s_theme.dart';

/// Utility functions for [SToasterService] and [SToastWidget].
class SSonnerUtils {
  /// Determines the alignment based on [SSonnerPosition].
  static Alignment
      getAlignment(SSonnerPosition position) {
    switch (
        position) {
      case SSonnerPosition.top:
        return Alignment.topCenter;
      case SSonnerPosition.center:
        return Alignment.center;
      case SSonnerPosition.bottom:
        return Alignment.bottomCenter;
    }
  }

  /// Determines the offset animation begin based on [SSonnerPosition].
  static Offset
      getOffsetBegin(SSonnerPosition position) {
    switch (
        position) {
      case SSonnerPosition.top:
        return const Offset(0.0, -1.0);
      case SSonnerPosition.center:
        return Offset.zero;
      case SSonnerPosition.bottom:
        return const Offset(0.0, 1.0);
    }
  }

  /// Provides icon data based on [SSonnerVariant].
  static IconData
      getIconData(SSonnerVariant type) {
    switch (
        type) {
      case SSonnerVariant.success:
        return Icons.check_circle;
      case SSonnerVariant.error:
        return Icons.error;
      case SSonnerVariant.warning:
        return Icons.warning;
      case SSonnerVariant.info:
        return Icons.info;
    }
  }

  /// Helper to get background color from Theme based on variant.
  static Color getBackgroundColor(
      SSonnerVariant
          type,
      BuildContext
          context) {
    final SSonnerThemeData
        theme =
        STheme.of(context).sonnerTheme;
    switch (
        type) {
      case SSonnerVariant.success:
        return theme.successColor;
      case SSonnerVariant.error:
        return theme.errorColor;
      case SSonnerVariant.warning:
        return theme.warningColor;
      case SSonnerVariant.info:
        return theme.infoColor;
    }
  }

  /// Returns the color associated with the variant.
  static Color getIconColor(
      SSonnerVariant
          variant,
      BuildContext
          context) {
    final SSonnerThemeData
        theme =
        STheme.of(context).sonnerTheme;
    switch (
        variant) {
      case SSonnerVariant.info:
        return theme.infoColor;
      case SSonnerVariant.success:
        return theme.successColor;
      case SSonnerVariant.error:
        return theme.errorColor;
      case SSonnerVariant.warning:
        return theme.warningColor;
    }
  }
}

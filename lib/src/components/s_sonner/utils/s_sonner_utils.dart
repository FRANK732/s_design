import 'package:flutter/material.dart';
import 'package:s_design/src/components/s_sonner/enums/s_sonner_options.dart';
import 'package:s_design/src/theme/theme_extension.dart';

/// Utility functions for [SToasterService] and [SToastWidget].
class SSonnerUtils {
  /// Determines the alignment based on [SSonnerPosition].
  /// Determines the alignment based on [SSonnerPosition].
  static Alignment getAlignment(SSonnerPosition position) {
    switch (position) {
      case SSonnerPosition.top:
        return Alignment.topCenter;
      case SSonnerPosition.center:
        return Alignment.center;
      case SSonnerPosition.bottom:
      default:
        return Alignment.bottomCenter;
    }
  }

  /// Determines the offset animation begin based on [SSonnerPosition].
  /// Made public by removing the leading underscore.
  static Offset getOffsetBegin(SSonnerPosition position) {
    switch (position) {
      case SSonnerPosition.top:
        return const Offset(0.0, -1.0);
      case SSonnerPosition.center:
        return const Offset(0.0, 0.0);
      case SSonnerPosition.bottom:
      default:
        return const Offset(0.0, 1.0);
    }
  }

  /// Provides icon data based on [SSonnerVariant].
  static IconData getIconData(SSonnerVariant type) {
    switch (type) {
      case SSonnerVariant.success:
        return Icons.check_circle;
      case SSonnerVariant.error:
        return Icons.error;
      case SSonnerVariant.warning:
        return Icons.warning;
      case SSonnerVariant.info:
      default:
        return Icons.info;
    }
  }

  static Color getBackgroundColor(SSonnerVariant type,BuildContext context) {
    switch (type) {
      case SSonnerVariant.success:
        return context.primaryColor;
      case SSonnerVariant.error:
        return context.errorColor;
      case SSonnerVariant.warning:
        return context.secondaryColor;
      case SSonnerVariant.info:
      default:
        return context.primaryColor;
    }
  }
}

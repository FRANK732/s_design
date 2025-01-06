import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_toast/enums/s_toast_options.dart';

/// Utility functions for [SToasterService] and [SToastWidget].
class SToasterUtils {
  /// Determines the alignment based on [SToastPosition].
  /// Determines the alignment based on [SToastPosition].
  static Alignment getAlignment(SToastPosition position) {
    switch (position) {
      case SToastPosition.top:
        return Alignment.topCenter;
      case SToastPosition.center:
        return Alignment.center;
      case SToastPosition.bottom:
      default:
        return Alignment.bottomCenter;
    }
  }

  /// Determines the offset animation begin based on [SToastPosition].
  /// Made public by removing the leading underscore.
  static Offset getOffsetBegin(SToastPosition position) {
    switch (position) {
      case SToastPosition.top:
        return const Offset(0.0, -1.0);
      case SToastPosition.center:
        return const Offset(0.0, 0.0);
      case SToastPosition.bottom:
      default:
        return const Offset(0.0, 1.0);
    }
  }

  /// Provides icon data based on [SToastType].
  static IconData getIconData(SToastType type) {
    switch (type) {
      case SToastType.success:
        return Icons.check_circle;
      case SToastType.error:
        return Icons.error;
      case SToastType.warning:
        return Icons.warning;
      case SToastType.info:
      default:
        return Icons.info;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_dialog/enums/s_dialog_type.dart';

/// Utility functions for [SDialog].
class SDialogUtils {
  /// Returns the appropriate icon based on the dialog type.
  static IconData getIconForDialogType(SDialogType type) {
    switch (type) {
      case SDialogType.alert:
        return Icons.warning;
      case SDialogType.confirmation:
        return Icons.help_outline;
      case SDialogType.information:
        return Icons.info_outline;
      case SDialogType.custom:
        return Icons.extension;
      default:
        return Icons.info_outline;
    }
  }

  /// Returns the appropriate title for the dialog type.
  static String getDefaultTitleForDialogType(SDialogType type) {
    switch (type) {
      case SDialogType.alert:
        return 'Alert';
      case SDialogType.confirmation:
        return 'Confirmation';
      case SDialogType.information:
        return 'Information';
      case SDialogType.custom:
        return 'Dialog';
      default:
        return 'Dialog';
    }
  }

  /// Returns the appropriate description for the dialog type.
  static String getDefaultDescriptionForDialogType(SDialogType type) {
    switch (type) {
      case SDialogType.alert:
        return 'This is an alert dialog.';
      case SDialogType.confirmation:
        return 'Are you sure you want to proceed?';
      case SDialogType.information:
        return 'This is some information for you.';
      case SDialogType.custom:
        return '';
      default:
        return '';
    }
  }
}

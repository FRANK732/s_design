
import 'package:flutter/material.dart';
import '../enums/s_dialog_type.dart';

class SDialogUtils {
  static String getDefaultTitleForDialogType(SDialogType type) {
    switch (type) {
      case SDialogType.alert:
        return 'Alert';
      case SDialogType.confirmation:
        return 'Confirm';
      case SDialogType.information:
        return 'Information';
      case SDialogType.custom:
        return '';
    }
  }

  static String getDefaultDescriptionForDialogType(SDialogType type) {
    switch (type) {
      case SDialogType.alert:
        return 'This is an alert message.';
      case SDialogType.confirmation:
        return 'Are you sure you want to proceed?';
      case SDialogType.information:
        return 'Here is some information for you.';
      case SDialogType.custom:
        return '';
    }
  }

  static IconData? getIconForDialogType(SDialogType type) {
    switch (type) {
      case SDialogType.alert:
        return Icons.warning_rounded;
      case SDialogType.confirmation:
        return Icons.help_outline;
      case SDialogType.information:
        return Icons.info_outline;
      case SDialogType.custom:
        return null;
    }
  }
}

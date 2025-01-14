import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_dropdown_menu/enums/s_dropdown_menu_item_type.dart';

/// Utility functions for [SDropdownMenu].
class SDropdownMenuUtils {
  /// Returns the appropriate icon based on the menu item type.
  static IconData getIconForMenuItemType(SDropdownMenuItemType type) {
    switch (type) {
      case SDropdownMenuItemType.normal:
        return Icons.arrow_right;
      case SDropdownMenuItemType.checkbox:
        return Icons.check_box;
      case SDropdownMenuItemType.radio:
        return Icons.radio_button_checked;
      case SDropdownMenuItemType.submenu:
        return Icons.arrow_right;
      case SDropdownMenuItemType.separator:
        return Icons.horizontal_rule;
      case SDropdownMenuItemType.label:
        return Icons.label;
      default:
        return Icons.arrow_right;
    }
  }

  /// Returns the appropriate action based on the menu item type.
  static bool isInteractive(SDropdownMenuItemType type) {
    switch (type) {
      case SDropdownMenuItemType.normal:
      case SDropdownMenuItemType.checkbox:
      case SDropdownMenuItemType.radio:
      case SDropdownMenuItemType.submenu:
        return true;
      case SDropdownMenuItemType.separator:
      case SDropdownMenuItemType.label:
        return false;
      default:
        return false;
    }
  }
}

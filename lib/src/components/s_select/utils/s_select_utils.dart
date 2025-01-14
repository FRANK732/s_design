// File: s_select_utils.dart

import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_select/enums/s_select_direction.dart';
import 'package:s_design/src/widgets/s_select/utils/s_select_extension.dart';

/// Utility class for filtering select items based on a search query.
class SSelectUtils {
  /// Filters the [items] based on the [query].
  static List<SSelectItem<T>> filterItems<T>(
      List<SSelectItem<T>> items, String query) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.label.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  /// Determines the position of the dropdown based on the available space.
  static SSelectDropdownDirection determineDropdownDirection(
      BuildContext context, RenderBox renderBox, double dropdownHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    final widgetPosition = renderBox.localToGlobal(Offset.zero);
    final spaceBelow = screenHeight - widgetPosition.dy - renderBox.size.height;
    if (spaceBelow < dropdownHeight && widgetPosition.dy > dropdownHeight) {
      return SSelectDropdownDirection.up;
    }
    return SSelectDropdownDirection.down;
  }
}

/// Utility class for managing styles and theming for SSelect.
class SSelectStyle {
  /// Returns the default text style for the trigger based on the theme.
  static TextStyle defaultTriggerTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }

  /// Returns the default dropdown background color based on the theme.
  static Color defaultDropdownBackgroundColor(BuildContext context) {
    return Theme.of(context).cardColor;
  }

  /// Returns the default icon color based on the theme.
  static Color defaultIconColor(BuildContext context) {
    return Theme.of(context).iconTheme.color!;
  }
}

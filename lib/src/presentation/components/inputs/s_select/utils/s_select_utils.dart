import 'package:flutter/material.dart';

import '../../../../../domain/entities/config/s_select_enums.dart';
import '../widgets/s_select_item.dart';

/// Utility class for filtering select items based on a search query.
class SSelectUtils {
  /// Filters the [items] based on the [query].
  static List<
      SSelectItem<
          T>> filterItems<
      T>(
    List<SSelectItem<T>>
        items,
    String
        query,
  ) {
    if (query
        .isEmpty) {
      return items;
    }
    return items
        .where((SSelectItem<T> item) => item.label?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();
  }

  /// Determines the position of the dropdown based on the available space.
  static SSelectDropdownDirection
      determineDropdownDirection(
    BuildContext
        context,
    RenderBox
        renderBox,
    double
        dropdownHeight,
  ) {
    final double
        screenHeight =
        MediaQuery.of(context).size.height;
    final Offset
        widgetPosition =
        renderBox.localToGlobal(Offset.zero);
    final double spaceBelow = screenHeight -
        widgetPosition.dy -
        renderBox.size.height;
    if (spaceBelow < dropdownHeight &&
        widgetPosition.dy > dropdownHeight) {
      return SSelectDropdownDirection.up;
    }
    return SSelectDropdownDirection
        .down;
  }
}

/// Utility class for managing styles and theming for SSelect.
class SSelectStyle {
  /// Returns the default text style for the trigger based on the theme.
  static TextStyle
      defaultTriggerTextStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodySmall!;
  }

  /// Returns the default dropdown background color based on the theme.
  static Color
      defaultDropdownBackgroundColor(BuildContext context) {
    return Theme.of(context)
        .cardColor;
  }

  /// Returns the default icon color based on the theme.
  static Color
      defaultIconColor(BuildContext context) {
    return Theme.of(context)
        .iconTheme
        .color!;
  }
}

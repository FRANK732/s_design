import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_button/enums/s_button_state.dart';

/// Utility functions for [SButton].
class SButtonUtils {
  /// Determines if the button should display a loader based on its state.
  static bool shouldShowLoader(SButtonState? state) {
    return state == SButtonState.loading;
  }

  /// Formats the button's content based on the presence of an icon and child.
  static List<Widget> formatContent({Widget? icon, Widget? child}) {
    List<Widget> contentWidgets = [];
    if (icon != null) {
      contentWidgets.add(icon);
    }
    if (child != null) {
      if (icon != null) {
        contentWidgets.add(const SizedBox(width: 8.0));
      }
      contentWidgets.add(child);
    }
    return contentWidgets;
  }
}

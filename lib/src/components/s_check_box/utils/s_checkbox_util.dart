import 'package:s_design/src/components/s_check_box/enums/s_checkbox_state.dart';

/// Utility functions for [SCheckbox].
class SCheckboxUtils {
  /// Toggles the state for the checkbox based on the intermediate flag.
  static SCheckboxState toggleState(SCheckboxState current, bool intermediate) {
    if (intermediate) {
      switch (current) {
        case SCheckboxState.unchecked:
          return SCheckboxState.checked;
        case SCheckboxState.checked:
          return SCheckboxState.indeterminate;
        case SCheckboxState.indeterminate:
          return SCheckboxState.unchecked;
      }
    } else {
      // Two-state logic: toggle between unchecked and checked
      return current == SCheckboxState.checked
          ? SCheckboxState.unchecked
          : SCheckboxState.checked;
    }
  }
}

import 'package:s_design/src/widgets/s_check_box/enums/s_checkbox_state.dart';

/// Utility functions for [SCheckbox].
class SCheckboxUtils {
  /// Toggles the checkbox state in a cyclic manner: unchecked → checked → indeterminate → unchecked.
  static SCheckboxState toggleState(SCheckboxState currentState) {
    switch (currentState) {
      case SCheckboxState.unchecked:
        return SCheckboxState.checked;
      case SCheckboxState.checked:
        return SCheckboxState.indeterminate;
      case SCheckboxState.indeterminate:
        return SCheckboxState.unchecked;
    }
  }
}

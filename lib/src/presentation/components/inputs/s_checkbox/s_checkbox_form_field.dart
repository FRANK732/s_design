import 'package:flutter/material.dart';

import '../../../../domain/entities/config/s_checkbox_state.dart';
import 's_checkbox_list_tile.dart';

/// A [FormField] that contains an [SCheckboxListTile].
class SCheckboxFormField
    extends FormField<
        bool> {
  /// Creates an [SCheckboxFormField] that wraps an [SCheckboxListTile].
  SCheckboxFormField({
    super.key,
    required Widget
        title,
    Widget?
        subtitle,
    Widget?
        secondary,
    bool super.initialValue =
        false,
    super.onSaved,
    super.validator,
    super.enabled =
        true,
    super.autovalidateMode,
    super.restorationId,
    EdgeInsets?
        contentPadding,
    bool dense =
        false,
    Color?
        activeColor,
    Color?
        checkColor,
    ListTileControlAffinity controlAffinity =
        ListTileControlAffinity.leading,
    ValueChanged<bool>?
        onChanged,
  }) : super(
          builder: (FormFieldState<bool> state) {
            final bool value = state.value ?? false;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SCheckboxListTile(
                  title: title,
                  subtitle: subtitle,
                  secondary: secondary,
                  value: value ? SCheckboxState.checked : SCheckboxState.unchecked,
                  onChanged: enabled
                      ? (SCheckboxState newState) {
                          final bool newValue = newState == SCheckboxState.checked;
                          state.didChange(newValue);
                          onChanged?.call(newValue);
                        }
                      : null,
                  activeColor: activeColor,
                  checkColor: checkColor,
                  dense: dense,
                  contentPadding: contentPadding,
                  controlAffinity: controlAffinity,
                  enabled: enabled,
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                    child: Text(
                      state.errorText!,
                      style: TextStyle(
                        color: Theme.of(state.context).colorScheme.error,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
}

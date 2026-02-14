import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// A [FormField] that wraps [SSelect].
class SSelectFormField<
        T>
    extends FormField<
        T> {
  SSelectFormField({
    super.key,
    required List<SSelectItem<T>>
        items,
    T? value,
    ValueChanged<T?>?
        onChanged,
    super.validator,
    super.onSaved,
    super.initialValue,
    super.enabled =
        true,
    super.autovalidateMode,
    String?
        placeholder,
    bool disabled =
        false,
    SSelectDropdownDirection dropdownDirection =
        SSelectDropdownDirection.down,
    Duration animationDuration =
        const Duration(milliseconds: 200),
    Curve animationCurve =
        Curves.easeInOut,
    Widget?
        dropdownIcon,
    double dropdownMaxHeight =
        300.0,
    String searchPlaceholder =
        'Search...',
    ButtonStyle?
        style,
  }) : super(
          builder: (FormFieldState<T> field) {
            void onChangedHandler(T? value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SSelect<T>(
                  items: items,
                  value: field.value,
                  onChanged: onChangedHandler,
                  placeholder: placeholder,
                  disabled: disabled || !enabled,
                  dropdownDirection: dropdownDirection,
                  animationDuration: animationDuration,
                  animationCurve: animationCurve,
                  dropdownIcon: dropdownIcon,
                  dropdownMaxHeight: dropdownMaxHeight,
                  searchPlaceholder: searchPlaceholder,
                  style: style,
                ),
                if (field.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                    child: Text(
                      field.errorText!,
                      style: TextStyle(
                        color: Theme.of(field.context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
}

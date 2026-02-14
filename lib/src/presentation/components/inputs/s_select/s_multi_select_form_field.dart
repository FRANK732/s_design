import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// A [FormField] that wraps [SMultiSelect].
class SMultiSelectFormField<
        T>
    extends FormField<
        List<T>> {
  SMultiSelectFormField({
    super.key,
    required List<SSelectItem<T>>
        items,
    List<T>?
        initialValue,
    ValueChanged<List<T>>?
        onChanged,
    super.validator,
    super.onSaved,
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
          initialValue: initialValue ?? [],
          builder: (FormFieldState<List<T>> field) {
            void onChangedHandler(List<T> values) {
              field.didChange(values);
              onChanged?.call(values);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SMultiSelect<T>(
                  items: items,
                  values: field.value,
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

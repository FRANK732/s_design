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
    SSelectDropdownDirection placement =
        SSelectDropdownDirection.down,
    double dropdownMaxHeight =
        256.0,
    bool showSearch =
        false,
    SSelectSize size =
        SSelectSize.middle,
    SSelectStatus status =
        SSelectStatus.none,
    SSelectVariant variant =
        SSelectVariant.outlined,
    bool allowClear =
        false,
  }) : super(
          builder: (FormFieldState<T> field) {
            void onChangedHandler(dynamic value) {
              field.didChange(value as T?);
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
                  placement: placement,
                  dropdownMaxHeight: dropdownMaxHeight,
                  showSearch: showSearch,
                  size: size,
                  status: field.hasError ? SSelectStatus.error : status,
                  variant: variant,
                  allowClear: allowClear,
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

import 'package:flutter/material.dart';
import 's_dropdown_menu.dart';
import '../../../../domain/entities/config/s_dropdown_menu_item_type.dart';

class SDropdownFormField<
        T>
    extends FormField<
        List<T>> {
  SDropdownFormField({
    super.key,
    required List<T>
        items,
    required ValueChanged<dynamic>
        onChanged,
    List<T>?
        initialValues,
    T? initialValue,
    String Function(T)?
        itemLabel,
    Widget Function(BuildContext, T, bool isSelected)?
        itemBuilder,
    Widget Function(BuildContext, T)?
        selectedItemBuilder,
    bool Function(T item, String searchValue)?
        searchMatchFn,
    Future<List<T>> Function(String query)?
        asyncItems,
    bool Function(T)?
        itemDisabled,
    WidgetBuilder?
        emptyBuilder,
    WidgetBuilder?
        loadingBuilder,
    Widget Function(BuildContext, Object error)?
        errorBuilder,
    String?
        hintText,
    Widget?
        icon,
    EdgeInsetsGeometry?
        padding,
    EdgeInsetsGeometry?
        menuPadding,
    Color?
        backgroundColor,
    Color?
        hoverColor,
    Color?
        splashColor,
    Color?
        highlightColor,
    double?
        borderRadius,
    BorderRadius?
        menuBorderRadius,
    BoxShadow?
        shadow,
    List<BoxShadow>?
        menuShadows,
    TextStyle?
        textStyle,
    TextStyle?
        menuTextStyle,
    TextStyle?
        hintTextStyle,
    TextStyle?
        selectedTextStyle,
    Color?
        menuBackgroundColor,
    Color?
        menuItemBackgroundColor,
    Color?
        menuItemHoverColor,
    Color?
        menuItemSelectedColor,
    double?
        menuElevation,
    double?
        menuWidth,
    double?
        menuMaxHeight,
    double?
        menuItemHeight,
    double?
        menuItemPadding,
    SDropdownMenuItemType menuType =
        SDropdownMenuItemType.normal,
    Duration animationDuration =
        const Duration(milliseconds: 300),
    Curve animationCurve =
        Curves.easeInOut,
    SDropdownMenuPosition preferredPosition =
        SDropdownMenuPosition.bottom,
    bool showSelectedItemIcon =
        false,
    Widget?
        selectedItemIcon,
    bool showClearButton =
        false,
    Widget?
        clearButtonIcon,
    VoidCallback?
        onClear,
    bool showMenuIcon =
        true,
    Widget?
        menuIcon,
    bool showDivider =
        false,
    Color?
        dividerColor,
    double?
        dividerThickness,
    EdgeInsetsGeometry?
        dividerPadding,
    bool showScrollbar =
        true,
    ScrollbarThemeData?
        scrollbarTheme,
    bool showCheckbox =
        false,
    Color?
        checkboxActiveColor,
    Color?
        checkboxCheckColor,
    Color?
        checkboxHoverColor,
    STriggerContainerSize triggerSize =
        STriggerContainerSize.md,
    Decoration?
        triggerDecoration,
    AlignmentGeometry?
        triggerAlignment,
    AlignmentGeometry?
        triggerIconAlignment,
    TextOverflow?
        triggerTextOverflow,
    int?
        maxSelectedItemsToShow,
    VoidCallback?
        onMenuOpen,
    VoidCallback?
        onMenuClose,
    EdgeInsetsGeometry?
        triggerMargin,
    Border?
        triggerBorder,
    Gradient?
        triggerGradient,
    ShapeBorder?
        triggerShape,
    BoxConstraints?
        triggerConstraints,
    EdgeInsetsGeometry?
        triggerContentPadding,
    EdgeInsetsGeometry?
        menuMargin,
    Border?
        menuBorder,
    Gradient?
        menuGradient,
    ShapeBorder?
        menuShape,
    BoxConstraints?
        menuConstraints,
    EdgeInsetsGeometry?
        menuContentPadding,
    bool expandToMax =
        false,
    double?
        triggerMaxHeight,
    double?
        triggerMaxWidth,
    Widget?
        chipAvatar,
    EdgeInsetsGeometry?
        chipLabelPadding,
    Widget?
        chipDeleteIcon,
    VoidCallback?
        chipOnDeleted,
    Color?
        chipDeleteIconColor,
    String?
        chipDeleteButtonTooltipMessage,
    BorderSide?
        chipSide,
    OutlinedBorder?
        chipShape,
    Clip clipBehavior =
        Clip.none,
    FocusNode?
        chipFocusNode,
    bool chipAutofocus =
        false,
    Color?
        chipBackgroundColor,
    EdgeInsetsGeometry?
        chipPadding,
    VisualDensity?
        chipVisualDensity,
    MaterialTapTargetSize?
        chipMaterialTapTargetSize,
    double?
        chipElevation,
    Color?
        chipShadowColor,
    Color?
        chipSurfaceTintColor,
    IconThemeData?
        chipIconTheme,
    BoxConstraints?
        chipAvatarBoxConstraints,
    BoxConstraints?
        chipDeleteIconBoxConstraints,
    ChipAnimationStyle?
        chipAnimationStyle,
    FocusNode?
        triggerFocus,
    bool readOnly =
        false,
    super.onSaved,
    super.validator,
    super.autovalidateMode,
    super.enabled,
  }) : super(
          initialValue: menuType == SDropdownMenuItemType.multiSelect
              ? initialValues ?? []
              : (initialValue != null
                  ? [
                      initialValue
                    ]
                  : []),
          builder: (FormFieldState<List<T>> field) {
            final _SDropdownFormFieldState<T> state = field as _SDropdownFormFieldState<T>;
            final ThemeData theme = Theme.of(state.context);
            final bool hasError = field.hasError;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SDropdownMenu<T>(
                  items: items,
                  onChanged: (dynamic value) {
                    if (menuType == SDropdownMenuItemType.multiSelect) {
                      state.didChange(value as List<T>);
                    } else {
                      state.didChange(value != null ? [value as T] : []);
                    }
                    onChanged(value);
                  },
                  initialValue: initialValue,
                  initialValues: initialValues,
                  itemLabel: itemLabel,
                  itemBuilder: itemBuilder,
                  selectedItemBuilder: selectedItemBuilder,
                  searchMatchFn: searchMatchFn,
                  asyncItems: asyncItems,
                  itemDisabled: itemDisabled,
                  emptyBuilder: emptyBuilder,
                  loadingBuilder: loadingBuilder,
                  errorBuilder: errorBuilder,
                  hintText: hintText,
                  icon: icon,
                  padding: padding,
                  menuPadding: menuPadding,
                  backgroundColor: backgroundColor,
                  hoverColor: hoverColor,
                  splashColor: splashColor,
                  highlightColor: highlightColor,
                  borderRadius: borderRadius,
                  menuBorderRadius: menuBorderRadius,
                  shadow: shadow,
                  menuShadows: menuShadows,
                  textStyle: textStyle,
                  menuTextStyle: menuTextStyle,
                  hintTextStyle: hintTextStyle,
                  selectedTextStyle: selectedTextStyle,
                  menuBackgroundColor: menuBackgroundColor,
                  menuItemBackgroundColor: menuItemBackgroundColor,
                  menuItemHoverColor: menuItemHoverColor,
                  menuItemSelectedColor: menuItemSelectedColor,
                  menuElevation: menuElevation,
                  menuWidth: menuWidth,
                  menuMaxHeight: menuMaxHeight,
                  menuItemHeight: menuItemHeight,
                  menuItemPadding: menuItemPadding,
                  menuType: menuType,
                  animationDuration: animationDuration,
                  animationCurve: animationCurve,
                  preferredPosition: preferredPosition,
                  showSelectedItemIcon: showSelectedItemIcon,
                  selectedItemIcon: selectedItemIcon,
                  showClearButton: showClearButton,
                  clearButtonIcon: clearButtonIcon,
                  onClear: onClear,
                  showMenuIcon: showMenuIcon,
                  menuIcon: menuIcon,
                  showDivider: showDivider,
                  dividerColor: dividerColor,
                  dividerThickness: dividerThickness,
                  dividerPadding: dividerPadding,
                  showScrollbar: showScrollbar,
                  scrollbarTheme: scrollbarTheme,
                  showCheckbox: showCheckbox,
                  checkboxActiveColor: checkboxActiveColor,
                  checkboxCheckColor: checkboxCheckColor,
                  checkboxHoverColor: checkboxHoverColor,
                  triggerSize: triggerSize,
                  triggerDecoration: hasError
                      ? (triggerDecoration as BoxDecoration?)?.copyWith(
                            border: Border.all(color: theme.colorScheme.error, width: 1.5),
                          ) ??
                          BoxDecoration(
                            border: Border.all(color: theme.colorScheme.error, width: 1.5),
                            borderRadius: BorderRadius.circular(borderRadius ?? 8),
                            color: backgroundColor ?? theme.inputDecorationTheme.fillColor,
                          )
                      : triggerDecoration,
                  triggerAlignment: triggerAlignment,
                  triggerIconAlignment: triggerIconAlignment,
                  triggerTextOverflow: triggerTextOverflow,
                  maxSelectedItemsToShow: maxSelectedItemsToShow,
                  onMenuOpen: onMenuOpen,
                  onMenuClose: onMenuClose,
                  triggerMargin: triggerMargin,
                  triggerBorder: hasError ? Border.all(color: theme.colorScheme.error) : triggerBorder,
                  triggerGradient: triggerGradient,
                  triggerShape: triggerShape,
                  triggerConstraints: triggerConstraints,
                  triggerContentPadding: triggerContentPadding,
                  menuMargin: menuMargin,
                  menuBorder: menuBorder,
                  menuGradient: menuGradient,
                  menuShape: menuShape,
                  menuConstraints: menuConstraints,
                  menuContentPadding: menuContentPadding,
                  expandToMax: expandToMax,
                  triggerMaxHeight: triggerMaxHeight,
                  triggerMaxWidth: triggerMaxWidth,
                  chipAvatar: chipAvatar,
                  chipLabelPadding: chipLabelPadding,
                  chipDeleteIcon: chipDeleteIcon,
                  chipOnDeleted: chipOnDeleted,
                  chipDeleteIconColor: chipDeleteIconColor,
                  chipDeleteButtonTooltipMessage: chipDeleteButtonTooltipMessage,
                  chipSide: chipSide,
                  chipShape: chipShape,
                  clipBehavior: clipBehavior,
                  chipFocusNode: chipFocusNode,
                  chipAutofocus: chipAutofocus,
                  chipBackgroundColor: chipBackgroundColor,
                  chipPadding: chipPadding,
                  chipVisualDensity: chipVisualDensity,
                  chipMaterialTapTargetSize: chipMaterialTapTargetSize,
                  chipElevation: chipElevation,
                  chipShadowColor: chipShadowColor,
                  chipSurfaceTintColor: chipSurfaceTintColor,
                  chipIconTheme: chipIconTheme,
                  chipAvatarBoxConstraints: chipAvatarBoxConstraints,
                  chipDeleteIconBoxConstraints: chipDeleteIconBoxConstraints,
                  chipAnimationStyle: chipAnimationStyle,
                  triggerFocus: triggerFocus,
                  readOnly: readOnly,
                ),
                if (hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 2),
                    child: Text(
                      field.errorText ?? '',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ),
              ],
            );
          },
        );

  @override
  FormFieldState<
      List<
          T>> createState() =>
      _SDropdownFormFieldState<T>();
}

class _SDropdownFormFieldState<
        T>
    extends FormFieldState<
        List<T>> {}

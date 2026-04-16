import 'package:flutter/material.dart';
import '../../../../../../s_design.dart';

class SSelectDropdown<
        T>
    extends StatelessWidget {
  const SSelectDropdown({
    super.key,
    required this.items,
    required this.selectedValues,
    required this.onSelect,
    required this.mode,
    this.maxHeight =
        256.0,
    this.emptyContent,
    this.loading =
        false,
    this.dropdownRender,
    this.optionRender,
    this.highlightedIndex =
        -1,
  });

  final List<SSelectItem<T>>
      items;
  final List<T>
      selectedValues;
  final ValueChanged<T>
      onSelect;
  final SSelectMode
      mode;
  final double
      maxHeight;
  final Widget?
      emptyContent;
  final bool
      loading;
  final Widget Function(
      BuildContext
          context,
      Widget
          menu)? dropdownRender;
  final Widget Function(
      BuildContext
          context,
      SSelectItem<T>
          option,
      int index)? optionRender;
  final int
      highlightedIndex;

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData
        theme =
        STheme.of(context);

    if (loading) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(theme.colorToken.primary),
        ),
      );
    }

    if (items
        .isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: emptyContent ??
            Text(
              SLocalizations.ofContext(context).noData,
              style: theme.typographyToken.bodyMedium.copyWith(color: theme.colorToken.textSecondary),
            ),
      );
    }

    final List<dynamic>
        flattenedItems =
        <dynamic>[];

    void flatten(
        List<SSelectItem<T>> items,
        {bool isNested = false}) {
      for (final SSelectItem<T> item
          in items) {
        if (item.isGroup) {
          flattenedItems.add({
            'type': 'group',
            'label': item.label
          });
          flatten(item.options!, isNested: true);
        } else {
          flattenedItems.add({
            'type': 'item',
            'item': item,
            'nested': isNested
          });
        }
      }
    }

    flatten(
        items);

    final Widget
        listWidget =
        Container(
      constraints:
          BoxConstraints(maxHeight: maxHeight),
      decoration:
          BoxDecoration(
        color: theme.colorToken.surface,
        borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: theme.colorToken.shadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child:
          ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4),
        shrinkWrap: true,
        itemCount: flattenedItems.length,
        prototypeItem: const SizedBox(height: 48),
        itemBuilder: (BuildContext context, int index) {
          final dynamic listItem = flattenedItems[index];

          if (listItem is Map && listItem['type'] == 'group') {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                listItem['label'] as String,
                style: theme.typographyToken.bodySmall.copyWith(
                  color: theme.colorToken.textSecondary,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            );
          }

          final Map itemMap = listItem as Map;
          final SSelectItem<T> item = itemMap['item'] as SSelectItem<T>;
          final bool isNested = itemMap['nested'] as bool;
          final bool isSelected = selectedValues.contains(item.value);
          final bool isHighlighted = highlightedIndex == index;

          return Padding(
            padding: EdgeInsets.only(left: isNested ? 12.0 : 0.0),
            child: InkWell(
              onTap: item.disabled ? null : () => onSelect(item.value as T),
              hoverColor: theme.colorToken.primary.withOpacity(0.05),
              child: optionRender != null
                  ? optionRender!(context, item, index)
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: (isSelected && mode == SSelectMode.single) || isHighlighted ? theme.colorToken.primary.withOpacity(0.1) : null,
                        borderRadius: BorderRadius.circular(DesignConstants.borderRadiusSmall),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.label!,
                                  style: theme.typographyToken.bodyMedium.copyWith(
                                    color: item.disabled ? theme.colorToken.textSecondary.withOpacity(0.5) : (isSelected && mode == SSelectMode.single ? theme.colorToken.primary : theme.colorToken.textPrimary),
                                    fontWeight: isSelected || isHighlighted ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                                if (item.subtitle != null)
                                  Text(
                                    item.subtitle!,
                                    style: theme.typographyToken.bodySmall.copyWith(
                                      color: theme.colorToken.textSecondary,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (isSelected && (mode == SSelectMode.multiple || mode == SSelectMode.tags))
                            Icon(
                              Icons.check,
                              size: 16,
                              color: theme.colorToken.primary,
                            ),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );

    if (dropdownRender !=
        null) {
      return dropdownRender!(context,
          listWidget);
    }
    return listWidget;
  }
}

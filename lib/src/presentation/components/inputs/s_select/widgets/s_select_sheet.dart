import 'package:flutter/material.dart';
import '../../../../../../s_design.dart';
import '../../../../localizations/s_localizations.dart';
import 's_select_item.dart';
import 's_select_menu.dart';

class SSelectSheet<
        T>
    extends StatelessWidget {
  const SSelectSheet({
    super.key,
    required this.items,
    this.singleValue,
    this.multiValues,
    this.onSingleSelect,
    this.onMultiSelect,
    this.isMultiSelect =
        false,
    this.searchPlaceholder,
    this.title,
  });

  final List<SSelectItem<T>>
      items;
  final T?
      singleValue;
  final List<T>?
      multiValues;
  final ValueChanged<T>?
      onSingleSelect;
  final ValueChanged<List<T>>?
      onMultiSelect;
  final bool
      isMultiSelect;
  final String?
      searchPlaceholder;
  final String?
      title;

  static Future<void>
      show<T>(
    BuildContext
        context, {
    required List<SSelectItem<T>>
        items,
    T? singleValue,
    List<T>?
        multiValues,
    ValueChanged<T>?
        onSingleSelect,
    ValueChanged<List<T>>?
        onMultiSelect,
    bool isMultiSelect =
        false,
    String?
        searchPlaceholder,
    String?
        title,
  }) {
    return showModalBottomSheet(
      context:
          context,
      isScrollControlled:
          true,
      backgroundColor:
          Colors.transparent,
      builder: (context) =>
          SSelectSheet<T>(
        items: items,
        singleValue: singleValue,
        multiValues: multiValues,
        onSingleSelect: onSingleSelect,
        onMultiSelect: onMultiSelect,
        isMultiSelect: isMultiSelect,
        searchPlaceholder: searchPlaceholder,
        title: title,
      ),
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final sTheme =
        STheme.of(context);
    return Container(
      decoration:
          BoxDecoration(
        color: sTheme.colorToken.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding:
          EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child:
          Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: sTheme.colorToken.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          if (title != null) ...[
            const SizedBox(height: 16),
            Text(
              title!,
              style: sTheme.typographyToken.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: sTheme.colorToken.textPrimary,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Flexible(
            child: SSelectMenu<T>(
              items: items,
              singleValue: singleValue,
              multiValues: multiValues,
              onSingleSelect: (value) {
                onSingleSelect?.call(value);
                Navigator.pop(context);
              },
              onMultiSelect: onMultiSelect,
              isMultiSelect: isMultiSelect,
              dropdownMaxHeight: MediaQuery.of(context).size.height * 0.7,
              searchPlaceholder: searchPlaceholder ?? SLocalizations.ofContext(context).searchPlaceholder,
            ),
          ),
          if (isMultiSelect)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(SLocalizations.ofContext(context).ok), // Reusing 'ok' for 'Done' as it's common.
                ),
              ),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

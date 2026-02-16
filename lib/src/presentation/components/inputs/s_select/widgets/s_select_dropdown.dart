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

  @override
  Widget build(
      BuildContext
          context) {
    if (loading) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: const CircularProgressIndicator.adaptive(),
      );
    }

    if (items
        .isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: emptyContent ??
            Text(
              'No data',
              style: TextStyle(color: Colors.grey.shade400),
            ),
      );
    }

    return Container(
      constraints:
          BoxConstraints(maxHeight: maxHeight),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child:
          ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedValues.contains(item.value);

          // Handle OptGroup (if grouped) - simplified for now
          // We can check item.groupLabel here if we flattened the list

          return InkWell(
            onTap: item.disabled ? null : () => onSelect(item.value),
            hoverColor: Theme.of(context).primaryColor.withOpacity(0.05), // Subtle hover
            borderRadius: BorderRadius.circular(DesignConstants.borderRadiusSmall),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected && mode == SSelectMode.single ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
                borderRadius: BorderRadius.circular(DesignConstants.borderRadiusSmall),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.label,
                          style: TextStyle(
                            color: item.disabled ? Colors.grey.shade400 : (isSelected && mode == SSelectMode.single ? Theme.of(context).primaryColor : Colors.black87),
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                        if (item.subtitle != null)
                          Text(
                            item.subtitle!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (isSelected && (mode == SSelectMode.multiple || mode == SSelectMode.tags))
                    Icon(
                      Icons.check,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

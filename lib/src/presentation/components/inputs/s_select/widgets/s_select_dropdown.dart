import 'package:flutter/material.dart';
import '../../../../../../s_design.dart';
import '../../../../localizations/s_localizations.dart';

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
    final theme =
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

    return Container(
      constraints:
          BoxConstraints(maxHeight: maxHeight),
      decoration:
          BoxDecoration(
        color: theme.colorToken.surface,
        borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
        boxShadow: [
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedValues.contains(item.value);

          return InkWell(
            onTap: item.disabled ? null : () => onSelect(item.value),
            hoverColor: theme.colorToken.primary.withOpacity(0.05), // Subtle hover
            borderRadius: BorderRadius.circular(DesignConstants.borderRadiusSmall),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected && mode == SSelectMode.single ? theme.colorToken.primary.withOpacity(0.1) : null,
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
                          style: theme.typographyToken.bodyMedium.copyWith(
                            color: item.disabled ? theme.colorToken.textSecondary.withOpacity(0.5) : (isSelected && mode == SSelectMode.single ? theme.colorToken.primary : theme.colorToken.textPrimary),
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
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
          );
        },
      ),
    );
  }
}

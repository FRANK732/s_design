import 'package:flutter/material.dart';
import '../../../../themes/s_theme.dart';
import '../../../../themes/s_theme_data.dart';
import '../s_date_picker_style.dart';

class SDatePickerYearGrid
    extends StatelessWidget {
  const SDatePickerYearGrid({
    super.key,
    required this.viewDate,
    this.selectedDate,
    required this.onYearSelected,
    this.style,
  });

  final DateTime
      viewDate;
  final DateTime?
      selectedDate;
  final ValueChanged<DateTime>
      onYearSelected;
  final SDatePickerStyle?
      style;

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData theme =
        STheme.of(context);
    final int startYear =
        (viewDate.year ~/ 10) * 10;

    // 12 items = 4 rows of 3 columns
    final List<Widget> rows =
        <Widget>[];
    for (int i = 0;
        i < 4;
        i++) {
      rows.add(Row(
        children: List.generate(3, (int colIndex) {
          final int index = (i * 3) + colIndex;
          final int year = startYear - 1 + index;
          final DateTime date = DateTime(year);

          final bool isSelected = selectedDate != null && selectedDate!.year == year;
          final bool isCurrentDecade = year >= startYear && year <= startYear + 9;
          final bool isCurrentYear = DateTime.now().year == year;

          Color textColor = isCurrentDecade ? theme.colorToken.textPrimary : theme.colorToken.textSecondary.withOpacity(0.5);
          if (isCurrentYear) textColor = theme.colorToken.primary;
          if (isSelected) textColor = theme.colorToken.surface;

          TextStyle textStyle = style?.dayTextStyle ??
              TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              );

          if (!isCurrentDecade) {
            textStyle = style?.disabledDayTextStyle ?? textStyle.copyWith(color: theme.colorToken.textSecondary.withOpacity(0.5));
          }

          if (isSelected) {
            textStyle = style?.selectedDayTextStyle ?? textStyle.copyWith(color: theme.colorToken.surface, fontWeight: FontWeight.bold);
          }

          return Expanded(
            child: AspectRatio(
              aspectRatio: 2.5,
              child: InkWell(
                onTap: () => onYearSelected(date),
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4), // Spacing
                  decoration: isSelected
                      ? BoxDecoration(
                          color: style?.selectedDayBackgroundColor ?? theme.colorToken.primary,
                          borderRadius: BorderRadius.circular(2),
                        )
                      : null,
                  child: Text(
                    '$year',
                    style: textStyle,
                  ),
                ),
              ),
            ),
          );
        }),
      ));
      if (i <
          3) {
        rows.add(const SizedBox(height: 8));
      }
    }

    return Column(
      mainAxisSize:
          MainAxisSize.min,
      children:
          rows,
    );
  }
}

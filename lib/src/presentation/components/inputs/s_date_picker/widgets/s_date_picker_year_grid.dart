import 'package:flutter/material.dart';
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
    final theme =
        Theme.of(context);
    final startYear =
        (viewDate.year ~/ 10) * 10;

    // 12 items = 4 rows of 3 columns
    final rows =
        <Widget>[];
    for (int i = 0;
        i < 4;
        i++) {
      rows.add(Row(
        children: List.generate(3, (colIndex) {
          final index = (i * 3) + colIndex;
          final year = startYear - 1 + index;
          final date = DateTime(year);

          final isSelected = selectedDate != null && selectedDate!.year == year;
          final isCurrentDecade = year >= startYear && year <= startYear + 9;
          final isCurrentYear = DateTime.now().year == year;

          Color textColor = isCurrentDecade ? (theme.textTheme.bodyMedium?.color ?? Colors.black87) : Colors.grey.shade400;
          if (isCurrentYear) textColor = theme.primaryColor;
          if (isSelected) textColor = Colors.white;

          TextStyle textStyle = style?.dayTextStyle ??
              TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              );

          if (!isCurrentDecade) {
            textStyle = style?.disabledDayTextStyle ?? textStyle.copyWith(color: Colors.grey.shade400);
          }

          if (isSelected) {
            textStyle = style?.selectedDayTextStyle ?? textStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
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
                          color: style?.selectedDayBackgroundColor ?? theme.primaryColor,
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
          3)
        rows.add(const SizedBox(height: 8));
    }

    return Column(
      mainAxisSize:
          MainAxisSize.min,
      children:
          rows,
    );
  }
}

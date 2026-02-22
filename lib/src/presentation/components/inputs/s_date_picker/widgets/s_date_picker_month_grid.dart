import 'package:flutter/material.dart';
import '../../../../themes/s_theme.dart';
import '../s_date_picker_style.dart';
import '../s_date_picker_style_helper.dart';

class SDatePickerMonthGrid
    extends StatelessWidget {
  const SDatePickerMonthGrid({
    super.key,
    required this.viewDate,
    this.selectedDate,
    required this.onMonthSelected,
    this.style,
  });

  final DateTime
      viewDate;
  final DateTime?
      selectedDate;
  final ValueChanged<DateTime>
      onMonthSelected;
  final SDatePickerStyle?
      style;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        STheme.of(context);
    const months =
        [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // 12 months = 4 rows of 3 columns
    final rows =
        <Widget>[];
    for (int i = 0;
        i < 4;
        i++) {
      final rowMonths =
          months.sublist(i * 3, (i + 1) * 3);
      rows.add(Row(
        children: rowMonths.asMap().entries.map((entry) {
          final index = (i * 3) + entry.key;
          final monthName = entry.value;
          final monthDate = DateTime(viewDate.year, index + 1);
          final isSelected = selectedDate != null && selectedDate!.year == monthDate.year && selectedDate!.month == monthDate.month;
          final isCurrentMonth = DateTime.now().year == monthDate.year && DateTime.now().month == monthDate.month;

          Color textColor = SDatePickerStyleHelper.getDayColor(
            theme,
            isCurrentMonth: true,
            isToday: isCurrentMonth,
          );

          if (isSelected) {
            textColor = theme.colorToken.surface;
          }

          TextStyle textStyle = style?.dayTextStyle ??
              TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              );

          if (isSelected) {
            textStyle = style?.selectedDayTextStyle ?? textStyle.copyWith(color: theme.colorToken.surface, fontWeight: FontWeight.bold);
          }

          return Expanded(
            child: AspectRatio(
              aspectRatio: 2.5,
              child: InkWell(
                onTap: () => onMonthSelected(monthDate),
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
                    monthName,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
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

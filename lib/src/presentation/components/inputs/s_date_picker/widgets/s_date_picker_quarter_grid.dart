import 'package:flutter/material.dart';
import '../s_date_picker_style.dart';

class SDatePickerQuarterGrid
    extends StatelessWidget {
  const SDatePickerQuarterGrid({
    super.key,
    required this.viewDate,
    this.selectedDate,
    required this.onQuarterSelected,
    this.style,
  });

  final DateTime
      viewDate;
  final DateTime?
      selectedDate;
  final ValueChanged<DateTime>
      onQuarterSelected;
  final SDatePickerStyle?
      style;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);

    // 4 items = 2 rows of 2 columns
    final rows =
        <Widget>[];
    for (int i = 0;
        i < 2;
        i++) {
      rows.add(Row(
        children: List.generate(2, (colIndex) {
          final index = (i * 2) + colIndex;
          final quarter = index + 1;
          // Quarter 1: Jan (1), Q2: Apr (4), Q3: Jul (7), Q4: Oct (10)
          final startMonth = (index * 3) + 1;
          final date = DateTime(viewDate.year, startMonth);

          final isSelected = selectedDate != null && selectedDate!.year == viewDate.year && ((selectedDate!.month - 1) ~/ 3) + 1 == quarter;

          final isCurrentYear = DateTime.now().year == viewDate.year;
          final currentQuarter = ((DateTime.now().month - 1) ~/ 3) + 1;
          final isCurrentQuarter = isCurrentYear && currentQuarter == quarter;

          Color textColor = theme.textTheme.bodyMedium?.color ?? Colors.black87;
          if (isCurrentQuarter) textColor = theme.primaryColor;
          if (isSelected) textColor = Colors.white;

          TextStyle textStyle = style?.dayTextStyle ??
              TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              );

          if (isSelected) {
            textStyle = style?.selectedDayTextStyle ?? textStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
          }

          return Expanded(
            child: AspectRatio(
              aspectRatio: 2.5,
              child: InkWell(
                onTap: () => onQuarterSelected(date),
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  decoration: isSelected
                      ? BoxDecoration(
                          color: style?.selectedDayBackgroundColor ?? theme.primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        )
                      : null,
                  child: Text(
                    'Q$quarter',
                    style: textStyle,
                  ),
                ),
              ),
            ),
          );
        }),
      ));
      if (i <
          1)
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

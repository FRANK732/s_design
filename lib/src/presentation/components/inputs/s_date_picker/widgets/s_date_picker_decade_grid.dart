import 'package:flutter/material.dart';
import '../s_date_picker_style.dart';

class SDatePickerDecadeGrid
    extends StatelessWidget {
  const SDatePickerDecadeGrid({
    super.key,
    required this.viewDate,
    this.selectedDate,
    required this.onDecadeSelected,
    this.style,
  });

  final DateTime
      viewDate;
  final DateTime?
      selectedDate;
  final ValueChanged<DateTime>
      onDecadeSelected;
  final SDatePickerStyle?
      style;

  @override
  Widget build(
      BuildContext
          context) {
    final ThemeData theme =
        Theme.of(context);
    // View date determines the century/decade range.
    // e.g. 2024 -> 2000-2099 century view?
    // Usually Decade picker shows 100 years range (10 decades) or 10 decades
    // Decade picker shows 12 decades roughly around current century.
    // Let's mimic YearGrid structure: 12 items.

    // Logic:
    // If we are in Decade panel, we want to select a Decade (e.g. 2010-2019).
    // The clickable item is a range.

    final int startYear =
        (viewDate.year ~/ 100) * 100; // e.g., 2024 -> 2000

    // We show 12 items.
    // -1 decade (1990-1999)
    // 0..9 decades (2000-2009 ... 2090-2099)
    // +1 decade (2100-2109)

    final List<Widget> rows =
        <Widget>[];
    for (int i = 0;
        i < 4;
        i++) {
      rows.add(Row(
        children: List.generate(3, (int colIndex) {
          final int index = (i * 3) + colIndex;
          // index 0 is startYear - 10
          final int decadeStartYear = startYear + (index - 1) * 10;
          final int decadeEndYear = decadeStartYear + 9;

          final DateTime date = DateTime(decadeStartYear);

          // Selection logic: is the selected date within this decade?
          final bool isSelected = selectedDate != null && selectedDate!.year >= decadeStartYear && selectedDate!.year <= decadeEndYear;

          // Is current decade?
          final int nowYear = DateTime.now().year;
          final bool isCurrentDecade = nowYear >= decadeStartYear && nowYear <= decadeEndYear;

          // Is in current century view?
          final bool isInView = decadeStartYear >= startYear && decadeEndYear < startYear + 100;

          Color textColor = isInView ? (theme.textTheme.bodyMedium?.color ?? Colors.black87) : Colors.grey.shade400;
          if (isCurrentDecade) textColor = theme.primaryColor;
          if (isSelected) textColor = Colors.white;

          TextStyle textStyle = style?.dayTextStyle ??
              TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              );

          if (!isInView) {
            textStyle = style?.disabledDayTextStyle ?? textStyle.copyWith(color: Colors.grey.shade400);
          }

          if (isSelected) {
            textStyle = style?.selectedDayTextStyle ?? textStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
          }

          return Expanded(
            child: AspectRatio(
              aspectRatio: 2.5,
              child: InkWell(
                onTap: () => onDecadeSelected(date),
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
                    '$decadeStartYear-$decadeEndYear',
                    style: textStyle.copyWith(fontSize: 12), // Smaller font for range
                    textAlign: TextAlign.center,
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

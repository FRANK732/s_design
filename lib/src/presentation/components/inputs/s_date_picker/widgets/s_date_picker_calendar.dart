import 'package:flutter/material.dart';
import '../../../../themes/s_theme.dart';
import '../../../../themes/s_theme_data.dart';
import '../s_date_picker_style.dart';
import '../s_date_picker_style_helper.dart';

class SDatePickerCalendar
    extends StatelessWidget {
  const SDatePickerCalendar({
    super.key,
    required this.viewDate,
    this.selectedDate,
    this.rangeStart,
    this.rangeEnd,
    required this.onDateSelected,
    this.style,
  });

  final DateTime
      viewDate;
  final DateTime?
      selectedDate;
  final DateTime?
      rangeStart;
  final DateTime?
      rangeEnd;
  final ValueChanged<DateTime>
      onDateSelected;
  final SDatePickerStyle?
      style;

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData sTheme =
        STheme.of(context);
    final List<DateTime> days =
        _generateDays();
    // 42 days = 6 rows of 7
    final List<Widget> rows =
        <Widget>[];
    for (int i = 0;
        i < 6;
        i++) {
      final List<DateTime> rowDays =
          days.sublist(i * 7, (i + 1) * 7);
      rows.add(Row(
        children: rowDays
            .map((DateTime day) => Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: _buildDayCell(context, day, sTheme),
                  ),
                ))
            .toList(),
      ));
      if (i <
          5) {
        rows.add(const SizedBox(height: 4));
      }
    }

    return Column(
      mainAxisSize:
          MainAxisSize.min,
      children: <Widget>[
        _buildWeekDays(sTheme),
        const SizedBox(height: 4),
        ...rows,
      ],
    );
  }

  Widget _buildWeekDays(
      SThemeData
          theme) {
    final List<String> weekDays =
        <String>[
      'Su',
      'Mo',
      'Tu',
      'We',
      'Th',
      'Fr',
      'Sa'
    ];
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: weekDays
          .map((String day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: style?.weekdayTextStyle ??
                        TextStyle(
                          fontSize: 12,
                          color: SDatePickerStyleHelper.getWeekDayColor(theme),
                        ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildDayCell(
      BuildContext
          context,
      DateTime
          day,
      SThemeData
          theme) {
    final bool isCurrentMonth =
        day.month == viewDate.month;
    final bool isToday = _isSameDay(
        day,
        DateTime.now());

    // Single selection
    final bool isSelected =
        selectedDate != null && _isSameDay(day, selectedDate);

    // Range selection
    final bool isRangeStart =
        rangeStart != null && _isSameDay(day, rangeStart);
    final bool isRangeEnd =
        rangeEnd != null && _isSameDay(day, rangeEnd);
    final bool isInRange = rangeStart != null &&
        rangeEnd != null &&
        day.isAfter(rangeStart!) &&
        day.isBefore(rangeEnd!);

    TextStyle textStyle = style?.dayTextStyle ??
        TextStyle(
          fontSize: 14,
          color: SDatePickerStyleHelper.getDayColor(
            theme,
            isCurrentMonth: isCurrentMonth,
            isToday: isToday,
          ),
          fontWeight: isSelected || isToday || isRangeStart || isRangeEnd ? FontWeight.bold : FontWeight.normal,
        );

    // Override if disabled (not fully implemented yet but placeholder)
    if (!isCurrentMonth) {
      textStyle =
          style?.disabledDayTextStyle ?? textStyle.copyWith(color: theme.colorToken.textSecondary.withOpacity(0.5));
    }

    if (isToday) {
      textStyle =
          style?.todayTextStyle ?? textStyle.copyWith(color: theme.colorToken.primary, fontWeight: FontWeight.bold);
    }

    // Color?
    //     cellColor;
    BoxDecoration?
        decoration;

    if (isSelected ||
        isRangeStart ||
        isRangeEnd) {
      textStyle =
          style?.selectedDayTextStyle ?? textStyle.copyWith(color: theme.colorToken.surface, fontWeight: FontWeight.bold); // Usually white, but surface in dark mode
      decoration =
          BoxDecoration(
        color: style?.selectedDayBackgroundColor ?? theme.colorToken.primary,
        borderRadius: BorderRadius.circular(2),
      );
    } else if (isInRange) {
      decoration =
          BoxDecoration(
        color: style?.rangeHoverColor ?? theme.colorToken.primary.withOpacity(0.1),
        borderRadius: BorderRadius.zero,
      );
    } else if (isToday) {
      decoration =
          BoxDecoration(
        border: Border.all(color: theme.colorToken.primary),
        borderRadius: BorderRadius.circular(2),
      );
    }

    return InkWell(
      onTap: () =>
          onDateSelected(day),
      borderRadius:
          BorderRadius.circular(2),
      child:
          Container(
        decoration: decoration,
        alignment: Alignment.center,
        margin: (isRangeStart || isRangeEnd || isInRange) ? EdgeInsets.zero : const EdgeInsets.all(2),
        child: Text(
          '${day.day}',
          style: textStyle,
        ),
      ),
    );
  }

  bool _isSameDay(
      DateTime?
          a,
      DateTime?
          b) {
    if (a == null ||
        b == null) {
      return false;
    }
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }

  List<DateTime>
      _generateDays() {
    final DateTime firstDayOfMonth = DateTime(
        viewDate.year,
        viewDate.month);
    final int weekdayOffset = firstDayOfMonth.weekday == 7
        ? 0
        : firstDayOfMonth.weekday;
    final DateTime startDate =
        firstDayOfMonth.subtract(Duration(days: weekdayOffset));

    return List.generate(
        42,
        (int index) {
      return startDate.add(Duration(days: index));
    });
  }
}

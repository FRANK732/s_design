import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class DatePickerPage
    extends StatefulWidget {
  const DatePickerPage(
      {super.key});

  @override
  State<DatePickerPage>
      createState() =>
          _DatePickerPageState();
}

class _DatePickerPageState
    extends State<
        DatePickerPage> {
  DateTime?
      _basicDate;
  final DateTime
      _disabledDate =
      DateTime.now();
  DateTime?
      _rangeStart;
  DateTime?
      _rangeEnd;
  DateTime?
      _monthDate;
  DateTime?
      _yearDate;
  DateTime?
      _presetDate;
  DateTime?
      _presetRangeStart;
  DateTime?
      _presetRangeEnd;
  DateTime?
      _customDate;

  @override
  Widget build(
      BuildContext
          context) {
    final sTheme =
        STheme.of(context);
    final isDark =
        sTheme.brightness == Brightness.dark;

    return SScaffold(
      appBar:
          AppBar(title: const Text('SDatePicker Showcase')),
      renderBody: (context) =>
          SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic DatePicker',
              SDatePicker(
                value: _basicDate,
                onChange: (date) => setState(() => _basicDate = date),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Disabled DatePicker',
              SDatePicker(
                value: _disabledDate,
                disabled: true,
                placeholder: 'Disabled',
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Range Picker',
              SDateRangePicker(
                startDate: _rangeStart,
                endDate: _rangeEnd,
                onChange: (range) {
                  setState(() {
                    _rangeStart = range?.start;
                    _rangeEnd = range?.end;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Month Picker',
              SDatePicker(
                value: _monthDate,
                picker: SDatePickerMode.month,
                placeholder: 'Select month',
                onChange: (date) => setState(() => _monthDate = date),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Year Picker',
              SDatePicker(
                value: _yearDate,
                picker: SDatePickerMode.year,
                placeholder: 'Select year',
                onChange: (date) => setState(() => _yearDate = date),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Presets DatePicker',
              SDatePicker(
                value: _presetDate,
                presets: [
                  SDatePickerPreset(label: 'Today', value: DateTime.now()),
                  SDatePickerPreset(label: 'Tomorrow', value: DateTime.now().add(const Duration(days: 1))),
                  SDatePickerPreset(label: 'Next Week', value: DateTime.now().add(const Duration(days: 7))),
                ],
                onChange: (date) => setState(() => _presetDate = date),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Presets RangePicker',
              SDateRangePicker(
                startDate: _presetRangeStart,
                endDate: _presetRangeEnd,
                presets: [
                  SDatePickerPreset(
                    label: 'This Week',
                    value: DateTimeRange(
                      start: DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
                      end: DateTime.now().add(Duration(days: 7 - DateTime.now().weekday)),
                    ),
                  ),
                  SDatePickerPreset(
                    label: 'Last 7 Days',
                    value: DateTimeRange(
                      start: DateTime.now().subtract(const Duration(days: 6)),
                      end: DateTime.now(),
                    ),
                  ),
                  SDatePickerPreset(
                    label: 'Next 30 Days',
                    value: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now().add(const Duration(days: 30)),
                    ),
                  ),
                ],
                onChange: (range) {
                  setState(() {
                    _presetRangeStart = range?.start;
                    _presetRangeEnd = range?.end;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Custom Styling',
              SDatePicker(
                value: _customDate,
                placeholder: 'Custom Theme',
                style: SDatePickerStyle(
                  inputDecoration: BoxDecoration(
                    color: isDark ? Colors.purple.shade900.withOpacity(0.2) : Colors.grey.shade50,
                    border: Border.all(color: isDark ? Colors.purple.shade400 : Colors.purple.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  inputTextStyle: TextStyle(color: isDark ? Colors.purple.shade100 : Colors.purple.shade900, fontWeight: FontWeight.w600),
                  icon: Icon(Icons.star, size: 14, color: isDark ? Colors.purple.shade300 : Colors.purple.shade400),
                  popupDecoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E0A2D) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(isDark ? 0.3 : 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  headerTextStyle: TextStyle(
                    color: isDark ? Colors.purple.shade100 : Colors.purple.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  weekdayTextStyle: TextStyle(
                    color: isDark ? Colors.purple.shade200 : Colors.purple.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  dayTextStyle: TextStyle(color: isDark ? Colors.grey.shade300 : Colors.black87),
                  todayTextStyle: TextStyle(
                    color: isDark ? Colors.purple.shade200 : Colors.purple.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                  selectedDayBackgroundColor: isDark ? Colors.purple.shade400 : Colors.purple.shade600,
                  selectedDayTextStyle: TextStyle(
                    color: isDark ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChange: (date) => setState(() => _customDate = date),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String
          title,
      Widget
          child) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

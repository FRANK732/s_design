import 'package:flutter/material.dart';
import '../s_date_picker_style.dart';
import '../s_date_picker_style_helper.dart';
import '../s_date_picker_types.dart';
import 's_date_picker_calendar.dart';

class SDateRangePickerPanel
    extends StatefulWidget {
  const SDateRangePickerPanel({
    super.key,
    this.startDate,
    this.endDate,
    this.onChange,
    this.presets,
    this.style,
  });

  final DateTime?
      startDate;
  final DateTime?
      endDate;
  final ValueChanged<DateTimeRange?>?
      onChange;
  final List<SDatePickerPreset<DateTimeRange>>?
      presets;
  final SDatePickerStyle?
      style;

  @override
  State<SDateRangePickerPanel>
      createState() =>
          _SDateRangePickerPanelState();
}

class _SDateRangePickerPanelState
    extends State<
        SDateRangePickerPanel> {
  late DateTime
      _leftViewDate;
  late DateTime
      _rightViewDate;
  DateTime?
      _internalStartDate;
  DateTime?
      _internalEndDate;
  DateTime?
      _hoverDate;

  @override
  void
      initState() {
    super
        .initState();
    _internalStartDate =
        widget.startDate;
    _internalEndDate =
        widget.endDate;

    // Initialize view dates
    if (widget.startDate !=
        null) {
      _leftViewDate = DateTime(
          widget.startDate!.year,
          widget.startDate!.month,
          1);
    } else {
      _leftViewDate =
          DateTime.now();
    }
    _rightViewDate = DateTime(
        _leftViewDate.year,
        _leftViewDate.month + 1,
        1);
  }

  void _onDateSelected(
      DateTime
          date) {
    setState(
        () {
      if (_internalStartDate == null ||
          (_internalStartDate != null && _internalEndDate != null)) {
        // Start new range
        _internalStartDate = date;
        _internalEndDate = null;
      } else if (_internalStartDate != null && _internalEndDate == null) {
        // Complete range
        if (date.isBefore(_internalStartDate!)) {
          _internalEndDate = _internalStartDate;
          _internalStartDate = date;
        } else {
          _internalEndDate = date;
        }
        // Notify parent
        widget.onChange?.call(DateTimeRange(start: _internalStartDate!, end: _internalEndDate!));
      }
    });
  }

  void
      _prevYear() {
    setState(
        () {
      _leftViewDate = DateTime(
          _leftViewDate.year - 1,
          _leftViewDate.month,
          _leftViewDate.day);
      _rightViewDate = DateTime(
          _rightViewDate.year - 1,
          _rightViewDate.month,
          _rightViewDate.day);
    });
  }

  void
      _prevMonth() {
    setState(
        () {
      _leftViewDate = DateTime(
          _leftViewDate.year,
          _leftViewDate.month - 1,
          _leftViewDate.day);
      _rightViewDate = DateTime(
          _rightViewDate.year,
          _rightViewDate.month - 1,
          _rightViewDate.day);
    });
  }

  void
      _nextMonth() {
    setState(
        () {
      _leftViewDate = DateTime(
          _leftViewDate.year,
          _leftViewDate.month + 1,
          _leftViewDate.day);
      _rightViewDate = DateTime(
          _rightViewDate.year,
          _rightViewDate.month + 1,
          _rightViewDate.day);
    });
  }

  void
      _nextYear() {
    setState(
        () {
      _leftViewDate = DateTime(
          _leftViewDate.year + 1,
          _leftViewDate.month,
          _leftViewDate.day);
      _rightViewDate = DateTime(
          _rightViewDate.year + 1,
          _rightViewDate.month,
          _rightViewDate.day);
    });
  }

  @override
  Widget build(
      BuildContext
          context) {
    final hasPresets =
        widget.presets != null && widget.presets!.isNotEmpty;
    final content =
        Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildHeader(isLeft: true),
              const SizedBox(height: 8),
              SDatePickerCalendar(
                viewDate: _leftViewDate,
                rangeStart: _internalStartDate,
                rangeEnd: _internalEndDate ?? _hoverDate,
                selectedDate: null,
                style: widget.style,
                onDateSelected: _onDateSelected,
              ),
            ],
          ),
        ),
        const VerticalDivider(width: 16, color: Colors.grey), // Separator
        Expanded(
          child: Column(
            children: [
              _buildHeader(isLeft: false),
              const SizedBox(height: 8),
              SDatePickerCalendar(
                viewDate: _rightViewDate,
                rangeStart: _internalStartDate,
                rangeEnd: _internalEndDate ?? _hoverDate,
                selectedDate: null,
                style: widget.style,
                onDateSelected: _onDateSelected,
              ),
            ],
          ),
        ),
      ],
    );

    final decoration = widget.style?.popupDecoration ??
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        );

    return Container(
      width: hasPresets
          ? SDatePickerStyleHelper.panelWidth * 2 + 16 + 120
          : SDatePickerStyleHelper.panelWidth * 2 + 16,
      padding:
          const EdgeInsets.all(SDatePickerStyleHelper.panelPadding),
      decoration:
          decoration,
      child: hasPresets
          ? IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildPresetsSidebar(),
                  const VerticalDivider(width: 1, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(child: content),
                ],
              ),
            )
          : content,
    );
  }

  Widget
      _buildPresetsSidebar() {
    return Container(
      width:
          110,
      padding:
          const EdgeInsets.only(right: 8),
      decoration:
          widget.style?.presetsSidebarDecoration,
      child:
          Column(
        children: widget.presets!.map((preset) {
          return InkWell(
            onTap: () {
              widget.onChange?.call(preset.value);
              _onDateSelected(preset.value.end);
              setState(() {
                _internalStartDate = preset.value.start;
                _internalEndDate = preset.value.end;
                // Update view to start date
                _leftViewDate = DateTime(preset.value.start.year, preset.value.start.month, 1);
                _rightViewDate = DateTime(_leftViewDate.year, _leftViewDate.month + 1, 1);
              });
            },
            borderRadius: BorderRadius.circular(2),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                preset.label,
                style: widget.style?.presetTextStyle ?? const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHeader(
      {required bool
          isLeft}) {
    final theme =
        Theme.of(context);
    final headerStyle = widget.style?.headerTextStyle ??
        TextStyle(
          fontWeight: FontWeight.bold,
          color: SDatePickerStyleHelper.getHeaderColor(theme),
        );

    final viewDate = isLeft
        ? _leftViewDate
        : _rightViewDate;

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

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        if (isLeft)
          Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_left, size: 16),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: _prevYear,
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.chevron_left, size: 16),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: _prevMonth,
            ),
          ])
        else
          const SizedBox(width: 40),
        Expanded(
          child: Center(
            child: Text(
              '${months[viewDate.month - 1]} ${viewDate.year}',
              style: headerStyle,
            ),
          ),
        ),
        if (!isLeft)
          Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              icon: const Icon(Icons.chevron_right, size: 16),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: _nextMonth,
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.keyboard_double_arrow_right, size: 16),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: _nextYear,
            ),
          ])
        else
          const SizedBox(width: 40),
      ],
    );
  }
}

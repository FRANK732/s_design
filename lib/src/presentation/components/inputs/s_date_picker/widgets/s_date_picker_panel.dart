import 'package:flutter/material.dart';
import '../s_date_picker_style.dart';
import '../s_date_picker_style_helper.dart';
import '../s_date_picker_types.dart';
import 's_date_picker_calendar.dart';
import 's_date_picker_month_grid.dart';
import '../../../../themes/s_theme.dart';
import '../../../../themes/s_theme_data.dart';
import 's_date_picker_year_grid.dart';

class SDatePickerPanel
    extends StatefulWidget {
  const SDatePickerPanel({
    super.key,
    this.value,
    this.onChange,
    this.pickerMode =
        SDatePickerMode.date,
    this.presets,
    this.style,
  });

  final DateTime?
      value;
  final ValueChanged<DateTime>?
      onChange;
  final SDatePickerMode
      pickerMode;
  final List<SDatePickerPreset<DateTime>>?
      presets;
  final SDatePickerStyle?
      style;

  @override
  State<SDatePickerPanel>
      createState() =>
          _SDatePickerPanelState();
}

class _SDatePickerPanelState
    extends State<
        SDatePickerPanel> {
  late DateTime
      _viewDate;
  late SDatePickerMode
      _currentMode;

  @override
  void
      initState() {
    super
        .initState();
    _viewDate =
        widget.value ?? DateTime.now();
    _currentMode =
        widget.pickerMode;
  }

  void
      _prev() {
    setState(
        () {
      switch (_currentMode) {
        case SDatePickerMode.date:
        case SDatePickerMode.week:
          _viewDate = DateTime(_viewDate.year, _viewDate.month - 1, _viewDate.day);
        case SDatePickerMode.month:
          _viewDate = DateTime(_viewDate.year - 1, _viewDate.month, _viewDate.day);
        case SDatePickerMode.year:
          _viewDate = DateTime(_viewDate.year - 10, _viewDate.month, _viewDate.day);
        case SDatePickerMode.quarter:
          // TODO: Handle this case.
          throw UnimplementedError();
        case SDatePickerMode.decade:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }

  void
      _next() {
    setState(
        () {
      switch (_currentMode) {
        case SDatePickerMode.date:
        case SDatePickerMode.week:
          _viewDate = DateTime(_viewDate.year, _viewDate.month + 1, _viewDate.day);
        case SDatePickerMode.month:
          _viewDate = DateTime(_viewDate.year + 1, _viewDate.month, _viewDate.day);
        case SDatePickerMode.year:
          _viewDate = DateTime(_viewDate.year + 10, _viewDate.month, _viewDate.day);
        case SDatePickerMode.quarter:
          // TODO: Handle this case.
          throw UnimplementedError();
        case SDatePickerMode.decade:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }

  void
      _prevYear() {
    setState(
        () {
      switch (_currentMode) {
        case SDatePickerMode.date:
        case SDatePickerMode.week:
          _viewDate = DateTime(_viewDate.year - 1, _viewDate.month, _viewDate.day);
        case SDatePickerMode.month:
          _viewDate = DateTime(_viewDate.year - 10, _viewDate.month, _viewDate.day);
        case SDatePickerMode.year:
          _viewDate = DateTime(_viewDate.year - 100, _viewDate.month, _viewDate.day);
        case SDatePickerMode.quarter:
          // TODO: Handle this case.
          throw UnimplementedError();
        case SDatePickerMode.decade:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }

  void
      _nextYear() {
    setState(
        () {
      switch (_currentMode) {
        case SDatePickerMode.date:
        case SDatePickerMode.week:
          _viewDate = DateTime(_viewDate.year + 1, _viewDate.month, _viewDate.day);
        case SDatePickerMode.month:
          _viewDate = DateTime(_viewDate.year + 10, _viewDate.month, _viewDate.day);
        case SDatePickerMode.year:
          _viewDate = DateTime(_viewDate.year + 100, _viewDate.month, _viewDate.day);
        case SDatePickerMode.quarter:
          // TODO: Handle this case.
          throw UnimplementedError();
        case SDatePickerMode.decade:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }

  void
      _onHeaderMonthClick() {
    setState(() =>
        _currentMode = SDatePickerMode.month);
  }

  void
      _onHeaderYearClick() {
    setState(() =>
        _currentMode = SDatePickerMode.year);
  }

  @override
  Widget build(
      BuildContext
          context) {
    final bool
        hasPresets =
        widget.presets != null && widget.presets!.isNotEmpty;
    final Column
        content =
        Column(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        _buildHeader(),
        const SizedBox(height: 8),
        _buildBody(),
      ],
    );

    final SThemeData
        sTheme =
        STheme.of(context);
    final BoxDecoration decoration = widget.style?.popupDecoration ??
        BoxDecoration(
          color: sTheme.colorToken.surface,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: sTheme.colorToken.shadow.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        );

    return Container(
      width: hasPresets
          ? SDatePickerStyleHelper.panelWidth + 120
          : SDatePickerStyleHelper.panelWidth,
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
        children: widget.presets!.map((SDatePickerPreset<DateTime> preset) {
          return InkWell(
            onTap: () {
              widget.onChange?.call(preset.value);
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

  Widget
      _buildBody() {
    switch (
        _currentMode) {
      case SDatePickerMode.date:
      case SDatePickerMode.week:
        return SDatePickerCalendar(
          viewDate: _viewDate,
          selectedDate: widget.value,
          style: widget.style,
          onDateSelected: (DateTime date) {
            widget.onChange?.call(date);
          },
        );
      case SDatePickerMode.month:
        return SDatePickerMonthGrid(
          viewDate: _viewDate,
          selectedDate: widget.value,
          style: widget.style,
          onMonthSelected: (DateTime date) {
            if (widget.pickerMode == SDatePickerMode.month) {
              widget.onChange?.call(date);
            } else {
              setState(() {
                _viewDate = date;
                _currentMode = SDatePickerMode.date;
              });
            }
          },
        );
      case SDatePickerMode.year:
        return SDatePickerYearGrid(
          viewDate: _viewDate,
          selectedDate: widget.value,
          style: widget.style,
          onYearSelected: (DateTime date) {
            if (widget.pickerMode == SDatePickerMode.year) {
              widget.onChange?.call(date);
            } else {
              setState(() {
                _viewDate = date;
                _currentMode = SDatePickerMode.month; // Go to month
              });
            }
          },
        );
      default:
        return const SizedBox();
    }
  }

  Widget
      _buildHeader() {
    final SThemeData
        theme =
        STheme.of(context);
    final TextStyle headerStyle = widget.style?.headerTextStyle ??
        TextStyle(
          fontWeight: FontWeight.bold,
          color: SDatePickerStyleHelper.getHeaderColor(theme),
        );

    const List<String>
        months =
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

    String
        label =
        '';
    if (_currentMode == SDatePickerMode.date ||
        _currentMode == SDatePickerMode.week) {
      label =
          '${months[_viewDate.month - 1]} ${_viewDate.year}';
    } else if (_currentMode == SDatePickerMode.month) {
      label =
          '${_viewDate.year}';
    } else if (_currentMode == SDatePickerMode.year) {
      final int
          startYear =
          (_viewDate.year ~/ 10) * 10;
      label =
          '$startYear-${startYear + 9}';
    }

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
            icon: const Icon(Icons.keyboard_double_arrow_left, size: 16),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: _prevYear,
            tooltip: 'Previous Year',
          ),
          const SizedBox(width: 8),
          if (_currentMode == SDatePickerMode.date || _currentMode == SDatePickerMode.week) ...[
            IconButton(
              icon: const Icon(Icons.chevron_left, size: 16),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: _prev,
              tooltip: 'Previous Month',
            ),
          ]
        ]),
        Expanded(
          child: InkWell(
            onTap: () {
              if (_currentMode == SDatePickerMode.date) {
                _onHeaderMonthClick();
              } else if (_currentMode == SDatePickerMode.month) {
                _onHeaderYearClick();
              }
            },
            child: Center(
              child: Text(
                label,
                style: headerStyle.copyWith(
                  decoration: (_currentMode == SDatePickerMode.date || _currentMode == SDatePickerMode.month) ? TextDecoration.none : TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
        Row(mainAxisSize: MainAxisSize.min, children: [
          if (_currentMode == SDatePickerMode.date || _currentMode == SDatePickerMode.week) ...[
            IconButton(
              icon: const Icon(Icons.chevron_right, size: 16),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: _next,
              tooltip: 'Next Month',
            ),
            const SizedBox(width: 8),
          ],
          IconButton(
            icon: const Icon(Icons.keyboard_double_arrow_right, size: 16),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: _nextYear,
            tooltip: 'Next Year',
          ),
        ]),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../localizations/s_localizations.dart';
import '../../../themes/s_theme.dart';
import '../../../themes/s_theme_data.dart';
import 's_date_picker_style.dart';
import 's_date_picker_style_helper.dart';
import 's_date_picker_types.dart';
import 'widgets/s_date_range_picker_panel.dart';

class SDateRangePicker
    extends StatefulWidget {
  const SDateRangePicker({
    super.key,
    this.startDate,
    this.endDate,
    this.onChange,
    this.separator =
        '~',
    this.startPlaceholder,
    this.endPlaceholder,
    this.disabled =
        false,
    this.presets,
    this.style,
  });

  final DateTime?
      startDate;
  final DateTime?
      endDate;
  final ValueChanged<DateTimeRange?>?
      onChange;
  final String
      separator;
  final String?
      startPlaceholder;
  final String?
      endPlaceholder;
  final bool
      disabled;
  final List<SDatePickerPreset<DateTimeRange>>?
      presets;
  final SDatePickerStyle?
      style;

  @override
  State<SDateRangePicker>
      createState() =>
          _SDateRangePickerState();
}

class _SDateRangePickerState
    extends State<
        SDateRangePicker> {
  final LayerLink
      _layerLink =
      LayerLink();
  OverlayEntry?
      _overlayEntry;
  bool
      _isOpen =
      false;

  void
      _toggleDropdown() {
    if (widget
        .disabled) {
      return;
    }
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void
      _openDropdown() {
    if (_isOpen) {
      return;
    }
    final RenderBox?
        renderBox =
        context.findRenderObject() as RenderBox?;
    if (renderBox ==
        null) {
      return;
    }

    final Size
        size =
        renderBox.size;
    final Offset
        offset =
        renderBox.localToGlobal(Offset.zero);
    final MediaQueryData
        mediaQuery =
        MediaQuery.of(context);
    final double
        screenWidth =
        mediaQuery.size.width;
    final double
        screenHeight =
        mediaQuery.size.height;

    final double overlayWidth = SDatePickerStyleHelper.panelWidth * 2 +
        16 +
        (widget.presets != null && widget.presets!.isNotEmpty ? 120 : 0);

    // Vertical Flip Logic
    const double
        estimatedHeight =
        350.0;
    bool
        showAbove =
        false;
    if (offset.dy + size.height + estimatedHeight > screenHeight &&
        offset.dy > estimatedHeight) {
      showAbove =
          true;
    }

    // Width Constraint
    double
        finalWidth =
        overlayWidth;
    if (overlayWidth >
        screenWidth - 16) {
      finalWidth =
          screenWidth - 16;
    }

    // Horizontal Alignment
    double
        dx =
        0;
    if (offset.dx + finalWidth >
        screenWidth) {
      dx =
          size.width - finalWidth;
    }
    // Safety check for left edge
    if (offset.dx + dx <
        8) {
      dx =
          8 - offset.dx; // Ensure at least 8px from left
    }

    _overlayEntry =
        OverlayEntry(
      builder: (BuildContext context) =>
          Stack(
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _closeDropdown,
            ),
          ),
          Positioned(
            width: finalWidth,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: showAbove ? Alignment.topLeft : Alignment.bottomLeft,
              followerAnchor: showAbove ? Alignment.bottomLeft : Alignment.topLeft,
              offset: Offset(dx, showAbove ? -4 : 4),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: finalWidth),
                    child: SDateRangePickerPanel(
                      startDate: widget.startDate,
                      endDate: widget.endDate,
                      presets: widget.presets,
                      style: widget.style,
                      onChange: (DateTimeRange<DateTime>? range) {
                        widget.onChange?.call(range);
                        if (range != null && range.start != range.end) {
                          _closeDropdown();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context)
        .insert(_overlayEntry!);
    setState(() =>
        _isOpen = true);
  }

  void
      _closeDropdown() {
    if (!_isOpen) {
      return;
    }
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
    setState(() =>
        _isOpen = false);
  }

  @override
  void
      dispose() {
    _closeDropdown();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData
        sTheme =
        STheme.of(context);
    final Color borderColor = _isOpen
        ? sTheme.colorToken.primary
        : sTheme.colorToken.divider;

    // Use custom decoration if provided, else default
    final BoxDecoration decoration = widget.style?.inputDecoration ??
        BoxDecoration(
          color: widget.disabled ? sTheme.colorToken.background : sTheme.colorToken.surface,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(6),
          boxShadow: _isOpen
              ? <BoxShadow>[
                  BoxShadow(
                    color: sTheme.colorToken.primary.withOpacity(0.2),
                    spreadRadius: 2,
                  )
                ]
              : <BoxShadow>[],
        );

    final TextStyle
        defaultTextStyle =
        TextStyle(color: sTheme.colorToken.textPrimary);
    final TextStyle
        placeholderStyle =
        TextStyle(color: sTheme.colorToken.textSecondary);

    final TextStyle startStyle = widget.startDate != null
        ? (widget.style?.inputTextStyle ?? defaultTextStyle)
        : (widget.style?.placeholderStyle ?? placeholderStyle);

    final TextStyle endStyle = widget.endDate != null
        ? (widget.style?.inputTextStyle ?? defaultTextStyle)
        : (widget.style?.placeholderStyle ?? placeholderStyle);

    return CompositedTransformTarget(
      link:
          _layerLink,
      child:
          InkWell(
        onTap: _toggleDropdown,
        child: Container(
          height: SDatePickerStyleHelper.defaultInputHeight,
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
          decoration: decoration,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.startDate != null ? _formatDate(widget.startDate!) : (widget.startPlaceholder ?? SLocalizations.ofContext(context).startDate),
                  style: startStyle,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(widget.separator, style: widget.style?.placeholderStyle ?? TextStyle(color: sTheme.colorToken.textSecondary)),
              ),
              Expanded(
                child: Text(
                  widget.endDate != null ? _formatDate(widget.endDate!) : (widget.endPlaceholder ?? SLocalizations.ofContext(context).endDate),
                  style: endStyle,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 8),
              if ((widget.startDate != null || widget.endDate != null) && !_isOpen && !widget.disabled)
                InkWell(
                  onTap: () => widget.onChange?.call(null),
                  child: Icon(Icons.close, size: 14, color: sTheme.colorToken.textSecondary),
                )
              else
                widget.style?.icon ??
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: sTheme.colorToken.textSecondary,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(
      DateTime
          date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

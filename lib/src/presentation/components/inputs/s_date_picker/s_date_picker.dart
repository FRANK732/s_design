import 'package:flutter/material.dart';

import '../../../localizations/s_localizations.dart';
import '../../../themes/s_theme.dart';
import '../../../themes/s_theme_data.dart';
import 's_date_picker_style.dart';
import 's_date_picker_style_helper.dart';
import 's_date_picker_types.dart';
import 'widgets/s_date_picker_panel.dart';

class SDatePicker
    extends StatefulWidget {
  const SDatePicker({
    super.key,
    this.value,
    this.onChange,
    this.placeholder,
    this.disabled =
        false,
    this.picker =
        SDatePickerMode.date,
    this.presets,
    this.style,
  });

  final DateTime?
      value;
  final ValueChanged<DateTime?>?
      onChange;
  final String?
      placeholder;
  final bool
      disabled;
  final SDatePickerMode
      picker;
  final List<SDatePickerPreset<DateTime>>?
      presets;
  final SDatePickerStyle?
      style;

  @override
  State<SDatePicker>
      createState() =>
          _SDatePickerState();
}

class _SDatePickerState
    extends State<
        SDatePicker> {
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

    final double
        overlayWidth =
        SDatePickerStyleHelper.panelWidth + (widget.presets != null && widget.presets!.isNotEmpty ? 120 : 0);

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

    double
        finalWidth =
        overlayWidth;
    if (overlayWidth >
        screenWidth - 16) {
      finalWidth =
          screenWidth - 16;
    }

    double
        dx =
        0;
    if (offset.dx + finalWidth >
        screenWidth) {
      dx =
          size.width - finalWidth;
    }
    if (offset.dx + dx <
        8) {
      dx =
          8 - offset.dx;
    }

    _overlayEntry =
        OverlayEntry(builder: (BuildContext context) {
      if (!mounted) {
        return const SizedBox.shrink();
      }
      return Stack(
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
                    child: SDatePickerPanel(
                      value: widget.value,
                      pickerMode: widget.picker,
                      presets: widget.presets,
                      style: widget.style,
                      onChange: (DateTime date) {
                        widget.onChange?.call(date);
                        _closeDropdown();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });

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

    final TextStyle textStyle = widget.value != null
        ? (widget.style?.inputTextStyle ?? TextStyle(color: sTheme.colorToken.textPrimary))
        : (widget.style?.placeholderStyle ?? TextStyle(color: sTheme.colorToken.textSecondary));

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
                  widget.value != null ? _formatValue(widget.value!) : (widget.placeholder ?? SLocalizations.ofContext(context).selectDate),
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              if (widget.value != null && !_isOpen && !widget.disabled)
                InkWell(
                  onTap: () {
                    widget.onChange?.call(null);
                  },
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

  String _formatValue(
      DateTime
          date) {
    if (widget.picker ==
        SDatePickerMode
            .year) {
      return '${date.year}';
    } else if (widget.picker ==
        SDatePickerMode.month) {
      return '${date.year}-${date.month.toString().padLeft(2, '0')}';
    }
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

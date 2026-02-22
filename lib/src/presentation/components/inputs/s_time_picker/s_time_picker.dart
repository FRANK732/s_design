import 'package:flutter/material.dart';
import '../../../../domain/entities/config/s_time_picker_enums.dart';
import '../../../themes/extensions/component_themes/s_time_picker_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  Resolved design tokens (computed per-widget from theme + overrides)
// ─────────────────────────────────────────────────────────────────────────────

class _TimePickerTokens {
  const _TimePickerTokens({
    required this.activeColor,
    required this.panelBackground,
    required this.columnHighlightColor,
    required this.borderColor,
    required this.borderRadius,
    required this.fillColor,
    required this.textStyle,
    required this.placeholderStyle,
    required this.itemTextStyle,
    required this.itemHeight,
    required this.columnWidth,
    required this.fieldHeight,
    required this.fontSize,
    required this.iconSize,
    required this.horizontalPadding,
  });

  final Color
      activeColor;
  final Color
      panelBackground;
  final Color
      columnHighlightColor;
  final Color
      borderColor;
  final BorderRadius
      borderRadius;
  final Color
      fillColor;
  final TextStyle
      textStyle;
  final TextStyle
      placeholderStyle;
  final TextStyle
      itemTextStyle;
  final double
      itemHeight;
  final double
      columnWidth;
  final double
      fieldHeight;
  final double
      fontSize;
  final double
      iconSize;
  final double
      horizontalPadding;
}

// ─────────────────────────────────────────────────────────────────────────────
//  Helper: parse & format time
// ─────────────────────────────────────────────────────────────────────────────

String
    _formatTime({
  required int
      hour,
  required int
      minute,
  required int
      second,
  required String
      format,
  required bool
      use12Hours,
}) {
  final bool is12h = use12Hours ||
      format.contains('h') ||
      format.contains('a') ||
      format.contains('A');

  String
      result =
      format;

  if (is12h) {
    final bool
        isPm =
        hour >= 12;
    final int h12 = hour == 0
        ? 12
        : (hour > 12 ? hour - 12 : hour);
    result = result.replaceAll(
        'HH',
        hour.toString().padLeft(2, '0'));
    result = result.replaceAll(
        'H',
        hour.toString());
    result = result.replaceAll(
        'hh',
        h12.toString().padLeft(2, '0'));
    result = result.replaceAll(
        'h',
        h12.toString());
    result = result.replaceAll(
        'A',
        isPm ? 'PM' : 'AM');
    result = result.replaceAll(
        'a',
        isPm ? 'pm' : 'am');
  } else {
    result = result.replaceAll(
        'HH',
        hour.toString().padLeft(2, '0'));
    result = result.replaceAll(
        'H',
        hour.toString());
  }
  result = result.replaceAll(
      'mm',
      minute.toString().padLeft(2,
          '0'));
  result = result.replaceAll(
      'm',
      minute.toString());
  result = result.replaceAll(
      'ss',
      second.toString().padLeft(2,
          '0'));
  result = result.replaceAll(
      's',
      second.toString());
  return result;
}

bool _formatShowsSeconds(
        String
            format) =>
    format.contains(
        'ss') ||
    format
        .contains('s');

bool _formatShowsMinutes(
        String
            format) =>
    format.contains(
        'mm') ||
    format
        .contains('m');

bool _formatShowsAmPm(
        String
            format) =>
    format.contains(
        'a') ||
    format
        .contains('A');

// ─────────────────────────────────────────────────────────────────────────────
//  STimePicker
// ─────────────────────────────────────────────────────────────────────────────

/// A time picker component inspired by Ant Design's [TimePicker].
///
/// Shows a scrollable column panel (hours / minutes / seconds + optional
/// AM/PM) in an [Overlay] positioned below the trigger field.
///
/// ## Minimal usage
/// ```dart
/// STimePicker(
///   onChange: (t) => print(t),
/// )
/// ```
///
/// ## Controlled
/// ```dart
/// STimePicker(
///   value: _time,
///   onChange: (t) => setState(() => _time = t),
/// )
/// ```
class STimePicker
    extends StatefulWidget {
  const STimePicker({
    super.key,
    // Value
    this.value,
    this.defaultValue,
    this.onChange,
    // Format / columns
    this.format =
        'HH:mm:ss',
    this.use12Hours =
        false,
    this.hourStep =
        1,
    this.minuteStep =
        1,
    this.secondStep =
        1,
    // Field appearance
    this.disabled =
        false,
    this.placeholder =
        'Select time',
    this.size =
        STimePickerSize.middle,
    this.variant =
        STimePickerVariant.outlined,
    this.status =
        STimePickerStatus.none,
    this.allowClear =
        true,
    this.suffixIcon,
    this.prefix,
    // Panel behaviour
    this.needConfirm =
        false,
    this.changeOnScroll =
        false,
    this.renderExtraFooter,
    // Controlled open state
    this.open,
    this.onOpenChange,
    // Customizability overrides
    this.activeColor,
    this.panelBackground,
    this.columnHighlightColor,
    this.borderColor,
    this.borderRadius,
    this.fillColor,
    this.textStyle,
    this.placeholderStyle,
    this.itemTextStyle,
    this.itemHeight,
    this.columnWidth,
  });

  // ── Value ──────────────────────────────────────────────────────────────────
  /// Controlled time value. Set alongside [onChange] for controlled mode.
  final TimeOfDay?
      value;

  /// Default time for uncontrolled mode.
  final TimeOfDay?
      defaultValue;

  /// Called when the selected time changes.
  final ValueChanged<TimeOfDay?>?
      onChange;

  // ── Format / columns ───────────────────────────────────────────────────────
  /// Display format string. Controls which columns appear.
  ///
  /// Examples: `'HH:mm:ss'`, `'HH:mm'`, `'h:mm:ss A'`, `'h:mm a'`.
  final String
      format;

  /// Show 12-hour clock with AM/PM column.
  final bool
      use12Hours;

  /// Interval between items in the hours column (default 1).
  final int
      hourStep;

  /// Interval between items in the minutes column (default 1).
  final int
      minuteStep;

  /// Interval between items in the seconds column (default 1).
  final int
      secondStep;

  // ── Field appearance ───────────────────────────────────────────────────────
  final bool
      disabled;
  final String
      placeholder;
  final STimePickerSize
      size;
  final STimePickerVariant
      variant;
  final STimePickerStatus
      status;

  /// Show a ✕ clear button when a value is selected.
  final bool
      allowClear;

  /// Custom trailing icon (default: clock icon).
  final Widget?
      suffixIcon;

  /// Leading widget inside the field.
  final Widget?
      prefix;

  // ── Panel behaviour ────────────────────────────────────────────────────────
  /// Require the user to press OK before the value is committed.
  final bool
      needConfirm;

  /// Fire [onChange] as the user scrolls (requires [needConfirm] == false).
  final bool
      changeOnScroll;

  /// Extra widget rendered at the bottom of the panel.
  final Widget
          Function()?
      renderExtraFooter;

  // ── Controlled open state ──────────────────────────────────────────────────
  final bool?
      open;
  final ValueChanged<bool>?
      onOpenChange;

  // ── Per-instance customizability ───────────────────────────────────────────
  final Color?
      activeColor;
  final Color?
      panelBackground;
  final Color?
      columnHighlightColor;
  final Color?
      borderColor;
  final BorderRadius?
      borderRadius;
  final Color?
      fillColor;
  final TextStyle?
      textStyle;
  final TextStyle?
      placeholderStyle;
  final TextStyle?
      itemTextStyle;
  final double?
      itemHeight;
  final double?
      columnWidth;

  @override
  State<STimePicker>
      createState() =>
          _STimePickerState();
}

class _STimePickerState
    extends State<
        STimePicker>
    with
        SingleTickerProviderStateMixin {
  // Internal state for uncontrolled mode
  TimeOfDay?
      _internalValue;

  // Pending value during needConfirm
  late int
      _pendingHour;
  late int
      _pendingMinute;
  late int
      _pendingSecond;
  late bool
      _pendingIsPm; // for 12h mode

  bool
      _panelOpen =
      false;

  // Scroll controllers
  late FixedExtentScrollController
      _hourCtrl;
  late FixedExtentScrollController
      _minuteCtrl;
  late FixedExtentScrollController
      _secondCtrl;
  late FixedExtentScrollController
      _amPmCtrl;

  // Overlay
  OverlayEntry?
      _overlayEntry;
  final LayerLink
      _layerLink =
      LayerLink();
  final GlobalKey
      _triggerKey =
      GlobalKey();

  // Hover state for clear/suffix swap
  bool
      _hovered =
      false;

  // ── Getters ─────────────────────────────────────────────────────────────────

  TimeOfDay? get _effectiveValue =>
      widget.value ??
      _internalValue;

  bool get _isControlledOpen =>
      widget.open !=
      null;

  bool get _isPanelOpen => _isControlledOpen
      ? widget.open!
      : _panelOpen;

  bool get _show12h =>
      widget.use12Hours ||
      _formatShowsAmPm(widget.format);

  bool get _showSeconds =>
      _formatShowsSeconds(widget.format);
  bool get _showMinutes =>
      _formatShowsMinutes(widget.format);

  // ── Lifecycle ────────────────────────────────────────────────────────────────

  @override
  void
      initState() {
    super
        .initState();
    _syncPendingFromValue(widget.defaultValue ??
        widget.value ??
        const TimeOfDay(hour: 0, minute: 0));
    _hourCtrl =
        FixedExtentScrollController(initialItem: _hourIndex(_pendingHour));
    _minuteCtrl =
        FixedExtentScrollController(initialItem: _minuteIndex(_pendingMinute));
    _secondCtrl =
        FixedExtentScrollController(initialItem: _secondIndex(_pendingSecond));
    _amPmCtrl =
        FixedExtentScrollController(initialItem: _pendingIsPm ? 1 : 0);
  }

  @override
  void didUpdateWidget(
      STimePicker
          old) {
    super.didUpdateWidget(
        old);
    if (widget.value != old.value &&
        widget.value != null &&
        !_isPanelOpen) {
      _syncPendingFromValue(widget.value!);
    }
  }

  @override
  void
      dispose() {
    _removeOverlay();
    _hourCtrl
        .dispose();
    _minuteCtrl
        .dispose();
    _secondCtrl
        .dispose();
    _amPmCtrl
        .dispose();
    super
        .dispose();
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  void _syncPendingFromValue(
      TimeOfDay
          t) {
    _pendingHour =
        t.hour;
    _pendingMinute =
        t.minute;
    _pendingSecond =
        0;
    _pendingIsPm =
        t.hour >= 12;
  }

  List<int>
      get _hours {
    final total = _show12h
        ? 12
        : 24;
    return [
      for (int i = 0;
          i < total;
          i += widget.hourStep)
        i
    ];
  }

  List<int>
      get _minutes =>
          [
            for (int i = 0; i < 60; i += widget.minuteStep) i
          ];

  List<int>
      get _seconds =>
          [
            for (int i = 0; i < 60; i += widget.secondStep) i
          ];

  int _hourIndex(
      int h) {
    final display = _show12h
        ? (h == 0
                ? 12
                : h > 12
                    ? h - 12
                    : h) %
            (_show12h ? 12 : 24)
        : h;
    final idx =
        _hours.indexOf(display);
    return idx < 0
        ? 0
        : idx;
  }

  int _minuteIndex(
      int m) {
    final idx =
        _minutes.indexOf(m);
    return idx < 0
        ? 0
        : idx;
  }

  int _secondIndex(
      int s) {
    final idx =
        _seconds.indexOf(s);
    return idx < 0
        ? 0
        : idx;
  }

  int _displayHourToHour24(
      int
          displayHour,
      bool
          isPm) {
    if (!_show12h)
      return displayHour;
    if (displayHour ==
        12)
      return isPm
          ? 12
          : 0;
    return isPm
        ? displayHour + 12
        : displayHour;
  }

  TimeOfDay get _pendingTime =>
      TimeOfDay(
        hour: _displayHourToHour24(
          _show12h
              ? (_pendingHour == 0
                  ? 12
                  : _pendingHour > 12
                      ? _pendingHour - 12
                      : _pendingHour)
              : _pendingHour,
          _pendingIsPm,
        ),
        minute: _pendingMinute,
      );

  String _formatDisplay(
      TimeOfDay?
          t) {
    if (t ==
        null)
      return '';
    return _formatTime(
      hour:
          t.hour,
      minute:
          t.minute,
      second:
          _pendingSecond,
      format:
          widget.format,
      use12Hours:
          _show12h,
    );
  }

  // ── Panel open / close ────────────────────────────────────────────────────

  void
      _openPanel() {
    if (widget
        .disabled)
      return;
    if (_isControlledOpen) {
      widget.onOpenChange?.call(true);
      return;
    }
    setState(() =>
        _panelOpen = true);
    widget
        .onOpenChange
        ?.call(true);
    _showOverlay();
  }

  void _closePanel(
      {bool commit =
          false}) {
    if (_isControlledOpen) {
      widget.onOpenChange?.call(false);
      return;
    }
    if (commit ||
        !widget.needConfirm) {
      _commitPending();
    }
    setState(() =>
        _panelOpen = false);
    widget
        .onOpenChange
        ?.call(false);
    _removeOverlay();
  }

  void
      _commitPending() {
    final t =
        _pendingTime;
    if (widget.value ==
        null)
      setState(() =>
          _internalValue = t);
    widget
        .onChange
        ?.call(t);
  }

  void
      _clearValue() {
    setState(() =>
        _internalValue = null);
    widget
        .onChange
        ?.call(null);
  }

  // ── Overlay management ────────────────────────────────────────────────────

  void
      _showOverlay() {
    _removeOverlay();
    final overlay =
        Overlay.of(context);
    _overlayEntry =
        OverlayEntry(
      builder: (_) =>
          _TimePickerOverlay(
        layerLink: _layerLink,
        state: this,
      ),
    );
    overlay
        .insert(_overlayEntry!);
  }

  void
      _removeOverlay() {
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
  }

  void
      _rebuildOverlay() {
    _overlayEntry
        ?.markNeedsBuild();
  }

  // ── Tokens ────────────────────────────────────────────────────────────────

  _TimePickerTokens
      _resolveTokens(BuildContext ctx) {
    final theme =
        Theme.of(ctx);
    final ext =
        theme.sTimePickerTheme;
    final isDark =
        theme.brightness == Brightness.dark;

    // Field height from size
    final double
        fieldHeight;
    final double
        fontSize;
    final double
        iconSize;
    final double
        hPad;
    switch (
        widget.size) {
      case STimePickerSize.large:
        fieldHeight = 40;
        fontSize = 16;
        iconSize = 18;
        hPad = 12;
        break;
      case STimePickerSize.small:
        fieldHeight = 24;
        fontSize = 12;
        iconSize = 12;
        hPad = 7;
        break;
      case STimePickerSize.middle:
        fieldHeight = 32;
        fontSize = 14;
        iconSize = 14;
        hPad = 11;
        break;
    }

    // Status overrides border
    Color
        borderColor;
    switch (
        widget.status) {
      case STimePickerStatus.error:
        borderColor = const Color(0xFFFF4D4F);
        break;
      case STimePickerStatus.warning:
        borderColor = const Color(0xFFFAAD14);
        break;
      case STimePickerStatus.none:
        borderColor = widget.borderColor ?? ext?.borderColor ?? (isDark ? const Color(0xFF434343) : const Color(0xFFD9D9D9));
    }

    return _TimePickerTokens(
      activeColor: widget.activeColor ??
          ext?.activeColor ??
          const Color(0xFF1677FF),
      panelBackground: widget.panelBackground ??
          ext?.panelBackground ??
          (isDark ? const Color(0xFF1F1F1F) : Colors.white),
      columnHighlightColor: widget.columnHighlightColor ??
          ext?.columnHighlightColor ??
          (isDark ? const Color(0xFF262626) : const Color(0xFFF5F5F5)),
      borderColor:
          borderColor,
      borderRadius: widget.borderRadius ??
          ext?.borderRadius ??
          BorderRadius.circular(6),
      fillColor: widget.fillColor ??
          ext?.fillColor ??
          (isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF5F5F5)),
      textStyle:
          (widget.textStyle ?? ext?.textStyle ?? const TextStyle()).copyWith(fontSize: fontSize, color: isDark ? Colors.white : const Color(0xFF000000E0)),
      placeholderStyle:
          (widget.placeholderStyle ?? ext?.placeholderStyle ?? const TextStyle()).copyWith(fontSize: fontSize, color: const Color(0xFFBFBFBF)),
      itemTextStyle:
          (widget.itemTextStyle ?? ext?.itemTextStyle ?? const TextStyle()).copyWith(fontSize: 14, color: isDark ? Colors.white70 : const Color(0xFF000000E0)),
      itemHeight: widget.itemHeight ??
          ext?.itemHeight ??
          36,
      columnWidth: widget.columnWidth ??
          ext?.columnWidth ??
          56,
      fieldHeight:
          fieldHeight,
      fontSize:
          fontSize,
      iconSize:
          iconSize,
      horizontalPadding:
          hPad,
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(
      BuildContext
          context) {
    final tokens =
        _resolveTokens(context);
    final hasValue =
        _effectiveValue != null;
    final displayText =
        _formatDisplay(_effectiveValue);
    final bool showClear = widget.allowClear &&
        hasValue &&
        _hovered &&
        !widget.disabled;

    // Border decoration based on variant
    BoxDecoration
        fieldDecoration;
    switch (
        widget.variant) {
      case STimePickerVariant.filled:
        fieldDecoration = BoxDecoration(
          color: widget.disabled ? const Color(0xFFF5F5F5) : tokens.fillColor,
          borderRadius: tokens.borderRadius,
        );
        break;
      case STimePickerVariant.borderless:
        fieldDecoration = const BoxDecoration();
        break;
      case STimePickerVariant.underlined:
        fieldDecoration = BoxDecoration(
          border: Border(bottom: BorderSide(color: widget.disabled ? const Color(0xFFD9D9D9) : tokens.borderColor)),
        );
        break;
      case STimePickerVariant.outlined:
        fieldDecoration = BoxDecoration(
          color: widget.disabled ? const Color(0xFFF5F5F5) : Colors.transparent,
          border: Border.all(color: widget.disabled ? const Color(0xFFD9D9D9) : tokens.borderColor),
          borderRadius: tokens.borderRadius,
        );
    }

    final Widget
        triggerField =
        MouseRegion(
      cursor: widget.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onEnter: (_) =>
          setState(() => _hovered = true),
      onExit: (_) =>
          setState(() => _hovered = false),
      child:
          GestureDetector(
        onTap: _isPanelOpen ? () => _closePanel() : _openPanel,
        child: CompositedTransformTarget(
          link: _layerLink,
          child: Container(
            key: _triggerKey,
            height: tokens.fieldHeight,
            padding: EdgeInsets.symmetric(horizontal: tokens.horizontalPadding),
            decoration: fieldDecoration,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Prefix
                if (widget.prefix != null) ...[
                  widget.prefix!,
                  const SizedBox(width: 6),
                ],
                // Time text / placeholder
                Expanded(
                  child: Text(
                    hasValue ? displayText : widget.placeholder,
                    style: hasValue ? tokens.textStyle : tokens.placeholderStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Clear or suffix icon
                if (showClear)
                  GestureDetector(
                    onTap: _clearValue,
                    child: Icon(Icons.cancel, size: tokens.iconSize, color: const Color(0xFFBFBFBF)),
                  )
                else ...[
                  widget.suffixIcon ?? Icon(Icons.access_time, size: tokens.iconSize, color: widget.disabled ? const Color(0xFFBFBFBF) : const Color(0xFF8C8C8C)),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    return triggerField;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Overlay widget
// ─────────────────────────────────────────────────────────────────────────────

class _TimePickerOverlay
    extends StatefulWidget {
  const _TimePickerOverlay({
    required this.layerLink,
    required this.state,
  });

  final LayerLink
      layerLink;
  final _STimePickerState
      state;

  @override
  State<_TimePickerOverlay>
      createState() =>
          _TimePickerOverlayState();
}

class _TimePickerOverlayState
    extends State<
        _TimePickerOverlay>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _animCtrl;
  late Animation<double>
      _fadeAnim;

  @override
  void
      initState() {
    super
        .initState();
    _animCtrl = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150));
    _fadeAnim = CurvedAnimation(
        parent: _animCtrl,
        curve: Curves.easeOut);
    _animCtrl
        .forward();
  }

  @override
  void
      dispose() {
    _animCtrl
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final s =
        widget.state;
    final tokens =
        s._resolveTokens(context);
    final panelWidth = _panelWidth(
        s,
        tokens);

    return Stack(
      children: [
        // Tap-outside to close
        Positioned.fill(
          child: GestureDetector(
            onTap: () => s._closePanel(commit: !s.widget.needConfirm),
            behavior: HitTestBehavior.translucent,
          ),
        ),
        // Panel
        Positioned(
          width: panelWidth,
          child: CompositedTransformFollower(
            link: widget.layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, _triggerHeight(s) + 4),
            child: FadeTransition(
              opacity: _fadeAnim,
              child: Material(
                elevation: 8,
                borderRadius: tokens.borderRadius,
                color: tokens.panelBackground,
                child: _buildPanel(context, s, tokens),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _triggerHeight(
      _STimePickerState
          s) {
    final ctx = s
        ._triggerKey
        .currentContext;
    if (ctx ==
        null)
      return 32;
    final box =
        ctx.findRenderObject() as RenderBox?;
    return box?.size.height ??
        32;
  }

  double _panelWidth(
      _STimePickerState
          s,
      _TimePickerTokens
          tokens) {
    int colCount =
        0;
    colCount++; // hours
    if (s
        ._showMinutes)
      colCount++;
    if (s
        ._showSeconds)
      colCount++;
    if (s
        ._show12h)
      colCount++;
    return colCount * tokens.columnWidth +
        (colCount - 1) +
        2;
  }

  Widget _buildPanel(
      BuildContext
          ctx,
      _STimePickerState
          s,
      _TimePickerTokens
          tokens) {
    const panelHeight =
        216.0; // 6 items visible

    return Column(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        // Column selectors row
        SizedBox(
          height: panelHeight,
          child: Stack(
            children: [
              // Highlight stripe in the middle (selected item)
              Positioned(
                left: 0,
                right: 0,
                top: (panelHeight - tokens.itemHeight) / 2,
                height: tokens.itemHeight,
                child: Container(color: tokens.columnHighlightColor),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildColumn(
                    ctx,
                    s,
                    tokens,
                    items: s._hours,
                    controller: s._hourCtrl,
                    // In 12h mode: 0 → "12", 1–11 → "01"…"11"
                    label: (v) => s._show12h ? (v == 0 ? '12' : v.toString().padLeft(2, '0')) : v.toString().padLeft(2, '0'),
                    onSelected: (v) {
                      s._pendingHour = v;
                      if (!s.widget.needConfirm && !s.widget.changeOnScroll) {
                        s._commitPending();
                      }
                    },
                  ),
                  if (s._showMinutes) ...[
                    _buildDivider(tokens),
                    _buildColumn(
                      ctx,
                      s,
                      tokens,
                      items: s._minutes,
                      controller: s._minuteCtrl,
                      label: (v) => v.toString().padLeft(2, '0'),
                      onSelected: (v) {
                        s._pendingMinute = v;
                        if (!s.widget.needConfirm && !s.widget.changeOnScroll) {
                          s._commitPending();
                        }
                      },
                    ),
                  ],
                  if (s._showSeconds) ...[
                    _buildDivider(tokens),
                    _buildColumn(
                      ctx,
                      s,
                      tokens,
                      items: s._seconds,
                      controller: s._secondCtrl,
                      label: (v) => v.toString().padLeft(2, '0'),
                      onSelected: (v) {
                        s._pendingSecond = v;
                        if (!s.widget.needConfirm && !s.widget.changeOnScroll) {
                          s._commitPending();
                        }
                      },
                    ),
                  ],
                  if (s._show12h) ...[
                    _buildDivider(tokens),
                    _buildColumn(
                      ctx,
                      s,
                      tokens,
                      items: const [0, 1],
                      controller: s._amPmCtrl,
                      label: (v) => v == 0 ? 'AM' : 'PM',
                      onSelected: (v) {
                        s._pendingIsPm = v == 1;
                        if (!s.widget.needConfirm && !s.widget.changeOnScroll) {
                          s._commitPending();
                        }
                      },
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        // Footer: extra content + OK if needConfirm
        if (s.widget.renderExtraFooter != null || s.widget.needConfirm)
          _buildFooter(ctx, s, tokens),
      ],
    );
  }

  Widget _buildDivider(_TimePickerTokens tokens) => Container(
      width:
          1,
      color:
          const Color(0x1A000000));

  Widget
      _buildColumn(
    BuildContext
        ctx,
    _STimePickerState
        s,
    _TimePickerTokens
        tokens, {
    required List<int>
        items,
    required FixedExtentScrollController
        controller,
    required String Function(int)
        label,
    required void Function(int)
        onSelected,
  }) {
    return SizedBox(
      width:
          tokens.columnWidth,
      child:
          ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: tokens.itemHeight,
        physics: const FixedExtentScrollPhysics(),
        perspective: 0.003,
        onSelectedItemChanged: (idx) {
          onSelected(items[idx]);
          if (s.widget.changeOnScroll && !s.widget.needConfirm) {
            s._commitPending();
            s._rebuildOverlay();
          }
          setState(() {});
        },
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: items.length,
          builder: (_, idx) {
            final v = items[idx];
            final isSelected = controller.hasClients && controller.selectedItem == idx;
            return GestureDetector(
              onTap: () {
                controller.animateToItem(idx, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  label(v),
                  style: tokens.itemTextStyle.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? tokens.activeColor : tokens.itemTextStyle.color,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFooter(
      BuildContext
          ctx,
      _STimePickerState
          s,
      _TimePickerTokens
          tokens) {
    return Container(
      decoration:
          BoxDecoration(
        border: const Border(top: BorderSide(color: Color(0x1A000000))),
        color: tokens.panelBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: tokens.borderRadius.bottomLeft,
          bottomRight: tokens.borderRadius.bottomRight,
        ),
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child:
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (s.widget.renderExtraFooter != null) Expanded(child: s.widget.renderExtraFooter!()),
          if (s.widget.needConfirm)
            GestureDetector(
              onTap: () => s._closePanel(commit: true),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: tokens.activeColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('OK', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  STimeRangePicker
// ─────────────────────────────────────────────────────────────────────────────

/// A time range picker that shows two [STimePicker] fields side by side.
///
/// ```dart
/// STimeRangePicker(
///   onRangeChange: (start, end) => print('$start → $end'),
/// )
/// ```
class STimeRangePicker
    extends StatefulWidget {
  const STimeRangePicker({
    super.key,
    this.defaultValue,
    this.value,
    this.onRangeChange,
    this.format =
        'HH:mm:ss',
    this.use12Hours =
        false,
    this.hourStep =
        1,
    this.minuteStep =
        1,
    this.secondStep =
        1,
    this.disabled =
        false,
    this.placeholder =
        const (
      'Start time',
      'End time'
    ),
    this.size =
        STimePickerSize.middle,
    this.variant =
        STimePickerVariant.outlined,
    this.status =
        STimePickerStatus.none,
    this.allowClear =
        true,
    this.prefix,
    this.needConfirm =
        false,
    this.activeColor,
    this.borderColor,
    this.borderRadius,
  });

  final (
    TimeOfDay?,
    TimeOfDay?
  )? defaultValue;
  final (
    TimeOfDay?,
    TimeOfDay?
  )? value;
  final void Function(
      TimeOfDay?
          start,
      TimeOfDay?
          end)? onRangeChange;
  final String
      format;
  final bool
      use12Hours;
  final int
      hourStep;
  final int
      minuteStep;
  final int
      secondStep;
  final bool
      disabled;
  final (
    String,
    String
  ) placeholder;
  final STimePickerSize
      size;
  final STimePickerVariant
      variant;
  final STimePickerStatus
      status;
  final bool
      allowClear;
  final Widget?
      prefix;
  final bool
      needConfirm;
  final Color?
      activeColor;
  final Color?
      borderColor;
  final BorderRadius?
      borderRadius;

  @override
  State<STimeRangePicker>
      createState() =>
          _STimeRangePickerState();
}

class _STimeRangePickerState
    extends State<
        STimeRangePicker> {
  TimeOfDay?
      _start;
  TimeOfDay?
      _end;

  @override
  void
      initState() {
    super
        .initState();
    if (widget.defaultValue !=
        null) {
      _start =
          widget.defaultValue!.$1;
      _end =
          widget.defaultValue!.$2;
    }
  }

  TimeOfDay? get _effectiveStart =>
      widget.value?.$1 ??
      _start;
  TimeOfDay? get _effectiveEnd =>
      widget.value?.$2 ??
      _end;

  @override
  Widget build(
      BuildContext
          context) {
    return Wrap(
      spacing:
          8,
      runSpacing:
          8,
      children: [
        STimePicker(
          value: _effectiveStart,
          format: widget.format,
          use12Hours: widget.use12Hours,
          hourStep: widget.hourStep,
          minuteStep: widget.minuteStep,
          secondStep: widget.secondStep,
          disabled: widget.disabled,
          placeholder: widget.placeholder.$1,
          size: widget.size,
          variant: widget.variant,
          status: widget.status,
          allowClear: widget.allowClear,
          prefix: widget.prefix,
          needConfirm: widget.needConfirm,
          activeColor: widget.activeColor,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          onChange: (t) {
            setState(() => _start = t);
            widget.onRangeChange?.call(t, _effectiveEnd);
          },
        ),
        STimePicker(
          value: _effectiveEnd,
          format: widget.format,
          use12Hours: widget.use12Hours,
          hourStep: widget.hourStep,
          minuteStep: widget.minuteStep,
          secondStep: widget.secondStep,
          disabled: widget.disabled,
          placeholder: widget.placeholder.$2,
          size: widget.size,
          variant: widget.variant,
          status: widget.status,
          allowClear: widget.allowClear,
          prefix: widget.prefix,
          needConfirm: widget.needConfirm,
          activeColor: widget.activeColor,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          onChange: (t) {
            setState(() => _end = t);
            widget.onRangeChange?.call(_effectiveStart, t);
          },
        ),
      ],
    );
  }
}

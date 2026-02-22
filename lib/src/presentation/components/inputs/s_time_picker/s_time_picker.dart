import 'package:flutter/material.dart';
import '../../../../domain/entities/config/s_time_picker_enums.dart';
import '../../../themes/s_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  Format helpers
// ─────────────────────────────────────────────────────────────────────────────

bool _hasSeconds(
        String
            fmt) =>
    fmt.contains(
        's');
bool _hasMinutes(
        String
            fmt) =>
    fmt.contains(
        'm');
bool _hasAmPm(
        String
            fmt) =>
    fmt.contains('a') ||
    fmt.contains(
        'A') ||
    fmt.contains(
        'h');

String
    _formatDisplay({
  required int
      h24,
  required int
      m,
  required int
      s,
  required String
      fmt,
}) {
  final bool
      is12 =
      _hasAmPm(fmt);
  final bool
      isPm =
      h24 >=
          12;
  String
      r =
      fmt;
  if (is12) {
    final h12 = h24 == 0
        ? 12
        : (h24 > 12 ? h24 - 12 : h24);
    r = r.replaceAll(
        'HH',
        h24.toString().padLeft(2, '0'));
    r = r.replaceAll(
        'H',
        h24.toString());
    r = r.replaceAll(
        'hh',
        h12.toString().padLeft(2, '0'));
    r = r.replaceAll(
        'h',
        h12.toString());
    r = r.replaceAll(
        'A',
        isPm ? 'PM' : 'AM');
    r = r.replaceAll(
        'a',
        isPm ? 'pm' : 'am');
  } else {
    r = r.replaceAll(
        'HH',
        h24.toString().padLeft(2, '0'));
    r = r.replaceAll(
        'H',
        h24.toString());
  }
  r = r.replaceAll(
      'mm',
      m.toString().padLeft(2,
          '0'));
  r = r.replaceAll(
      'm',
      m.toString());
  r = r.replaceAll(
      'ss',
      s.toString().padLeft(2,
          '0'));
  r = r.replaceAll(
      's',
      s.toString());
  return r;
}

int _to24(
    int
        displayH,
    bool
        isPm) {
  if (displayH ==
      0)
    return isPm
        ? 12
        : 0;
  return isPm
      ? displayH +
          12
      : displayH;
}

// ─────────────────────────────────────────────────────────────────────────────
//  Token bag
// ─────────────────────────────────────────────────────────────────────────────

class _Tok {
  const _Tok({
    required this.primary,
    required this.panelBg,
    required this.highlightBg,
    required this.borderColor,
    required this.radius,
    required this.fillBg,
    required this.textStyle,
    required this.placeholderStyle,
    required this.itemStyle,
    required this.itemH,
    required this.colW,
    required this.fieldH,
    required this.hPad,
    required this.iconSz,
  });

  final Color
      primary;
  final Color
      panelBg;
  final Color
      highlightBg;
  final Color
      borderColor;
  final BorderRadius
      radius;
  final Color
      fillBg;
  final TextStyle
      textStyle;
  final TextStyle
      placeholderStyle;
  final TextStyle
      itemStyle;
  final double
      itemH;
  final double
      colW;
  final double
      fieldH;
  final double
      hPad;
  final double
      iconSz;
}

// ─────────────────────────────────────────────────────────────────────────────
//  Scrollable column  (one per time unit)
// ─────────────────────────────────────────────────────────────────────────────

/// A single scrollable column that snaps to items.
/// Parent must give it tight [BoxConstraints] (use explicit SizedBox).
class _TimeColumn
    extends StatefulWidget {
  const _TimeColumn({
    required this.items,
    required this.selectedIndex,
    required this.label,
    required this.itemH,
    required this.primary,
    required this.highlightBg,
    required this.itemStyle,
    required this.onSelected,
    this.onLiveScroll,
  });

  final List<int>
      items;
  final int
      selectedIndex;
  final String
          Function(int value)
      label;
  final double
      itemH;
  final Color
      primary;
  final Color
      highlightBg;
  final TextStyle
      itemStyle;
  final void
          Function(int index)
      onSelected;
  final void
          Function(int index)?
      onLiveScroll;

  @override
  State<_TimeColumn>
      createState() =>
          _TimeColumnState();
}

class _TimeColumnState
    extends State<
        _TimeColumn> {
  late ScrollController
      _sc;
  int _current =
      0;
  bool
      _dragging =
      false;

  @override
  void
      initState() {
    super
        .initState();
    _current = widget.selectedIndex.clamp(
        0,
        _maxIdx);
    _sc =
        ScrollController(initialScrollOffset: _current * widget.itemH);
    _sc.addListener(
        _onScroll);
  }

  int get _maxIdx => (widget.items.length - 1).clamp(
      0,
      9999);

  @override
  void didUpdateWidget(
      _TimeColumn
          old) {
    super.didUpdateWidget(
        old);
    if (old.selectedIndex != widget.selectedIndex &&
        !_dragging) {
      final target =
          widget.selectedIndex.clamp(0, _maxIdx);
      if (target !=
          _current) {
        _current = target;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || !_sc.hasClients) return;
          _sc.animateTo(
            target * widget.itemH,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        });
      }
    }
  }

  @override
  void
      dispose() {
    _sc.removeListener(
        _onScroll);
    _sc.dispose();
    super
        .dispose();
  }

  void
      _onScroll() {
    if (!_sc
        .hasClients)
      return;
    final raw =
        (_sc.offset / widget.itemH).round();
    final idx = raw.clamp(
        0,
        _maxIdx);
    if (idx !=
        _current) {
      setState(() =>
          _current = idx);
      widget.onLiveScroll?.call(idx);
    }
  }

  void
      _snap() {
    if (!mounted ||
        !_sc.hasClients)
      return;
    final target =
        _current * widget.itemH;
    if ((_sc.offset - target).abs() >
        0.5) {
      _sc.animateTo(target,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut);
    }
    widget
        .onSelected(_current);
  }

  void _tapItem(
      int idx) {
    if (idx ==
        _current)
      return;
    setState(() =>
        _current = idx);
    if (_sc
        .hasClients) {
      _sc.animateTo(idx * widget.itemH,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut);
    }
    widget
        .onSelected(idx);
  }

  @override
  Widget build(
      BuildContext
          context) {
    return NotificationListener<
        ScrollNotification>(
      onNotification:
          (n) {
        if (n is ScrollStartNotification)
          _dragging = true;
        if (n is ScrollEndNotification) {
          _dragging = false;
          WidgetsBinding.instance.addPostFrameCallback((_) => _snap());
        }
        return false;
      },
      child:
          ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          controller: _sc,
          // Padding top + bottom = half the column height minus half an item
          // so item 0 centres when scrolled to top.
          // Column height = 7 * itemH; centre = 3 * itemH from top.
          padding: EdgeInsets.symmetric(vertical: widget.itemH * 3),
          itemCount: widget.items.length,
          itemExtent: widget.itemH,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (ctx, i) {
            final sel = i == _current;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _tapItem(i),
              child: Container(
                alignment: Alignment.center,
                color: sel ? widget.highlightBg : Colors.transparent,
                child: Text(
                  widget.label(widget.items[i]),
                  style: widget.itemStyle.copyWith(
                    color: sel ? widget.primary : STheme.of(context).colorToken.textPrimary,
                    fontWeight: sel ? FontWeight.w600 : FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  STimePicker
// ─────────────────────────────────────────────────────────────────────────────

/// Time picker for Flutter.
///
/// **Commit rules:**
/// * Default → value commits when panel is dismissed (OK or tap-outside).
/// * `needConfirm: true` → only when the user taps **OK**.
/// * `changeOnScroll: true` → `onChange` fires live on every column snap.
class STimePicker
    extends StatefulWidget {
  const STimePicker({
    super.key,
    this.value,
    this.defaultValue,
    this.defaultOpenValue,
    this.onChange,
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
    this.needConfirm =
        false,
    this.changeOnScroll =
        false,
    this.showNow =
        true,
    this.renderExtraFooter,
    this.open,
    this.onOpenChange,
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

  final TimeOfDay?
      value;
  final TimeOfDay?
      defaultValue;
  final TimeOfDay?
      defaultOpenValue;
  final ValueChanged<TimeOfDay?>?
      onChange;

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
  final String
      placeholder;
  final STimePickerSize
      size;
  final STimePickerVariant
      variant;
  final STimePickerStatus
      status;
  final bool
      allowClear;
  final Widget?
      suffixIcon;
  final Widget?
      prefix;

  final bool
      needConfirm;
  final bool
      changeOnScroll;
  final bool
      showNow;
  final Widget
          Function()?
      renderExtraFooter;

  final bool?
      open;
  final ValueChanged<bool>?
      onOpenChange;

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
        STimePicker> {
  // Committed (uncontrolled) value
  TimeOfDay?
      _committed;
  int _committedSec =
      0;

  // Pending values – indices into the respective items lists
  int _phIdx =
      0; // hour column index
  int _pmIdx =
      0; // minute column index
  int _psIdx =
      0; // second column index
  int _apIdx =
      0; // AM/PM index (0=AM,1=PM)

  bool
      _panelOpen =
      false;
  OverlayEntry?
      _entry;
  final LayerLink
      _link =
      LayerLink();
  final GlobalKey
      _fieldKey =
      GlobalKey();
  bool
      _hovered =
      false;

  // ── Derived ────────────────────────────────────────────────────────────────

  bool get _is12h =>
      widget.use12Hours ||
      _hasAmPm(widget.format);
  bool get _showMin =>
      _hasMinutes(widget.format);
  bool get _showSec =>
      _hasSeconds(widget.format);
  bool get _isOpen => widget.open !=
          null
      ? widget.open!
      : _panelOpen;
  TimeOfDay? get _effective =>
      widget.value ??
      _committed;

  List<int>
      get _hourItems {
    final max = _is12h
        ? 12
        : 24;
    return [
      for (int i = 0;
          i < max;
          i += widget.hourStep)
        i
    ];
  }

  List<int>
      get _minItems =>
          [
            for (int i = 0; i < 60; i += widget.minuteStep) i
          ];

  List<int>
      get _secItems =>
          [
            for (int i = 0; i < 60; i += widget.secondStep) i
          ];

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void
      initState() {
    super
        .initState();
    final base = widget.defaultValue ??
        widget.value ??
        widget.defaultOpenValue ??
        const TimeOfDay(hour: 0, minute: 0);
    _syncPending(
        base,
        sec: 0);
  }

  @override
  void didUpdateWidget(
      STimePicker
          old) {
    super.didUpdateWidget(
        old);
    if (widget.value != old.value &&
        widget.value != null &&
        !_isOpen) {
      _syncPending(widget.value!,
          sec: 0);
    }
  }

  @override
  void
      dispose() {
    _removeEntry();
    super
        .dispose();
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  int _nearest(
      List<int>
          items,
      int val) {
    if (items
        .isEmpty)
      return 0;
    int best = 0,
        bestD = (items[0] - val).abs();
    for (int i = 1;
        i < items.length;
        i++) {
      final d =
          (items[i] - val).abs();
      if (d <
          bestD) {
        bestD = d;
        best = i;
      }
    }
    return best;
  }

  void _syncPending(
      TimeOfDay
          t,
      {int sec =
          0}) {
    _apIdx = t.hour >= 12
        ? 1
        : 0;
    if (_is12h) {
      final h12 = t.hour == 0
          ? 0
          : (t.hour > 12 ? t.hour - 12 : t.hour) % 12;
      _phIdx =
          _nearest(_hourItems, h12);
    } else {
      _phIdx =
          _nearest(_hourItems, t.hour);
    }
    _pmIdx = _nearest(
        _minItems,
        t.minute);
    _psIdx = _nearest(
        _secItems,
        sec);
  }

  TimeOfDay
      get _pendingTime {
    final hVal = _hourItems[_phIdx.clamp(
        0,
        _hourItems.length - 1)];
    final mVal = _minItems[_pmIdx.clamp(
        0,
        _minItems.length - 1)];
    final h24 = _is12h
        ? _to24(hVal, _apIdx == 1)
        : hVal;
    return TimeOfDay(
        hour: h24,
        minute: mVal);
  }

  int get _pendingSec => _secItems.isEmpty
      ? 0
      : _secItems[_psIdx.clamp(0,
          _secItems.length - 1)];

  // ── Open / close ───────────────────────────────────────────────────────────

  void
      _open() {
    if (widget
        .disabled)
      return;
    if (widget.open !=
        null) {
      widget.onOpenChange?.call(true);
      return;
    }
    final base = _effective ??
        widget.defaultOpenValue ??
        const TimeOfDay(hour: 0, minute: 0);
    _syncPending(
        base,
        sec: _committedSec);
    setState(() =>
        _panelOpen = true);
    widget
        .onOpenChange
        ?.call(true);
    _insertEntry();
  }

  void _dismiss(
      {required bool
          commit}) {
    if (widget.open !=
        null) {
      widget.onOpenChange?.call(false);
      return;
    }
    if (commit)
      _doCommit();
    setState(() =>
        _panelOpen = false);
    widget
        .onOpenChange
        ?.call(false);
    _removeEntry();
  }

  void
      _confirm() {
    _doCommit();
    setState(() =>
        _panelOpen = false);
    widget
        .onOpenChange
        ?.call(false);
    _removeEntry();
  }

  void
      _doCommit() {
    final t =
        _pendingTime;
    final s =
        _pendingSec;
    if (widget.value ==
        null) {
      setState(() {
        _committed = t;
        _committedSec = s;
      });
    }
    widget
        .onChange
        ?.call(t);
  }

  void
      _setNow() {
    final now =
        DateTime.now();
    _syncPending(
        TimeOfDay.fromDateTime(now),
        sec: now.second);
    setState(
        () {});
    _rebuildEntry();
    if (widget
        .changeOnScroll)
      _doCommit();
  }

  void
      _clear() {
    setState(
        () {
      _committed =
          null;
      _committedSec =
          0;
      _syncPending(widget.defaultOpenValue ?? const TimeOfDay(hour: 0, minute: 0),
          sec: 0);
    });
    widget
        .onChange
        ?.call(null);
  }

  // ── Overlay ────────────────────────────────────────────────────────────────

  void
      _insertEntry() {
    _removeEntry();
    _entry =
        OverlayEntry(builder: (ctx) => _PanelOverlay(link: _link, state: this));
    Overlay.of(context)
        .insert(_entry!);
  }

  void
      _removeEntry() {
    _entry
        ?.remove();
    _entry =
        null;
  }

  void _rebuildEntry() =>
      _entry?.markNeedsBuild();

  // ── Tokens ─────────────────────────────────────────────────────────────────

  _Tok _tok(
      BuildContext
          ctx) {
    final th =
        STheme.of(ctx);
    final ext =
        th.timePickerTheme;

    double
        fh,
        hp,
        iz,
        fs;
    switch (
        widget.size) {
      case STimePickerSize.large:
        fh = 40;
        hp = 12;
        iz = 18;
        fs = 16;
        break;
      case STimePickerSize.small:
        fh = 24;
        hp = 7;
        iz = 12;
        fs = 12;
        break;
      default:
        fh = 32;
        hp = 11;
        iz = 14;
        fs = 14;
    }

    Color
        bc;
    switch (
        widget.status) {
      case STimePickerStatus.error:
        bc = th.colorToken.error;
        break;
      case STimePickerStatus.warning:
        bc = const Color(0xFFFAAD14); // Keep warning as amber
        break;
      default:
        bc = widget.borderColor ?? ext.borderColor ?? th.colorToken.divider;
    }

    final primary = widget.activeColor ??
        ext.activeColor ??
        th.colorToken.primary;
    final panelBg = widget.panelBackground ??
        ext.panelBackground ??
        th.colorToken.surface;

    return _Tok(
      primary:
          primary,
      panelBg:
          panelBg,
      highlightBg: widget.columnHighlightColor ??
          ext.columnHighlightColor ??
          primary.withOpacity(0.08),
      borderColor:
          bc,
      radius: widget.borderRadius ??
          ext.borderRadius ??
          BorderRadius.circular(6),
      fillBg: widget.fillColor ??
          ext.fillColor ??
          th.colorToken.background,
      textStyle:
          (widget.textStyle ?? ext.textStyle ?? const TextStyle()).copyWith(fontSize: fs, color: th.colorToken.textPrimary),
      placeholderStyle:
          (widget.placeholderStyle ?? ext.placeholderStyle ?? const TextStyle()).copyWith(fontSize: fs, color: th.colorToken.textSecondary),
      itemStyle:
          (widget.itemTextStyle ?? ext.itemTextStyle ?? const TextStyle()).copyWith(fontSize: 14, color: th.colorToken.textPrimary),
      itemH: widget.itemHeight ??
          ext.itemHeight ??
          32,
      colW: widget.columnWidth ??
          ext.columnWidth ??
          56,
      fieldH:
          fh,
      hPad:
          hp,
      iconSz:
          iz,
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(
      BuildContext
          context) {
    final th =
        STheme.of(context);
    final tk =
        _tok(context);
    final t =
        _effective;
    final hasVal =
        t != null;
    final display = hasVal
        ? _formatDisplay(h24: t.hour, m: t.minute, s: _committedSec, fmt: widget.format)
        : '';
    final showClear = widget.allowClear &&
        hasVal &&
        _hovered &&
        !widget.disabled;

    BoxDecoration
        deco;
    switch (
        widget.variant) {
      case STimePickerVariant.filled:
        deco = BoxDecoration(
          color: widget.disabled ? const Color(0xFFF5F5F5) : tk.fillBg,
          borderRadius: tk.radius,
        );
        break;
      case STimePickerVariant.borderless:
        deco = const BoxDecoration();
        break;
      case STimePickerVariant.underlined:
        deco = BoxDecoration(
          border: Border(
            bottom: BorderSide(color: widget.disabled ? th.colorToken.divider : tk.borderColor),
          ),
        );
        break;
      default:
        deco = BoxDecoration(
          color: widget.disabled ? th.colorToken.background : Colors.transparent,
          border: Border.all(color: widget.disabled ? th.colorToken.divider : tk.borderColor),
          borderRadius: tk.radius,
        );
    }

    return MouseRegion(
      onEnter: (_) =>
          setState(() => _hovered = true),
      onExit: (_) =>
          setState(() => _hovered = false),
      cursor: widget.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child:
          GestureDetector(
        onTap: _isOpen ? () => _dismiss(commit: !widget.needConfirm) : _open,
        child: CompositedTransformTarget(
          link: _link,
          child: Container(
            key: _fieldKey,
            height: tk.fieldH,
            padding: EdgeInsets.symmetric(horizontal: tk.hPad),
            decoration: deco,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.prefix != null) ...[
                  widget.prefix!,
                  const SizedBox(width: 6),
                ],
                Expanded(
                  child: Text(
                    hasVal ? display : widget.placeholder,
                    style: hasVal ? tk.textStyle : tk.placeholderStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                if (showClear)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _clear,
                    child: Icon(Icons.cancel, size: tk.iconSz, color: th.colorToken.textSecondary),
                  )
                else
                  widget.suffixIcon ?? Icon(Icons.access_time, size: tk.iconSz, color: widget.disabled ? th.colorToken.disabled : th.colorToken.textSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Panel overlay
// ─────────────────────────────────────────────────────────────────────────────

class _PanelOverlay
    extends StatefulWidget {
  const _PanelOverlay(
      {required this.link,
      required this.state});
  final LayerLink
      link;
  final _STimePickerState
      state;

  @override
  State<_PanelOverlay>
      createState() =>
          _PanelOverlayState();
}

class _PanelOverlayState
    extends State<
        _PanelOverlay>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _ac;
  late Animation<double>
      _fade;

  @override
  void
      initState() {
    super
        .initState();
    _ac = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150));
    _fade = CurvedAnimation(
        parent: _ac,
        curve: Curves.easeOut);
    _ac.forward();
  }

  @override
  void
      dispose() {
    _ac.dispose();
    super
        .dispose();
  }

  /// Returns (fieldHeight, fieldBottomY-in-screen-coords).
  (
    double,
    double
  ) _fieldMetrics() {
    final ctx = widget
        .state
        ._fieldKey
        .currentContext;
    if (ctx ==
        null)
      return (
        32,
        0
      );
    final rb =
        ctx.findRenderObject() as RenderBox?;
    if (rb ==
        null)
      return (
        32,
        0
      );
    final h = rb
        .size
        .height;
    final topY = rb
        .localToGlobal(Offset.zero)
        .dy;
    return (
      h,
      topY +
          h
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final s =
        widget.state;
    final tk =
        s._tok(context);

    int cols =
        1;
    if (s
        ._showMin)
      cols++;
    if (s
        ._showSec)
      cols++;
    if (s
        ._is12h)
      cols++;

    final panelW =
        cols * tk.colW + (cols - 1) * 1.0;
    // panelH = 7 rows + footer
    final panelH =
        tk.itemH * 7 + 40;
    const gap =
        4.0;
    const screenPad =
        8.0;

    final (
      fieldH,
      fieldBottomY
    ) = _fieldMetrics();
    final screenH =
        MediaQuery.sizeOf(context).height;
    final spaceBelow = screenH -
        fieldBottomY -
        gap -
        screenPad;
    final showAbove =
        spaceBelow < panelH;

    // When showing above: negative offset = (panelH + gap) upward from top of field.
    final yOffset = showAbove
        ? -(panelH + gap)
        : fieldH + gap;

    return Stack(
      children: [
        // Tap outside → dismiss
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => s._dismiss(commit: !s.widget.needConfirm),
          ),
        ),
        // Panel
        Positioned(
          width: panelW,
          child: CompositedTransformFollower(
            link: widget.link,
            showWhenUnlinked: false,
            offset: Offset(0, yOffset),
            child: FadeTransition(
              opacity: _fade,
              child: Material(
                elevation: 8,
                borderRadius: tk.radius,
                color: tk.panelBg,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildColumns(tk, s),
                    _buildFooter(tk, s),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Columns area ────────────────────────────────────────────────────────────

  Widget _buildColumns(
      _Tok
          tk,
      _STimePickerState
          s) {
    // 7 visible rows: 3 above + selected + 3 below
    final double
        colH =
        tk.itemH * 7;

    // Helper to build one column with a fixed-size box
    Widget col({
      required List<int>
          items,
      required int
          selIdx,
      required String Function(int)
          label,
      required void Function(int)
          onSelected,
      void Function(int)?
          onLive,
    }) =>
        SizedBox(
          width: tk.colW,
          height: colH,
          child: _TimeColumn(
            items: items,
            selectedIndex: selIdx,
            label: label,
            itemH: tk.itemH,
            primary: tk.primary,
            highlightBg: tk.highlightBg,
            itemStyle: tk.itemStyle,
            onSelected: onSelected,
            onLiveScroll: onLive,
          ),
        );

    Widget div() => Container(
        width: 1,
        height: colH,
        color: tk.borderColor.withOpacity(0.1));

    return SizedBox(
      height:
          colH,
      child:
          Stack(
        children: [
          // ① Column list
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Hours
              col(
                items: s._hourItems,
                selIdx: s._phIdx,
                label: (v) => s._is12h ? (v == 0 ? '12' : v.toString().padLeft(2, '0')) : v.toString().padLeft(2, '0'),
                onSelected: (i) {
                  s._phIdx = i;
                  if (s.widget.changeOnScroll && !s.widget.needConfirm) {
                    s._doCommit();
                  }
                },
                onLive: s.widget.changeOnScroll
                    ? (i) {
                        s._phIdx = i;
                        if (!s.widget.needConfirm) s._doCommit();
                      }
                    : null,
              ),
              if (s._showMin) ...[
                div(),
                col(
                  items: s._minItems,
                  selIdx: s._pmIdx,
                  label: (v) => v.toString().padLeft(2, '0'),
                  onSelected: (i) {
                    s._pmIdx = i;
                    if (s.widget.changeOnScroll && !s.widget.needConfirm) {
                      s._doCommit();
                    }
                  },
                  onLive: s.widget.changeOnScroll
                      ? (i) {
                          s._pmIdx = i;
                          if (!s.widget.needConfirm) s._doCommit();
                        }
                      : null,
                ),
              ],
              if (s._showSec) ...[
                div(),
                col(
                  items: s._secItems,
                  selIdx: s._psIdx,
                  label: (v) => v.toString().padLeft(2, '0'),
                  onSelected: (i) {
                    s._psIdx = i;
                    if (s.widget.changeOnScroll && !s.widget.needConfirm) {
                      s._doCommit();
                    }
                  },
                  onLive: s.widget.changeOnScroll
                      ? (i) {
                          s._psIdx = i;
                          if (!s.widget.needConfirm) s._doCommit();
                        }
                      : null,
                ),
              ],
              if (s._is12h) ...[
                div(),
                col(
                  items: const [0, 1],
                  selIdx: s._apIdx,
                  label: (v) => v == 0 ? 'AM' : 'PM',
                  onSelected: (i) {
                    s._apIdx = i;
                    if (s.widget.changeOnScroll && !s.widget.needConfirm) {
                      s._doCommit();
                    }
                  },
                  onLive: s.widget.changeOnScroll
                      ? (i) {
                          s._apIdx = i;
                          if (!s.widget.needConfirm) s._doCommit();
                        }
                      : null,
                ),
              ],
            ],
          ),

          // ② Top gradient — fades top 1 item
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: tk.itemH,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      tk.panelBg,
                      tk.panelBg.withOpacity(0)
                    ],
                  ),
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ),

          // ③ Bottom gradient — fades bottom 1 item
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: tk.itemH,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      tk.panelBg,
                      tk.panelBg.withOpacity(0)
                    ],
                  ),
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ),

          // ④ Center stripe — top border
          Positioned(
            left: 0,
            right: 0,
            top: tk.itemH * 3,
            height: 1,
            child: IgnorePointer(
              child: ColoredBox(color: tk.borderColor.withOpacity(0.2)),
            ),
          ),

          // ⑤ Center stripe — bottom border
          Positioned(
            left: 0,
            right: 0,
            top: tk.itemH * 4,
            height: 1,
            child: IgnorePointer(
              child: ColoredBox(color: tk.borderColor.withOpacity(0.2)),
            ),
          ),
        ],
      ),
    );
  }

  // ── Footer ─────────────────────────────────────────────────────────────────

  Widget _buildFooter(
      _Tok
          tk,
      _STimePickerState
          s) {
    return Container(
      height:
          40,
      decoration:
          BoxDecoration(
        border: Border(top: BorderSide(color: tk.borderColor.withOpacity(0.1))),
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: 12),
      child:
          Row(
        children: [
          if (s.widget.showNow)
            GestureDetector(
              onTap: s._setNow,
              child: Text(
                'Now',
                style: TextStyle(
                  fontSize: 13,
                  color: tk.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          if (s.widget.renderExtraFooter != null) ...[
            const SizedBox(width: 8),
            Expanded(child: s.widget.renderExtraFooter!()),
          ] else
            const Spacer(),
          GestureDetector(
            onTap: s._confirm,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: tk.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
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

/// Two [STimePicker] fields side-by-side for selecting a time range.
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
    this.showNow =
        true,
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
  final bool
      showNow;
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
    _start = widget
        .defaultValue
        ?.$1;
    _end = widget
        .defaultValue
        ?.$2;
  }

  TimeOfDay? get _eStart =>
      widget.value?.$1 ??
      _start;
  TimeOfDay? get _eEnd =>
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
          value: _eStart,
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
          showNow: widget.showNow,
          activeColor: widget.activeColor,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          onChange: (t) {
            setState(() => _start = t);
            widget.onRangeChange?.call(t, _eEnd);
          },
        ),
        STimePicker(
          value: _eEnd,
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
          showNow: widget.showNow,
          activeColor: widget.activeColor,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          onChange: (t) {
            setState(() => _end = t);
            widget.onRangeChange?.call(_eStart, t);
          },
        ),
      ],
    );
  }
}

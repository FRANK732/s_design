import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../domain/entities/config/s_pagination_enums.dart';
import '../../../themes/extensions/component_themes/s_pagination_theme.dart';

/// Ant Design–inspired Pagination component for Flutter.
///
/// ## Features (full Ant Design parity)
/// - Page number buttons with automatic ellipsis (…) when there are many pages
/// - Previous / Next navigation arrows
/// - Jump-backward / Jump-forward (skip 5 pages) via ellipsis buttons
/// - **Simple mode** — shows `current / total` input instead of page buttons
/// - **Size changer** — dropdown to choose page size (10 / 20 / 50 / 100)
/// - **Quick jumper** — text field to jump directly to a page number
/// - **showTotal** — renders a total-count label
/// - **itemRender** — fully custom prev/next/page widgets
/// - **disabled** — entire component grayed out
/// - **size** — `normal`, `small`, `large`
/// - **align** — `start`, `center`, `end`
/// - **Controlled mode** — via `current` + `onChange`
/// - **Uncontrolled mode** — via `defaultCurrent`
///
/// ## Open Customizability
/// Per-instance overrides: `activeColor`, `borderRadius`, `itemSize`,
/// `itemSpacing`, `itemTextStyle`, `totalTextStyle`, and more via props.
/// Global defaults via [SPaginationThemeData] registered on [ThemeData].
///
/// ```dart
/// // Basic
/// SPagination(total: 50, defaultCurrent: 1, onChange: (p) {})
///
/// // All features
/// SPagination(
///   total: 85,
///   showSizeChanger: true,
///   showQuickJumper: true,
///   showTotal: (total, range) => '${range[0]}-${range[1]} of $total items',
/// )
///
/// // Controlled
/// SPagination(
///   current: _page,
///   total: 200,
///   onChange: (p) => setState(() => _page = p),
/// )
///
/// // Simple mode
/// SPagination(total: 50, simple: true)
/// ```
class SPagination
    extends StatefulWidget {
  const SPagination({
    super.key,
    this.total =
        0,
    this.current,
    this.defaultCurrent =
        1,
    this.pageSize,
    this.defaultPageSize =
        10,
    this.onChange,
    this.onShowSizeChange,
    this.showSizeChanger =
        false,
    this.pageSizeOptions =
        const [
      10,
      20,
      50,
      100
    ],
    this.showQuickJumper =
        false,
    this.showTotal,
    this.simple =
        false,
    this.disabled =
        false,
    this.size =
        SPaginationSize.normal,
    this.align =
        SPaginationAlign.start,
    this.itemRender,
    this.responsive =
        true,
    // ── Open customizability ──────────────────────────────────────────────
    this.activeColor,
    this.activeBorderColor,
    this.activeTextColor,
    this.defaultBorderColor,
    this.defaultTextColor,
    this.disabledColor,
    this.disabledTextColor,
    this.hoverBorderColor,
    this.hoverTextColor,
    this.itemSize,
    this.itemSpacing,
    this.borderRadius,
    this.itemTextStyle,
    this.totalTextStyle,
  });

  // ── Core pagination props ─────────────────────────────────────────────────

  /// Total number of items.
  final int
      total;

  /// Controlled current page (1-indexed). Provide [onChange] to update.
  final int?
      current;

  /// Initial page for uncontrolled mode. Defaults to `1`.
  final int
      defaultCurrent;

  /// Controlled page size.
  final int?
      pageSize;

  /// Initial page size for uncontrolled mode. Defaults to `10`.
  final int
      defaultPageSize;

  /// Called when the page changes. Receives `(page, pageSize)`.
  final void Function(
      int page,
      int pageSize)? onChange;

  /// Called when the page size changes. Receives `(current, pageSize)`.
  final void Function(
      int current,
      int pageSize)? onShowSizeChange;

  /// Show the page-size dropdown. Defaults to `false`.
  final bool
      showSizeChanger;

  /// Options available in the size-changer dropdown.
  final List<int>
      pageSizeOptions;

  /// Show the quick-jump text field. Defaults to `false`.
  final bool
      showQuickJumper;

  /// Builder for the total-count label.
  /// Receives `(total, [firstItem, lastItem])`.
  final String Function(
      int
          total,
      List<int>
          range)? showTotal;

  /// If `true`, renders as `current / totalPages` input instead of page buttons.
  final bool
      simple;

  /// Disables all interactions.
  final bool
      disabled;

  /// Size variant.
  final SPaginationSize
      size;

  /// Horizontal alignment.
  final SPaginationAlign
      align;

  /// Custom item renderer.
  /// [page] is the page number (null for prev/next/ellipsis),
  /// [type] is [SPaginationItemType].
  /// [defaultWidget] is the default widget — return it for default rendering.
  final Widget Function(
      int?
          page,
      SPaginationItemType
          type,
      Widget
          defaultWidget)? itemRender;

  /// When `true` (default), the component automatically adapts its layout
  /// based on available width:
  /// - **Wide (≥ 600 px)**: full mode — ±2 sibling pages, all extras visible.
  /// - **Medium (360–599 px)**: ±1 sibling page; size changer and quick
  ///   jumper are hidden unless the parent has room.
  /// - **Narrow (< 360 px)**: collapses to simple `current / total` mode;
  ///   only prev/next arrows and the page input are shown.
  ///
  /// Set to `false` to disable all responsive behaviour and always render
  /// the full layout regardless of available width.
  final bool
      responsive;

  // ── Open customizability props ────────────────────────────────────────────

  final Color?
      activeColor;
  final Color?
      activeBorderColor;
  final Color?
      activeTextColor;
  final Color?
      defaultBorderColor;
  final Color?
      defaultTextColor;
  final Color?
      disabledColor;
  final Color?
      disabledTextColor;
  final Color?
      hoverBorderColor;
  final Color?
      hoverTextColor;

  /// Override per-item button size.
  final double?
      itemSize;

  /// Override gap between items.
  final double?
      itemSpacing;

  /// Override item border radius.
  final BorderRadius?
      borderRadius;

  /// Override item number text style.
  final TextStyle?
      itemTextStyle;

  /// Override total label text style.
  final TextStyle?
      totalTextStyle;

  @override
  State<SPagination>
      createState() =>
          _SPaginationState();
}

class _SPaginationState
    extends State<
        SPagination> {
  late int
      _currentPage;
  late int
      _pageSize;
  final TextEditingController
      _jumpController =
      TextEditingController();
  final FocusNode
      _jumpFocus =
      FocusNode();

  @override
  void
      initState() {
    super
        .initState();
    _currentPage =
        widget.current ?? widget.defaultCurrent;
    _pageSize =
        widget.pageSize ?? widget.defaultPageSize;
    _jumpFocus
        .addListener(() {
      if (!_jumpFocus.hasFocus)
        _jumpController.clear();
    });
  }

  @override
  void didUpdateWidget(
      SPagination
          old) {
    super.didUpdateWidget(
        old);
    if (widget.current != null &&
        widget.current != _currentPage) {
      _currentPage =
          widget.current!;
    }
    if (widget.pageSize != null &&
        widget.pageSize != _pageSize) {
      _pageSize =
          widget.pageSize!;
    }
  }

  @override
  void
      dispose() {
    _jumpController
        .dispose();
    _jumpFocus
        .dispose();
    super
        .dispose();
  }

  int get _totalPages => (_pageSize ==
          0)
      ? 1
      : (widget.total / _pageSize).ceil().clamp(1,
          99999);

  void _goTo(
      int page) {
    if (widget
        .disabled)
      return;
    final clamped = page.clamp(
        1,
        _totalPages);
    if (clamped ==
        _currentPage)
      return;
    setState(() =>
        _currentPage = clamped);
    widget.onChange?.call(
        _currentPage,
        _pageSize);
  }

  void _changePageSize(
      int newSize) {
    if (widget
        .disabled)
      return;
    final newTotal = (widget.total / newSize).ceil().clamp(
        1,
        99999);
    final newPage = _currentPage.clamp(
        1,
        newTotal);
    setState(
        () {
      _pageSize =
          newSize;
      _currentPage =
          newPage;
    });
    widget.onShowSizeChange?.call(
        _currentPage,
        _pageSize);
    widget.onChange?.call(
        _currentPage,
        _pageSize);
  }

  // ── Token resolution ──────────────────────────────────────────────────────

  _PaginationTokens
      _tokens(BuildContext context) {
    final theme =
        Theme.of(context).sPaginationTheme;
    final primary = Theme.of(context)
        .colorScheme
        .primary;
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final defaultBg = isDark
        ? const Color(0xFF1F1F1F)
        : Colors.white;
    final defaultBorder = isDark
        ? const Color(0xFF424242)
        : const Color(0xFFD9D9D9);
    final defaultText = isDark
        ? const Color(0xFFE0E0E0)
        : const Color(0xFF333333);
    final disabledBg = isDark
        ? const Color(0xFF141414)
        : const Color(0xFFF5F5F5);
    final disabledText = isDark
        ? const Color(0xFF555555)
        : const Color(0xFFBFBFBF);

    final sz =
        widget.size;
    final baseSize = sz == SPaginationSize.small
        ? 24.0
        : sz == SPaginationSize.large
            ? 40.0
            : 32.0;
    final baseFontSize = sz == SPaginationSize.small
        ? 12.0
        : sz == SPaginationSize.large
            ? 16.0
            : 14.0;

    return _PaginationTokens(
      activeColor: widget.activeColor ??
          theme.activeColor ??
          primary,
      activeBorderColor: widget.activeBorderColor ??
          theme.activeBorderColor ??
          primary,
      activeTextColor: widget.activeTextColor ??
          theme.activeTextColor ??
          Colors.white,
      defaultBg:
          defaultBg,
      defaultBorder: widget.defaultBorderColor ??
          theme.defaultBorderColor ??
          defaultBorder,
      defaultText: widget.defaultTextColor ??
          theme.defaultTextColor ??
          defaultText,
      disabledBg: widget.disabledColor ??
          theme.disabledColor ??
          disabledBg,
      disabledText: widget.disabledTextColor ??
          theme.disabledTextColor ??
          disabledText,
      hoverBorder: widget.hoverBorderColor ??
          theme.hoverBorderColor ??
          primary,
      hoverText: widget.hoverTextColor ??
          theme.hoverTextColor ??
          primary,
      itemSize: widget.itemSize ??
          theme.itemSize ??
          baseSize,
      itemSpacing: widget.itemSpacing ??
          theme.itemSpacing ??
          4.0,
      borderRadius: widget.borderRadius ??
          theme.borderRadius ??
          BorderRadius.circular(6),
      baseFontSize:
          baseFontSize,
      itemTextStyle:
          widget.itemTextStyle ?? theme.itemTextStyle,
      totalTextStyle:
          widget.totalTextStyle ?? theme.totalTextStyle,
    );
  }

  // ── Responsive breakpoints ────────────────────────────────────────────────

  /// Minimum width (px) for a full-featured layout (±2 siblings, all extras).
  static const double
      _kWide =
      600.0;

  /// Minimum width (px) for medium mode (±1 sibling, no extras).
  static const double
      _kMedium =
      360.0;

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(
      BuildContext
          context) {
    return LayoutBuilder(
      builder:
          (context, constraints) {
        final availableWidth = constraints.maxWidth;
        return _buildContent(context, availableWidth);
      },
    );
  }

  Widget _buildContent(
      BuildContext
          context,
      double
          availableWidth) {
    final tokens =
        _tokens(context);
    final total =
        _totalPages;

    // ── Responsive overrides ──────────────────────────────────────────────
    final bool
        isNarrow =
        widget.responsive && availableWidth < _kMedium;
    final bool isMedium = widget.responsive &&
        availableWidth >= _kMedium &&
        availableWidth < _kWide;

    // On very narrow screens, auto-switch to simple mode.
    final bool
        effectiveSimple =
        widget.simple || isNarrow;

    // Hide secondary controls when space is tight.
    final bool showSizeChanger = widget.showSizeChanger &&
        !isNarrow &&
        !isMedium;
    final bool showQuickJumper = widget.showQuickJumper &&
        !isNarrow &&
        !isMedium;
    final bool
        showTotal =
        widget.showTotal != null && !isNarrow;

    // Number of sibling pages shown either side of current.
    // Wide: 2, Medium: 1, Narrow: irrelevant (simple mode).
    final int siblingCount = (!widget.responsive || availableWidth >= _kWide)
        ? 2
        : isMedium
            ? 1
            : 0;

    WrapAlignment
        wrapAlign;
    switch (
        widget.align) {
      case SPaginationAlign.center:
        wrapAlign = WrapAlignment.center;
        break;
      case SPaginationAlign.end:
        wrapAlign = WrapAlignment.end;
        break;
      case SPaginationAlign.start:
        wrapAlign = WrapAlignment.start;
        break;
    }

    Widget
        content;
    if (effectiveSimple) {
      content =
          _buildSimpleMode(tokens, total);
    } else {
      content = _buildFullMode(tokens,
          total,
          siblingCount: siblingCount);
    }

    // Use Wrap so that on narrow screens where the responsive breakpoints
    // aren’t quite enough, items gracefully flow to the next line instead
    // of triggering a RenderFlex overflow.
    // ConstrainedBox forces the Wrap to fill the available width so that
    // WrapAlignment.center / .end actually have space to align within.
    final double minW = availableWidth.isFinite
        ? availableWidth
        : 0;
    return ConstrainedBox(
      constraints:
          BoxConstraints(minWidth: minW),
      child:
          Wrap(
        alignment: wrapAlign,
        spacing: tokens.itemSpacing * 2,
        runSpacing: tokens.itemSpacing * 2,
        children: [
          if (showTotal) _buildTotalLabel(tokens, total),
          content,
          if (showSizeChanger) _buildSizeChanger(tokens),
          if (showQuickJumper) _buildQuickJumper(tokens, total),
        ],
      ),
    );
  }

  // ── Full mode ─────────────────────────────────────────────────────────────

  Widget
      _buildFullMode(
    _PaginationTokens
        tokens,
    int total, {
    int siblingCount =
        2,
  }) {
    final pages = _buildPageNumbers(
        total,
        siblingCount: siblingCount);
    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        // Prev
        _buildNavButton(
          tokens: tokens,
          icon: Icons.chevron_left,
          onTap: _currentPage > 1 ? () => _goTo(_currentPage - 1) : null,
          type: SPaginationItemType.prev,
          tooltip: 'Previous',
        ),
        SizedBox(width: tokens.itemSpacing),
        // Page items — iterate with index so ellipsis knows its direction
        ...pages.asMap().entries.map((entry) {
          final idx = entry.key;
          final item = entry.value;
          if (item == null) {
            // Determine direction by whether the null is in the left or right half
            final isLeft = idx < pages.length ~/ 2;
            return _buildEllipsisAt(tokens, isLeft: isLeft);
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPageButton(tokens, item),
              SizedBox(width: tokens.itemSpacing),
            ],
          );
        }),
        // Next
        _buildNavButton(
          tokens: tokens,
          icon: Icons.chevron_right,
          onTap: _currentPage < total ? () => _goTo(_currentPage + 1) : null,
          type: SPaginationItemType.next,
          tooltip: 'Next',
        ),
      ],
    );
  }

  // Build page number list with nulls for ellipsis
  List<int?> _buildPageNumbers(
      int
          total,
      {int siblingCount =
          2}) {
    if (total <=
        (siblingCount * 2 + 5)) {
      return List<int?>.generate(total,
          (i) => i + 1);
    }

    final result =
        <int?>[];
    final left = (_currentPage - siblingCount).clamp(
        2,
        total - 1);
    final right = (_currentPage + siblingCount).clamp(
        2,
        total - 1);

    result
        .add(1);
    if (left >
        2)
      result.add(null); // left ellipsis
    for (int i = left;
        i <=
            right;
        i++)
      result.add(i);
    if (right <
        total - 1)
      result.add(null); // right ellipsis
    result
        .add(total);
    return result;
  }

  Widget _buildEllipsisAt(
      _PaginationTokens
          tokens,
      {required bool
          isLeft}) {
    const jumpCount =
        5;
    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        _PaginationEllipsisButton(
          tokens: tokens,
          isLeft: isLeft,
          onTap: widget.disabled ? null : () => _goTo(isLeft ? _currentPage - jumpCount : _currentPage + jumpCount),
          itemRender: widget.itemRender,
        ),
        SizedBox(width: tokens.itemSpacing),
      ],
    );
  }

  Widget _buildPageButton(
      _PaginationTokens
          tokens,
      int page) {
    final isActive =
        page == _currentPage;
    final defaultWidget =
        _PaginationItemButton(
      label:
          '$page',
      isActive:
          isActive,
      disabled:
          widget.disabled,
      tokens:
          tokens,
      onTap: () =>
          _goTo(page),
    );
    if (widget.itemRender !=
        null) {
      return widget.itemRender!(
          page,
          SPaginationItemType.page,
          defaultWidget);
    }
    return defaultWidget;
  }

  Widget
      _buildNavButton({
    required _PaginationTokens
        tokens,
    required IconData
        icon,
    required VoidCallback?
        onTap,
    required SPaginationItemType
        type,
    required String
        tooltip,
  }) {
    final defaultWidget =
        _PaginationNavButton(
      icon:
          icon,
      onTap: widget.disabled
          ? null
          : onTap,
      tokens:
          tokens,
      tooltip:
          tooltip,
    );
    if (widget.itemRender !=
        null) {
      return widget.itemRender!(
          null,
          type,
          defaultWidget);
    }
    return defaultWidget;
  }

  // ── Simple mode ───────────────────────────────────────────────────────────

  Widget _buildSimpleMode(
      _PaginationTokens
          tokens,
      int total) {
    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        _buildNavButton(
          tokens: tokens,
          icon: Icons.chevron_left,
          onTap: _currentPage > 1 ? () => _goTo(_currentPage - 1) : null,
          type: SPaginationItemType.prev,
          tooltip: 'Previous',
        ),
        SizedBox(width: tokens.itemSpacing),
        // Current / Total input
        _SimplePageInput(
          current: _currentPage,
          total: total,
          disabled: widget.disabled,
          tokens: tokens,
          onSubmit: _goTo,
        ),
        SizedBox(width: tokens.itemSpacing),
        _buildNavButton(
          tokens: tokens,
          icon: Icons.chevron_right,
          onTap: _currentPage < total ? () => _goTo(_currentPage + 1) : null,
          type: SPaginationItemType.next,
          tooltip: 'Next',
        ),
      ],
    );
  }

  // ── Auxiliary widgets ─────────────────────────────────────────────────────

  Widget _buildTotalLabel(
      _PaginationTokens
          tokens,
      int total) {
    final first = ((_currentPage - 1) * _pageSize + 1).clamp(
        0,
        widget.total);
    final last = (_currentPage * _pageSize).clamp(
        0,
        widget.total);
    final text =
        widget.showTotal!(widget.total, [
      first,
      last
    ]);
    return Text(
      text,
      style: tokens.totalTextStyle ??
          TextStyle(
            fontSize: tokens.baseFontSize,
            color: widget.disabled ? tokens.disabledText : tokens.defaultText,
          ),
    );
  }

  Widget _buildSizeChanger(
      _PaginationTokens
          tokens) {
    return _SizeChangerDropdown(
      value:
          _pageSize,
      options:
          widget.pageSizeOptions,
      disabled:
          widget.disabled,
      tokens:
          tokens,
      onChange:
          _changePageSize,
    );
  }

  Widget _buildQuickJumper(
      _PaginationTokens
          tokens,
      int total) {
    return _QuickJumper(
      disabled:
          widget.disabled,
      tokens:
          tokens,
      total:
          total,
      onSubmit:
          _goTo,
    );
  }
}

// ─── Internal sub-widgets ────────────────────────────────────────────────────

class _PaginationTokens {
  const _PaginationTokens({
    required this.activeColor,
    required this.activeBorderColor,
    required this.activeTextColor,
    required this.defaultBg,
    required this.defaultBorder,
    required this.defaultText,
    required this.disabledBg,
    required this.disabledText,
    required this.hoverBorder,
    required this.hoverText,
    required this.itemSize,
    required this.itemSpacing,
    required this.borderRadius,
    required this.baseFontSize,
    this.itemTextStyle,
    this.totalTextStyle,
  });

  final Color
      activeColor;
  final Color
      activeBorderColor;
  final Color
      activeTextColor;
  final Color
      defaultBg;
  final Color
      defaultBorder;
  final Color
      defaultText;
  final Color
      disabledBg;
  final Color
      disabledText;
  final Color
      hoverBorder;
  final Color
      hoverText;
  final double
      itemSize;
  final double
      itemSpacing;
  final BorderRadius
      borderRadius;
  final double
      baseFontSize;
  final TextStyle?
      itemTextStyle;
  final TextStyle?
      totalTextStyle;
}

class _PaginationItemButton
    extends StatefulWidget {
  const _PaginationItemButton({
    required this.label,
    required this.isActive,
    required this.disabled,
    required this.tokens,
    required this.onTap,
  });

  final String
      label;
  final bool
      isActive;
  final bool
      disabled;
  final _PaginationTokens
      tokens;
  final VoidCallback
      onTap;

  @override
  State<_PaginationItemButton>
      createState() =>
          _PaginationItemButtonState();
}

class _PaginationItemButtonState
    extends State<
        _PaginationItemButton> {
  bool
      _hovered =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final tokens =
        widget.tokens;
    final Color bg = widget.isActive
        ? tokens.activeColor
        : widget.disabled
            ? tokens.disabledBg
            : tokens.defaultBg;
    final Color border = widget.isActive
        ? tokens.activeBorderColor
        : widget.disabled
            ? tokens.defaultBorder
            : _hovered
                ? tokens.hoverBorder
                : tokens.defaultBorder;
    final Color text = widget.isActive
        ? tokens.activeTextColor
        : widget.disabled
            ? tokens.disabledText
            : _hovered
                ? tokens.hoverText
                : tokens.defaultText;

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
        onTap: widget.disabled ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: tokens.itemSize,
          height: tokens.itemSize,
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(color: border),
            borderRadius: tokens.borderRadius,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: (tokens.itemTextStyle ??
                    TextStyle(
                      fontSize: tokens.baseFontSize,
                      fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
                    ))
                .copyWith(color: text),
          ),
        ),
      ),
    );
  }
}

class _PaginationNavButton
    extends StatefulWidget {
  const _PaginationNavButton({
    required this.icon,
    required this.onTap,
    required this.tokens,
    required this.tooltip,
  });

  final IconData
      icon;
  final VoidCallback?
      onTap;
  final _PaginationTokens
      tokens;
  final String
      tooltip;

  @override
  State<_PaginationNavButton>
      createState() =>
          _PaginationNavButtonState();
}

class _PaginationNavButtonState
    extends State<
        _PaginationNavButton> {
  bool
      _hovered =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final tokens =
        widget.tokens;
    final isDisabled =
        widget.onTap == null;
    final border = isDisabled
        ? tokens.defaultBorder
        : _hovered
            ? tokens.hoverBorder
            : tokens.defaultBorder;
    final iconColor = isDisabled
        ? tokens.disabledText
        : _hovered
            ? tokens.hoverText
            : tokens.defaultText;

    return Tooltip(
      message:
          widget.tooltip,
      child:
          MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: tokens.itemSize,
            height: tokens.itemSize,
            decoration: BoxDecoration(
              color: isDisabled ? tokens.disabledBg : tokens.defaultBg,
              border: Border.all(color: border),
              borderRadius: tokens.borderRadius,
            ),
            alignment: Alignment.center,
            child: Icon(widget.icon, size: tokens.itemSize * 0.5, color: iconColor),
          ),
        ),
      ),
    );
  }
}

class _PaginationEllipsisButton
    extends StatefulWidget {
  const _PaginationEllipsisButton({
    required this.tokens,
    required this.isLeft,
    required this.onTap,
    this.itemRender,
  });

  final _PaginationTokens
      tokens;
  final bool
      isLeft;
  final VoidCallback?
      onTap;
  final Widget Function(
      int?
          page,
      SPaginationItemType
          type,
      Widget
          defaultWidget)? itemRender;

  @override
  State<_PaginationEllipsisButton>
      createState() =>
          _PaginationEllipsisButtonState();
}

class _PaginationEllipsisButtonState
    extends State<
        _PaginationEllipsisButton> {
  bool
      _hovered =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final tokens =
        widget.tokens;
    final type = widget.isLeft
        ? SPaginationItemType.jumpPrev
        : SPaginationItemType.jumpNext;

    final defaultWidget =
        MouseRegion(
      onEnter: (_) =>
          setState(() => _hovered = true),
      onExit: (_) =>
          setState(() => _hovered = false),
      cursor: widget.onTap == null
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child:
          GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: tokens.itemSize,
          height: tokens.itemSize,
          decoration: BoxDecoration(
            color: tokens.defaultBg,
            border: Border.all(color: _hovered ? tokens.hoverBorder : tokens.defaultBorder),
            borderRadius: tokens.borderRadius,
          ),
          alignment: Alignment.center,
          child: _hovered
              ? Icon(
                  widget.isLeft ? Icons.keyboard_double_arrow_left : Icons.keyboard_double_arrow_right,
                  size: tokens.itemSize * 0.45,
                  color: tokens.hoverText,
                )
              : Text(
                  '•••',
                  style: TextStyle(
                    fontSize: tokens.baseFontSize,
                    color: tokens.defaultText,
                    letterSpacing: 1,
                  ),
                ),
        ),
      ),
    );

    if (widget.itemRender !=
        null) {
      return widget.itemRender!(
          null,
          type,
          defaultWidget);
    }
    return defaultWidget;
  }
}

class _SimplePageInput
    extends StatefulWidget {
  const _SimplePageInput({
    required this.current,
    required this.total,
    required this.disabled,
    required this.tokens,
    required this.onSubmit,
  });

  final int
      current;
  final int
      total;
  final bool
      disabled;
  final _PaginationTokens
      tokens;
  final void
          Function(int)
      onSubmit;

  @override
  State<_SimplePageInput>
      createState() =>
          _SimplePageInputState();
}

class _SimplePageInputState
    extends State<
        _SimplePageInput> {
  late TextEditingController
      _ctrl;

  @override
  void
      initState() {
    super
        .initState();
    _ctrl =
        TextEditingController(text: '${widget.current}');
  }

  @override
  void didUpdateWidget(
      _SimplePageInput
          old) {
    super.didUpdateWidget(
        old);
    if (old.current !=
        widget.current) {
      _ctrl.text =
          '${widget.current}';
    }
  }

  @override
  void
      dispose() {
    _ctrl
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final tokens =
        widget.tokens;
    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        SizedBox(
          width: tokens.itemSize * 1.6,
          height: tokens.itemSize,
          child: TextField(
            controller: _ctrl,
            enabled: !widget.disabled,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              fontSize: tokens.baseFontSize,
              color: widget.disabled ? tokens.disabledText : tokens.defaultText,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.defaultBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.defaultBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.activeBorderColor, width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.defaultBorder),
              ),
              filled: widget.disabled,
              fillColor: widget.disabled ? tokens.disabledBg : null,
            ),
            onSubmitted: (val) {
              final p = int.tryParse(val);
              if (p != null) widget.onSubmit(p);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '/ ${widget.total}',
            style: TextStyle(
              fontSize: tokens.baseFontSize,
              color: widget.disabled ? tokens.disabledText : tokens.defaultText,
            ),
          ),
        ),
      ],
    );
  }
}

class _SizeChangerDropdown
    extends StatelessWidget {
  const _SizeChangerDropdown({
    required this.value,
    required this.options,
    required this.disabled,
    required this.tokens,
    required this.onChange,
  });

  final int
      value;
  final List<int>
      options;
  final bool
      disabled;
  final _PaginationTokens
      tokens;
  final void
          Function(int)
      onChange;

  @override
  Widget build(
      BuildContext
          context) {
    return Container(
      height:
          tokens.itemSize,
      padding:
          const EdgeInsets.symmetric(horizontal: 8),
      decoration:
          BoxDecoration(
        color: disabled ? tokens.disabledBg : tokens.defaultBg,
        border: Border.all(color: tokens.defaultBorder),
        borderRadius: tokens.borderRadius,
      ),
      alignment:
          Alignment.center,
      child:
          DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: value,
          isDense: true,
          icon: Icon(Icons.keyboard_arrow_down, size: tokens.baseFontSize + 2, color: disabled ? tokens.disabledText : tokens.defaultText),
          style: TextStyle(
            fontSize: tokens.baseFontSize,
            color: disabled ? tokens.disabledText : tokens.defaultText,
          ),
          onChanged: disabled ? null : (v) => v != null ? onChange(v) : null,
          items: options
              .map((o) => DropdownMenuItem<int>(
                    value: o,
                    child: Text('$o / page'),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _QuickJumper
    extends StatefulWidget {
  const _QuickJumper({
    required this.disabled,
    required this.tokens,
    required this.total,
    required this.onSubmit,
  });

  final bool
      disabled;
  final _PaginationTokens
      tokens;
  final int
      total;
  final void
          Function(int)
      onSubmit;

  @override
  State<_QuickJumper>
      createState() =>
          _QuickJumperState();
}

class _QuickJumperState
    extends State<
        _QuickJumper> {
  final TextEditingController
      _ctrl =
      TextEditingController();

  @override
  void
      dispose() {
    _ctrl
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final tokens =
        widget.tokens;
    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children: [
        Text(
          'Go to',
          style: TextStyle(fontSize: tokens.baseFontSize, color: widget.disabled ? tokens.disabledText : tokens.defaultText),
        ),
        const SizedBox(width: 6),
        SizedBox(
          width: tokens.itemSize * 1.6,
          height: tokens.itemSize,
          child: TextField(
            controller: _ctrl,
            enabled: !widget.disabled,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              fontSize: tokens.baseFontSize,
              color: widget.disabled ? tokens.disabledText : tokens.defaultText,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.defaultBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.defaultBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.activeBorderColor, width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: tokens.borderRadius,
                borderSide: BorderSide(color: tokens.defaultBorder),
              ),
              filled: widget.disabled,
              fillColor: widget.disabled ? tokens.disabledBg : null,
            ),
            onSubmitted: (val) {
              final p = int.tryParse(val);
              if (p != null) {
                widget.onSubmit(p);
                _ctrl.clear();
              }
            },
          ),
        ),
      ],
    );
  }
}

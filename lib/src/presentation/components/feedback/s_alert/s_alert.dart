import 'package:flutter/material.dart';
import '../../../../domain/entities/config/s_alert_type.dart';
import '../../../themes/extensions/component_themes/s_alert_theme.dart';

/// A static-inline alert component inspired by Ant Design Alert.
///
/// Supports four semantic [type]s (success, info, warning, error), an optional
/// icon, title, description, closable state with smooth animated collapse,
/// a trailing [action] widget, and full [banner] mode.
///
/// ## Ant Design parity
/// Covers: basic, description, icon, closable, action, banner, custom-icon,
/// smooth-close demos.
///
/// ## Open Customizability
/// Every visual token can be overridden per-instance:
/// - [backgroundColor], [borderColor], [borderWidth], [borderRadius]
/// - [padding], [iconColor], [iconSize]
/// - [titleStyle], [descriptionStyle]
/// - [elevation], [shadowColor]
/// - [constraints]
/// - [closeIcon] (custom close widget)
///
/// Global defaults live in [SAlertThemeData] registered on [ThemeData].
///
/// ```dart
/// // Basic
/// SAlert(type: SAlertType.success, title: 'Success Text')
///
/// // With description + icon
/// SAlert(
///   type: SAlertType.info,
///   title: 'Info',
///   description: 'More details here.',
///   showIcon: true,
/// )
///
/// // Closable with callback
/// SAlert(
///   type: SAlertType.warning,
///   title: 'Warning',
///   closable: true,
///   onClose: () => print('closed'),
///   afterClose: () => print('animation done'),
/// )
///
/// // Banner mode
/// SAlert(type: SAlertType.warning, title: 'Banner Warning', banner: true)
///
/// // Fully custom
/// SAlert(
///   type: SAlertType.error,
///   title: 'Custom',
///   backgroundColor: Colors.purple.shade50,
///   borderColor: Colors.purple,
///   borderRadius: BorderRadius.circular(4),
///   iconColor: Colors.purple,
///   titleStyle: const TextStyle(fontStyle: FontStyle.italic),
///   showIcon: true,
///   closable: true,
/// )
/// ```
class SAlert
    extends StatefulWidget {
  const SAlert({
    super.key,
    this.type =
        SAlertType.info,
    this.title,
    this.description,
    this.showIcon =
        false,
    this.icon,
    this.closable =
        false,
    this.closeIcon,
    this.onClose,
    this.afterClose,
    this.action,
    this.banner =
        false,

    // ── Open customizability ──────────────────────────────────────────────
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.padding,
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.elevation,
    this.shadowColor,
    this.constraints,
  });

  // ── Ant Design props ──────────────────────────────────────────────────────

  /// Semantic type of the alert.
  final SAlertType
      type;

  /// Primary message. Rendered in bold.
  final String?
      title;

  /// Secondary supporting detail text or widget.
  final dynamic
      description; // String or Widget

  /// Whether to show the type icon.
  /// In [banner] mode defaults to `true`.
  final bool
      showIcon;

  /// Custom icon widget. Used only when [showIcon] is `true`.
  final Widget?
      icon;

  /// Show the close button.
  final bool
      closable;

  /// Custom close button widget. Defaults to an `×` icon.
  final Widget?
      closeIcon;

  /// Called when the close button is tapped.
  final VoidCallback?
      onClose;

  /// Called after the collapse animation completes.
  final VoidCallback?
      afterClose;

  /// Optional action widget rendered in the trailing area (right side).
  final Widget?
      action;

  /// If `true`, renders as a full-width banner (no border-radius, warning default,
  /// showIcon defaults to `true`).
  final bool
      banner;

  // ── Open customizability props (all nullable → fall back to theme) ────────

  /// Override background color.
  final Color?
      backgroundColor;

  /// Override border color.
  final Color?
      borderColor;

  /// Override border width. Defaults to `1`.
  final double?
      borderWidth;

  /// Override corner border radius. Has no effect in [banner] mode.
  final BorderRadius?
      borderRadius;

  /// Override inner padding.
  final EdgeInsetsGeometry?
      padding;

  /// Override icon color.
  final Color?
      iconColor;

  /// Override icon size.
  final double?
      iconSize;

  /// Override title text style.
  final TextStyle?
      titleStyle;

  /// Override description text style.
  final TextStyle?
      descriptionStyle;

  /// Elevation of the alert shadow.
  final double?
      elevation;

  /// Color of the shadow when [elevation] > 0.
  final Color?
      shadowColor;

  /// Size constraints applied to the alert widget.
  final BoxConstraints?
      constraints;

  @override
  State<SAlert>
      createState() =>
          _SAlertState();
}

class _SAlertState
    extends State<
        SAlert>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _controller;
  late Animation<double>
      _heightFactor;
  late Animation<double>
      _opacity;

  bool
      _visible =
      true;

  @override
  void
      initState() {
    super
        .initState();
    _controller =
        AnimationController(
      vsync:
          this,
      duration:
          const Duration(milliseconds: 300),
      value:
          1.0,
    );
    _heightFactor =
        _controller.drive(CurveTween(curve: Curves.easeInOut));
    _opacity =
        _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  Future<void>
      _handleClose() async {
    widget
        .onClose
        ?.call();
    await _controller
        .reverse();
    if (mounted) {
      setState(() =>
          _visible = false);
    }
    widget
        .afterClose
        ?.call();
  }

  @override
  Widget build(
      BuildContext
          context) {
    if (!_visible)
      return const SizedBox.shrink();

    final SAlertThemeData
        theme =
        Theme.of(context).sAlertTheme;
    final SAlertType effectiveType = widget.banner && widget.type == SAlertType.info
        ? SAlertType.warning
        : widget.type;
    final bool
        effectiveShowIcon =
        widget.showIcon;

    final _SAlertColors
        colors =
        _SAlertColors.resolve(effectiveType, theme);

    final Color
        bgColor =
        widget.backgroundColor ?? colors.background;
    final Color
        bdColor =
        widget.borderColor ?? colors.border;
    final Color
        icColor =
        widget.iconColor ?? colors.icon;
    final double
        icSize =
        widget.iconSize ?? (effectiveShowIcon ? (widget.description != null ? 24.0 : 16.0) : 16.0);
    final double
        bdWidth =
        widget.borderWidth ?? 1.0;
    final BorderRadius? radius = widget.banner
        ? BorderRadius.zero
        : (widget.borderRadius ?? theme.borderRadius ?? BorderRadius.circular(6));
    final EdgeInsetsGeometry pad = widget.padding ??
        theme.padding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 10);
    final double elev = widget.elevation ??
        theme.elevation ??
        0.0;
    final Color?
        shadowColor =
        widget.shadowColor ?? theme.shadowColor;

    final TextStyle defaultTitleStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w600, color: colors.titleText);
    final TextStyle defaultDescStyle = Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: colors.descText);

    final TextStyle effectiveTitleStyle = (widget.titleStyle ??
        theme.titleStyle ??
        defaultTitleStyle);
    final TextStyle effectiveDescStyle = (widget.descriptionStyle ??
        theme.descriptionStyle ??
        defaultDescStyle);

    Widget
        content =
        Container(
      constraints:
          widget.constraints,
      decoration:
          BoxDecoration(
        color: bgColor,
        border: Border.all(color: bdColor, width: bdWidth),
        borderRadius: radius,
        boxShadow: elev > 0
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.black12,
                  blurRadius: elev * 2,
                  offset: Offset(0, elev / 2),
                ),
              ]
            : null,
      ),
      child:
          Padding(
        padding: pad,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Icon ────────────────────────────────────────────────────────
            if (effectiveShowIcon) ...[
              Padding(
                padding: EdgeInsets.only(
                  top: widget.description != null ? 2.0 : 0.0,
                  right: 10,
                ),
                child: widget.icon ??
                    Icon(
                      _iconForType(effectiveType),
                      color: icColor,
                      size: icSize,
                    ),
              ),
            ],

            // ── Content section ─────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.title != null) Text(widget.title!, style: effectiveTitleStyle),
                  if (widget.description != null) ...[
                    if (widget.title != null) const SizedBox(height: 4),
                    if (widget.description is String) Text(widget.description as String, style: effectiveDescStyle) else if (widget.description is Widget) widget.description as Widget,
                  ],
                ],
              ),
            ),

            // ── Action ──────────────────────────────────────────────────────
            if (widget.action != null) ...[
              const SizedBox(width: 8),
              widget.action!,
            ],

            // ── Close button ────────────────────────────────────────────────
            if (widget.closable) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _handleClose,
                child: widget.closeIcon ?? Icon(Icons.close, size: 14, color: colors.closeIcon),
              ),
            ],
          ],
        ),
      ),
    );

    // Smooth close animation wrapping
    return AnimatedBuilder(
      animation:
          _controller,
      builder:
          (BuildContext ctx, Widget? child) {
        return ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: Opacity(
              opacity: _opacity.value,
              child: child,
            ),
          ),
        );
      },
      child:
          content,
    );
  }

  IconData
      _iconForType(SAlertType type) {
    switch (
        type) {
      case SAlertType.success:
        return Icons.check_circle;
      case SAlertType.info:
        return Icons.info;
      case SAlertType.warning:
        return Icons.warning_amber_rounded;
      case SAlertType.error:
        return Icons.cancel;
    }
  }
}

// ─── Internal color resolver ───────────────────────────────────────────────────

class _SAlertColors {
  const _SAlertColors({
    required this.background,
    required this.border,
    required this.icon,
    required this.titleText,
    required this.descText,
    required this.closeIcon,
  });

  final Color
      background;
  final Color
      border;
  final Color
      icon;
  final Color
      titleText;
  final Color
      descText;
  final Color
      closeIcon;

  static _SAlertColors resolve(
      SAlertType
          type,
      SAlertThemeData
          theme) {
    switch (
        type) {
      case SAlertType.success:
        return _SAlertColors(
          background: theme.successBackgroundColor ?? const Color(0xFFF6FFED),
          border: theme.successBorderColor ?? const Color(0xFFB7EB8F),
          icon: theme.successIconColor ?? const Color(0xFF52C41A),
          titleText: const Color(0xFF135200),
          descText: const Color(0xFF135200),
          closeIcon: const Color(0xFF52C41A),
        );
      case SAlertType.info:
        return _SAlertColors(
          background: theme.infoBackgroundColor ?? const Color(0xFFE6F4FF),
          border: theme.infoBorderColor ?? const Color(0xFF91CAFF),
          icon: theme.infoIconColor ?? const Color(0xFF1677FF),
          titleText: const Color(0xFF002C8C),
          descText: const Color(0xFF002C8C),
          closeIcon: const Color(0xFF1677FF),
        );
      case SAlertType.warning:
        return _SAlertColors(
          background: theme.warningBackgroundColor ?? const Color(0xFFFFFBE6),
          border: theme.warningBorderColor ?? const Color(0xFFFFE58F),
          icon: theme.warningIconColor ?? const Color(0xFFFFAB00),
          titleText: const Color(0xFF7C4A03),
          descText: const Color(0xFF7C4A03),
          closeIcon: const Color(0xFFFFAB00),
        );
      case SAlertType.error:
        return _SAlertColors(
          background: theme.errorBackgroundColor ?? const Color(0xFFFFF2F0),
          border: theme.errorBorderColor ?? const Color(0xFFFFCCC7),
          icon: theme.errorIconColor ?? const Color(0xFFFF4D4F),
          titleText: const Color(0xFF5C0011),
          descText: const Color(0xFF5C0011),
          closeIcon: const Color(0xFFFF4D4F),
        );
    }
  }
}

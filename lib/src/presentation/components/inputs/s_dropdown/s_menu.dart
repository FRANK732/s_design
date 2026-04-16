import 'package:flutter/material.dart';

import '../../../../../s_design.dart';

class SMenu
    extends StatelessWidget {
  const SMenu({
    super.key,
    required this.children,
    this.padding = const EdgeInsets
        .symmetric(
        vertical: 4),
  });

  /// The list of list items. usually SMenuItem or SMenuDivider
  final List<Widget>
      children;

  /// The padding around the entire menu container.
  final EdgeInsetsGeometry
      padding;

  @override
  Widget build(
      BuildContext
          context) {
    return Padding(
      padding:
          padding,
      child:
          Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class SMenuItem
    extends StatefulWidget {
  const SMenuItem({
    super.key,
    required this.child,
    this.onTap,
    this.icon,
    this.trailing,
    this.disabled =
        false,
    this.danger =
        false,
    this.selected =
        false,
    this.loading =
        false,
  });

  /// The primary content of the menu item.
  final Widget
      child;

  /// Callback when item is tapped.
  final VoidCallback?
      onTap;

  /// Icon to display before the child.
  final Widget?
      icon;

  /// Icon or widget to display after the child.
  final Widget?
      trailing;

  /// Whether the item is disabled.
  final bool
      disabled;

  /// Whether this is a dangerous action (colors it red).
  final bool
      danger;

  /// Whether the item is in a selected state (renders a checkmark).
  final bool
      selected;

  /// Whether the item is in a loading state (renders a spinner).
  final bool
      loading;

  @override
  State<SMenuItem>
      createState() =>
          _SMenuItemState();
}

class _SMenuItemState
    extends State<
        SMenuItem> {
  bool
      _isHovering =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData
        theme =
        STheme.of(context);

    // Determine colors
    Color
        textColor =
        theme.colorToken.textPrimary;
    Color
        iconColor =
        theme.colorToken.textSecondary;
    Color hoverColor = theme
        .colorToken
        .primary
        .withOpacity(0.08);

    if (widget
        .disabled) {
      textColor =
          theme.colorToken.textSecondary.withOpacity(0.5);
      iconColor =
          theme.colorToken.textSecondary.withOpacity(0.3);
      hoverColor =
          Colors.transparent;
    } else if (widget
        .danger) {
      textColor =
          theme.colorToken.error;
      iconColor =
          theme.colorToken.error;
      hoverColor =
          theme.colorToken.error.withOpacity(0.08);
    }

    return MouseRegion(
      onEnter: (_) =>
          setState(() => _isHovering = true),
      onExit: (_) =>
          setState(() => _isHovering = false),
      cursor: widget.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child:
          GestureDetector(
        onTap: widget.disabled ? null : widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovering && !widget.disabled && !widget.loading ? hoverColor : Colors.transparent,
          ),
          child: Row(
            children: <Widget>[
              // Leading Icon / Loader
              if (widget.loading) ...<Widget>[
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                  ),
                ),
                const SizedBox(width: 10),
              ] else if (widget.icon != null) ...<Widget>[
                IconTheme(
                  data: IconThemeData(color: iconColor, size: 16),
                  child: widget.icon!,
                ),
                const SizedBox(width: 8),
              ],

              // Content
              Expanded(
                child: DefaultTextStyle(
                  style: theme.typographyToken.bodyMedium.copyWith(
                    color: textColor,
                    fontWeight: widget.selected ? FontWeight.w600 : null,
                  ),
                  child: widget.child,
                ),
              ),

              // Trailing / Selected Indicator
              if (widget.selected) ...<Widget>[
                const SizedBox(width: 8),
                Icon(Icons.check, size: 14, color: theme.colorToken.primary),
              ] else if (widget.trailing != null) ...<Widget>[
                const SizedBox(width: 8),
                IconTheme(
                  data: IconThemeData(color: iconColor, size: 14),
                  child: widget.trailing!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class SMenuDivider
    extends StatelessWidget {
  const SMenuDivider(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    return Divider(
      height:
          9,
      thickness:
          1,
      color:
          STheme.of(context).colorToken.divider.withOpacity(0.5),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// A menu item that opens a nested [SMenu] overlay on hover/click.
///
/// Use inside [SMenu] anywhere you need cascading sub-menus
class SSubMenu
    extends StatefulWidget {
  const SSubMenu({
    super.key,
    required this.title,
    required this.children,
    this.icon,
    this.disabled =
        false,
    this.placement =
        STriggerPlacement.rightTop,
    this.popupOffset = const Offset(
        4,
        0),
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.trigger = const <STriggerAction>[STriggerAction.hover],
  });

  /// The label shown in the parent menu row.
  final Widget
      title;

  /// Items inside the sub-menu popup.
  final List<Widget>
      children;

  /// Optional leading icon.
  final Widget?
      icon;

  /// Whether this sub-menu is disabled.
  final bool
      disabled;

  /// Placement of the popup relative to this row. Defaults to [STriggerPlacement.rightTop].
  final STriggerPlacement
      placement;

  /// Additional pixel offset applied on top of the placement.
  final Offset
      popupOffset;

  /// Override background color of the sub-menu.
  final Color? backgroundColor;

  /// Override border color of the sub-menu.
  final Color? borderColor;

  /// Override border radius of the sub-menu.
  final BorderRadius? borderRadius;

  /// Trigger actions for opening the sub-menu.
  final List<STriggerAction> trigger;

  @override
  State<SSubMenu> createState() => _SSubMenuState();
}

class _SSubMenuState extends State<SSubMenu> {
  final String _menuId = UniqueKey().toString();
  bool _isOpen = false;
  SMenuScope? _scope;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final SMenuScope? newScope = SMenuScope.of(context);
    if (_scope != newScope) {
      _scope?.activeSubMenuId.removeListener(_onScopeChanged);
      _scope = newScope;
      _scope?.activeSubMenuId.addListener(_onScopeChanged);
    }
  }

  @override
  void dispose() {
    _scope?.activeSubMenuId.removeListener(_onScopeChanged);
    super.dispose();
  }

  void _onScopeChanged() {
    final String? activeId = _scope?.activeSubMenuId.value;
    if (activeId != _menuId && _isOpen) {
      setState(() => _isOpen = false);
    }
  }

  void _handleVisibleChange(bool visible) {
    setState(() => _isOpen = visible);
    if (visible) {
      _scope?.activeSubMenuId.value = _menuId;
    } else {
      if (_scope?.activeSubMenuId.value == _menuId) {
        _scope?.activeSubMenuId.value = null;
      }
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData
        theme =
        STheme.of(context);

    final Color textColor = widget.disabled
        ? theme.colorToken.textSecondary.withOpacity(0.5)
        : theme.colorToken.textPrimary;
    final Color iconColor = widget.disabled
        ? theme.colorToken.textSecondary.withOpacity(0.3)
        : theme.colorToken.textSecondary;

    final SDropdownMenuThemeData dropdownTheme = theme.dropdownMenuTheme;

    final Color effectiveBackgroundColor = widget.backgroundColor ?? 
        dropdownTheme.backgroundColor ?? 
        theme.colorToken.surface;
    
    final Color effectiveBorderColor = widget.borderColor ?? 
        dropdownTheme.borderColor ?? 
        theme.colorToken.divider.withOpacity(0.4);
    
    final BorderRadius effectiveBorderRadius = widget.borderRadius ?? 
        dropdownTheme.borderRadius ?? 
        BorderRadius.circular(DesignConstants.borderRadiusMedium);
    
    final double effectiveElevation = dropdownTheme.elevation ?? 8.0;

    final Widget
        popup =
        Material(
      elevation:
          effectiveElevation,
      shadowColor:
          theme.colorToken.shadow.withOpacity(0.15),
      color:
          Colors.transparent,
      borderRadius:
          effectiveBorderRadius,
      child:
          Container(
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: effectiveBorderRadius,
          border: Border.all(color: effectiveBorderColor),
        ),
        child: SMenu(children: widget.children),
      ),
    );

    return STrigger(
      placement:
          widget.placement,
      disabled:
          widget.disabled,
      mouseEnterDelay:
          const Duration(milliseconds: 80),
      mouseLeaveDelay:
          const Duration(milliseconds: 120),
      action:
          widget.trigger,
      popupVisible: 
          _isOpen,
      onPopupVisibleChange: 
          _handleVisibleChange,
      popup:
          popup,
      child:
          _SSubMenuRow(
        title: widget.title,
        icon: widget.icon,
        textColor: textColor,
        iconColor: iconColor,
        disabled: widget.disabled,
        theme: theme,
      ),
    );
  }
}

class _SSubMenuRow
    extends StatefulWidget {
  const _SSubMenuRow({
    required this.title,
    required this.textColor,
    required this.iconColor,
    required this.disabled,
    required this.theme,
    this.icon,
  });

  final Widget
      title;
  final Widget?
      icon;
  final Color
      textColor;
  final Color
      iconColor;
  final bool
      disabled;
  final SThemeData
      theme;

  @override
  State<_SSubMenuRow>
      createState() =>
          _SSubMenuRowState();
}

class _SSubMenuRowState
    extends State<
        _SSubMenuRow> {
  bool
      _isHovering =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final Color hoverBg = widget.disabled
        ? Colors.transparent
        : widget.theme.colorToken.primary.withOpacity(0.07);

    return MouseRegion(
      onEnter: (_) =>
          setState(() => _isHovering = true),
      onExit: (_) =>
          setState(() => _isHovering = false),
      cursor: widget.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child:
          AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovering ? hoverBg : Colors.transparent,
        ),
        child: DefaultTextStyle(
          style: widget.theme.typographyToken.bodyMedium.copyWith(color: widget.textColor),
          child: IconTheme(
            data: IconThemeData(color: widget.iconColor, size: 16),
            child: Row(
              children: <Widget>[
                if (widget.icon != null) ...<Widget>[
                  widget.icon!,
                  const SizedBox(width: 8),
                ],
                Expanded(child: widget.title),
                // Arrow indicator
                Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: widget.iconColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Renders a primary action button alongside an arrow button that opens
/// the dropdown overlay.

class SDropdownButton
    extends StatelessWidget {
  const SDropdownButton({
    super.key,
    required this.child,
    required this.overlay,
    required this.onMainPressed,
    this.placement =
        SDropdownPlacement.bottomRight,
    this.trigger =
        const <SDropdownTrigger>[
      SDropdownTrigger.click
    ],
    this.disabled =
        false,
    this.open,
    this.onOpenChange,
    this.variant =
        SButtonVariant.defaultVariant,
    this.size =
        SButtonSize.defaultSize,
  });

  /// Content of the primary (left) button.
  final Widget
      child;

  /// Overlay widget opened by the arrow button.
  final Widget
      overlay;

  /// Callback for the primary button press.
  final VoidCallback?
      onMainPressed;

  /// Placement of the popup.
  final SDropdownPlacement
      placement;

  /// Trigger modes for the arrow button.
  final List<SDropdownTrigger>
      trigger;

  /// Disables both buttons.
  final bool
      disabled;

  /// Controlled visibility.
  final bool?
      open;

  /// Callback when visibility changes.
  final ValueChanged<bool>?
      onOpenChange;

  /// Visual style of both buttons.
  final SButtonVariant
      variant;

  /// The sizing scale of both buttons.
  final SButtonSize
      size;

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData
        theme =
        STheme.of(context);

    const Radius
        outerRadius =
        Radius.circular(6);

    return IntrinsicHeight(
      child:
          Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SButton(
            variant: variant,
            size: size,
            height: double.infinity,
            onPressed: disabled ? null : onMainPressed,
            borderRadius: const BorderRadius.only(
              topLeft: outerRadius,
              bottomLeft: outerRadius,
            ),
            child: child,
          ),
          Container(
            width: 1,
            color: theme.colorToken.divider.withOpacity(0.5),
          ),
          SDropdown(
            trigger: trigger,
            placement: placement,
            disabled: disabled,
            open: open,
            onOpenChange: onOpenChange,
            overlay: overlay,
            child: SButton(
              variant: variant,
              size: size,
              height: double.infinity,
              onPressed: disabled ? null : () {},
              borderRadius: const BorderRadius.only(
                topRight: outerRadius,
                bottomRight: outerRadius,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const Icon(Icons.keyboard_arrow_down, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

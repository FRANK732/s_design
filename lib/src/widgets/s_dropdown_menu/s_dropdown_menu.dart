import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_dropdown_menu/enums/s_dropdown_menu_item_type.dart';

/// Data model for a dropdown menu item.
class SDropdownMenuItemData<T> {
  /// The display label of the menu item.
  final String? label;

  /// The icon displayed alongside the menu item.
  final Widget? icon;

  /// The type of the menu item, determining its behavior and appearance.
  final SDropdownMenuItemType type;

  /// Callback invoked when the menu item is tapped.
  final VoidCallback? onTap;

  /// Whether the menu item is enabled.
  final bool enabled;

  /// The checked state for checkbox menu items.
  final bool? isChecked;

  /// Callback invoked when the checked state changes for checkbox menu items.
  final ValueChanged<bool>? onCheckedChanged;

  /// The value associated with radio menu items.
  final T? value;

  /// The list of submenu items for submenu menu items.
  final List<SDropdownMenuItemData<T>>? submenuItems;

  /// Shortcut text displayed alongside the menu item.
  final String? shortcut;

  /// Creates an [SDropdownMenuItemData].
  SDropdownMenuItemData({
    this.label,
    this.icon,
    this.type = SDropdownMenuItemType.normal,
    this.onTap,
    this.enabled = true,
    this.isChecked,
    this.onCheckedChanged,
    this.value,
    this.submenuItems,
    this.shortcut,
  }) : assert(
          (type == SDropdownMenuItemType.checkbox && isChecked != null) ||
              type != SDropdownMenuItemType.checkbox,
          'isChecked must be provided for checkbox menu items.',
        );
}

/// A comprehensive Dropdown Menu Widget that encapsulates triggering, overlay, content,
/// and various types of menu items.
class SDropdownMenu<T> extends StatefulWidget {
  /// The widget that triggers the dropdown menu when interacted with.
  final Widget trigger;

  /// The list of dropdown menu items.
  final List<SDropdownMenuItemData<T>> items;

  /// The currently selected radio value.
  final T? selectedRadioValue;

  /// Callback invoked when the selected radio value changes.
  final ValueChanged<T?>? onRadioValueChanged;

  /// Whether the dropdown menu closes when a menu item is tapped.
  final bool closeOnItemTap;

  /// The width of the dropdown menu.
  final double menuWidth;

  /// The text style for enabled menu items.
  final TextStyle? itemTextStyle;

  /// The text style for disabled menu items.
  final TextStyle? disabledItemTextStyle;

  /// The background color of the dropdown menu.
  final Color? backgroundColor;

  /// The elevation of the dropdown menu.
  final double elevation;

  /// The padding inside the dropdown menu.
  final EdgeInsetsGeometry? padding;

  /// Creates an [SDropdownMenu].
  const SDropdownMenu({
    super.key,
    required this.trigger,
    required this.items,
    this.selectedRadioValue,
    this.onRadioValueChanged,
    this.closeOnItemTap = true,
    this.menuWidth = 200.0,
    this.itemTextStyle,
    this.disabledItemTextStyle,
    this.backgroundColor,
    this.elevation = 8.0,
    this.padding,
  });

  @override
  _SDropdownMenuState<T> createState() => _SDropdownMenuState<T>();
}

class _SDropdownMenuState<T> extends State<SDropdownMenu<T>>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  /// Toggles the dropdown menu's visibility.
  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  /// Opens the dropdown menu by inserting an [OverlayEntry].
  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
    setState(() {
      _isOpen = true;
    });
  }

  /// Closes the dropdown menu by removing the [OverlayEntry].
  void _closeDropdown() {
    _animationController.reverse();
    Future.delayed(const Duration(milliseconds: 200), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() {
        _isOpen = false;
      });
    });
  }

  /// Creates an [OverlayEntry] for the dropdown menu.
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate available space below
    double availableHeightBelow = screenHeight - offset.dy - size.height;
    bool openAbove = availableHeightBelow < 200.0; // Adjust threshold as needed

    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: _closeDropdown,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: const Color.fromARGB(0, 180, 47, 47),
                ),
              ),
              Positioned(
                width: widget.menuWidth,
                left: offset.dx,
                top: openAbove ? offset.dy - 300.0 : offset.dy + size.height,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  offset: const Offset(0.0, 0.0),
                  showWhenUnlinked: false,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: Material(
                      color: widget.backgroundColor ??
                          Theme.of(context).canvasColor,
                      elevation: widget.elevation,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 300.0,
                        ),
                        child: _buildMenuItems(widget.items),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Builds the list of menu items.
  Widget _buildMenuItems(List<SDropdownMenuItemData<T>> items) {
    return ListView(
      padding: widget.padding ?? EdgeInsets.zero,
      shrinkWrap: true,
      children: items.map((item) => _buildMenuItem(item)).toList(),
    );
  }

  /// Builds an individual menu item based on its type.
  Widget _buildMenuItem(SDropdownMenuItemData<T> item) {
    switch (item.type) {
      case SDropdownMenuItemType.normal:
        return _buildNormalItem(item);
      case SDropdownMenuItemType.checkbox:
        return _buildCheckboxItem(item);
      case SDropdownMenuItemType.radio:
        return _buildRadioItem(item);
      case SDropdownMenuItemType.submenu:
        return _buildSubmenuItem(item);
      case SDropdownMenuItemType.separator:
        return const Divider(height: 1.0, color: Colors.grey);
      case SDropdownMenuItemType.label:
        return _buildLabelItem(item);
      default:
        return const SizedBox.shrink();
    }
  }

  /// Builds a standard interactive menu item.
  Widget _buildNormalItem(SDropdownMenuItemData<T> item) {
    return ListTile(
      leading: item.icon,
      title: Text(
        item.label ?? '',
        style: item.enabled
            ? (widget.itemTextStyle ?? const TextStyle(fontSize: 14.0))
            : (widget.disabledItemTextStyle ??
                const TextStyle(fontSize: 14.0, color: Colors.grey)),
      ),
      trailing: item.shortcut != null
          ? Text(
              item.shortcut!,
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          : null,
      enabled: item.enabled,
      onTap: () {
        if (item.onTap != null) {
          item.onTap!();
        }
        if (widget.closeOnItemTap) {
          _closeDropdown();
        }
      },
    );
  }

  /// Builds a checkbox menu item.
  Widget _buildCheckboxItem(SDropdownMenuItemData<T> item) {
    return CheckboxListTile(
      value: item.isChecked ?? false,
      onChanged: item.enabled
          ? (value) {
              if (item.onCheckedChanged != null) {
                item.onCheckedChanged!(value ?? false);
              }
              // if (widget.closeOnItemTap) {
              //   print('close on item tap');
              //   _closeDropdown();
              // }
            }
          : null,
      title: Text(
        item.label ?? '',
        style: item.enabled
            ? (widget.itemTextStyle ?? const TextStyle(fontSize: 14.0))
            : (widget.disabledItemTextStyle ??
                const TextStyle(fontSize: 14.0, color: Colors.grey)),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  /// Builds a radio button menu item.
  Widget _buildRadioItem(SDropdownMenuItemData<T> item) {
    return RadioListTile<T>(
      value: item.value as T,
      groupValue: widget.selectedRadioValue,
      onChanged: item.enabled
          ? (value) {
              if (widget.onRadioValueChanged != null) {
                widget.onRadioValueChanged!(value);
              }
              if (widget.closeOnItemTap) {
                _closeDropdown();
              }
            }
          : null,
      title: Text(
        item.label ?? '',
        style: item.enabled
            ? (widget.itemTextStyle ?? const TextStyle(fontSize: 14.0))
            : (widget.disabledItemTextStyle ??
                const TextStyle(fontSize: 14.0, color: Colors.grey)),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  /// Builds a submenu menu item.
  Widget _buildSubmenuItem(SDropdownMenuItemData<T> item) {
    return SDropdownSubmenu<T>(
      parentItem: item,
      buildMenuItem: _buildMenuItem,
      closeParentMenu: _closeDropdown,
      itemTextStyle: widget.itemTextStyle,
      disabledItemTextStyle: widget.disabledItemTextStyle,
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
    );
  }

  /// Builds a non-interactive label menu item.
  Widget _buildLabelItem(SDropdownMenuItemData<T> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        item.label ?? '',
        style: widget.itemTextStyle?.copyWith(fontWeight: FontWeight.bold) ??
            const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: widget.trigger,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _closeDropdown();
    super.dispose();
  }
}

/// Internal widget that represents a submenu within the dropdown menu.
class SDropdownSubmenu<T> extends StatefulWidget {
  /// The parent menu item that contains this submenu.
  final SDropdownMenuItemData<T> parentItem;

  /// Function to build individual menu items.
  final Widget Function(SDropdownMenuItemData<T>) buildMenuItem;

  /// Callback to close the parent dropdown menu.
  final VoidCallback closeParentMenu;

  /// The text style for enabled menu items.
  final TextStyle? itemTextStyle;

  /// The text style for disabled menu items.
  final TextStyle? disabledItemTextStyle;

  /// The background color of the submenu.
  final Color? backgroundColor;

  /// The elevation of the submenu.
  final double elevation;

  /// Creates an [SDropdownSubmenu].
  const SDropdownSubmenu({
    super.key,
    required this.parentItem,
    required this.buildMenuItem,
    required this.closeParentMenu,
    this.itemTextStyle,
    this.disabledItemTextStyle,
    this.backgroundColor,
    this.elevation = 8.0,
  });

  @override
  _SDropdownSubmenuState<T> createState() => _SDropdownSubmenuState<T>();
}

class _SDropdownSubmenuState<T> extends State<SDropdownSubmenu<T>>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  /// Opens the submenu by inserting an [OverlayEntry].
  void _openSubmenu() {
    if (_isOpen) return;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
    setState(() {
      _isOpen = true;
    });
  }

  /// Closes the submenu by removing the [OverlayEntry].
  void _closeSubmenu() {
    if (!_isOpen) return;
    _animationController.reverse();
    Future.delayed(const Duration(milliseconds: 200), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() {
        _isOpen = false;
      });
    });
  }

  /// Creates an [OverlayEntry] for the submenu.
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    // double screenWidth = MediaQuery.of(context).size.width;

    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: _closeSubmenu,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: offset.dx + size.width,
                top: offset.dy,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  offset: const Offset(0.0, 0.0),
                  showWhenUnlinked: false,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: Material(
                      color: widget.backgroundColor ??
                          Theme.of(context).canvasColor,
                      elevation: widget.elevation,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 200.0,
                          maxHeight: 300.0,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: widget.parentItem.submenuItems!
                              .map(widget.buildMenuItem)
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => _openSubmenu(),
        onExit: (_) => _closeSubmenu(),
        child: ListTile(
          leading: widget.parentItem.icon,
          title: Text(
            widget.parentItem.label ?? '',
            style: widget.itemTextStyle ?? const TextStyle(fontSize: 14.0),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: null,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _closeSubmenu();
    super.dispose();
  }
}

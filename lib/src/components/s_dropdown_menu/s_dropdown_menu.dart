import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

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

  /// A unique identifier for the menu item, used for state management.
  final String key;

  SDropdownMenuItemData({
    required this.key,
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
  })  : assert(
          (type == SDropdownMenuItemType.checkbox && isChecked != null) ||
              type != SDropdownMenuItemType.checkbox,
          'isChecked must be provided for checkbox menu items.',
        ),
        assert(
          (type == SDropdownMenuItemType.radio && value != null) ||
              type != SDropdownMenuItemType.radio,
          'value must be provided for radio menu items.',
        ),
        assert(
          (type == SDropdownMenuItemType.submenu && submenuItems != null) ||
              type != SDropdownMenuItemType.submenu,
          'submenuItems must be provided for submenu menu items.',
        ),
        assert(
          (type == SDropdownMenuItemType.label && label != null) ||
              type != SDropdownMenuItemType.label,
          'label must be provided for label menu items.',
        ),
        assert(
          (type != SDropdownMenuItemType.checkbox || submenuItems == null),
          'SDropdownMenuItemType of checkbox cannot have sub menu items.',
        ),
        assert(
          (type != SDropdownMenuItemType.radio || submenuItems == null),
          'SDropdownMenuItemType of radio cannot have sub menu items.',
        ),
        assert(
          (type != SDropdownMenuItemType.label || submenuItems == null),
          'SDropdownMenuItemType of label cannot have sub menu items.',
        ),
        assert(
          (type != SDropdownMenuItemType.separator || submenuItems == null),
          'SDropdownMenuItemType of separator cannot have sub menu items.',
        ),
        assert(
          (type != SDropdownMenuItemType.submenu || isChecked == null),
          'SDropdownMenuItemType of submenu cannot have isChecked.',
        ),
        assert(
          (type != SDropdownMenuItemType.submenu || value == null),
          'SDropdownMenuItemType of submenu cannot have value.',
        ),
        assert(
          (type != SDropdownMenuItemType.submenu || shortcut == null),
          'SDropdownMenuItemType of submenu cannot have shortcut.',
        );
}

/// A comprehensive Dropdown Menu Widget that encapsulates triggering, overlay, content,
/// and various types of menu items.
class SDropdownMenu<T> extends StatefulWidget {
  /// The widget that triggers the dropdown menu when interacted with.
  final Widget? trigger;

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

  /// The alignment of the dropdown menu relative to the trigger.
  final SDropdownMenuPosition menuPosition;

  /// Additional offset for the dropdown menu's position.
  final Offset offset;

  /// Creates an [SDropdownMenu].
  const SDropdownMenu({
    super.key,
    this.trigger,
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
    this.menuPosition = SDropdownMenuPosition.bottomLeft,
    this.offset = Offset.zero,
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

  T? _selectedRadioValue;
  Map<String, bool> _checkboxStates = {};

  @override
  void initState() {
    super.initState();

    _selectedRadioValue = widget.selectedRadioValue;
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
    print('close dropdown');
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
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate available space below and above
    double availableHeightBelow = screenHeight - offset.dy - size.height;
    bool openAbove = availableHeightBelow < 100.0;

    double left;
    double top;

    switch (widget.menuPosition) {
      case SDropdownMenuPosition.topLeft:
        left = offset.dx + widget.offset.dx;
        top = openAbove
            ? offset.dy - 300.0 + widget.offset.dy
            : offset.dy + size.height + widget.offset.dy;
        break;
      case SDropdownMenuPosition.topCenter:
        left = offset.dx +
            (size.width / 2) -
            (widget.menuWidth / 2) +
            widget.offset.dx;
        top = openAbove
            ? offset.dy - 300.0 + widget.offset.dy
            : offset.dy + size.height + widget.offset.dy;
        break;
      case SDropdownMenuPosition.topRight:
        left = offset.dx + size.width - widget.menuWidth + widget.offset.dx;
        top = openAbove
            ? offset.dy - 300.0 + widget.offset.dy
            : offset.dy + size.height + widget.offset.dy;
        break;
      case SDropdownMenuPosition.bottomLeft:
        left = offset.dx + widget.offset.dx;
        top = openAbove
            ? offset.dy - 300.0 + widget.offset.dy
            : offset.dy + size.height + widget.offset.dy;
        break;
      case SDropdownMenuPosition.bottomCenter:
        left = offset.dx +
            (size.width / 2) -
            (widget.menuWidth / 2) +
            widget.offset.dx;
        top = openAbove
            ? offset.dy - 300.0 + widget.offset.dy
            : offset.dy + size.height + widget.offset.dy;
        break;
      case SDropdownMenuPosition.bottomRight:
        left = offset.dx + size.width - widget.menuWidth + widget.offset.dx;
        top = openAbove
            ? offset.dy - 300.0 + widget.offset.dy
            : offset.dy + size.height + widget.offset.dy;
        break;
      default:
        left = offset.dx;
        top = openAbove
            ? offset.dy - 300.0 + widget.offset.dy
            : offset.dy + size.height + widget.offset.dy;
    }

    // Ensuring the overlay doesn't go off-screen horizontally
    left = left.clamp(0.0, screenWidth - widget.menuWidth);

    // Ensuring the overlay doesn't go off-screen vertically
    top = top.clamp(0.0, screenHeight - 100.0);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Backdrop GestureDetector
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeDropdown,
                behavior: HitTestBehavior.translucent,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            // Menu Positioned above the backdrop
            Positioned(
              width: widget.menuWidth,
              left: left,
              top: top,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Material(
                  color:
                      widget.backgroundColor ?? Theme.of(context).canvasColor,
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
          ],
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
        } else {
          // Mark the OverlayEntry to rebuild
          _overlayEntry?.markNeedsBuild();
        }
      },
    );
  }

  /// Builds a checkbox menu item.
  Widget _buildCheckboxItem(SDropdownMenuItemData<T> item) {
    return CheckboxListTile(
      value: _checkboxStates[item.key] ?? item.isChecked ?? false,
      onChanged: item.enabled
          ? (value) {
              setState(() {
                _checkboxStates[item.key] = value ?? false;
              });
              if (item.onCheckedChanged != null) {
                item.onCheckedChanged!(value ?? false);
              }
              // Mark the OverlayEntry to rebuild to reflect the new state
              _overlayEntry?.markNeedsBuild();
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

  /// Builds a radio menu item.
  Widget _buildRadioItem(SDropdownMenuItemData<T> item) {
    return RadioListTile<T>(
      value: item.value as T,
      groupValue: _selectedRadioValue,
      onChanged: item.enabled
          ? (value) {
              setState(() {
                _selectedRadioValue = value;
              });
              if (widget.onRadioValueChanged != null) {
                widget.onRadioValueChanged!(value);
              }
              // Mark the OverlayEntry to rebuild to reflect the new state
              _overlayEntry?.markNeedsBuild();
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
      child: widget.trigger != null
          ? GestureDetector(
              onTap: _toggleDropdown,
              child: widget.trigger,
            )
          : SButton(
              onPressed: _toggleDropdown,
              variant: SButtonVariant.outline,
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 6),
              child: Text("Open"),
            ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _overlayEntry?.remove();
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

  /// The alignment of the dropdown menu relative to the trigger.
  final SDropdownMenuPosition menuPosition;

  /// Additional offset for the dropdown menu's position.
  final Offset offset;

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
    this.menuPosition = SDropdownMenuPosition.topLeft,
    this.offset = Offset.zero,
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
    print("Sub Menu opened");
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
    if (!_isOpen || !mounted) return;

    if (_animationController.isAnimating || _animationController.isCompleted) {
      _animationController.reverse();
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() {
        _isOpen = false;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  /// Creates an [OverlayEntry] for the submenu.
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate available space to the right
    // double availableWidthRight = screenWidth - offset.dx - size.width;
    // bool openToRight = availableWidthRight >= 200.0;

    // Determine the position based on alignment
    double left;
    double top;

    switch (widget.menuPosition) {
      case SDropdownMenuPosition.topLeft:
        left = offset.dx + size.width + widget.offset.dx;
        top = offset.dy + widget.offset.dy;
        break;
      case SDropdownMenuPosition.topCenter:
        left = offset.dx + (size.width / 2) - (200.0 / 2) + widget.offset.dx;
        top = offset.dy + widget.offset.dy;
        break;
      case SDropdownMenuPosition.topRight:
        left = offset.dx - 200.0 + widget.offset.dx;
        top = offset.dy + widget.offset.dy;
        break;
      case SDropdownMenuPosition.bottomLeft:
        left = offset.dx + size.width + widget.offset.dx;
        top = offset.dy + size.height + widget.offset.dy;
        break;
      case SDropdownMenuPosition.bottomCenter:
        left = offset.dx + (size.width / 2) - (200.0 / 2) + widget.offset.dx;
        top = offset.dy + size.height + widget.offset.dy;
        break;
      case SDropdownMenuPosition.bottomRight:
        left = offset.dx - 200.0 + widget.offset.dx;
        top = offset.dy + size.height + widget.offset.dy;
        break;
      default:
        left = offset.dx + size.width + widget.offset.dx;
        top = offset.dy + widget.offset.dy;
    }

    // Submenu goes off the screen to the right
    if (left + 200.0 > screenWidth) {
      left = screenWidth - 200.0 - 10.0;
    }

    // Submenu goes off the screen to the left
    if (left < 0.0) {
      left = 10.0;
    }

    // Submenu goes off the screen vertically
    top = top.clamp(0.0, screenHeight - 150.0);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Backdrop GestureDetector for Submenu
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeSubmenu,
                behavior: HitTestBehavior.translucent,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            // Submenu Positioned above the backdrop
            Positioned(
              left: left,
              top: top,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Material(
                  color:
                      widget.backgroundColor ?? Theme.of(context).canvasColor,
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
          ],
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
          onTap: () => _openSubmenu(),
        ),
      ),
    );
  }
}

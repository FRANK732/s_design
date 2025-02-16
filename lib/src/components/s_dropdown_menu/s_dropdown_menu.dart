import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SDropdownMenu extends StatefulWidget {
  final List<String> items;
  final ValueChanged<dynamic> onChanged;
  final String? hintText;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? menuPadding;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? highlightColor;
  final double? borderRadius;
  final BorderRadius? menuBorderRadius;
  final BoxShadow? shadow;
  final List<BoxShadow>? menuShadows;
  final TextStyle? textStyle;
  final TextStyle? menuTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? selectedTextStyle;
  final Color? menuBackgroundColor;
  final Color? menuItemBackgroundColor;
  final Color? menuItemHoverColor;
  final Color? menuItemSelectedColor;
  final double? menuElevation;
  final double? menuWidth;
  final double? menuMaxHeight;
  final double? menuItemHeight;
  final double? menuItemPadding;
  final SDropdownMenuItemType menuType;
  final Duration animationDuration;
  final Curve animationCurve;
  final SDropdownMenuPosition preferredPosition;
  final bool showSelectedItemIcon;
  final Widget? selectedItemIcon;
  final bool showClearButton;
  final Widget? clearButtonIcon;
  final VoidCallback? onClear;
  final bool showMenuIcon;
  final Widget? menuIcon;
  final bool showDivider;
  final Color? dividerColor;
  final double? dividerThickness;
  final EdgeInsetsGeometry? dividerPadding;
  final bool showScrollbar;
  final ScrollbarThemeData? scrollbarTheme;
  final bool showCheckbox;
  final Color? checkboxActiveColor;
  final Color? checkboxCheckColor;
  final Color? checkboxHoverColor;

  final double? triggerWidth;
  final double? triggerHeight;
  final Decoration? triggerDecoration;
  final AlignmentGeometry? triggerAlignment;
  final AlignmentGeometry? triggerIconAlignment;
  final TextOverflow? triggerTextOverflow;
  final int? maxSelectedItemsToShow;
  final VoidCallback? onMenuOpen;
  final VoidCallback? onMenuClose;
  final EdgeInsetsGeometry? triggerMargin;
  final Border? triggerBorder;
  final Gradient? triggerGradient;
  final ShapeBorder? triggerShape;
  final BoxConstraints? triggerConstraints;
  final EdgeInsetsGeometry? triggerContentPadding;

  final EdgeInsetsGeometry? menuMargin;
  final Border? menuBorder;
  final Gradient? menuGradient;
  final ShapeBorder? menuShape;
  final BoxConstraints? menuConstraints;
  final EdgeInsetsGeometry? menuContentPadding;

  // New fields for direction and expansion
  final Axis selectedItemsDirection;
  final bool expandToMax;
  final double? triggerMaxHeight;
  final double? triggerMaxWidth;

  SDropdownMenu({
    Key? key,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.icon,
    this.padding,
    this.menuPadding,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.highlightColor,
    this.borderRadius,
    this.menuBorderRadius,
    this.shadow,
    this.menuShadows,
    this.textStyle,
    this.menuTextStyle,
    this.hintTextStyle,
    this.selectedTextStyle,
    this.menuBackgroundColor,
    this.menuItemBackgroundColor,
    this.menuItemHoverColor,
    this.menuItemSelectedColor,
    this.menuElevation,
    this.menuWidth,
    this.menuMaxHeight,
    this.menuItemHeight,
    this.menuItemPadding,
    this.menuType = SDropdownMenuItemType.normal,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.preferredPosition = SDropdownMenuPosition.bottom,
    this.showSelectedItemIcon = false,
    this.selectedItemIcon,
    this.showClearButton = false,
    this.clearButtonIcon,
    this.onClear,
    this.showMenuIcon = true,
    this.menuIcon,
    this.showDivider = false,
    this.dividerColor,
    this.dividerThickness,
    this.dividerPadding,
    this.showScrollbar = true,
    this.scrollbarTheme,
    this.showCheckbox = false,
    this.checkboxActiveColor,
    this.checkboxCheckColor,
    this.checkboxHoverColor,
    this.triggerWidth,
    this.triggerHeight,
    this.triggerDecoration,
    this.triggerAlignment,
    this.triggerIconAlignment,
    this.triggerTextOverflow,
    this.maxSelectedItemsToShow,
    this.onMenuOpen,
    this.onMenuClose,
    this.triggerMargin,
    this.triggerBorder,
    this.triggerGradient,
    this.triggerShape,
    this.triggerConstraints,
    this.triggerContentPadding,
    this.menuMargin,
    this.menuBorder,
    this.menuGradient,
    this.menuShape,
    this.menuConstraints,
    this.menuContentPadding,
    this.selectedItemsDirection = Axis.horizontal,
    this.expandToMax = false,
    this.triggerMaxHeight,
    this.triggerMaxWidth,
  }) : super(key: key) {
    // Assertions for production-level validation
    assert(items.isNotEmpty, 'Items list cannot be empty.');
    assert(menuType != null, 'Menu type cannot be null.');
    assert(animationDuration != null && animationDuration >= Duration.zero,
        'Animation duration must be non-negative.');
    assert(menuWidth == null || menuWidth! > 0, 'Menu width must be positive.');
    assert(menuMaxHeight == null || menuMaxHeight! > 0,
        'Menu max height must be positive.');
    assert(triggerWidth == null || triggerWidth! > 0,
        'Trigger width must be positive.');
    assert(triggerHeight == null || triggerHeight! > 0,
        'Trigger height must be positive.');
    assert(maxSelectedItemsToShow == null || maxSelectedItemsToShow! > 0,
        'Max selected items to show must be positive.');
    assert(borderRadius == null || borderRadius! >= 0,
        'Border radius must be non-negative.');
    assert(menuBorderRadius == null || menuBorderRadius!.topLeft.x >= 0,
        'Menu border radius must be non-negative.');
    assert(dividerThickness == null || dividerThickness! >= 0,
        'Divider thickness must be non-negative.');
    assert(checkboxActiveColor == null || checkboxActiveColor != null,
        'Checkbox active color must be a valid color.');
    assert(checkboxCheckColor == null || checkboxCheckColor != null,
        'Checkbox check color must be a valid color.');
    assert(checkboxHoverColor == null || checkboxHoverColor != null,
        'Checkbox hover color must be a valid color.');
    assert(onChanged != null, 'onChanged callback cannot be null.');
    assert(onClear == null || onClear != null,
        'onClear callback must be valid if provided.');
    assert(onMenuOpen == null || onMenuOpen != null,
        'onMenuOpen callback must be valid if provided.');
    assert(onMenuClose == null || onMenuClose != null,
        'onMenuClose callback must be valid if provided.');
    assert(triggerMaxHeight == null || triggerMaxHeight! > 0,
        'Trigger max height must be positive.');
    assert(triggerMaxWidth == null || triggerMaxWidth! > 0,
        'Trigger max width must be positive.');
  }

  @override
  _SDropdownMenuState createState() => _SDropdownMenuState();
}

class _SDropdownMenuState extends State<SDropdownMenu> {
  List<String> _selectedItems = [];
  bool _isMenuOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  TextEditingController _searchController = TextEditingController();
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
              item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _toggleMenu() {
    if (_isMenuOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      if (widget.onMenuClose != null) widget.onMenuClose!();
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
      if (widget.onMenuOpen != null) widget.onMenuOpen!();
    }
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    var screenSize = MediaQuery.of(context).size;

    double menuWidth = widget.menuWidth ?? renderBox.size.width;
    double menuHeight = _calculateMenuHeight();

    // Calculate the position based on the preferred position and available space
    Offset menuOffset = _calculateMenuPosition(
        offset, screenSize, menuWidth, menuHeight, renderBox);

    return OverlayEntry(
      builder: (context) {
        final theme = Theme.of(context);
        return Stack(
          children: [
            // Transparent background to capture taps outside the dropdown
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleMenu,
                behavior: HitTestBehavior.translucent,
              ),
            ),
            // Dropdown menu content
            Positioned(
              left: menuOffset.dx,
              top: menuOffset.dy,
              width: menuWidth,
              child: Container(
                margin: widget.menuMargin,
                constraints: widget.menuConstraints,
                child: Material(
                  elevation:
                      widget.menuElevation ?? theme.cardTheme.elevation ?? 4,
                  color: widget.menuBackgroundColor ?? theme.cardColor,
                  shape: widget.menuShape ??
                      RoundedRectangleBorder(
                        borderRadius:
                            widget.menuBorderRadius ?? BorderRadius.circular(8),
                      ),
                  child: AnimatedContainer(
                    duration: widget.animationDuration,
                    curve: widget.animationCurve,
                    padding: widget.menuContentPadding ??
                        widget.menuPadding ??
                        const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: widget.menuGradient,
                      border: widget.menuBorder,
                    ),
                    child: Column(
                      children: [
                        if (widget.menuType == SDropdownMenuItemType.searchable)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SInputField.search(
                              controller: _searchController,
                              hintText: 'Search...',
                            ),
                          ),
                        if (widget.showDivider)
                          Divider(
                            color: widget.dividerColor ?? theme.dividerColor,
                            thickness: widget.dividerThickness ?? 1,
                            height: widget.dividerPadding?.vertical ?? 8,
                          ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight:
                                widget.menuMaxHeight ?? screenSize.height * 0.4,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: _filteredItems.map((item) {
                                return widget.menuType ==
                                        SDropdownMenuItemType.multiSelect
                                    ? CheckboxListTile(
                                        title: Text(
                                          item,
                                          style: widget.menuTextStyle ??
                                              theme.textTheme.bodyMedium,
                                        ),
                                        value: _selectedItems.contains(item),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == true) {
                                              _selectedItems.add(item);
                                            } else {
                                              _selectedItems.remove(item);
                                            }
                                            widget.onChanged(_selectedItems);
                                          });
                                          // Mark the overlay entry to rebuild
                                          _overlayEntry?.markNeedsBuild();
                                        },
                                        activeColor: widget.checkboxActiveColor,
                                        checkColor: widget.checkboxCheckColor,
                                        hoverColor: widget.checkboxHoverColor,
                                      )
                                    : ListTile(
                                        title: Text(
                                          item,
                                          style: widget.menuTextStyle ??
                                              theme.textTheme.bodyMedium,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _selectedItems = [item];
                                            widget.onChanged(item);
                                          });
                                          _toggleMenu();
                                        },
                                      );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
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

  double _calculateMenuHeight() {
    double baseHeight = _filteredItems.length * (widget.menuItemHeight ?? 48.0);
    if (widget.menuType == SDropdownMenuItemType.searchable) {
      baseHeight += 64;
    }
    return baseHeight;
  }

  Offset _calculateMenuPosition(Offset offset, Size screenSize,
      double menuWidth, double menuHeight, RenderBox renderBox) {
    double dx = offset.dx;
    double dy = offset.dy;

    switch (widget.preferredPosition) {
      case SDropdownMenuPosition.bottom:
        if (dy + menuHeight > screenSize.height) {
          dy = offset.dy - menuHeight;
        } else {
          dy = offset.dy + renderBox.size.height;
        }
        break;
      case SDropdownMenuPosition.top:
        if (dy - menuHeight < 0) {
          dy = offset.dy + renderBox.size.height;
        } else {
          dy = offset.dy - menuHeight;
        }
        break;
      case SDropdownMenuPosition.left:
        if (dx - menuWidth < 0) {
          dx = offset.dx + renderBox.size.width;
        } else {
          dx = offset.dx - menuWidth;
        }
        break;
      case SDropdownMenuPosition.right:
        if (dx + menuWidth > screenSize.width) {
          dx = offset.dx - menuWidth;
        } else {
          dx = offset.dx + renderBox.size.width;
        }
        break;
    }

    // Ensure the menu stays within screen bounds
    dx = dx.clamp(0, screenSize.width - menuWidth);
    dy = dy.clamp(0, screenSize.height - menuHeight);

    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleMenu,
        child: Container(
          margin: widget.triggerMargin,
          constraints: widget.triggerConstraints,
          child: AnimatedContainer(
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            width: widget.triggerWidth ?? 200,
            height: widget.triggerHeight,
            padding: widget.triggerContentPadding ??
                widget.padding ??
                const EdgeInsets.all(12),
            decoration: widget.triggerDecoration ??
                BoxDecoration(
                  color: widget.backgroundColor ??
                      theme.inputDecorationTheme.focusColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                  border: widget.triggerBorder,
                  gradient: widget.triggerGradient,
                  shape: widget.triggerShape != null
                      ? BoxShape.rectangle
                      : BoxShape.rectangle,
                ),
            alignment: widget.triggerAlignment ?? Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: widget.menuType == SDropdownMenuItemType.multiSelect
                      ? _buildSelectedItems()
                      : Text(
                          _selectedItems.isNotEmpty
                              ? _selectedItems.first
                              : widget.hintText ?? 'Select an item',
                          style: widget.textStyle ?? theme.textTheme.bodyMedium,
                          overflow: widget.triggerTextOverflow,
                        ),
                ),
                if (widget.showClearButton && _selectedItems.isNotEmpty)
                  IconButton(
                    icon: widget.clearButtonIcon ?? const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _selectedItems.clear();
                        widget.onChanged(_selectedItems);
                        if (widget.onClear != null) widget.onClear!();
                      });
                    },
                  ),
                if (widget.showMenuIcon)
                  Align(
                    alignment:
                        widget.triggerIconAlignment ?? Alignment.centerRight,
                    child: widget.menuIcon ??
                        Icon(Icons.arrow_drop_down,
                            color: theme.iconTheme.color),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedItems() {
    final theme = Theme.of(context);
    final selectedItems = _selectedItems
        .take(widget.maxSelectedItemsToShow ?? 3)
        .map((item) => Chip(
              label: Text(
                item,
                style: widget.selectedTextStyle ?? theme.textTheme.bodyMedium,
                overflow: widget.triggerTextOverflow,
              ),
              onDeleted: () {
                setState(() {
                  _selectedItems.remove(item);
                  widget.onChanged(_selectedItems);
                });
              },
            ))
        .toList();

    return widget.expandToMax
        ? ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: widget.triggerMaxHeight ?? double.infinity,
              maxWidth: widget.triggerMaxWidth ?? double.infinity,
            ),
            child: SingleChildScrollView(
              scrollDirection: widget.selectedItemsDirection,
              child: widget.selectedItemsDirection == Axis.horizontal
                  ? Row(children: selectedItems)
                  : Column(children: selectedItems),
            ),
          )
        : Wrap(
            direction: widget.selectedItemsDirection,
            spacing: 4,
            runSpacing: 4,
            children: selectedItems,
          );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

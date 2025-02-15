import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SDropdownMenu extends StatefulWidget {
  final List<String> items;
  final ValueChanged<dynamic> onChanged;
  final String? hintText;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxShadow? shadow;
  final TextStyle? textStyle;
  final SDropdownMenuItemType menuType;
  final Duration animationDuration;
  final Curve animationCurve;
  final Color? menuBackgroundColor;
  final double? menuElevation;
  final double? menuWidth;
  final SDropdownMenuPosition preferredPosition;

  const SDropdownMenu({
    Key? key,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.icon,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.shadow,
    this.textStyle,
    this.menuType = SDropdownMenuItemType.normal,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.menuBackgroundColor,
    this.menuElevation,
    this.menuWidth,
    this.preferredPosition = SDropdownMenuPosition.bottom,
  }) : super(key: key);

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
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
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
                onTap: _toggleMenu, // Close the dropdown when tapping outside
                behavior: HitTestBehavior.translucent,
              ),
            ),
            // Dropdown menu content
            Positioned(
              left: menuOffset.dx,
              top: menuOffset.dy,
              width: menuWidth,
              child: Material(
                elevation:
                    widget.menuElevation ?? theme.cardTheme.elevation ?? 4,
                color: widget.menuBackgroundColor ?? theme.cardColor,
                borderRadius: BorderRadius.circular(
                  widget.borderRadius is BorderRadius
                      ? (widget.borderRadius as BorderRadius).topLeft.x
                      : (theme.cardTheme.shape is RoundedRectangleBorder
                          ? (theme.cardTheme.shape as RoundedRectangleBorder)
                              .borderRadius
                              .resolve(TextDirection.ltr)
                              .topLeft
                              .x
                          : 8),
                ),
                child: AnimatedContainer(
                  duration: widget.animationDuration,
                  curve: widget.animationCurve,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      if (widget.menuType == SDropdownMenuItemType.searchable)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SInputField(
                            controller: _searchController,
                            hintText: 'Search...',
                          ),
                        ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: screenSize.height * 0.4,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: _filteredItems.map((item) {
                              return widget.menuType ==
                                      SDropdownMenuItemType.multiSelect
                                  ? CheckboxListTile(
                                      title: Text(
                                        item,
                                        style: theme.textTheme.bodyMedium,
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
                                      },
                                    )
                                  : ListTile(
                                      title: Text(
                                        item,
                                        style: theme.textTheme.bodyMedium,
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
          ],
        );
      },
    );
  }

  double _calculateMenuHeight() {
    double baseHeight =
        _filteredItems.length * 48.0; // Approximate height per item
    if (widget.menuType == SDropdownMenuItemType.searchable) {
      baseHeight += 64; // Add height for the search bar
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
        child: AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          padding: widget.padding ?? const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? theme.cardColor,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            boxShadow: widget.shadow != null
                ? [widget.shadow!]
                : [
                    BoxShadow(
                      color: theme.shadowColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.menuType == SDropdownMenuItemType.multiSelect
                    ? _selectedItems.isNotEmpty
                        ? _selectedItems.join(', ')
                        : widget.hintText ?? 'Select items'
                    : _selectedItems.isNotEmpty
                        ? _selectedItems.first
                        : widget.hintText ?? 'Select an item',
                style: widget.textStyle ?? theme.textTheme.bodyMedium,
              ),
              widget.icon ??
                  Icon(Icons.arrow_drop_down, color: theme.iconTheme.color),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

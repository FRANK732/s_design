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
  final STriggerContainerSize triggerSize;
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

  final Widget? chipAvatar;
  final EdgeInsetsGeometry? chipLabelPadding;
  final Widget? chipDeleteIcon;
  final VoidCallback? chipOnDeleted;
  final Color? chipDeleteIconColor;
  final String? chipDeleteButtonTooltipMessage;
  final BorderSide? chipSide;
  final OutlinedBorder? chipShape;
  final Clip clipBehavior;
  final FocusNode? chipFocusNode;
  final bool chipAutofocus;
  final Color? chipBackgroundColor;
  final EdgeInsetsGeometry? chipPadding;
  final VisualDensity? chipVisualDensity;
  final MaterialTapTargetSize? chipMaterialTapTargetSize;
  final double? chipElevation;
  final Color? chipShadowColor;
  final Color? chipSurfaceTintColor;
  final IconThemeData? chipIconTheme;
  final BoxConstraints? chipAvatarBoxConstraints;
  final BoxConstraints? chipDeleteIconBoxConstraints;
  final ChipAnimationStyle? chipAnimationStyle;

  final bool expandToMax;
  final double? triggerMaxHeight;
  final double? triggerMaxWidth;

  final FocusNode? triggerFocus;
  final bool readOnly;
  final String? initialValue;
  final List<String>? initialValues;

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
    this.triggerSize = STriggerContainerSize.md,
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
    this.expandToMax = false,
    this.triggerMaxHeight,
    this.triggerMaxWidth,
    this.chipAvatar,
    this.chipLabelPadding,
    this.chipDeleteIcon,
    this.chipOnDeleted,
    this.chipDeleteIconColor,
    this.chipDeleteButtonTooltipMessage,
    this.chipSide,
    this.chipShape,
    this.clipBehavior = Clip.none,
    this.chipFocusNode,
    this.chipAutofocus = false,
    this.chipBackgroundColor,
    this.chipPadding,
    this.chipVisualDensity,
    this.chipMaterialTapTargetSize,
    this.chipElevation,
    this.chipShadowColor,
    this.chipSurfaceTintColor,
    this.chipIconTheme,
    this.chipAvatarBoxConstraints,
    this.chipDeleteIconBoxConstraints,
    this.chipAnimationStyle,
    this.initialValue,
    this.initialValues,
    this.triggerFocus,
    this.readOnly = false,
  }) : super(key: key) {
    assert(items.isNotEmpty, 'Items list cannot be empty.');
    assert(menuWidth == null || menuWidth! > 0, 'Menu width must be positive.');
    assert(menuMaxHeight == null || menuMaxHeight! > 0,
        'Menu max height must be positive.');
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
    assert(
        initialValue == null || initialValues == null,
        'Cannot provide both initialValue and initialValues. '
        'Use initialValue for single selection and initialValues for multi-selection.');
    assert(initialValue == null || menuType == SDropdownMenuItemType.normal,
        'initialValue can only be used with SDropdownMenuItemType.normal.');
    assert(
        initialValues == null || menuType == SDropdownMenuItemType.multiSelect,
        'initialValues can only be used with SDropdownMenuItemType.multiSelect.');
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
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_onSearchChanged);

    // Initialize selected items based on initial values
    if (widget.menuType == SDropdownMenuItemType.multiSelect) {
      _selectedItems = widget.initialValues ?? [];
    } else {
      if (widget.initialValue != null) {
        _selectedItems = [widget.initialValue!];
      }
    }

    // Initialize focus node
    _focusNode = widget.triggerFocus ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _isMenuOpen) {
      _toggleMenu();
    }
  }

  void _onSearchChanged() {
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
              item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  // void _toggleMenu() {
  //   if (widget.readOnly) return; // Do nothing if read-only

  //   if (_isMenuOpen) {
  //     _closeMenu();
  //   } else {
  //     _openMenu();
  //   }
  // }

  void _toggleMenu() {
    if (_isMenuOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _openMenu() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    widget.onMenuOpen?.call();
    setState(() {
      _isMenuOpen = true;
    });
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    widget.onMenuClose?.call();
    setState(() {
      _isMenuOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    var screenSize = MediaQuery.of(context).size;

    double menuWidth =
        STriggerContainerSizeUtils.getMenuWidth(widget.triggerSize, context);
    double menuHeight = _calculateMenuHeight();

    Offset menuOffset = _calculateMenuPosition(
        offset, screenSize, menuWidth, menuHeight, renderBox);

    return OverlayEntry(
      builder: (context) {
        final theme = Theme.of(context);
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleMenu,
                behavior: HitTestBehavior.translucent,
              ),
            ),
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
                            maxHeight: menuHeight,
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

    dx = dx.clamp(0, screenSize.width - menuWidth);
    dy = dy.clamp(0, screenSize.height - menuHeight);

    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final containerHeight =
        STriggerContainerSizeUtils.getContainerHeight(widget.triggerSize);
    final containerWidth =
        STriggerContainerSizeUtils.getContainerWidth(widget.triggerSize);
    final containerPadding =
        STriggerContainerSizeUtils.getContainerPadding(widget.triggerSize);

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (popped, result) {
        if (_isMenuOpen) {
          _closeMenu();
        }
      },
      child: CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: () {
              if (widget.readOnly) return;
              _toggleMenu();
            },
            child: Focus(
              focusNode: _focusNode,
              child: Container(
                margin: widget.triggerMargin,
                constraints: widget.triggerConstraints,
                decoration: widget.triggerDecoration,
                child: AnimatedContainer(
                  duration: widget.animationDuration,
                  curve: widget.animationCurve,
                  width: containerWidth,
                  height: containerHeight,
                  padding: containerPadding,
                  decoration: widget.triggerDecoration ??
                      BoxDecoration(
                        color: widget.backgroundColor ??
                            theme.inputDecorationTheme.focusColor,
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 8),
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
                        child: widget.menuType ==
                                SDropdownMenuItemType.multiSelect
                            ? _selectedItems.isEmpty
                                ? Text(
                                    widget.hintText ?? 'Select an item',
                                    style: widget.hintTextStyle ??
                                        widget.textStyle ??
                                        theme.textTheme.bodyMedium,
                                    overflow: widget.triggerTextOverflow,
                                  )
                                : _buildSelectedItems()
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  _selectedItems.isNotEmpty
                                      ? _selectedItems.first
                                      : widget.hintText ?? 'Select an item',
                                  style: widget.textStyle ??
                                      theme.textTheme.bodyMedium,
                                  overflow: widget.triggerTextOverflow ??
                                      TextOverflow.ellipsis,
                                ),
                              ),
                      ),
                      if (widget.showClearButton && _selectedItems.isNotEmpty)
                        IconButton(
                          iconSize: STriggerContainerSizeUtils.getIconSize(
                                  widget.triggerSize) *
                              0.7,
                          icon: widget.clearButtonIcon ??
                              Icon(
                                Icons.clear,
                                color: theme.iconTheme.color,
                              ),
                          onPressed: widget.readOnly
                              ? null
                              : () {
                                  setState(() {
                                    _selectedItems.clear();
                                    widget.onChanged(_selectedItems);
                                    widget.onClear?.call();
                                  });
                                },
                        ),
                      if (widget.showMenuIcon)
                        Align(
                          alignment: widget.triggerIconAlignment ??
                              Alignment.centerRight,
                          child: widget.menuIcon ??
                              Icon(
                                Icons.arrow_drop_down,
                                size: STriggerContainerSizeUtils.getIconSize(
                                    widget.triggerSize),
                                color: theme.iconTheme.color,
                              ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildSelectedItems() {
    final theme = Theme.of(context);
    final chipHeight =
        STriggerContainerSizeUtils.getChipHeight(widget.triggerSize);
    final chipWidth =
        STriggerContainerSizeUtils.getChipWidth(widget.triggerSize);
    final chipPadding =
        STriggerContainerSizeUtils.getChipPadding(widget.triggerSize);
    final chipIconSize =
        STriggerContainerSizeUtils.getChipIconSize(widget.triggerSize);
    final chipElevation =
        STriggerContainerSizeUtils.getChipElevation(widget.triggerSize);

    final selectedItems = _selectedItems
        .take(widget.maxSelectedItemsToShow ?? 3)
        .map((item) => Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Chip(
                avatar: widget.chipAvatar,
                label: Text(
                  item,
                  style: widget.selectedTextStyle ?? theme.textTheme.bodyMedium,
                  overflow: widget.triggerTextOverflow,
                ),
                labelPadding: widget.chipLabelPadding ?? chipPadding,
                deleteIcon: widget.chipDeleteIcon ??
                    Icon(Icons.close, size: chipIconSize),
                onDeleted: () {
                  setState(() {
                    _selectedItems.remove(item);
                    widget.onChanged(_selectedItems);
                  });
                },
                deleteIconColor: widget.chipDeleteIconColor,
                deleteButtonTooltipMessage:
                    widget.chipDeleteButtonTooltipMessage,
                side: widget.chipSide,
                shape: widget.chipShape,
                clipBehavior: widget.clipBehavior,
                focusNode: widget.chipFocusNode,
                autofocus: widget.chipAutofocus,
                backgroundColor: widget.chipBackgroundColor,
                padding: widget.chipPadding ?? chipPadding,
                visualDensity: widget.chipVisualDensity,
                materialTapTargetSize: widget.chipMaterialTapTargetSize,
                elevation: widget.chipElevation ?? chipElevation,
                shadowColor: widget.chipShadowColor,
                surfaceTintColor: widget.chipSurfaceTintColor,
                iconTheme: widget.chipIconTheme,
                avatarBoxConstraints: widget.chipAvatarBoxConstraints,
                deleteIconBoxConstraints: widget.chipDeleteIconBoxConstraints,
                chipAnimationStyle: widget.chipAnimationStyle,
              ),
            ))
        .toList();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.triggerMaxHeight ?? double.infinity,
        maxWidth: widget.triggerMaxWidth ?? double.infinity,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: selectedItems),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.removeListener(_onFocusChange);
    if (widget.triggerFocus == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }
}

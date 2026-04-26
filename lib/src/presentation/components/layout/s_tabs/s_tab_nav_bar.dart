import 'dart:ui'
    as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../s_design.dart';

class STabNavBar
    extends StatefulWidget {
  const STabNavBar({
    super.key,
    required this.items,
    required this.activeKey,
    required this.onTabClick,
    this.onEdit,
    this.type =
        STabType.line,
    this.tabPosition =
        STabPosition.top,
    this.size =
        STabSize.medium,
    this.tabBarExtraContent,
    this.centered =
        false,
    this.onClose,
    this.controller,
  });

  final List<STabItem>
      items;
  final String
      activeKey;
  final ValueChanged<String>
      onTabClick;
  final void Function(
      String
          key,
      String
          action)? onEdit;
  final STabType
      type;
  final STabPosition
      tabPosition;
  final STabSize
      size;
  final Widget?
      tabBarExtraContent;
  final bool
      centered;
  final void
          Function(String key)?
      onClose;
  final TabController?
      controller;

  @override
  State<STabNavBar>
      createState() =>
          _STabNavBarState();
}

class _STabNavBarState
    extends State<
        STabNavBar>
    with
        TickerProviderStateMixin {
  // Key for the container of the tabs to calculate offsets
  final GlobalKey
      _barKey =
      GlobalKey();
  // Map of keys for each tab item to find their render objects
  final Map<String,
          GlobalKey>
      _tabKeys =
      <String,
          GlobalKey<State<StatefulWidget>>>{};

  // Scroll controller for the tab list
  final ScrollController
      _scrollController =
      ScrollController();

  // Animation controller for the sliding indicator
  late AnimationController
      _indicatorController;
  late Animation<double>
      _indicatorAnimation;

  // Current indicator state
  Rect?
      _indicatorRect;
  Rect?
      _targetIndicatorRect;

  @override
  void
      initState() {
    super
        .initState();
    _indicatorController =
        AnimationController(
      vsync:
          this,
      duration:
          const Duration(milliseconds: 300),
    );

    if (widget.controller !=
        null) {
      _indicatorAnimation =
          widget.controller!.animation!;
    } else {
      _indicatorAnimation =
          CurvedAnimation(
        parent: _indicatorController,
        curve: Curves.easeInOut,
      );
    }

    _indicatorController
        .addListener(() {
      setState(() {
        // Re-render to animate indicator
      });
    });

    _attachExternalListener();

    // Initialize keys
    for (final STabItem item
        in widget.items) {
      _tabKeys[item.key] =
          GlobalKey();
    }

    // Initial measurement frame
    WidgetsBinding
        .instance
        .addPostFrameCallback((_) {
      _updateIndicator();
      _scrollToActiveItem();
    });
  }

  @override
  void didUpdateWidget(
      STabNavBar
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    // Update keys if items changed
    if (widget.items !=
        oldWidget.items) {
      // Remove unused keys
      final Set<String>
          newKeys =
          widget.items.map((STabItem e) => e.key).toSet();
      _tabKeys.removeWhere((String key, _) =>
          !newKeys.contains(key));
      // Add new keys
      for (final STabItem item
          in widget.items) {
        if (!_tabKeys.containsKey(item.key)) {
          _tabKeys[item.key] = GlobalKey();
        }
      }
    }

    if (widget.activeKey !=
        oldWidget
            .activeKey) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateIndicator();
        _scrollToActiveItem();
      });
    } else if (widget.items != oldWidget.items ||
        widget.tabPosition != oldWidget.tabPosition) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          _updateIndicator());
    }

    if (widget.controller !=
        oldWidget.controller) {
      _detachExternalListener();
      _attachExternalListener();
    }
  }

  @override
  void
      dispose() {
    _indicatorController
        .dispose();
    _scrollController
        .dispose();
    super
        .dispose();
  }

  VoidCallback?
      _currentListener;

  void
      _attachExternalListener() {
    if (widget.controller !=
        null) {
      _currentListener =
          () => setState(() {});
      widget.controller!.animation?.addListener(_currentListener!);
    }
  }

  void
      _detachExternalListener() {
    if (widget.controller != null &&
        _currentListener != null) {
      widget.controller!.animation?.removeListener(_currentListener!);
      _currentListener =
          null;
    }
  }

  void
      _scrollToActiveItem() {
    final GlobalKey<State<StatefulWidget>>?
        key =
        _tabKeys[widget.activeKey];
    if (key?.currentContext !=
        null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.5, // Center the item
      );
    }
  }

  void
      _updateIndicator() {
    if (widget.type !=
        STabType.line) {
      return;
    }

    final RenderBox?
        barRenderObject =
        _barKey.currentContext?.findRenderObject() as RenderBox?;
    final GlobalKey<State<StatefulWidget>>?
        activeTabKey =
        _tabKeys[widget.activeKey];
    final RenderBox?
        activeRenderObject =
        activeTabKey?.currentContext?.findRenderObject() as RenderBox?;

    if (barRenderObject != null &&
        activeRenderObject != null) {
      final Offset
          barOffset =
          barRenderObject.localToGlobal(Offset.zero);
      final Offset
          tabOffset =
          activeRenderObject.localToGlobal(Offset.zero);
      final Offset
          relativeOffset =
          tabOffset - barOffset;

      final Rect
          newRect =
          Rect.fromLTWH(
        relativeOffset.dx,
        relativeOffset.dy,
        activeRenderObject.size.width,
        activeRenderObject.size.height,
      );

      if (_targetIndicatorRect !=
          newRect) {
        if (_indicatorRect == null) {
          _indicatorRect = newRect;
        } else {
          _indicatorRect = _currentAnimatedRect;
        }
        _targetIndicatorRect = newRect;
        if (_indicatorRect != _targetIndicatorRect) {
          _indicatorController.forward(from: 0.0);
        }
      }
    }
  }

  Rect?
      get _currentAnimatedRect {
    if (_indicatorRect == null ||
        _targetIndicatorRect == null) {
      return _indicatorRect ??
          _targetIndicatorRect;
    }

    // If using TabController, calculate rect based on animation value
    if (widget.controller !=
        null) {
      final double
          value =
          _indicatorAnimation.value.clamp(0.0, (widget.items.length - 1).toDouble());

      // Find the two indices we are between
      final int
          leftIndex =
          value.floor();
      final int
          rightIndex =
          value.ceil();

      if (leftIndex < 0 ||
          rightIndex >= widget.items.length) {
        return null;
      }

      final String
          leftKey =
          widget.items[leftIndex].key;
      final String
          rightKey =
          widget.items[rightIndex].key;

      final Rect?
          leftRect =
          _getTabRect(leftKey);
      final Rect?
          rightRect =
          _getTabRect(rightKey);

      if (leftRect == null ||
          rightRect == null) {
        return null;
      }

      final double
          t =
          value - leftIndex;

      final double
          leftT =
          Curves.easeInCubic.transform(t);
      final double
          rightT =
          Curves.easeOutCubic.transform(t);

      final double
          newLeft =
          ui.lerpDouble(leftRect.left, rightRect.left, leftT)!;
      final double
          newRight =
          ui.lerpDouble(leftRect.right, rightRect.right, rightT)!;
      final double
          newTop =
          ui.lerpDouble(leftRect.top, rightRect.top, t)!;
      final double
          newBottom =
          ui.lerpDouble(leftRect.bottom, rightRect.bottom, t)!;

      return Rect.fromLTRB(
          newLeft,
          newTop,
          newRight,
          newBottom);
    }

    return Rect.lerp(
        _indicatorRect,
        _targetIndicatorRect,
        _indicatorAnimation.value);
  }

  Rect? _getTabRect(
      String
          key) {
    if (widget.type !=
        STabType.line) {
      return null;
    }

    final RenderBox?
        barRenderObject =
        _barKey.currentContext?.findRenderObject() as RenderBox?;
    final GlobalKey<State<StatefulWidget>>?
        activeTabKey =
        _tabKeys[key];
    final RenderBox?
        activeRenderObject =
        activeTabKey?.currentContext?.findRenderObject() as RenderBox?;

    if (barRenderObject != null &&
        activeRenderObject != null) {
      final Offset
          barOffset =
          barRenderObject.localToGlobal(Offset.zero);
      final Offset
          tabOffset =
          activeRenderObject.localToGlobal(Offset.zero);
      final Offset
          relativeOffset =
          tabOffset - barOffset;

      return Rect.fromLTWH(
        relativeOffset.dx,
        relativeOffset.dy,
        activeRenderObject.size.width,
        activeRenderObject.size.height,
      );
    }
    return null;
  }

  @override
  Widget build(
      BuildContext
          context) {
    final STabsThemeData
        theme =
        Theme.of(context).sTabsTheme;
    final bool
        isVertical =
        widget.tabPosition == STabPosition.left || widget.tabPosition == STabPosition.right;

    final double itemPaddingVertical = widget.size == STabSize.small
        ? 6
        : (widget.size == STabSize.large ? 12 : 10);
    final double itemPaddingHorizontal = widget.size == STabSize.small
        ? 8
        : (widget.size == STabSize.large ? 20 : 16);
    final double fontSize = widget.size == STabSize.small
        ? 12
        : (widget.size == STabSize.large ? 16 : 14);

    return Container(
      color: widget.type == STabType.card
          ? theme.cardBackgroundColor
          : null,
      child:
          Flex(
        direction: isVertical ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: widget.centered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: <Widget>[
          // ScrollView for tabs
          Flexible(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: <Widget>[
                  Flex(
                    key: _barKey,
                    direction: isVertical ? Axis.vertical : Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.items.map((STabItem item) {
                      final bool isActive = item.key == widget.activeKey;
                      return _buildTabItem(context, item, isActive, theme, itemPaddingVertical, itemPaddingHorizontal, fontSize);
                    }).toList(),
                  ),
                  // Sliding Indicator for Line Type
                  if (widget.type == STabType.line && _currentAnimatedRect != null)
                    Positioned(
                      left: isVertical ? (widget.tabPosition == STabPosition.right ? 0 : null) : _currentAnimatedRect!.left,
                      right: isVertical ? (widget.tabPosition == STabPosition.left ? 0 : null) : null,
                      top: isVertical ? _currentAnimatedRect!.top : (widget.tabPosition == STabPosition.bottom ? 0 : null),
                      bottom: isVertical ? null : (widget.tabPosition == STabPosition.bottom ? null : 0),
                      width: isVertical ? 2 : _currentAnimatedRect!.width,
                      height: isVertical ? _currentAnimatedRect!.height : 2,
                      child: Container(
                        color: theme.indicatorColor,
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Extra Content
          if (widget.tabBarExtraContent != null)
            Padding(
              padding: isVertical ? const EdgeInsets.symmetric(vertical: 8.0) : const EdgeInsets.symmetric(horizontal: 8.0),
              child: widget.tabBarExtraContent,
            ),

          // Add Button for Editable Card
          if (widget.type == STabType.editableCard && widget.onEdit != null)
            IconButton(
              icon: const Icon(Icons.add, size: 20),
              onPressed: () => widget.onEdit!('NEW_TAB', 'add'),
              padding: EdgeInsets.all(itemPaddingVertical),
            ),
        ],
      ),
    );
  }

  Widget
      _buildTabItem(
    BuildContext
        context,
    STabItem
        item,
    bool
        isActive,
    STabsThemeData
        theme,
    double
        padV,
    double
        padH,
    double
        fontSize,
  ) {
    final bool
        isVertical =
        widget.tabPosition == STabPosition.left || widget.tabPosition == STabPosition.right;
    final bool
        isCard =
        widget.type == STabType.card || widget.type == STabType.editableCard;

    Color?
        bgColor;
    if (isCard) {
      if (isActive) {
        bgColor = theme.cardActiveBackgroundColor;
      } else {
        bgColor = Colors.transparent; // Active bg is handled by container, inactive transparent on top of container
      }
    }

    // Border for cards
    Border?
        border;
    if (isCard &&
        isActive) {
      border =
          Border.all(color: theme.dividerColor);
    }

    // Margins - Cards need to look connected
    EdgeInsets
        margin =
        EdgeInsets.zero;
    if (isCard) {
      margin = isVertical
          ? const EdgeInsets.only(bottom: 2)
          : const EdgeInsets.only(right: 2);
    } else {
      margin = isVertical
          ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
          : const EdgeInsets.symmetric(horizontal: 16);
    }

    BorderRadius?
        cardRadius;
    if (isCard) {
      switch (widget.tabPosition) {
        case STabPosition.top:
          cardRadius = const BorderRadius.vertical(top: Radius.circular(6));
        case STabPosition.bottom:
          cardRadius = const BorderRadius.vertical(bottom: Radius.circular(6));
        case STabPosition.left:
          cardRadius = const BorderRadius.horizontal(left: Radius.circular(6));
        case STabPosition.right:
          cardRadius = const BorderRadius.horizontal(right: Radius.circular(6));
      }
    }

    Positioned?
        cardIndicator;
    if (isCard &&
        isActive) {
      double?
          top,
          bottom,
          left,
          right,
          width,
          height;
      switch (widget.tabPosition) {
        case STabPosition.top:
          top = 0;
          left = 0;
          right = 2;
          height = 2;
        case STabPosition.bottom:
          bottom = 0;
          left = 0;
          right = 2;
          height = 2;
        case STabPosition.left:
          left = 0;
          top = 0;
          bottom = 2;
          width = 2;
        case STabPosition.right:
          right = 0;
          top = 0;
          bottom = 2;
          width = 2;
      }
      cardIndicator =
          Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.indicatorColor,
            borderRadius: cardRadius,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: item.disabled
          ? null
          : () {
              HapticFeedback.selectionClick();
              if (widget.controller != null) {
                final int index = widget.items.indexOf(item);
                if (index != -1) {
                  widget.controller!.animateTo(index);
                }
              }
              widget.onTabClick(item.key);
            },
      child:
          MouseRegion(
        cursor: item.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        child: Stack(
          children: <Widget>[
            Container(
              margin: margin,
              padding: EdgeInsets.symmetric(vertical: padV, horizontal: padH),
              decoration: BoxDecoration(
                color: bgColor,
                border: border,
                borderRadius: cardRadius,
              ),
              child: Row(
                key: _tabKeys[item.key],
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (item.icon != null) ...<Widget>[
                    IconTheme(
                      data: IconThemeData(
                        size: fontSize + 2,
                        color: item.disabled ? theme.unselectedLabelColor.withOpacity(0.5) : (isActive ? theme.labelColor : theme.unselectedLabelColor),
                      ),
                      child: item.icon!,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      color: item.disabled ? theme.unselectedLabelColor.withOpacity(0.5) : (isActive ? theme.labelColor : theme.unselectedLabelColor),
                    ),
                  ),
                  if (widget.type == STabType.editableCard && item.closable) ...<Widget>[
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: item.disabled ? null : () => widget.onClose?.call(item.key),
                      hoverColor: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      child: Icon(
                        Icons.close,
                        size: fontSize,
                        color: theme.unselectedLabelColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (cardIndicator != null) cardIndicator,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

class STabNavBar
    extends StatefulWidget {
  const STabNavBar({
    super.key,
    required this.items,
    required this.activeKey,
    required this.onTabClick,
    required this.onEdit,
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
      {};

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
    _indicatorAnimation =
        CurvedAnimation(
      parent:
          _indicatorController,
      curve:
          Curves.easeInOut,
    );

    _indicatorController
        .addListener(() {
      setState(() {
        // Re-render to animate indicator
      });
    });

    // Initialize keys
    for (var item
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
      final newKeys =
          widget.items.map((e) => e.key).toSet();
      _tabKeys.removeWhere((key, _) =>
          !newKeys.contains(key));
      // Add new keys
      for (var item
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

  void
      _scrollToActiveItem() {
    final key =
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
        STabType.line)
      return;

    final barRenderObject = _barKey
        .currentContext
        ?.findRenderObject() as RenderBox?;
    final activeTabKey =
        _tabKeys[widget.activeKey];
    final activeRenderObject = activeTabKey
        ?.currentContext
        ?.findRenderObject() as RenderBox?;

    if (barRenderObject != null &&
        activeRenderObject != null) {
      final barOffset =
          barRenderObject.localToGlobal(Offset.zero);
      final tabOffset =
          activeRenderObject.localToGlobal(Offset.zero);
      final relativeOffset =
          tabOffset - barOffset;

      final newRect =
          Rect.fromLTWH(
        relativeOffset.dx,
        relativeOffset.dy,
        activeRenderObject.size.width,
        activeRenderObject.size.height,
      );

      if (_indicatorRect !=
          newRect) {
        _targetIndicatorRect = newRect;
        if (_indicatorRect == null) {
          _indicatorRect = newRect;
        } else {
          _indicatorController.forward(from: 0.0);
        }
      }
    }
  }

  Rect?
      get _currentAnimatedRect {
    if (_indicatorRect == null ||
        _targetIndicatorRect == null)
      return _indicatorRect ??
          _targetIndicatorRect;
    return Rect.lerp(
        _indicatorRect,
        _targetIndicatorRect,
        _indicatorAnimation.value);
  }

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context).sTabsTheme;
    final isVertical =
        widget.tabPosition == STabPosition.left || widget.tabPosition == STabPosition.right;

    // Size adjustments
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
      key:
          _barKey,
      color: widget.type == STabType.card
          ? theme.cardBackgroundColor
          : null,
      child:
          Flex(
        direction: isVertical ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: widget.centered ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ScrollView for tabs
          Flexible(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
              child: Stack(
                children: [
                  Flex(
                    direction: isVertical ? Axis.vertical : Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.items.map((item) {
                      final isActive = item.key == widget.activeKey;
                      return _buildTabItem(context, item, isActive, theme, itemPaddingVertical, itemPaddingHorizontal, fontSize);
                    }).toList(),
                  ),
                  // Sliding Indicator for Line Type
                  if (widget.type == STabType.line && _currentAnimatedRect != null)
                    Positioned(
                      left: isVertical ? null : _currentAnimatedRect!.left,
                      top: isVertical ? _currentAnimatedRect!.top : null,
                      bottom: 0,
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: widget.tabBarExtraContent!,
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
    final isVertical =
        widget.tabPosition == STabPosition.left || widget.tabPosition == STabPosition.right;
    final isCard =
        widget.type == STabType.card || widget.type == STabType.editableCard;

    // Background color for cards
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
          Border(
        top: BorderSide(color: theme.dividerColor),
        left: BorderSide(color: theme.dividerColor),
        right: BorderSide(color: theme.dividerColor),
        bottom: BorderSide.none, // Open at bottom to merge with content
      );
    }

    // Margins - Cards need to look connected
    EdgeInsets
        margin =
        EdgeInsets.zero;
    if (isCard) {
      margin =
          const EdgeInsets.only(right: 2); // Gap between cards
    } else {
      margin =
          const EdgeInsets.symmetric(horizontal: 16); // Gap for line tabs
      if (isVertical)
        margin = const EdgeInsets.symmetric(vertical: 8);
    }

    return GestureDetector(
      key:
          _tabKeys[item.key],
      onTap: item.disabled
          ? null
          : () => widget.onTabClick(item.key),
      child:
          MouseRegion(
        cursor: item.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        child: Container(
          margin: margin,
          padding: EdgeInsets.symmetric(vertical: padV, horizontal: padH),
          decoration: BoxDecoration(
            color: bgColor,
            border: border,
            borderRadius: isCard ? const BorderRadius.vertical(top: Radius.circular(6)) : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.icon != null) ...[
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
              if (widget.type == STabType.editableCard && item.closable) ...[
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
      ),
    );
  }
}

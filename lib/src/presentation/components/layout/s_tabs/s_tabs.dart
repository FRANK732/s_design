import 'package:flutter/material.dart';
import '../../../../../s_design.dart';
import 's_tab_nav_bar.dart';
import 's_tab_view.dart';

class STabs
    extends StatefulWidget {
  const STabs({
    super.key,
    required this.items,
    this.activeKey,
    this.defaultActiveKey,
    this.type =
        STabType.line,
    this.tabPosition =
        STabPosition.top,
    this.size =
        STabSize.medium,
    this.tabBarExtraContent,
    this.onTabClick,
    this.onEdit,
    this.centered =
        false,
    this.hideAdd =
        false,
  });

  final List<STabItem>
      items;
  final String?
      activeKey;
  final String?
      defaultActiveKey;
  final STabType
      type;
  final STabPosition
      tabPosition;
  final STabSize
      size;
  final Widget?
      tabBarExtraContent;
  final ValueChanged<String>?
      onTabClick;
  final void Function(
      String?
          key,
      String
          action)? onEdit;
  final bool
      centered;
  final bool
      hideAdd;

  @override
  State<STabs>
      createState() =>
          _STabsState();
}

class _STabsState
    extends State<
        STabs>
    with
        TickerProviderStateMixin {
  late String
      _activeKey;
  TabController?
      _controller;
  int _currentIndex =
      0;

  @override
  void
      initState() {
    super
        .initState();
    _activeKey = widget.activeKey ??
        widget.defaultActiveKey ??
        (widget.items.isNotEmpty ? widget.items.first.key : '');
    _initController();
  }

  void
      _initController() {
    final initialIndex = widget.items.indexWhere((item) =>
        item.key ==
        _activeKey);
    _currentIndex = initialIndex != -1
        ? initialIndex
        : 0;

    _controller =
        TabController(
      length:
          widget.items.length,
      vsync:
          this,
      initialIndex:
          _currentIndex,
    );
    _controller!
        .addListener(_handleTabSelection);
  }

  @override
  void didUpdateWidget(
      STabs
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);

    // If items changed, we need a new controller
    if (widget.items.length !=
        oldWidget
            .items.length) {
      _controller?.dispose();
      _initController();
    } else if (widget.activeKey != null &&
        widget.activeKey != _activeKey) {
      // External update to activeKey
      _activeKey =
          widget.activeKey!;
      final index = widget.items.indexWhere((item) =>
          item.key ==
          _activeKey);
      if (index != -1 &&
          index != _controller!.index) {
        _controller!.animateTo(index);
      }
    }
  }

  @override
  void
      dispose() {
    _controller
        ?.dispose();
    super
        .dispose();
  }

  void
      _handleTabSelection() {
    if (_controller ==
        null)
      return;

    final newIndex =
        _controller!.index;
    if (newIndex !=
        _currentIndex) {
      // Tab changed
      _currentIndex =
          newIndex;
      if (newIndex >= 0 &&
          newIndex < widget.items.length) {
        final key = widget.items[newIndex].key;
        if (key != _activeKey) {
          setState(() {
            _activeKey = key;
          });
          widget.onTabClick?.call(key);
        }
      }
    }
  }

  void _handleEdit(
      String?
          key,
      String
          action) {
    widget.onEdit?.call(
        key,
        action);
  }

  void _handleClose(
      String
          key) {
    _handleEdit(
        key,
        'remove');
  }

  @override
  Widget build(
      BuildContext
          context) {
    // Determine layout direction
    final bool
        isVertical =
        widget.tabPosition == STabPosition.left || widget.tabPosition == STabPosition.right;
    final bool
        isPositionRight =
        widget.tabPosition == STabPosition.right;
    final bool
        isPositionBottom =
        widget.tabPosition == STabPosition.bottom;

    final navBar =
        STabNavBar(
      controller:
          _controller,
      items:
          widget.items,
      activeKey:
          _activeKey,
      onTabClick:
          (key) {
        // Handled by controller listener mostly, but we trigger callback
        // The nav bar click will drive the controller
      },
      onEdit: widget.hideAdd
          ? null
          : _handleEdit,
      onClose:
          _handleClose,
      type:
          widget.type,
      tabPosition:
          widget.tabPosition,
      size:
          widget.size,
      tabBarExtraContent:
          widget.tabBarExtraContent,
      centered:
          widget.centered,
    );

    final content =
        Expanded(
      child:
          STabView(
        controller: _controller,
        children: widget.items.map((item) => item.content).toList(),
      ),
    );

    List<Widget>
        children;
    if (isVertical) {
      children = isPositionRight
          ? [
              content,
              navBar
            ]
          : [
              navBar,
              content
            ];
    } else {
      children = isPositionBottom
          ? [
              content,
              navBar
            ]
          : [
              navBar,
              content
            ];
    }

    return Flex(
      direction: isVertical
          ? Axis.horizontal
          : Axis.vertical,
      crossAxisAlignment:
          CrossAxisAlignment.stretch,
      children:
          children,
    );
  }
}

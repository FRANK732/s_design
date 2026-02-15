import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

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

  /// The list of tabs.
  final List<STabItem>
      items;

  /// The key of the currently active tab.
  /// If provided, this component is controlled.
  final String?
      activeKey;

  /// The key of the initially active tab.
  /// Only used if [activeKey] is null.
  final String?
      defaultActiveKey;

  /// The type of tabs to render.
  final STabType
      type;

  /// The position of the tabs relative to the content.
  final STabPosition
      tabPosition;

  /// The size of the tabs.
  final STabSize
      size;

  /// Optional content to render in the tab bar.
  final Widget?
      tabBarExtraContent;

  /// Callback when a tab is clicked.
  final ValueChanged<String>?
      onTabClick;

  /// Callback for add/remove actions.
  /// action: 'add' or 'remove'
  final void Function(
      String?
          key,
      String
          action)? onEdit;

  /// Whether to center the tabs.
  final bool
      centered;

  /// Whether to hide the add button in editable-card mode.
  final bool
      hideAdd;

  @override
  State<STabs>
      createState() =>
          _STabsState();
}

class _STabsState
    extends State<
        STabs> {
  late String
      _activeKey;
  late PageController
      _pageController;
  bool
      _isSyncing =
      false; // Prevent circular updates between PageView and TabBar

  @override
  void
      initState() {
    super
        .initState();
    _activeKey = widget.activeKey ??
        widget.defaultActiveKey ??
        (widget.items.isNotEmpty ? widget.items.first.key : '');

    // Find initial index
    final initialIndex = widget.items.indexWhere((item) =>
        item.key ==
        _activeKey);
    _pageController =
        PageController(initialPage: initialIndex != -1 ? initialIndex : 0);
  }

  @override
  void didUpdateWidget(
      STabs
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.activeKey != null &&
        widget.activeKey != _activeKey) {
      if (!_isSyncing) {
        setState(() {
          _activeKey = widget.activeKey!;
        });
        _syncPageController();
      }
    }
  }

  @override
  void
      dispose() {
    _pageController
        .dispose();
    super
        .dispose();
  }

  void
      _syncPageController() {
    final index = widget.items.indexWhere((item) =>
        item.key ==
        _activeKey);
    if (index != -1 &&
        _pageController.hasClients &&
        _pageController.page?.round() != index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleTabClick(
      String
          key) {
    if (key ==
        _activeKey)
      return;

    setState(
        () {
      _activeKey =
          key;
    });

    // Sync PageView
    _syncPageController();

    // Notify parent
    widget
        .onTabClick
        ?.call(key);
  }

  void _handlePageChanged(
      int index) {
    if (index >= 0 &&
        index < widget.items.length) {
      final key =
          widget.items[index].key;
      if (key !=
          _activeKey) {
        _isSyncing = true;
        setState(() {
          _activeKey = key;
        });
        widget.onTabClick?.call(key);
        // Small delay to release sync lock
        Future.delayed(const Duration(milliseconds: 50), () => _isSyncing = false);
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
    // Determine layout direction based on tabPosition
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
      items:
          widget.items,
      activeKey:
          _activeKey,
      onTabClick:
          _handleTabClick,
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
          PageView(
        controller: _pageController,
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        physics: const BouncingScrollPhysics(), // Mobile-friendly physics
        onPageChanged: _handlePageChanged,
        children: widget.items.map((item) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: item.content, // Consider wrapping in KeepAlive if needed
          );
        }).toList(),
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

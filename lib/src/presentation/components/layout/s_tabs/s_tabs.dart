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
    this.expanded =
        true,
  });

  /// Comprehensive list of predefined tab nodes containing the headers and mapped child payloads.
  final List<STabItem>
      items;

  /// Explicit key forcing the active tab. Providing this delegates state control to the parent (controlled mode).
  final String?
      activeKey;

  /// Initialization key determining the active tab on the very first render (uncontrolled mode).
  final String?
      defaultActiveKey;

  /// Structural variant styling the tab navigation bar (e.g. `STabType.line`, `STabType.card`).
  final STabType
      type;

  /// Geometric orientation pinning the tab bar relative to the content payload.
  final STabPosition
      tabPosition;

  /// Physical bounding size scaling the typography, padding, and layout density of the headers.
  final STabSize
      size;

  /// Independent complex widget injected directly into the empty space of the nav bar (trailing edge).
  final Widget?
      tabBarExtraContent;

  /// Callback continuously streaming the key of the newly selected tab.
  final ValueChanged<String>?
      onTabClick;

  /// Advanced callback triggering when a user interacts with dynamic tab management buttons (add/remove).
  final void Function(
      String?
          key,
      String
          action)? onEdit;

  /// Forces the tab navigation bar to compress towards the physical center axis.
  final bool
      centered;

  /// Suppresses the native dynamic 'Add Tab' button when using editable tab variants.
  final bool
      hideAdd;

  /// Whether the tab view content should be wrapped in an Expanded widget.
  final bool
      expanded;

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
    int initialIndex = widget.items.indexWhere((STabItem item) =>
        item.key ==
        _activeKey);
    if (initialIndex ==
        -1) {
      initialIndex =
          0;
      if (widget.items.isNotEmpty) {
        _activeKey = widget.items.first.key;
      }
    }
    _currentIndex =
        initialIndex;

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

    if (widget.items.length !=
        oldWidget
            .items.length) {
      _controller?.dispose();
      _initController();
    } else if (widget.activeKey != null &&
        widget.activeKey != _activeKey) {
      _activeKey =
          widget.activeKey!;
      final int
          index =
          widget.items.indexWhere((STabItem item) => item.key == _activeKey);
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
        null) {
      return;
    }

    final int
        newIndex =
        _controller!.index;
    if (newIndex !=
        _currentIndex) {
      _currentIndex =
          newIndex;
      if (newIndex >= 0 &&
          newIndex < widget.items.length) {
        final String key = widget.items[newIndex].key;
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

    final STabNavBar
        navBar =
        STabNavBar(
      controller:
          _controller,
      items:
          widget.items,
      activeKey:
          _activeKey,
      onTabClick:
          (String key) {
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

    final Widget
        content =
        STabView(
      controller:
          _controller,
      children:
          widget.items.map((STabItem item) => item.content ?? const SizedBox.shrink()).toList(),
    );

    final Widget flexibleContent = widget.expanded
        ? Expanded(child: content)
        : content;

    List<Widget>
        children;
    if (isVertical) {
      children = isPositionRight
          ? <Widget>[
              flexibleContent,
              navBar
            ]
          : <Widget>[
              navBar,
              flexibleContent
            ];
    } else {
      children = isPositionBottom
          ? <Widget>[
              flexibleContent,
              navBar
            ]
          : <Widget>[
              navBar,
              flexibleContent
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

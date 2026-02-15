import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

class SliverSTabs
    extends StatelessWidget {
  const SliverSTabs({
    super.key,
    required this.items,
    this.controller,
    this.activeKey,
    this.onTabClick,
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
    this.pinned =
        true,
    this.floating =
        true,
    this.height,
    this.backgroundColor,
  });

  final List<STabItem>
      items;
  final TabController?
      controller;
  final String?
      activeKey;
  final ValueChanged<String>?
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

  /// Whether the tab bar should be pinned to the top.
  final bool
      pinned;

  /// Whether the tab bar should float when scrolling up.
  final bool
      floating;

  /// Explicit height for the tab bar.
  /// If null, defaults based on size (Medium: 48, Large: 56, Small: 40).
  final double?
      height;

  /// Background color of the sliver.
  final Color?
      backgroundColor;

  double
      get _defaultHeight {
    switch (
        size) {
      case STabSize.small:
        return 40.0;
      case STabSize.large:
        return 56.0;
      case STabSize.medium:
        return 48.0;
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final double
        toolBarHeight =
        height ?? _defaultHeight;

    return SliverPersistentHeader(
      pinned:
          pinned,
      floating:
          floating,
      delegate:
          _SliverSTabsDelegate(
        height: toolBarHeight,
        child: Container(
          color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          child: STabNavBar(
            items: items,
            activeKey: activeKey ?? (items.isNotEmpty ? items.first.key : ''),
            onTabClick: onTabClick ?? (_) {},
            onEdit: onEdit,
            type: type,
            tabPosition: tabPosition,
            size: size,
            tabBarExtraContent: tabBarExtraContent,
            centered: centered,
            onClose: onClose,
            controller: controller,
          ),
        ),
      ),
    );
  }
}

class _SliverSTabsDelegate
    extends SliverPersistentHeaderDelegate {
  final double
      height;
  final Widget
      child;

  _SliverSTabsDelegate({
    required this.height,
    required this.child,
  });

  @override
  double get minExtent =>
      height;

  @override
  double get maxExtent =>
      height;

  @override
  Widget build(
      BuildContext
          context,
      double
          shrinkOffset,
      bool
          overlapsContent) {
    return SizedBox.expand(
        child: child);
  }

  @override
  bool shouldRebuild(
      _SliverSTabsDelegate
          oldDelegate) {
    return height != oldDelegate.height ||
        child != oldDelegate.child;
  }
}

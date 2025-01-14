
import 'package:flutter/material.dart';
import 'enums/s_tabs_enums.dart';
import 's_tabs.dart';
import 'utils/s_tabs_utils.dart';

class TabsContent extends StatelessWidget {
  final int index;
  final Widget child;

  const TabsContent({
    Key? key,
    required this.index,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsState = Tabs.of(context);
    // final theme = TabsTheme.of(context).;
    final parentTabs = context.findAncestorWidgetOfExactType<Tabs>();

    if (tabsState == null) {
      return const SizedBox.shrink();
    }

    return AnimatedSwitcher(
      duration: parentTabs?.duration ?? const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return getTabTransition(
          type: parentTabs?.animationType ?? TabAnimationType.fade,
          child: child,
          animation: animation,
        );
      },
      child: tabsState.activeIndex == index
          ? Container(
        key: ValueKey<int>(index),
        // padding: theme.padding,
        // color: theme.backgroundColor,
        child: child,
      )
          : const SizedBox.shrink(),
    );
  }
}

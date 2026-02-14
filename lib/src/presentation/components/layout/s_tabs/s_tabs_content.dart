import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'utils/s_tabs_utils.dart';

class TabsContent
    extends StatelessWidget {
  const TabsContent({
    super.key,
    required this.index,
    required this.activeIndex,
    required this.contentMargin,
    required this.animationType,
    required this.duration,
    required this.curve,
    required this.child,
  });

  /// The index of the tab this content belongs to.
  final int
      index;

  /// The index of the currently active tab.
  final int
      activeIndex;

  /// The animation type for transitioning the content (e.g., fade, slide).
  final STabAnimationType
      animationType;

  /// The duration of the content animation.
  final Duration
      duration;

  /// The animation curve for content transitions.
  final Curve
      curve;

  /// The content widget to display for the tab.
  final Widget
      child;

  /// Margin around the content.
  final EdgeInsetsGeometry
      contentMargin;

  @override
  Widget build(
      BuildContext
          context) {
    return AnimatedSwitcher(
      duration:
          duration,
      transitionBuilder:
          (Widget child, Animation<double> animation) {
        return getTabTransition(
          type: animationType,
          child: child,
          animation: animation,
        );
      },
      child: activeIndex == index
          ? Container(
              margin: contentMargin,
              key: ValueKey<int>(index),
              child: child,
            )
          : const SizedBox.shrink(),
    );
  }
}

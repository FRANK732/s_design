import 'package:flutter/material.dart';
import 'enums/s_tabs_enums.dart';
import 'utils/s_tabs_utils.dart';

class TabsContent extends StatelessWidget {
  final int index;
  final int activeIndex;
  final STabAnimationType animationType;
  final Duration duration;
  final Curve curve;
  final Widget child;
  final EdgeInsetsGeometry contentMargin;

  const TabsContent({
    Key? key,
    required this.index,
    required this.activeIndex,
    required this.contentMargin,
    required this.animationType,
    required this.duration,
    required this.curve,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
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

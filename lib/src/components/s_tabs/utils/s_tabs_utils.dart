import 'package:flutter/material.dart';
import '../enums/s_tabs_enums.dart';

/// Utility to get the transition based on the TabAnimationType.
Widget getTabTransition({
  required STabAnimationType type,
  required Widget child,
  required Animation<double> animation,
}) {
  switch (type) {
    case STabAnimationType.fade:
      return FadeTransition(opacity: animation, child: child);
    case STabAnimationType.slide:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    case STabAnimationType.scale:
      return ScaleTransition(scale: animation, child: child);
    default:
      return child;
  }
}

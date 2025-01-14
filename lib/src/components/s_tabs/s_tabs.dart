// s_tabs/src/tabs.dart

import 'package:flutter/material.dart';
import 'enums/s_tabs_enums.dart';
import 'themes/s_tabs_theme.dart';

class Tabs extends StatefulWidget {
  /// The initial index of the active tab.
  final int initialIndex;

  /// The animation type when switching tabs.
  final TabAnimationType animationType;

  /// The duration of the tab change animation.
  final Duration duration;

  /// The curve of the tab change animation.
  final Curve curve;

  /// The orientation of the tabs (horizontal or vertical).
  final TabOrientation orientation;

  /// The child widgets, typically including TabsList and TabsContent.
  final Widget child;

  const Tabs({
    Key? key,
    this.initialIndex = 0,
    this.animationType = TabAnimationType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.orientation = TabOrientation.horizontal,
    required this.child,
  }) : super(key: key);

  @override
  _TabsState createState() => _TabsState();

  /// Method to access the Tabs state from descendant widgets.
  static _TabsState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_TabsInherited>()?.data;
  }
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late int _activeIndex;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.initialIndex;
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Method to change the active tab.
  void setActiveIndex(int index) {
    if (index != _activeIndex) {
      setState(() {
        _activeIndex = index;
      });
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = TabsTheme.of(context);

    return _TabsInherited(
      data: this,
      child: Theme(
        data: Theme.of(context).copyWith(
          extensions: <TabsTheme>[theme],
        ),
        child: widget.child,
      ),
    );
  }

  /// Get the current active index.
  int get activeIndex => _activeIndex;
}

class _TabsInherited extends InheritedWidget {
  final _TabsState data;

  const _TabsInherited({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_TabsInherited oldWidget) => true;
}

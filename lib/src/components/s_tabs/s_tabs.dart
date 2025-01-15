// lib/components/s_tabs/tabs.dart

import 'package:flutter/material.dart';
import 'enums/s_tabs_enums.dart';
import 'models/s_tabs_model.dart';
import 's_tab_list.dart';
import 'themes/s_tabs_theme.dart';
import 's_tabs_content.dart';

class Tabs extends StatefulWidget {
  /// The list of tabs, each containing a label and corresponding content.
  final List<TabItem> tabs;

  /// The initial index of the active tab.
  final int initialIndex;

  /// The animation type when switching tabs.
  final STabAnimationType animationType;

  /// The duration of the tab change animation.
  final Duration duration;

  /// The curve of the tab change animation.
  final Curve curve;

  /// The orientation of the tabs (horizontal or vertical).
  final STabOrientation orientation;

  /// The alignment of the tab triggers.
  final MainAxisAlignment mainAxisAlignment;

  /// Optional callback when a tab is changed.
  final ValueChanged<int>? onTabChanged;

  const Tabs({
    Key? key,
    required this.tabs,
    this.initialIndex = 0,
    this.animationType = STabAnimationType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.orientation = STabOrientation.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.onTabChanged,
  })  : assert(tabs.length > 0, 'Tabs list cannot be empty.'),
        assert(
        initialIndex >= 0 && initialIndex < tabs.length,
        'Initial index must be within the range of tabs.'),
        super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late int _activeIndex;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.initialIndex;
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Method to change the active tab.
  void _setActiveIndex(int index) {
    if (index != _activeIndex && index >= 0 && index < widget.tabs.length) {
      setState(() {
        _activeIndex = index;
      });
      _controller.forward(from: 0.0);
      if (widget.onTabChanged != null) {
        widget.onTabChanged!(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the TabsTheme from the current theme
    final theme = TabsTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabsList(
          direction: widget.orientation == STabOrientation.horizontal
              ? Axis.horizontal
              : Axis.vertical,
          mainAxisAlignment: widget.mainAxisAlignment,
          tabs: widget.tabs,
          onTabSelected: _setActiveIndex,
          activeIndex: _activeIndex,
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Stack(
            children: widget.tabs
                .asMap()
                .map((index, tab) => MapEntry(
              index,
              TabsContent(
                index: index,
                activeIndex: _activeIndex,
                animationType: widget.animationType,
                duration: widget.duration,
                curve: widget.curve,
                child: tab.content,
              ),
            ))
                .values
                .toList(),
          ),
        ),
      ],
    );
  }

  /// Get the current active index.
  int get activeIndex => _activeIndex;
}

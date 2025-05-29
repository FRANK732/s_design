import 'package:flutter/material.dart';
import '../../theme/s_spacers.dart';
import 'enums/s_tabs_enums.dart';
import 'models/s_tabs_model.dart';
import 's_tab_list.dart';
import 's_tabs_content.dart';

class STabs extends StatefulWidget {
  const STabs({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.animationType = STabAnimationType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.orientation = STabOrientation.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.onTabChanged,
    this.tabListMargin = EdgeInsets.zero,
    this.tabListPadding = const EdgeInsets.all(3.0),
    this.backgroundDecoration,
    this.activeTabTextStyle,
    this.inactiveTabTextStyle,
    this.activeTabDecoration,
    this.inactiveTabDecoration,
    this.tabBorderRadius,
    this.tabPadding = const EdgeInsets.symmetric(vertical: 3, horizontal: 55),
    this.tabMargin = const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
    this.tabWidth = 420,
    this.tabHeight = 40.0,
    this.tabTextAlign = TextAlign.center,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 300),
    this.scrollPhysics,
    this.isScrollable = true,
    this.activeTabBackgroundColor,
    this.inactiveTabBackgroundColor,
    this.tabLeadingIcon,
    this.tabTrailingIcon,
    this.iconSpacing = 8.0,
  })  : assert(
          tabs.length > 0,
          'Tabs list cannot be empty.',
        ),
        assert(
          initialIndex >= 0 && initialIndex < tabs.length,
          'Initial index must be within the range of tabs.',
        );

  /// The list of tabs, each containing a label and corresponding content.
  final List<STabItem> tabs;

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

  /// The alignment of the tab triggers along the main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// The alignment of the tab triggers along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// Optional callback when a tab is changed.
  final ValueChanged<int>? onTabChanged;

  /// Margin for the tab list container.
  final EdgeInsetsGeometry tabListMargin;

  /// Padding for the tab list container.
  final EdgeInsetsGeometry tabListPadding;

  /// Decoration for the tab list background.
  final Decoration? backgroundDecoration;

  /// Text style for the active tab.
  final TextStyle? activeTabTextStyle;

  /// Text style for inactive tabs.
  final TextStyle? inactiveTabTextStyle;

  /// Decoration for the active tab.
  final Decoration? activeTabDecoration;

  /// Decoration for inactive tabs.
  final Decoration? inactiveTabDecoration;

  /// Border radius for tabs.
  final BorderRadius? tabBorderRadius;

  /// Padding for individual tabs.
  final EdgeInsetsGeometry tabPadding;

  /// Margin for individual tabs.
  final EdgeInsetsGeometry tabMargin;

  /// Width of individual tabs.
  final double tabWidth;

  /// Height of individual tabs.
  final double tabHeight;

  /// Text alignment within tabs.
  final TextAlign tabTextAlign;

  /// Animation curve for tab transitions.
  final Curve animationCurve;

  /// Duration of tab animations.
  final Duration animationDuration;

  /// Scroll physics for the tab list.
  final ScrollPhysics? scrollPhysics;

  /// Whether the tab list is scrollable.
  final bool isScrollable;

  /// Background color for the active tab.
  final Color? activeTabBackgroundColor;

  /// Background color for inactive tabs.
  final Color? inactiveTabBackgroundColor;

  /// Leading icon for tabs.
  final Widget? tabLeadingIcon;

  /// Trailing icon for tabs.
  final Widget? tabTrailingIcon;

  /// Spacing between icons and text in tabs.
  final double iconSpacing;

  @override
  State<STabs> createState() => _STabsState();
}

class _STabsState extends State<STabs> with SingleTickerProviderStateMixin {
  late int _activeIndex;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.initialIndex;
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacers.mediumHeight,
        TabsList(
          direction: widget.orientation == STabOrientation.horizontal
              ? Axis.horizontal
              : Axis.vertical,
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          tabListMargin: widget.tabListMargin,
          tabListPadding: widget.tabListPadding,
          tabs: widget.tabs,
          onTabSelected: _setActiveIndex,
          activeIndex: _activeIndex,
          backgroundDecoration: widget.backgroundDecoration,
          activeTabTextStyle: widget.activeTabTextStyle,
          inactiveTabTextStyle: widget.inactiveTabTextStyle,
          activeTabDecoration: widget.activeTabDecoration,
          inactiveTabDecoration: widget.inactiveTabDecoration,
          tabBorderRadius: widget.tabBorderRadius,
          tabPadding: widget.tabPadding,
          tabMargin: widget.tabMargin,
          tabWidth: widget.tabWidth,
          tabHeight: widget.tabHeight,
          tabTextAlign: widget.tabTextAlign,
          animationCurve: widget.animationCurve,
          animationDuration: widget.animationDuration,
          scrollPhysics: widget.scrollPhysics,
          isScrollable: widget.isScrollable,
          activeTabBackgroundColor: widget.activeTabBackgroundColor,
          inactiveTabBackgroundColor: widget.inactiveTabBackgroundColor,
          tabLeadingIcon: widget.tabLeadingIcon,
          tabTrailingIcon: widget.tabTrailingIcon,
          iconSpacing: widget.iconSpacing,
        ),
        Spacers.mediumHeight,
        Flexible(
          child: Stack(
            children: widget.tabs
                .asMap()
                .map(
                  (int index, STabItem tab) => MapEntry(
                    index,
                    TabsContent(
                      contentMargin: widget.tabListMargin,
                      index: index,
                      activeIndex: _activeIndex,
                      animationType: widget.animationType,
                      duration: widget.duration,
                      curve: widget.curve,
                      child: tab.content,
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
      ],
    );
  }

  int get activeIndex => _activeIndex;
}

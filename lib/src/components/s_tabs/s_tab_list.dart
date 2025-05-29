import 'package:flutter/material.dart';

import '../../../s_design.dart';
import '../../theme/s_spacers.dart';

class TabsList extends StatelessWidget {
  const TabsList({
    super.key,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.tabListMargin,
    this.tabListPadding = const EdgeInsets.all(3.0),
    required this.tabs,
    required this.onTabSelected,
    required this.activeIndex,
    this.backgroundDecoration,
    this.activeTabTextStyle,
    this.inactiveTabTextStyle,
    this.activeTabDecoration,
    this.inactiveTabDecoration,
    this.tabBorderRadius,
    this.tabPadding = const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
    this.tabMargin = const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
    this.tabWidth,
    this.maxTabWidth = 200.0, // Default max width to prevent overflow
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
  });

  /// The axis along which tabs are arranged (horizontal or vertical). Defaults to horizontal.
  final Axis direction;

  /// Main axis alignment for the tab list. Defaults to center.
  final MainAxisAlignment mainAxisAlignment;

  /// Cross axis alignment for the tab list. Defaults to center.
  final CrossAxisAlignment crossAxisAlignment;

  /// List of tab items to display.
  final List<STabItem> tabs;

  /// Callback triggered when a tab is selected, passing the selected tab's index.
  final Function(int) onTabSelected;

  /// Index of the currently active tab.
  final int activeIndex;

  /// Margin around the entire tab list.
  final EdgeInsetsGeometry tabListMargin;

  /// Padding inside the tab list container. Defaults to 3.0 on all sides.
  final EdgeInsetsGeometry tabListPadding;

  /// Background decoration for the tab list container.
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

  /// Padding inside each tab. Defaults to 3 vertical and 16 horizontal.
  final EdgeInsetsGeometry tabPadding;

  /// Margin around each tab. Defaults to 5 horizontal and 2 vertical.
  final EdgeInsetsGeometry tabMargin;

  /// Fixed width for each tab.
  final double? tabWidth;

  /// Maximum width for each tab to prevent overflow. Defaults to 200.0.
  final double? maxTabWidth;

  /// Height of each tab. Defaults to 40.0.
  final double tabHeight;

  /// Text alignment within each tab. Defaults to center.
  final TextAlign tabTextAlign;

  /// Animation curve for tab transitions. Defaults to Curves.easeInOut.
  final Curve animationCurve;

  /// Duration of tab selection animations. Defaults to 300ms.
  final Duration animationDuration;

  /// Scroll physics for the tab list when scrollable.
  final ScrollPhysics? scrollPhysics;

  /// Enables scrolling for the tab list. Defaults to true.
  final bool isScrollable;

  /// Background color for the active tab.
  final Color? activeTabBackgroundColor;

  /// Background color for inactive tabs.
  final Color? inactiveTabBackgroundColor;

  /// Leading icon displayed before the tab text.
  final Widget? tabLeadingIcon;

  /// Trailing icon displayed after the tab text.
  final Widget? tabTrailingIcon;

  /// Spacing between icons and text in tabs. Defaults to 8.0.
  final double iconSpacing;

  void _validateProps() {
    // Validate tabs list
    if (tabs.isEmpty) {
      throw FlutterError('TabsList: The tabs list cannot be empty.');
    }

    // Validate activeIndex
    if (activeIndex < 0 || activeIndex >= tabs.length) {
      throw FlutterError(
        'TabsList: activeIndex ($activeIndex) is out of bounds for tabs list of length ${tabs.length}.',
      );
    }

    // Validate tab labels
    for (int i = 0; i < tabs.length; i++) {
      if (tabs[i].label.isEmpty) {
        throw FlutterError('TabsList: Tab at index $i has an empty label.');
      }
    }

    // Validate tabWidth
    if (tabWidth != null && (tabWidth! <= 0 || tabWidth!.isInfinite)) {
      throw FlutterError(
        'TabsList: tabWidth must be a positive finite number if provided.',
      );
    }

    // Validate maxTabWidth
    if (maxTabWidth != null && (maxTabWidth! <= 0 || maxTabWidth!.isInfinite)) {
      throw FlutterError(
        'TabsList: maxTabWidth must be a positive finite number if provided.',
      );
    }

    // Validate tabHeight
    if (tabHeight <= 0 || tabHeight.isInfinite) {
      throw FlutterError(
        'TabsList: tabHeight must be a positive finite number.',
      );
    }

    // Validate iconSpacing
    if (iconSpacing < 0) {
      throw FlutterError('TabsList: iconSpacing cannot be negative.');
    }

    // Validate animationDuration
    if (animationDuration.inMilliseconds <= 0) {
      throw FlutterError('TabsList: animationDuration must be greater than 0.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Perform validations
    _validateProps();

    final STabs? widgetTabs = context.findAncestorWidgetOfExactType<STabs>();
    if (widgetTabs != null && widgetTabs.tabs != tabs) {
      throw FlutterError(
        'TabsList must be a child of the corresponding Tabs widget.',
      );
    }

    // Access the current theme: colorScheme, textTheme, etc.
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final Color containerColor = colorScheme.outline.withOpacity(0.15);
    final Color defaultActiveTabColor =
        activeTabBackgroundColor ?? colorScheme.primary.withOpacity(0.2);
    final Color defaultInactiveTabColor =
        inactiveTabBackgroundColor ?? Colors.transparent;
    final BorderRadiusGeometry borderRadius = tabBorderRadius ?? Spacers.radiusSmall;

    return Container(
      padding: tabListPadding,
      margin: tabListMargin,
      decoration: backgroundDecoration ??
          BoxDecoration(
            color: containerColor,
            borderRadius: borderRadius,
          ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: direction,
          physics: isScrollable
              ? scrollPhysics
              : const NeverScrollableScrollPhysics(),
          child: Flex(
            direction: direction,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: List.generate(tabs.length, (int index) {
              final STabItem tab = tabs[index];
              final bool isActive = (index == activeIndex);

              return Padding(
                padding: tabMargin,
                child: Semantics(
                  button: true,
                  selected: isActive,
                  label: tab.label,
                  child: GestureDetector(
                    onTap: () => onTabSelected(index),
                    child: FocusableActionDetector(
                      mouseCursor: SystemMouseCursors.click,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: maxTabWidth ?? double.infinity,
                        ),
                        child: AnimatedContainer(
                          duration: animationDuration,
                          curve: animationCurve,
                          padding: tabPadding,
                          width: tabWidth, // Only applied if provided
                          height: tabHeight,
                          decoration: isActive
                              ? (activeTabDecoration ??
                                  BoxDecoration(
                                    color: defaultActiveTabColor,
                                    borderRadius: borderRadius,
                                  ))
                              : (inactiveTabDecoration ??
                                  BoxDecoration(
                                    color: defaultInactiveTabColor,
                                    borderRadius: borderRadius,
                                  )),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (tabLeadingIcon != null) ...<Widget>[
                                tabLeadingIcon!,
                                SizedBox(width: iconSpacing),
                              ],
                              Flexible(
                                child: Text(
                                  tab.label,
                                  textAlign: tabTextAlign,
                                  style: isActive
                                      ? activeTabTextStyle
                                      : inactiveTabTextStyle,
                                ),
                              ),
                              if (tabTrailingIcon != null) ...<Widget>[
                                SizedBox(width: iconSpacing),
                                tabTrailingIcon!,
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

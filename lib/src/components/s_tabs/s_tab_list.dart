import 'package:flutter/material.dart';
import 'package:s_design/src/theme/s_spacers.dart';

import '../../../s_design.dart';

class TabsList extends StatelessWidget {
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<STabItem> tabs;
  final Function(int) onTabSelected;
  final int activeIndex;
  final EdgeInsetsGeometry tabListMargin;
  final EdgeInsetsGeometry tabListPadding;
  final Decoration? backgroundDecoration;
  final TextStyle? activeTabTextStyle;
  final TextStyle? inactiveTabTextStyle;
  final Decoration? activeTabDecoration;
  final Decoration? inactiveTabDecoration;
  final BorderRadius? tabBorderRadius;
  final EdgeInsetsGeometry tabPadding;
  final EdgeInsetsGeometry tabMargin;
  final double? tabWidth; // Optional fixed width for tabs
  final double? maxTabWidth; // New: Maximum width for tabs
  final double tabHeight;
  final TextAlign tabTextAlign;
  final Curve animationCurve;
  final Duration animationDuration;
  final ScrollPhysics? scrollPhysics;
  final bool isScrollable;
  final Color? activeTabBackgroundColor;
  final Color? inactiveTabBackgroundColor;
  final Widget? tabLeadingIcon;
  final Widget? tabTrailingIcon;
  final double iconSpacing;

  const TabsList({
    Key? key,
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
  }) : super(key: key);

  void _validateProps() {
    // Validate tabs list
    if (tabs.isEmpty) {
      throw FlutterError('TabsList: The tabs list cannot be empty.');
    }

    // Validate activeIndex
    if (activeIndex < 0 || activeIndex >= tabs.length) {
      throw FlutterError(
          'TabsList: activeIndex ($activeIndex) is out of bounds for tabs list of length ${tabs.length}.');
    }

    // Validate tab labels
    for (var i = 0; i < tabs.length; i++) {
      if (tabs[i].label.isEmpty) {
        throw FlutterError('TabsList: Tab at index $i has an empty label.');
      }
    }

    // Validate onTabSelected
    if (onTabSelected == null) {
      throw FlutterError('TabsList: onTabSelected callback cannot be null.');
    }

    // Validate tabWidth
    if (tabWidth != null && (tabWidth! <= 0 || tabWidth!.isInfinite)) {
      throw FlutterError(
          'TabsList: tabWidth must be a positive finite number if provided.');
    }

    // Validate maxTabWidth
    if (maxTabWidth != null && (maxTabWidth! <= 0 || maxTabWidth!.isInfinite)) {
      throw FlutterError(
          'TabsList: maxTabWidth must be a positive finite number if provided.');
    }

    // Validate tabHeight
    if (tabHeight <= 0 || tabHeight.isInfinite) {
      throw FlutterError(
          'TabsList: tabHeight must be a positive finite number.');
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

    final widgetTabs = context.findAncestorWidgetOfExactType<STabs>();
    if (widgetTabs != null && widgetTabs.tabs != tabs) {
      throw FlutterError(
          'TabsList must be a child of the corresponding Tabs widget.');
    }

    // Access the current theme: colorScheme, textTheme, etc.
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final containerColor = colorScheme.outline.withOpacity(0.15);
    final defaultActiveTabColor =
        activeTabBackgroundColor ?? colorScheme.primary.withOpacity(0.2);
    final defaultInactiveTabColor =
        inactiveTabBackgroundColor ?? Colors.transparent;
    final borderRadius = tabBorderRadius ?? Spacers.radiusSmall;

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
            children: List.generate(tabs.length, (index) {
              final tab = tabs[index];
              final isActive = (index == activeIndex);

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
                            children: [
                              if (tabLeadingIcon != null) ...[
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
                              if (tabTrailingIcon != null) ...[
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

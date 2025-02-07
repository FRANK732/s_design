import 'package:flutter/material.dart';
import 'package:s_design/src/theme/s_spacers.dart';

import '../../../s_design.dart';

class TabsList extends StatelessWidget {
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final List<TabItem> tabs;
  final Function(int) onTabSelected;
  final int activeIndex;
  final EdgeInsetsGeometry tabListMargin;

  const TabsList({
    Key? key,
    this.direction = Axis.horizontal,
    required this.tabListMargin,
    this.mainAxisAlignment = MainAxisAlignment.center,
    required this.tabs,
    required this.onTabSelected,
    required this.activeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetTabs = context.findAncestorWidgetOfExactType<Tabs>();
    if (widgetTabs != null && widgetTabs.tabs != tabs) {
      throw FlutterError(
          'TabsList must be a child of the corresponding Tabs widget.');
    }

    // Access the current theme: colorScheme, textTheme, etc.
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final containerColor = colorScheme.outline.withOpacity(0.15);

    final activeTabColor = colorScheme.primary.withOpacity(0.2);
    final borderRadius = Spacers.radiusSmall;

    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: tabListMargin,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: direction,
          child: Flex(
            direction: direction,
            mainAxisAlignment: mainAxisAlignment,
            children: List.generate(tabs.length, (index) {
              final tab = tabs[index];
              final isActive = (index == activeIndex);

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Semantics(
                  button: true,
                  selected: isActive,
                  label: tab.label,
                  child: GestureDetector(
                    onTap: () => onTabSelected(index),
                    child: FocusableActionDetector(
                      mouseCursor: SystemMouseCursors.click,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 55,
                        ),
                        decoration: BoxDecoration(
                          color: isActive ? activeTabColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          tab.label,
                          style: isActive
                              ? textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)
                              : textTheme.bodyMedium,
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

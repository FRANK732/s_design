import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'package:s_design/src/theme/s_spacers.dart';
import 'package:s_design/src/theme/theme_extension.dart';
import 'themes/s_tabs_theme.dart';

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
    final theme = TabsTheme.of(context).listStyle;

    Tabs? widgetTabs = context.findAncestorWidgetOfExactType<Tabs>();

    if (widgetTabs != null && widgetTabs.tabs != this.tabs) {
      throw FlutterError('TabsList must be a child of Tabs');
    }

    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: tabListMargin,
      decoration: BoxDecoration(
        color: context.tabsIndicatorColor,
        borderRadius: Spacers.radiusSmall,
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: direction,
          child: Flex(
            direction: direction,
            mainAxisAlignment: mainAxisAlignment,
            children: List.generate(tabs.length, (index) {
              final tab = tabs[index];
              final isActive = index == activeIndex;
              final triggerStyle = TabsTheme.of(context).triggerStyle;

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
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 55),
                        decoration: BoxDecoration(
                          color: isActive
                              ? triggerStyle.activeBackgroundColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text(
                          tab.label,
                          style: isActive
                              ? triggerStyle.activeTextStyle
                              : triggerStyle.inactiveTextStyle,
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

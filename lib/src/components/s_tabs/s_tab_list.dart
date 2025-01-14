import 'package:flutter/material.dart';
import 'themes/s_tabs_theme.dart';

class TabsList extends StatelessWidget {
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  const TabsList({
    Key? key,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = TabsTheme.of(context).listStyle;

    return Container(
      padding: const EdgeInsets.all(4.0), // Spacing around the tabs
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: theme.borderRadius,
      ),
      child: Flex(
        direction: direction,
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      ),
    );
  }
}

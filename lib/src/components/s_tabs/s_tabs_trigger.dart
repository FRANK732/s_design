// import 'package:flutter/material.dart';
// import '../../components/s_tabs/s_tabs.dart';
// import '../../components/s_tabs/themes/s_tabs_theme.dart';
//
// class TabsTrigger extends StatelessWidget {
//   final String label;
//   final int index;
//   final VoidCallback? onTap;
//
//   const TabsTrigger({
//     Key? key,
//     required this.label,
//     required this.index,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final tabsState = Tabs.of(context);
//     final theme = TabsTheme.of(context).triggerStyle;
//
//     final isActive = tabsState?.activeIndex == index;
//
//     return GestureDetector(
//       onTap: () {
//         tabsState?.setActiveIndex(index);
//         if (onTap != null) onTap!();
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         padding: theme.padding,
//         decoration: BoxDecoration(
//           color: isActive
//               ? theme.activeBackgroundColor
//               : theme.inactiveBackgroundColor,
//           borderRadius: theme.borderRadius,
//         ),
//         child: Text(
//           label,
//           style: isActive ? theme.activeTextStyle : theme.inactiveTextStyle,
//         ),
//       ),
//     );
//   }
// }

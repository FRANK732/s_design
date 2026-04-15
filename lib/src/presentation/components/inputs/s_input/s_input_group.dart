import 'package:flutter/material.dart';

class SInputGroupScope
    extends InheritedWidget {
  const SInputGroupScope({
    super.key,
    required super.child,
    required this.isFirst,
    required this.isLast,
    required this.compact,
  });

  final bool
      isFirst;
  final bool
      isLast;
  final bool
      compact;

  static SInputGroupScope?
      of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SInputGroupScope>();
  }

  @override
  bool updateShouldNotify(
      SInputGroupScope
          oldWidget) {
    return isFirst != oldWidget.isFirst ||
        isLast != oldWidget.isLast ||
        compact != oldWidget.compact;
  }
}

class SInputGroup
    extends StatelessWidget {
  const SInputGroup({
    super.key,
    required this.children,
    this.compact =
        true,
  });

  final List<Widget>
      children;
  final bool
      compact;

  @override
  Widget build(
      BuildContext
          context) {
    if (!compact) {
      return Row(
        children: children.map((Widget c) => Padding(padding: const EdgeInsets.only(right: 8), child: c)).toList(),
      );
    }

    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children:
          children.asMap().entries.map((MapEntry<int, Widget> entry) {
        final int index = entry.key;
        final Widget child = entry.value;
        final bool isFirst = index == 0;
        final bool isLast = index == children.length - 1;

        return Flexible(
          child: Container(
            transform: Matrix4.translationValues(compact && !isFirst ? -1.0 * index : 0.0, 0.0, 0.0),
            // We wrap each child in a Scope so SInput can read its position
            child: SInputGroupScope(
              isFirst: isFirst,
              isLast: isLast,
              compact: compact,
              child: child,
            ),
          ),
        );
      }).toList(),
    );
  }
}

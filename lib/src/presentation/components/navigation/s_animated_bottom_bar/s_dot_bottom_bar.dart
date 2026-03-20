import 'package:flutter/material.dart';

import 's_animated_bottom_bar_item.dart';

/// A bottom bar where the active item shifts up and reveals a colored dot below.
class SDotBottomBar
    extends StatelessWidget {
  const SDotBottomBar({
    Key?
        key,
    required this.items,
    this.backgroundColor,
    this.currentIndex =
        0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.margin = const EdgeInsets
        .all(
        8),
    this.itemPadding = const EdgeInsets
        .symmetric(
        vertical: 10,
        horizontal: 16),
    this.duration =
        const Duration(milliseconds: 300),
    this.curve =
        Curves.easeOutCubic,
    this.dotIndicatorColor,
  }) : super(key: key);

  /// The background color of the bar.
  final Color?
      backgroundColor;

  /// The index of the currently active tab.
  final int
      currentIndex;

  /// The transition curve
  final Curve
      curve;

  /// The transition duration
  final Duration
      duration;

  /// The padding of each item.
  final EdgeInsets
      itemPadding;

  /// A convenience field for the margin surrounding the entire widget.
  final EdgeInsets
      margin;

  /// A list of tabs to display.
  final List<SAnimatedBottomBarItem>
      items;

  /// Callback when a tab is tapped.
  final Function(int)?
      onTap;

  /// The color of the icon and text when the item is selected.
  final Color?
      selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color?
      unselectedItemColor;

  /// The color of the dot indicator below the active item
  final Color?
      dotIndicatorColor;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);

    return ColoredBox(
      color:
          backgroundColor ?? Colors.transparent,
      child:
          SafeArea(
        minimum: margin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (final item in items)
              TweenAnimationBuilder<double>(
                tween: Tween(
                  end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
                ),
                curve: curve,
                duration: duration,
                builder: (context, t, _) {
                  final _selectedColor = item.selectedColor ?? selectedItemColor ?? theme.primaryColor;

                  final _unselectedColor = item.unselectedColor ?? unselectedItemColor ?? theme.iconTheme.color;

                  final _dotColor = dotIndicatorColor ?? _selectedColor;

                  return GestureDetector(
                    onTap: () => onTap?.call(items.indexOf(item)),
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: itemPadding,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.translate(
                            offset: Offset(0, -5 * t),
                            child: IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(_unselectedColor, _selectedColor, t),
                                size: 24,
                              ),
                              child: items.indexOf(item) == currentIndex ? item.activeIcon ?? item.icon : item.icon,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Opacity(
                            opacity: t,
                            child: Transform.scale(
                              scale: t,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: _dotColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

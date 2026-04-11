import 'package:flutter/material.dart';

import 's_animated_bottom_bar_item.dart';

/// A bottom bar where the background transitions colors and inactive items shrink.
class SShiftBottomBar
    extends StatelessWidget {
  const SShiftBottomBar({
    Key?
        key,
    required this.items,
    this.currentIndex =
        0,
    this.onTap,
    this.selectedItemColor =
        Colors.white,
    this.unselectedItemColor =
        Colors.white70,
    this.margin =
        EdgeInsets.zero,
    this.itemPadding = const EdgeInsets
        .symmetric(
        vertical: 16,
        horizontal: 16),
    this.duration =
        const Duration(milliseconds: 300),
    this.curve =
        Curves.easeInOut,
    this.elevation =
        8.0,
  }) : super(key: key);

  /// The index of the currently active tab.
  final int
      currentIndex;

  /// The transition curve
  final Curve
      curve;

  /// The transition duration
  final Duration
      duration;

  /// Bar elevation
  final double
      elevation;

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
  /// Defaults to `colorScheme.onPrimary` if null.
  final Color?
      selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  /// Defaults to `colorScheme.onPrimary.withOpacity(0.7)` if null.
  final Color?
      unselectedItemColor;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);

    // Determine the current bar background color based on the selected item
    final currentItemColor =
        items[currentIndex].selectedColor ?? theme.primaryColor;
    final Color effectiveSelected = selectedItemColor ?? theme.colorScheme.onPrimary;
    final Color effectiveUnselected = unselectedItemColor ?? theme.colorScheme.onPrimary.withOpacity(0.7);

    return TweenAnimationBuilder<
        Color?>(
      tween:
          ColorTween(
        begin: currentItemColor,
        end: currentItemColor,
      ),
      duration:
          duration,
      builder: (context,
          color,
          child) {
        return Material(
          color: color,
          elevation: elevation,
          child: SafeArea(
            minimum: margin,
            child: Row(
              mainAxisAlignment: items.length <= 3 ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.spaceAround,
              children: [
                for (final item in items)
                  TweenAnimationBuilder<double>(
                    tween: Tween(
                      end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
                    ),
                    curve: curve,
                    duration: duration,
                    builder: (context, t, _) {
                      return GestureDetector(
                        onTap: () => onTap?.call(items.indexOf(item)),
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: itemPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.translate(
                                offset: Offset(0, -6 * t),
                                child: IconTheme(
                                  data: IconThemeData(
                                    color: Color.lerp(effectiveUnselected, effectiveSelected, t),
                                    size: 24,
                                  ),
                                  child: items.indexOf(item) == currentIndex ? item.activeIcon ?? item.icon : item.icon,
                                ),
                              ),
                              ClipRect(
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  height: 16 * t,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    heightFactor: t,
                                    child: Transform.scale(
                                      scale: 0.8 + (0.2 * t),
                                      child: DefaultTextStyle(
                                        style: TextStyle(
                                          color: Color.lerp(effectiveSelected.withOpacity(0.0), effectiveSelected, t),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                        child: item.title,
                                      ),
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
      },
    );
  }
}

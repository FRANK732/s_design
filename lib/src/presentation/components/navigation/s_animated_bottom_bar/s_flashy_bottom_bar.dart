import 'package:flutter/material.dart';

import 's_animated_bottom_bar_item.dart';

/// A bottom bar featuring a flashy bubble background effect on the active item.
class SFlashyBottomBar
    extends StatelessWidget {
  const SFlashyBottomBar({
    Key?
        key,
    required this.items,
    this.backgroundColor,
    this.currentIndex =
        0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.margin = const EdgeInsets
        .all(
        8),
    this.itemPadding = const EdgeInsets
        .symmetric(
        vertical: 10,
        horizontal: 16),
    this.duration =
        const Duration(milliseconds: 400),
    this.curve =
        Curves.fastOutSlowIn,
    this.iconSize =
        24.0,
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

  /// Icon size
  final double
      iconSize;

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

  /// The opacity of color of the touchable background when the item is selected.
  final double?
      selectedColorOpacity;

  /// The color of the icon and text when the item is selected.
  final Color?
      selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color?
      unselectedItemColor;

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

                  return GestureDetector(
                    onTap: () => onTap?.call(items.indexOf(item)),
                    behavior: HitTestBehavior.opaque,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Flashy background bubble
                        Opacity(
                          opacity: t * (selectedColorOpacity ?? 0.1),
                          child: Transform.scale(
                            scale: t,
                            child: Container(
                              height: iconSize * 2,
                              width: iconSize * 2,
                              decoration: BoxDecoration(
                                color: _selectedColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),

                        // Icon and Title Column
                        Padding(
                          padding: itemPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.translate(
                                offset: Offset(0, -5 * t),
                                child: IconTheme(
                                  data: IconThemeData(
                                    color: Color.lerp(_unselectedColor, _selectedColor, t),
                                    size: iconSize,
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
                                    child: Transform.translate(
                                      offset: Offset(0, 10 * (1 - t)),
                                      child: DefaultTextStyle(
                                        style: TextStyle(
                                          color: Color.lerp(_selectedColor.withOpacity(0.0), _selectedColor, t),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
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
                      ],
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

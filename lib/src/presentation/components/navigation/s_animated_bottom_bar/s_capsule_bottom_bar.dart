import 'package:flutter/material.dart';

import 's_animated_bottom_bar_item.dart';

/// A bottom bar matching the Salomon capsule design pattern.
class SCapsuleBottomBar
    extends StatelessWidget {
  const SCapsuleBottomBar({
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
    this.itemShape =
        const StadiumBorder(),
    this.margin = const EdgeInsets
        .all(
        8),
    this.itemPadding = const EdgeInsets
        .symmetric(
        vertical: 10,
        horizontal: 16),
    this.duration =
        const Duration(milliseconds: 500),
    this.curve =
        Curves.easeOutQuint,
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

  /// The border shape of each item.
  final ShapeBorder
      itemShape;

  /// A list of tabs to display.
  final List<SAnimatedBottomBarItem>
      items;

  /// Callback when a tab is tapped.
  final void
          Function(int)?
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
          mainAxisAlignment: items.length <= 2 ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.spaceBetween,
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

                  return Material(
                    color: Color.lerp(_selectedColor.withOpacity(0.0), _selectedColor.withOpacity(selectedColorOpacity ?? 0.1), t),
                    shape: itemShape,
                    child: InkWell(
                      onTap: () => onTap?.call(items.indexOf(item)),
                      customBorder: itemShape,
                      focusColor: _selectedColor.withOpacity(0.1),
                      highlightColor: _selectedColor.withOpacity(0.1),
                      splashColor: _selectedColor.withOpacity(0.1),
                      hoverColor: _selectedColor.withOpacity(0.1),
                      child: Padding(
                        padding: itemPadding - (Directionality.of(context) == TextDirection.ltr ? EdgeInsets.only(right: itemPadding.right * t) : EdgeInsets.only(left: itemPadding.left * t)),
                        child: Row(
                          children: [
                            IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(_unselectedColor, _selectedColor, t),
                                size: 24,
                              ),
                              child: items.indexOf(item) == currentIndex ? item.activeIcon ?? item.icon : item.icon,
                            ),
                            ClipRect(
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 20,
                                child: Align(
                                  alignment: const Alignment(-0.2, 0.0),
                                  widthFactor: t,
                                  child: Padding(
                                    padding: Directionality.of(context) == TextDirection.ltr ? EdgeInsets.only(left: itemPadding.left / 2, right: itemPadding.right) : EdgeInsets.only(left: itemPadding.left, right: itemPadding.right / 2),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        color: Color.lerp(_selectedColor.withOpacity(0.0), _selectedColor, t),
                                        fontWeight: FontWeight.w600,
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

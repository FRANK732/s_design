import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// A container that groups [SListTile]s together with a common background and rounded corners.
///
/// This mimics the "Inset Grouped" style found in iOS settings.
class SListTileGroup
    extends StatelessWidget {
  /// Creates an [SListTileGroup].
  const SListTileGroup({
    super.key,
    required this.children,
    this.margin,
    this.backgroundColor,
    this.dividerColor,
    this.borderRadius,
    this.showDividers =
        true,
  });

  /// The list of tiles to display in the group.
  ///
  /// Usually [SListTile]s, but can be any widget.
  final List<Widget>
      children;

  /// External margin around the group.
  final EdgeInsetsGeometry?
      margin;

  /// Background color of the group.
  ///
  /// Defaults to [SListTileThemeData.groupBackgroundColor].
  final Color?
      backgroundColor;

  /// Color of the dividers between tiles.
  ///
  /// Defaults to [SListTileThemeData.dividerColor].
  final Color?
      dividerColor;

  /// Border radius of the group container.
  ///
  /// Defaults to [SListTileThemeData.groupBorderRadius].
  final BorderRadius?
      borderRadius;

  /// Whether to show dividers between children.
  final bool
      showDividers;

  @override
  Widget build(
      BuildContext
          context) {
    if (children
        .isEmpty) {
      return const SizedBox.shrink();
    }

    final SListTileThemeData
        theme =
        Theme.of(context).sListTileTheme;
    final BorderRadius effectiveBorderRadius = borderRadius ??
        theme.groupBorderRadius ??
        BorderRadius.circular(16);
    final Color effectiveBackgroundColor = backgroundColor ??
        theme.groupBackgroundColor ??
        Colors.grey.shade100;
    final Color effectiveDividerColor = dividerColor ??
        theme.dividerColor ??
        Colors.grey.shade300;

    return Padding(
      padding:
          margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
      child:
          Container(
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: effectiveBorderRadius,
        ),
        clipBehavior: Clip.antiAlias, // Clip children to rounded corners
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildChildrenWithDividers(effectiveDividerColor),
        ),
      ),
    );
  }

  List<Widget>
      _buildChildrenWithDividers(Color dividerColor) {
    if (!showDividers ||
        children.length <= 1) {
      return children;
    }

    final List<Widget>
        items =
        <Widget>[];
    for (int i = 0;
        i < children.length;
        i++) {
      items.add(children[i]);
      if (i <
          children.length - 1) {
        // Add divider
        items.add(
          Divider(
            height: 1,
            thickness: 1,
            color: dividerColor,
            indent: 16, // Typical inset
            endIndent: 0,
          ),
        );
      }
    }
    return items;
  }
}

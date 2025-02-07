import 'package:flutter/material.dart';

/// A customizable ListTile widget with theming support.
/// It supports custom icons, titles, subtitles, trailing widgets, and a tap callback.
class SListTile extends StatelessWidget {
  /// The title text of the tile.
  final String title;

  /// The subtitle widget of the tile.
  final Widget? subtitle;

  /// The leading widget of the tile.
  final Widget? leading;

  /// The trailing widget of the tile.
  final Widget? trailing;

  /// Callback when the tile is tapped.
  final VoidCallback? onTap;

  /// Creates a [SListTile].
  const SListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final listTileTheme = ListTileTheme.of(context);
    final iconTheme = Theme.of(context).iconTheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      leading: leading != null
          ? IconTheme(
              data: IconThemeData(
                color: listTileTheme.iconColor ?? iconTheme.color,
                size: iconTheme.size,
              ),
              child: leading!,
            )
          : null,
      title: Text(
        title,
        style: listTileTheme.titleTextStyle ?? textTheme.titleMedium,
      ),
      subtitle: subtitle != null
          ? DefaultTextStyle(
              style: listTileTheme.subtitleTextStyle ?? textTheme.bodySmall!,
              child: subtitle!,
            )
          : null,
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            color: listTileTheme.iconColor ?? iconTheme.color,
            size: iconTheme.size,
          ),
      onTap: onTap,
    );
  }
}

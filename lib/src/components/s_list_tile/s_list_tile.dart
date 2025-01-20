import 'package:flutter/material.dart';
import 'themes/t_list_tile_theme.dart';
import '../../components/s_list_tile/themes/t_list_tile_theme_extension.dart';

/// A customizable ListTile widget with theming support.
///
/// It supports custom icons, titles, subtitles, actions, and theming.
///
/// Example usage:
/// ```dart
/// TListTile(
///   title: 'Profile',
///   subtitle: Text('View and edit your profile'),
///   leading: Icon(Icons.person),
///   trailing: Icon(Icons.edit),
///   onTap: () {
///     // Handle tap
///   },
/// )
/// ```
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
    // Retrieve the current theme data.
    final SListTileThemeData theme = Theme.of(context).tListTileTheme;

    return ListTile(
      leading: leading != null
          ? IconTheme(
              data: IconThemeData(
                color: theme.leadingColor,
              ),
              child: leading!,
            )
          : null,
      title: Text(
        title,
        style: theme.titleTextStyle,
      ),
      subtitle: subtitle != null
          ? DefaultTextStyle(
              style: theme.subtitleTextStyle ??
                  Theme.of(context).textTheme.titleSmall!,
              child: subtitle!,
            )
          : null,
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            size: theme.trailingIconSize,
            color: theme.trailingColor ?? Theme.of(context).iconTheme.color,
          ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// An advanced ListTile widget built strictly on Flutter's ListTile.
/// Enhances UI/UX with native properties and minimal external additions.
class SListTile extends StatelessWidget {
  /// The title widget of the tile.
  final Widget title;

  /// The subtitle widget of the tile (optional).
  final Widget? subtitle;

  /// The leading widget (e.g., icon or avatar) of the tile (optional).
  final Widget? leading;

  /// The trailing widget of the tile (optional), defaults to a chevron if not provided.
  final Widget? trailing;

  /// Callback when the tile is tapped.
  final VoidCallback? onTap;

  /// Callback when the tile is long-pressed (optional).
  final VoidCallback? onLongPress;

  /// Callback when the tile gains or loses focus (optional).
  final ValueChanged<bool>? onFocusChange;

  /// Background color of the tile (optional).
  final Color? tileColor;

  /// Background color when the tile is selected (optional).
  final Color? selectedTileColor;

  /// Color of icons (leading/trailing) (optional).
  final Color? iconColor;

  /// Color of text (title/subtitle) (optional).
  final Color? textColor;

  /// Custom text style for the title (optional).
  final TextStyle? titleTextStyle;

  /// Custom text style for the subtitle (optional).
  final TextStyle? subtitleTextStyle;

  /// Padding inside the tile (optional).
  final EdgeInsets? contentPadding;

  /// Margin outside the tile (applied via Padding wrapper).
  final EdgeInsets? margin;

  /// Whether the tile is enabled (default: true).
  final bool enabled;

  /// Whether to show a loading state (simulated with opacity, optional).
  final bool showLoading;

  /// Animation duration for style transitions (default: 200ms).
  final Duration animationDuration;

  /// Badge content to display with the leading widget (optional).
  final Widget? badge;

  /// Badge position (optional).
  final SBadgePosition? badgePosition;

  /// Whether to vibrate on tap (requires haptic feedback package) (default: false).
  final bool vibrateOnTap;

  /// Whether the tile is dense (smaller vertical height) (default: false).
  final bool isDense;

  /// Whether to enable three-line layout (default: false).
  final bool isThreeLine;

  /// Custom shape for the tile (optional).
  final ShapeBorder? shape;

  /// Visual density of the tile (optional).
  final VisualDensity? visualDensity;

  /// Splash color for tap feedback (optional).
  final Color? splashColor;

  /// Hover color when the mouse hovers over the tile (optional).
  final Color? hoverColor;

  /// Focus color when the tile is focused (optional).
  final Color? focusColor;

  /// Minimum horizontal gap between title and leading/trailing (optional).
  final double? horizontalTitleGap;

  /// Minimum vertical padding (optional).
  final double? minVerticalPadding;

  /// Minimum width of the leading widget (optional).
  final double? minLeadingWidth;

  /// Minimum height of the tile (optional).
  final double? minTileHeight;

  /// Creates an [SListTile] with advanced features using only [ListTile] properties.
  const SListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.tileColor,
    this.selectedTileColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.contentPadding,
    this.margin,
    this.enabled = true,
    this.showLoading = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.badge,
    this.badgePosition,
    this.vibrateOnTap = false,
    this.isDense = false,
    this.isThreeLine = false,
    this.shape,
    this.visualDensity,
    this.splashColor,
    this.hoverColor,
    this.focusColor,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.minTileHeight,
  }) : assert(!isThreeLine || subtitle != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final listTileTheme = ListTileTheme.of(context);
    final iconTheme = theme.iconTheme;

    // Apply margin via Padding if provided
    Widget tile = ListTile(
      // Leading with Badge
      leading: leading != null
          ? _buildLeadingWithBadge(
              context,
              leading!,
              badge,
              badgePosition,
              iconTheme,
              listTileTheme,
            )
          : null,
      // Title
      title: AnimatedDefaultTextStyle(
        duration: animationDuration,
        style: titleTextStyle ??
            listTileTheme.titleTextStyle ??
            theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: showLoading
                  ? Colors.transparent
                  : (enabled
                      ? textColor ?? theme.colorScheme.onSurface
                      : (textColor ?? theme.colorScheme.onSurface)
                          .withOpacity(0.5)),
            ),
        child: title,
      ),
      // Subtitle
      subtitle: subtitle != null
          ? AnimatedDefaultTextStyle(
              duration: animationDuration,
              style: subtitleTextStyle ??
                  listTileTheme.subtitleTextStyle ??
                  theme.textTheme.bodySmall!.copyWith(
                    color: showLoading
                        ? Colors.transparent
                        : (enabled
                            ? textColor ?? theme.colorScheme.onSurfaceVariant
                            : (textColor ?? theme.colorScheme.onSurfaceVariant)
                                .withOpacity(0.5)),
                  ),
              child: subtitle!,
            )
          : null,
      // Trailing
      trailing: trailing ??
          (enabled
              ? Icon(
                  Icons.arrow_forward_ios,
                  size: iconTheme.size ?? 16.0,
                  color: showLoading
                      ? Colors.transparent
                      : (iconColor ??
                          listTileTheme.iconColor ??
                          iconTheme.color),
                )
              : Icon(
                  Icons.arrow_forward_ios,
                  size: iconTheme.size ?? 16.0,
                  color: showLoading
                      ? Colors.transparent
                      : (iconColor ??
                              listTileTheme.iconColor ??
                              iconTheme.color)
                          ?.withOpacity(0.5),
                )),
      // Interactivity
      onTap: enabled && onTap != null
          ? () {
              if (vibrateOnTap) {
                HapticFeedback.heavyImpact();
                // Requires 'vibration' package: vibration: ^1.8.0
                // Vibration.vibrate(duration: 50);
              }
              onTap!();
            }
          : null,
      onLongPress: enabled ? onLongPress : null,
      onFocusChange: onFocusChange,
      // Styling
      tileColor: showLoading
          ? Colors.grey.withOpacity(0.2)
          : (tileColor ??
              listTileTheme.tileColor ??
              theme.scaffoldBackgroundColor),
      selectedTileColor: selectedTileColor,
      iconColor: iconColor,
      textColor: textColor,
      shape: shape,
      contentPadding: contentPadding ?? EdgeInsets.all(12.0),
      dense: isDense,
      isThreeLine: isThreeLine,
      enabled: enabled,
      visualDensity: visualDensity,
      splashColor: splashColor ?? theme.colorScheme.primary.withOpacity(0.2),
      hoverColor: hoverColor ?? theme.colorScheme.primary.withOpacity(0.1),
      focusColor: focusColor ?? theme.colorScheme.primary.withOpacity(0.3),
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      minLeadingWidth: minLeadingWidth,
      minTileHeight: minTileHeight,
    );

    // Apply margin if provided (minimal wrapper)
    if (margin != null) {
      tile = Padding(
        padding: margin!,
        child: tile,
      );
    }

    return tile;
  }

  /// Builds the leading widget with an optional badge.
  Widget _buildLeadingWithBadge(
    BuildContext context,
    Widget leading,
    Widget? badge,
    SBadgePosition? position,
    IconThemeData iconTheme,
    ListTileThemeData listTileTheme,
  ) {
    if (badge == null) {
      return IconTheme(
        data: IconThemeData(
          color: showLoading
              ? Colors.transparent
              : (enabled
                  ? iconColor ?? listTileTheme.iconColor ?? iconTheme.color
                  : (iconColor ?? listTileTheme.iconColor ?? iconTheme.color)
                      ?.withOpacity(0.5)),
          size: iconTheme.size,
        ),
        child: leading,
      );
    }

    // Use SizedBox and Positioned for badge overlay (minimal Stack usage)
    return SizedBox(
      width: (iconTheme.size ?? 24.0) + 16.0, // Space for badge
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              color: showLoading
                  ? Colors.transparent
                  : (enabled
                      ? iconColor ?? listTileTheme.iconColor ?? iconTheme.color
                      : (iconColor ??
                              listTileTheme.iconColor ??
                              iconTheme.color)
                          ?.withOpacity(0.5)),
              size: iconTheme.size,
            ),
            child: leading,
          ),
          if (!showLoading)
            Positioned(
              top: position?.top ?? -8.0,
              right: position?.right ?? -8.0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  shape: BoxShape.circle,
                ),
                child: badge,
              ),
            ),
        ],
      ),
    );
  }
}

/// Defines the position of a badge relative to the leading widget.
class SBadgePosition {
  final double? top;
  final double? right;

  const SBadgePosition({this.top, this.right});
}

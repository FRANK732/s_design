import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../s_design.dart';

/// Variants for [SListTile].
enum SListTileVariant {
  /// Default transparent style.
  standard,

  /// Solid background color (surface container).
  filled,

  /// Transparent background with border.
  outlined,

  /// Shadowed surface (elevation).
  elevated,
}

/// An SListTile widget built on Flutter's ListTile with advanced styling and features.
class SListTile
    extends StatelessWidget {
  /// Creates an [SListTile] with advanced features.
  const SListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.overline,
    this.variant =
        SListTileVariant.standard,
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
    this.enabled =
        true,
    this.selected =
        false,
    this.showLoading =
        false,
    this.animationDuration =
        const Duration(milliseconds: 200),
    this.badge,
    this.badgePosition,
    this.vibrateOnTap =
        false,
    this.isDense =
        false,
    this.isThreeLine =
        false,
    this.shape,
    this.visualDensity,
    this.splashColor,
    this.hoverColor,
    this.focusColor,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.minTileHeight,
    // Swipe Actions
    this.dismissKey,
    this.onDismissed,
    this.confirmDismiss,
    this.dismissBackground,
    this.dismissSecondaryBackground,
    this.dismissDirection =
        DismissDirection.endToStart,
    this.dismissThresholds =
        const <DismissDirection, double>{},
    this.dismissMovementDuration =
        const Duration(milliseconds: 200),
    this.dismissResizeDuration =
        const Duration(milliseconds: 300),
  }) : assert(!isThreeLine || subtitle != null);

  /// The title widget of the tile.
  final Widget
      title;

  /// The subtitle widget of the tile (optional).
  final Widget?
      subtitle;

  /// Text/Widget displayed above the title (optional).
  final Widget?
      overline;

  /// The leading widget (e.g., icon or avatar).
  final Widget?
      leading;

  /// The trailing widget of the tile.
  final Widget?
      trailing;

  /// The visual variant of the tile.
  final SListTileVariant
      variant;

  /// Callback when tapped.
  final VoidCallback?
      onTap;

  /// Callback when long-pressed.
  final VoidCallback?
      onLongPress;

  /// Callback when focus changes.
  final ValueChanged<bool>?
      onFocusChange;

  /// Explicit background color.
  final Color?
      tileColor;

  /// Explicit selected background color.
  final Color?
      selectedTileColor;

  /// Icon color.
  final Color?
      iconColor;

  /// Text color.
  final Color?
      textColor;

  /// Custom title style.
  final TextStyle?
      titleTextStyle;

  /// Custom subtitle style.
  final TextStyle?
      subtitleTextStyle;

  /// Padding inside the tile.
  final EdgeInsets?
      contentPadding;

  /// Margin outside the tile.
  final EdgeInsets?
      margin;

  /// Whether the tile is enabled.
  final bool
      enabled;

  /// Whether the tile is selected.
  final bool
      selected;

  /// Whether to show loading state.
  final bool
      showLoading;

  /// Animation duration.
  final Duration
      animationDuration;

  /// Badge content for leading widget.
  final Widget?
      badge;

  /// Badge position.
  final SBadgePosition?
      badgePosition;

  /// Whether to vibrate on tap.
  final bool
      vibrateOnTap;

  /// Whether the tile is dense.
  final bool
      isDense;

  /// Whether to enable three-line layout.
  final bool
      isThreeLine;

  /// Custom shape.
  final ShapeBorder?
      shape;

  /// Visual density.
  final VisualDensity?
      visualDensity;

  /// Splash color.
  final Color?
      splashColor;

  /// Hover color.
  final Color?
      hoverColor;

  /// Focus color.
  final Color?
      focusColor;

  /// Horizontal gap.
  final double?
      horizontalTitleGap;

  /// Minimum vertical padding.
  final double?
      minVerticalPadding;

  /// Minimum leading width.
  final double?
      minLeadingWidth;

  /// Minimum tile height.
  final double?
      minTileHeight;

  /// Key for Dismissible widget (required if onDismissed is used).
  final Key?
      dismissKey;

  /// Called when the tile is dismissed.
  final DismissDirectionCallback?
      onDismissed;

  /// Called to confirm if the tile should be dismissed.
  final ConfirmDismissCallback?
      confirmDismiss;

  /// Background widget when swiping (starts at start).
  final Widget?
      dismissBackground;

  /// Secondary background widget when swiping (starts at end).
  final Widget?
      dismissSecondaryBackground;

  /// Direction of swipe dismissal.
  final DismissDirection
      dismissDirection;

  /// Thresholds for dismissal.
  final Map<
      DismissDirection,
      double> dismissThresholds;

  /// Duration of movement.
  final Duration
      dismissMovementDuration;

  /// Duration of resize.
  final Duration
      dismissResizeDuration;

  /// Resolves the background color based on variant and state.
  Color? _resolveTileColor(
      SListTileThemeData
          theme,
      ColorScheme
          colorScheme) {
    if (showLoading) {
      return Colors.grey.withOpacity(0.1);
    }
    if (tileColor !=
        null) {
      return tileColor;
    }

    switch (
        variant) {
      case SListTileVariant.filled:
        return theme.filledColor ?? colorScheme.surfaceContainerHighest;
      case SListTileVariant.outlined:
        return Colors.transparent;
      case SListTileVariant.elevated:
        return colorScheme.surfaceContainerLow;
      case SListTileVariant.standard:
        return theme.backgroundColor;
    }
  }

  /// Resolves the shape based on variant.
  ShapeBorder? _resolveShape(
      SListTileThemeData
          theme,
      ColorScheme
          colorScheme) {
    if (shape !=
        null) {
      return shape;
    }

    final BorderRadius
        radius =
        theme.borderRadius ?? BorderRadius.circular(12);

    switch (
        variant) {
      case SListTileVariant.filled:
      case SListTileVariant.elevated:
        return RoundedRectangleBorder(borderRadius: radius);
      case SListTileVariant.outlined:
        return RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: selected ? (theme.selectedColor) : (theme.outlinedBorderColor ?? colorScheme.outline),
          ),
        );
      case SListTileVariant.standard:
        if (selected) {
          return RoundedRectangleBorder(borderRadius: radius);
        }
        return null; // Let Material handle it or be rectangular
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final ThemeData
        themeData =
        Theme.of(context);
    final SListTileThemeData
        theme =
        themeData.sListTileTheme;
    final ColorScheme
        colorScheme =
        themeData.colorScheme;
    final ListTileThemeData
        listTileTheme =
        ListTileTheme.of(context);

    // Resolve Colors
    final Color
        effectiveTileColor =
        _resolveTileColor(theme, colorScheme) ?? Colors.transparent;
    final Color
        effectiveSelectedTileColor =
        selectedTileColor ?? theme.selectedBackgroundColor;

    // Resolve Shape
    final ShapeBorder?
        effectiveShape =
        _resolveShape(theme, colorScheme);

    // Wrapper for Shadow (Elevated Variant)
    Widget
        content =
        Material(
      color:
          Colors.transparent, // Handled by ListTile or Container
      elevation: variant == SListTileVariant.elevated
          ? 1.0
          : 0.0,
      shape:
          effectiveShape,
      child:
          ListTile(
        // Leading with Badge
        leading: leading != null
            ? _buildLeadingWithBadge(
                context,
                leading!,
                badge,
                badgePosition,
                themeData.iconTheme,
                listTileTheme,
                theme,
              )
            : null,
        // Title with optional Overline
        title: _buildTitle(context, themeData),
        // Subtitle
        subtitle: subtitle != null
            ? AnimatedDefaultTextStyle(
                duration: animationDuration,
                style: subtitleTextStyle ??
                    listTileTheme.subtitleTextStyle ??
                    theme.subtitleTextStyle ??
                    themeData.textTheme.bodySmall!.copyWith(
                      color: showLoading ? Colors.transparent : (enabled ? textColor ?? theme.subtitleColor : (textColor ?? theme.subtitleColor).withOpacity(0.5)),
                    ),
                child: subtitle!,
              )
            : null,
        // Trailing
        trailing: trailing,
        // Interactivity
        onTap: enabled && onTap != null
            ? () {
                if (vibrateOnTap) {
                  HapticFeedback.heavyImpact();
                }
                onTap!();
              }
            : null,
        onLongPress: enabled ? onLongPress : null,
        onFocusChange: onFocusChange,
        // Styling
        tileColor: selected ? effectiveSelectedTileColor : effectiveTileColor,
        selectedTileColor: effectiveSelectedTileColor,
        selected: selected,
        iconColor: iconColor ?? theme.iconColor,
        textColor: textColor ?? theme.textColor,
        shape: effectiveShape,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        dense: isDense,
        isThreeLine: isThreeLine,
        enabled: enabled,
        visualDensity: visualDensity,
        splashColor: splashColor ?? theme.selectedColor.withOpacity(0.1),
        hoverColor: hoverColor ?? theme.hoverColor,
        focusColor: focusColor ?? theme.selectedColor.withOpacity(0.2),
        horizontalTitleGap: horizontalTitleGap,
        minVerticalPadding: minVerticalPadding,
        minLeadingWidth: minLeadingWidth,
        minTileHeight: minTileHeight,
      ),
    );

    // Margin Wrapper
    if (margin !=
        null) {
      content =
          Padding(
        padding: margin!,
        child: content,
      );
    }

    // Swipe Wrapper
    if (onDismissed != null &&
        dismissKey != null) {
      return Dismissible(
        key: dismissKey!,
        direction: dismissDirection,
        onDismissed: onDismissed,
        confirmDismiss: confirmDismiss,
        background: dismissBackground,
        secondaryBackground: dismissSecondaryBackground,
        dismissThresholds: dismissThresholds,
        movementDuration: dismissMovementDuration,
        resizeDuration: dismissResizeDuration,
        child: content,
      );
    }

    return content;
  }

  Widget _buildTitle(
      BuildContext
          context,
      ThemeData
          themeData) {
    final TextStyle defaultTitleStyle = titleTextStyle ??
        themeData.sListTileTheme.titleTextStyle ??
        themeData.textTheme.titleMedium!;

    final Widget
        titleWidget =
        AnimatedDefaultTextStyle(
      duration:
          animationDuration,
      style:
          defaultTitleStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: showLoading ? Colors.transparent : (enabled ? textColor ?? themeData.sListTileTheme.textColor : (textColor ?? themeData.sListTileTheme.textColor).withOpacity(0.5)),
      ),
      child:
          title,
    );

    if (overline !=
        null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedDefaultTextStyle(
            duration: animationDuration,
            style: themeData.textTheme.labelSmall!.copyWith(
              color: themeData.colorScheme.primary,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
            ),
            child: overline!,
          ),
          const SizedBox(height: 2),
          titleWidget,
        ],
      );
    }

    return titleWidget;
  }

  Widget
      _buildLeadingWithBadge(
    BuildContext
        context,
    Widget
        leading,
    Widget?
        badge,
    SBadgePosition?
        position,
    IconThemeData
        iconTheme,
    ListTileThemeData
        listTileTheme,
    SListTileThemeData
        sTheme,
  ) {
    if (badge ==
        null) {
      return IconTheme(
        data: IconThemeData(
          color: showLoading ? Colors.transparent : (enabled ? iconColor ?? listTileTheme.iconColor ?? iconTheme.color ?? sTheme.iconColor : (iconColor ?? listTileTheme.iconColor ?? iconTheme.color ?? sTheme.iconColor).withOpacity(0.5)),
          size: iconTheme.size,
        ),
        child: leading,
      );
    }

    return SizedBox(
      width:
          (iconTheme.size ?? 24.0) + 16.0,
      child:
          Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              color: showLoading ? Colors.transparent : (enabled ? iconColor ?? listTileTheme.iconColor ?? iconTheme.color ?? sTheme.iconColor : (iconColor ?? listTileTheme.iconColor ?? iconTheme.color ?? sTheme.iconColor).withOpacity(0.5)),
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
  const SBadgePosition(
      {this.top,
      this.right});
  final double?
      top;
  final double?
      right;
}

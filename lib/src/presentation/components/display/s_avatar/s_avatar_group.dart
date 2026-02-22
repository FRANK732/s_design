import 'package:flutter/material.dart';

import '../../../../domain/entities/config/s_avatar_enums.dart';
import '../../../themes/extensions/component_themes/s_avatar_theme.dart';
import 's_avatar.dart';

/// Properties for configuring the overflow popover (tooltip) in [SAvatarGroup].
class SAvatarGroupPopoverProps {
  const SAvatarGroupPopoverProps({
    this.message,
    this.rootClassName,
  });

  final String?
      message;
  final String?
      rootClassName;
}

double _getAvatarWidth(
    Widget
        child,
    SAvatarThemeData?
        ext) {
  if (child
      is SAvatar) {
    if (child.customSize !=
        null)
      return child.customSize!;
    switch (
        child.size) {
      case SAvatarSize.large:
        return ext?.largeSize ?? 40.0;
      case SAvatarSize.small:
        return ext?.smallSize ?? 24.0;
      case SAvatarSize.middle:
        return ext?.middleSize ?? 32.0;
    }
  }
  if (child
      is Tooltip) {
    return _getAvatarWidth(
        child.child!,
        ext);
  }
  return 32.0; // fallback
}

/// A group of avatars, often overlapping, with support to cap the number
/// of displayed avatars and show the remainder in a `+N` indicator.
class SAvatarGroup
    extends StatelessWidget {
  const SAvatarGroup({
    super.key,
    required this.children,
    this.maxCount,
    this.maxStyle,
    this.maxPopoverProps,
    this.size,
    this.shape,
    this.spacing =
        -8.0,
  });

  /// The child [SAvatar] components.
  final List<Widget>
      children;

  /// The maximum number of avatars to display. If the number of children exceeds this,
  /// a `+N` avatar will be displayed.
  final int?
      maxCount;

  /// Custom background/foreground color or style for the `+N` avatar.
  /// Typically defined using a dummy [SAvatar] or a `BoxDecoration`.
  /// Here we accept [BoxDecoration] to map to `backgroundColor`, `foregroundColor`, etc.
  /// Or simpler, we just allow overriding the background and text colors of the `+N` element.
  /// Wait, actually we'll pass it down as custom properties to the plus avatar.
  final SAvatar?
      maxStyle;

  /// Extended tooltip configuration.
  final SAvatarGroupPopoverProps?
      maxPopoverProps;

  /// Cascaded size to apply to all children that do not specify one.
  final SAvatarSize?
      size;

  /// Cascaded shape to apply to all children that do not specify one.
  final SAvatarShape?
      shape;

  /// The overlap spacing between avatars. Typically negative (e.g., -8) to overlap.
  final double
      spacing;

  Widget _cloneWithCascade(
      BuildContext
          context,
      Widget
          child) {
    if (child
        is SAvatar) {
      final theme =
          Theme.of(context);
      final ext =
          theme.extension<SAvatarThemeData>();
      final isDark =
          theme.brightness == Brightness.dark;

      final borderCol =
          ext?.backgroundColor ?? (isDark ? const Color(0xFF141414) : const Color(0xFFFFFFFF));
      final borderW =
          ext?.borderWidth ?? 1.0;

      return SAvatar(
        key: child.key,
        shape: child.shape, // We don't override if explicitly set in child constructor unless they are default...
        // We'll trust the child properties unless we really need to force. SAvatar uses default middle/circle.
        // If we want exact Ant cascade we would read their values.
        // For simplicity we create a clone setting the cascaded values if child has defaults.
        size: size ?? child.size,
        customSize: child.customSize,
        gap: child.gap,
        src: child.src,
        icon: child.icon,
        text: child.text,
        widget: child.widget,
        backgroundColor: child.backgroundColor,
        foregroundColor: child.foregroundColor,
        borderWidth: child.borderWidth ?? borderW,
        borderColor: child.borderColor ?? borderCol,
        onError: child.onError,
        onTap: child.onTap,
      );
    }
    return child;
  }

  @override
  Widget build(
      BuildContext
          context) {
    final numOfChildren =
        children.length;
    final mergeCount =
        maxCount;

    List<Widget>
        childrenToShow =
        [];

    if (mergeCount != null &&
        mergeCount < numOfChildren) {
      childrenToShow =
          children.sublist(0, mergeCount);
    } else {
      childrenToShow =
          List.from(children);
    }

    // Cascade props
    final cascadedShow = childrenToShow
        .map((c) => _cloneWithCascade(context, c))
        .toList();

    // Map to overlapping stack
    // In Flutter, overlapping from left means Stack with positioned items,
    // but the easiest is a Wrap or Row with negative margins if we use a special layout.
    // Fortunately, we can just use a Row with Transform or Padding if we reverse the list
    // or just calculate explicit widths.
    // Actually, simpler: A Row where each child is wrapped in Align(widthFactor: ...).

    final ext =
        Theme.of(context).extension<SAvatarThemeData>();

    Widget buildRow(
        List<Widget> items,
        {bool hasOverflow = false}) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: items.asMap().entries.map((entry) {
          final idx = entry.key;
          final item = entry.value;

          // If it's the last item, no width compression is needed because
          // nothing comes after it.
          if (idx == items.length - 1) {
            return item;
          }

          final w = _getAvatarWidth(item, ext);
          final fw = w + spacing;
          final widthFactor = (fw > 0 ? fw : 0.0) / w;

          return Align(
            alignment: Alignment.centerLeft,
            widthFactor: widthFactor,
            child: item,
          );
        }).toList(),
      );
    }

    if (mergeCount != null &&
        mergeCount < numOfChildren) {
      final theme =
          Theme.of(context);
      final ext =
          theme.extension<SAvatarThemeData>();
      final isDark =
          theme.brightness == Brightness.dark;

      final borderCol =
          ext?.backgroundColor ?? (isDark ? const Color(0xFF141414) : const Color(0xFFFFFFFF));
      final borderW =
          ext?.borderWidth ?? 1.0;

      final plusAvatar = maxStyle ??
          SAvatar(
            text: '+\${numOfChildren - mergeCount}',
            backgroundColor: isDark ? const Color(0xFF333333) : const Color(0xFFFDE3CF),
            foregroundColor: isDark ? const Color(0xFFD9D9D9) : const Color(0xFFF56A00),
          );

      final cascadedPlus = _cloneWithCascade(
          context,
          SAvatar(
            text: plusAvatar.text,
            widget: plusAvatar.widget,
            src: plusAvatar.src,
            icon: plusAvatar.icon,
            shape: plusAvatar.shape,
            size: plusAvatar.size,
            customSize: plusAvatar.customSize,
            gap: plusAvatar.gap,
            backgroundColor: plusAvatar.backgroundColor,
            foregroundColor: plusAvatar.foregroundColor,
            borderColor: plusAvatar.borderColor ?? borderCol,
            borderWidth: plusAvatar.borderWidth ?? borderW,
          ));

      final overflowItem =
          Tooltip(
        message: maxPopoverProps?.message ?? '(${numOfChildren - mergeCount} more)',
        child: cascadedPlus,
      );

      // We append it to the row
      final allItems = List<Widget>.from(cascadedShow)
        ..add(overflowItem);
      return buildRow(allItems,
          hasOverflow: true);
    }

    return buildRow(
        cascadedShow);
  }
}

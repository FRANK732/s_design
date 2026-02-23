import 'package:flutter/material.dart';

import '../../../../domain/entities/config/s_avatar_enums.dart';
import '../../../themes/extensions/component_themes/s_avatar_theme.dart';
import '../../../themes/s_theme.dart';
import '../../../themes/s_theme_data.dart';

/// A component for representing users or objects, supporting images, icons, or text.
/// Matches the Avatar specifications.
class SAvatar
    extends StatefulWidget {
  const SAvatar({
    super.key,
    this.shape =
        SAvatarShape.circle,
    this.size =
        SAvatarSize.middle,
    this.customSize,
    this.gap =
        4.0,
    this.src,
    this.icon,
    this.text,
    this.widget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderWidth,
    this.borderColor,
    this.onError,
    this.onTap,
  }) : assert(
          text == null || widget == null,
          'Cannot provide both text and widget.',
        );

  /// Shape of the avatar. Circle by default.
  final SAvatarShape
      shape;

  /// Predetermined size of the avatar.
  final SAvatarSize
      size;

  /// Custom size of the avatar. If provided, overrides [size].
  final double?
      customSize;

  /// Distance between the text string and the avatar edges.
  final double
      gap;

  /// The address of the image for an image avatar, or an `ImageProvider`.
  /// Can be a `String` (network URL) or an `ImageProvider`.
  final dynamic
      src;

  /// Custom icon type for an icon avatar.
  final Widget?
      icon;

  /// Text to render inside the avatar. Automatically scales to fit.
  final String?
      text;

  /// Custom widget to render inside the avatar.
  final Widget?
      widget;

  /// Background color of the avatar.
  final Color?
      backgroundColor;

  /// Foreground color (for text and icons).
  final Color?
      foregroundColor;

  /// Border width (useful for overlapping groups).
  final double?
      borderWidth;

  /// Border color (useful for overlapping groups).
  final Color?
      borderColor;

  /// Callback when image load error occurs.
  /// Return false to prevent default fallback behavior (falling back to text/icon).
  final bool
          Function()?
      onError;

  /// Callback when the avatar is tapped.
  final VoidCallback?
      onTap;

  @override
  State<SAvatar>
      createState() =>
          _SAvatarState();
}

class _SAvatarState
    extends State<
        SAvatar> {
  bool
      _imageFailed =
      false;

  @override
  void didUpdateWidget(
      SAvatar
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.src !=
        oldWidget.src) {
      _imageFailed =
          false;
    }
  }

  void _handleImageError(
      Object
          exception,
      StackTrace?
          stackTrace) {
    if (mounted) {
      final bool preventFallback =
          widget.onError?.call() ?? false;
      if (!preventFallback) {
        setState(() {
          _imageFailed = true;
        });
      }
    }
  }

  Widget _buildTextFitted(
      String
          text,
      TextStyle
          style,
      double
          maxWidth,
      double
          gap) {
    // If we have no max width, we cannot scale correctly
    if (maxWidth == double.infinity ||
        maxWidth == 0) {
      return Text(text,
          style: style);
    }

    final double availableWidth =
        maxWidth - (gap * 2);
    if (availableWidth <=
        0) {
      // Not enough space even for gap
      return const SizedBox.shrink();
    }

    // Measure the text
    final TextPainter textPainter =
        TextPainter(
      text:
          TextSpan(text: text, style: style),
      textDirection:
          TextDirection.ltr,
      maxLines:
          1,
    )..layout();

    final double textWidth =
        textPainter.width;

    if (textWidth <=
        availableWidth) {
      // Fits perfectly, no scaling needed
      return Text(text,
          style: style);
    }

    // Needs scaling
    final double scale =
        availableWidth / textWidth;

    return Transform
        .scale(
      scale:
          scale,
      child:
          Text(text, style: style),
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData theme =
        STheme.of(context);
    final SAvatarThemeData ext =
        theme.avatarTheme;

    // Resolve size
    double
        dimension;
    if (widget.customSize !=
        null) {
      dimension =
          widget.customSize!;
    } else {
      switch (widget.size) {
        case SAvatarSize.large:
          dimension = ext.largeSize ?? 40.0;
        case SAvatarSize.small:
          dimension = ext.smallSize ?? 24.0;
        case SAvatarSize.middle:
          dimension = ext.middleSize ?? 32.0;
      }
    }

    // Resolve colors
    Color?
        bgCol;
    Color?
        fgCol;

    if (widget.src != null &&
        !_imageFailed) {
      // Images don't usually need a background unless they have transparency,
      // but we use transparent default.
      bgCol = widget.backgroundColor ??
          ext.backgroundColor ??
          Colors.transparent;
      fgCol =
          widget.foregroundColor ?? ext.foregroundColor;
    } else {
      bgCol = widget.backgroundColor ??
          ext.backgroundColor ??
          theme.colorToken.surface;
      fgCol = widget.foregroundColor ??
          ext.foregroundColor ??
          theme.colorToken.textPrimary;
    }

    final double borderW = widget.borderWidth ??
        ext.borderWidth ??
        0.0;
    final Color borderC = widget.borderColor ??
        ext.borderColor ??
        Colors.transparent;

    // Resolve shape properties
    BoxShape
        boxShape =
        BoxShape.circle;
    BorderRadiusGeometry?
        borderRadius;

    if (widget.shape ==
        SAvatarShape.square) {
      boxShape =
          BoxShape.rectangle;
      if (widget.customSize !=
          null) {
        borderRadius = BorderRadius.circular(widget.customSize! * 0.15); // Approximate standard radius scaling
      } else {
        switch (widget.size) {
          case SAvatarSize.large:
            borderRadius = ext.largeRadius ?? BorderRadius.circular(8);
          case SAvatarSize.small:
            borderRadius = ext.smallRadius ?? BorderRadius.circular(4);
          case SAvatarSize.middle:
            borderRadius = ext.middleRadius ?? BorderRadius.circular(6);
        }
      }
    }

    // Resolve contents
    Widget
        content;

    if (widget.src != null &&
        !_imageFailed) {
      if (widget.src
          is String) {
        content = Image.network(
          widget.src as String,
          fit: BoxFit.cover,
          width: dimension,
          height: dimension,
          errorBuilder: (BuildContext ctx, Object err, StackTrace? stack) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _handleImageError(err, stack);
            });
            // Temporary empty box while it triggers the rebuild fallback
            return const SizedBox.shrink();
          },
        );
      } else if (widget.src
          is ImageProvider) {
        content = Image(
          image: widget.src as ImageProvider,
          fit: BoxFit.cover,
          width: dimension,
          height: dimension,
          errorBuilder: (BuildContext ctx, Object err, StackTrace? stack) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _handleImageError(err, stack);
            });
            return const SizedBox.shrink();
          },
        );
      } else {
        content = const SizedBox.shrink();
      }
    } else if (widget.icon !=
        null) {
      // Ensure icon takes relative size
      final double iconSize =
          dimension / 2;
      content =
          IconTheme(
        data: IconThemeData(color: fgCol, size: iconSize),
        child: widget.icon!,
      );
    } else if (widget.text !=
        null) {
      // Text styling
      final double defaultFontSize =
          dimension / 2;
      final TextStyle textStyle =
          (ext.textStyle ?? const TextStyle(fontWeight: FontWeight.w400)).copyWith(fontSize: defaultFontSize, color: fgCol);

      content =
          LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: _buildTextFitted(widget.text!, textStyle, dimension, widget.gap),
          );
        },
      );
    } else if (widget.widget !=
        null) {
      content =
          widget.widget!;
    } else {
      content =
          const SizedBox.shrink();
    }

    // Make circle or square clip
    if (widget.shape ==
        SAvatarShape.circle) {
      content =
          ClipOval(child: content);
    } else {
      content =
          ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: content,
      );
    }

    Widget
        avatar =
        Container(
      width:
          dimension,
      height:
          dimension,
      decoration:
          BoxDecoration(
        color: bgCol,
        shape: boxShape,
        borderRadius: boxShape == BoxShape.rectangle ? borderRadius : null,
        border: borderW > 0 ? Border.all(color: borderC, width: borderW) : null,
      ),
      child:
          Center(child: content),
    );

    if (widget.onTap !=
        null) {
      avatar =
          MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: avatar,
        ),
      );
    }

    return avatar;
  }
}

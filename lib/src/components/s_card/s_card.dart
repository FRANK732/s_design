import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:s_design/src/components/s_card/enums/s_card_shadow.dart';
import 'package:s_design/src/components/s_card/enums/s_card_shape.dart';

class SCard extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  final Widget? header;
  final Widget? body;
  final Widget? actions;
  final Widget? footer;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? bodyPadding;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? footerPadding;
  final Color? color;
  final Gradient? gradient;
  final ImageProvider? backgroundImage;
  final SCardShape shape;
  final ShapeBorder? customShape;
  final SCardShadow shadowStyle;
  final BoxShadow? customShadow;
  final Color? borderColor;
  final double? borderRadius;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final VoidCallback? onTap;
  final double? height;
  final double? width;

  final Key? dismissKey;
  final Widget? dismissBackground;
  final Widget? dismissSecondaryBackground;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Function()? onDismissed;
  final DismissDirection direction;
  final Duration resizeDuration;
  final Map<DismissDirection, double> dismissThresholds;
  final Duration movementDuration;
  final double crossAxisEndOffset;
  final DragStartBehavior dragStartBehavior;
  final HitTestBehavior behavior;

  const SCard({
    super.key,
    this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
    this.header,
    this.body,
    this.actions,
    this.footer,
    this.margin,
    this.padding,
    this.headerPadding,
    this.bodyPadding,
    this.actionsPadding,
    this.footerPadding,
    this.color,
    this.gradient,
    this.backgroundImage,
    this.shape = SCardShape.rounded,
    this.customShape,
    this.shadowStyle = SCardShadow.subtle,
    this.customShadow,
    this.borderColor,
    this.borderRadius,
    this.shadowColor,
    this.shadowOffset,
    this.onTap,
    this.height,
    this.width,
    this.dismissKey,
    this.dismissBackground,
    this.dismissSecondaryBackground,
    this.confirmDismiss,
    this.onDismissed,
    this.direction = DismissDirection.horizontal,
    this.resizeDuration = const Duration(milliseconds: 300),
    this.dismissThresholds = const <DismissDirection, double>{},
    this.movementDuration = const Duration(milliseconds: 200),
    this.crossAxisEndOffset = 0.0,
    this.dragStartBehavior = DragStartBehavior.start,
    this.behavior = HitTestBehavior.opaque,
  })  : assert(
          !(gradient != null && backgroundImage != null),
          'Only one of gradient or backgroundImage should be provided.',
        ),
        assert(
          shape != SCardShape.custom || customShape != null,
          'customShape must be provided when shape is set to SCardShape.custom.',
        ),
        assert(
          shadowStyle != SCardShadow.custom || customShadow != null,
          'customShadow must be provided when shadowStyle is set to SCardShadow.custom.',
        );

  @override
  Widget build(BuildContext context) {
    Widget buildHeader() {
      if (header == null && title == null && description == null) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding:
            headerPadding ?? const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: header ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: titleStyle ??
                        Theme.of(context).textTheme.headlineMedium,
                  ),
                if (description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    description!,
                    style: descriptionStyle ??
                        Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
      );
    }

    Widget buildBody() {
      if (body == null) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding: bodyPadding ?? const EdgeInsets.all(16.0),
        child: body,
      );
    }

    Widget buildActions() {
      if (actions == null) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding: actionsPadding ??
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: actions,
      );
    }

    Widget buildFooter() {
      if (footer == null) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding:
            footerPadding ?? const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: footer,
      );
    }

    ShapeBorder? effectiveShape;
    switch (shape) {
      case SCardShape.rounded:
        effectiveShape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        );
        break;
      case SCardShape.circular:
        effectiveShape = const CircleBorder();
        break;
      case SCardShape.beveled:
        effectiveShape = BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        );
        break;
      case SCardShape.custom:
        effectiveShape = customShape;
        break;
    }

    BoxDecoration decoration = BoxDecoration(
      color: (gradient == null && backgroundImage == null) ? color : null,
      gradient: gradient,
      image: backgroundImage != null
          ? DecorationImage(
              image: backgroundImage!,
              fit: BoxFit.cover,
            )
          : null,
      shape:
          effectiveShape is CircleBorder ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: effectiveShape is RoundedRectangleBorder ||
              effectiveShape is BeveledRectangleBorder
          ? (effectiveShape as dynamic).borderRadius
          : null,
      border: Border.all(color: borderColor ?? Colors.transparent),
    );

    // Card Content
    Widget cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        buildBody(),
        buildActions(),
        buildFooter(),
      ],
    );

    Widget tappableContent = cardContent;
    if (onTap != null) {
      tappableContent = InkWell(
        onTap: onTap,
        child: cardContent,
      );
    }

    Widget cardWidget = Container(
      margin: margin ?? const EdgeInsets.all(8),
      padding: padding ?? EdgeInsets.zero,
      height: height,
      width: width,
      decoration: decoration,
      child: tappableContent,
    );

    if (dismissKey != null) {
      return Dismissible(
        key: dismissKey!,
        background: dismissBackground ?? const SizedBox(),
        secondaryBackground: dismissSecondaryBackground ?? const SizedBox(),
        confirmDismiss: confirmDismiss,
        onDismissed: (direction) {
          if (onDismissed != null) onDismissed!();
        },
        direction: direction,
        resizeDuration: resizeDuration,
        dismissThresholds: dismissThresholds,
        movementDuration: movementDuration,
        crossAxisEndOffset: crossAxisEndOffset,
        dragStartBehavior: dragStartBehavior,
        behavior: behavior,
        child: cardWidget,
      );
    }

    return Semantics(
      button: onTap != null,
      label: title ?? 'Card',
      hint: description,
      child: cardWidget,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:s_design/src/components/s_card/enums/s_card_shadow.dart';
import 'package:s_design/src/components/s_card/enums/s_card_shape.dart';

/// A highly customizable and versatile card widget for Flutter applications.
///
/// The [SCard] widget provides extensive customization options, including
/// shadow customization, shape customization, gradient and image backgrounds,
/// tappable interactions, and flexible content slots for headers, body, actions,
/// and footer.
///
/// Example usage:
/// ```dart
/// SCard(
///   title: 'Card Title',
///   description: 'This is a description of the card.',
///   body: Text('Here is the main content of the card.'),
///   actions: Row(
///     mainAxisAlignment: MainAxisAlignment.end,
///     children: [
///       TextButton(onPressed: () {}, child: Text('Cancel')),
///       ElevatedButton(onPressed: () {}, child: Text('Accept')),
///     ],
///   ),
///   footer: Text('Footer content'),
///   color: Colors.white,
///   borderRadius: 12,
///   shape: SCardShape.rounded,
///   shadowStyle: SCardShadow.subtle,
///   shadowColor: Colors.black26, // Optional: Customize shadow color
///   shadowOffset: Offset(0, 2),   // Optional: Customize shadow offset
///   isTappable: true,
///   onTap: () {
///     print('Card tapped!');
///   },
/// )
/// ```
class SCard extends StatelessWidget {
  /// The primary title text of the card.
  final String? title;

  /// The [TextStyle] for the [title].
  final TextStyle? titleStyle;

  /// The description text displayed below the [title].
  final String? description;

  /// The [TextStyle] for the [description].
  final TextStyle? descriptionStyle;

  /// A custom widget for the header section of the card.
  ///
  /// If provided, it overrides the [title] and [description].
  final Widget? header;

  /// The main content widget of the card.
  final Widget? body;

  /// The actions widget displayed at the bottom of the card.
  ///
  /// Typically used for buttons or interactive elements.
  final Widget? actions;

  /// The footer widget displayed below the [actions].
  final Widget? footer;

  /// The outer margin of the card.
  final EdgeInsetsGeometry? margin;

  /// The inner padding of the card.
  final EdgeInsetsGeometry? padding;

  /// The padding applied to the header section.
  final EdgeInsetsGeometry? headerPadding;

  /// The padding applied to the body section.
  final EdgeInsetsGeometry? bodyPadding;

  /// The padding applied to the actions section.
  final EdgeInsetsGeometry? actionsPadding;

  /// The padding applied to the footer section.
  final EdgeInsetsGeometry? footerPadding;

  /// The background color of the card.
  ///
  /// Ignored if [gradient] or [backgroundImage] is provided.
  final Color? color;

  /// The background gradient of the card.
  ///
  /// Overrides [color] if provided.
  final Gradient? gradient;

  /// The background image of the card.
  ///
  /// Overrides [gradient] and [color] if provided.
  final ImageProvider? backgroundImage;

  /// The shape of the card.
  ///
  /// Defaults to a rectangle with rounded corners if not specified.
  final SCardShape shape;

  /// The custom [ShapeBorder] provided by the user.
  ///
  /// Only effective if [shape] is set to [SCardShape.custom].
  final ShapeBorder? customShape;

  /// The shadow style of the card.
  ///
  /// Defaults to [SCardShadow.subtle].
  final SCardShadow shadowStyle;

  /// The custom [BoxShadow] provided by the user.
  ///
  /// Only effective if [shadowStyle] is set to [SCardShadow.custom].
  final BoxShadow? customShadow;

  /// The color of the card's border.
  final Color? borderColor;

  /// The radius of the card's corners.
  ///
  /// Ignored if [shape] is provided and not [SCardShape.rounded].
  final double? borderRadius;

  /// The color of the card's shadow.
  ///
  /// Only effective if [shadowStyle] is not [SCardShadow.custom].
  final Color? shadowColor;

  /// The offset of the card's shadow.
  ///
  /// Only effective if [shadowStyle] is not [SCardShadow.custom].
  final Offset? shadowOffset;

  /// Determines if the card is tappable.
  final bool isTappable;

  /// The callback invoked when the card is tapped.
  ///
  /// Only effective if [isTappable] is true.
  final VoidCallback? onTap;

  /// The fixed height of the card.
  final double? height;

  /// The fixed width of the card.
  final double? width;

  /// Creates an [SCard] widget.
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
    this.isTappable = false,
    this.onTap,
    this.height,
    this.width,
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
    // Build the header section
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

    // Build the body section
    Widget buildBody() {
      if (body == null) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding: bodyPadding ?? const EdgeInsets.all(16.0),
        child: body,
      );
    }

    // Build the actions section
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

    // Build the footer section
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

    // Determine ShapeBorder based on SCardShape
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

    // Determine BoxShadow based on SCardShadow
    List<BoxShadow> boxShadows;
    switch (shadowStyle) {
      case SCardShadow.none:
        boxShadows = [];
        break;
      case SCardShadow.subtle:
        boxShadows = [
          BoxShadow(
            color: shadowColor ?? Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: shadowOffset ?? const Offset(0, 2),
          ),
        ];
        break;
      case SCardShadow.moderate:
        boxShadows = [
          BoxShadow(
            color: shadowColor ?? Colors.black26,
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: shadowOffset ?? const Offset(0, 4),
          ),
        ];
        break;
      case SCardShadow.prominent:
        boxShadows = [
          BoxShadow(
            color: shadowColor ?? Colors.black38,
            blurRadius: 12.0,
            spreadRadius: 4.0,
            offset: shadowOffset ?? const Offset(0, 6),
          ),
        ];
        break;
      case SCardShadow.custom:
        boxShadows = [customShadow!];
        break;
    }

    // Combine BoxDecoration with gradient and image background
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
      boxShadow: boxShadows,
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

    // Make the card tappable if required
    if (isTappable && onTap != null) {
      cardContent = InkWell(
        onTap: onTap,
        borderRadius: effectiveShape is RoundedRectangleBorder ||
                effectiveShape is BeveledRectangleBorder
            ? (effectiveShape as dynamic).borderRadius as BorderRadius?
            : null,
        child: cardContent,
      );
    }

    // Apply semantics for accessibility
    return Semantics(
      button: isTappable && onTap != null,
      label: title ?? 'Card',
      hint: description,
      child: Container(
        margin: margin ?? const EdgeInsets.all(8),
        padding: padding ?? EdgeInsets.zero,
        height: height,
        width: width,
        decoration: decoration,
        child: cardContent,
      ),
    );
  }
}

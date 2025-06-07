import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'enums/s_card_shadow.dart';
import 'enums/s_card_shape.dart';

// A customizable card widget with support for content sections, styling, animations, dismissible behavior, and accessibility features.

// A customizable card widget with support for content sections, styling, animations, dismissible behavior, and accessibility features.
class SCard extends StatefulWidget {
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
    this.elevation = 1.0,
    this.height = 100,
    this.width,
    this.maxWidth,
    this.maxHeight,
    this.alignment,
    this.color = Colors.white,
    this.gradient,
    this.backgroundImage,
    this.backgroundFit = BoxFit.cover,
    this.backgroundBlendMode,
    this.shape = SCardShape.rounded,
    this.customShape,
    this.shadowStyle = SCardShadow.subtle,
    this.customShadow,
    this.dismissIcon,
    this.dismissSecondaryIcon,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = 12.0,
    this.shadowColor,
    this.shadowOffset,
    this.blurRadius,
    this.spreadRadius,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.onScroll,
    this.onDoubleTap,
    this.enableFeedback = true,
    this.enableInteractiveDismiss = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.animateOnLoad = false,
    this.hoverElevation = 4.0,
    this.hoverColor,
    this.tapScale = 0.95,
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
    this.dismissBackgroundColor,
    this.dismissSecondaryBackgroundColor,
    this.dismissBackgroundLabel,
    this.dismissSecondaryBackgroundLabel,
    this.dismissBackgroundLabelStyle,
    this.dismissSecondaryBackgroundLabelStyle,
    this.dismissBackgroundOpacity = 1.0,
    this.dismissBackgroundAnimationCurve = Curves.linear,
    this.dismissBackgroundPadding,
    this.dismissBackgroundAlignment,
    this.semanticLabel,
    this.semanticValue,
    this.semanticHint,
    this.semanticTooltip,
    this.semanticEnabled,
    this.semanticChecked,
    this.semanticSelected,
    this.semanticToggled,
    this.semanticButton,
    this.semanticHeader,
    this.semanticHeadingLevel,
    this.semanticTextField,
    this.semanticReadOnly,
    this.semanticFocusable,
    this.semanticFocused,
    this.semanticHidden,
    this.semanticImage,
    this.semanticLiveRegion,
    this.onTapHint,
    this.onLongPressHint,
    this.onScrollLeft,
    this.onScrollRight,
    this.onScrollUp,
    this.onScrollDown,
    this.onIncrease,
    this.onDecrease,
    this.onDismissSemantics,
    this.customSemanticsActions,
    this.textDirection,
    this.focusNode,
    this.canRequestFocus = true,
    this.isDraggable = false,
    this.scrollController,
    this.customBorder,
    this.clipBehavior = Clip.antiAlias,
    this.materialType = MaterialType.card,
    this.additionalShadows,
    this.colorBlendMode,
  })  : assert(
          !(gradient != null && backgroundImage != null),
          'Cannot provide both gradient and backgroundImage.',
        ),
        assert(
          shape != SCardShape.custom || customShape != null,
          'customShape must be provided when shape is SCardShape.custom.',
        ),
        assert(
          shadowStyle != SCardShadow.custom || customShadow != null,
          'customShadow must be provided when shadowStyle is SCardShadow.custom.',
        );

  // Core Content
  /// Title text displayed in the card's header.
  final String? title;

  /// Custom text style for the title.
  final TextStyle? titleStyle;

  /// Description text shown below the title in the header.
  final String? description;

  /// Custom text style for the description.
  final TextStyle? descriptionStyle;

  /// Custom widget for the card's header section.
  final Widget? header;

  /// Main content widget of the card.
  final Widget? body;

  /// Widget for action buttons or controls.
  final Widget? actions;

  /// Custom widget for the card's footer section.
  final Widget? footer;

  // Layout & Spacing
  /// Margin around the card.
  final EdgeInsetsGeometry? margin;

  /// Padding inside the card for all content.
  final EdgeInsetsGeometry? padding;

  /// Padding specifically for the header section.
  final EdgeInsetsGeometry? headerPadding;

  /// Padding specifically for the body section.
  final EdgeInsetsGeometry? bodyPadding;

  /// Padding specifically for the actions section.
  final EdgeInsetsGeometry? actionsPadding;

  /// Padding specifically for the footer section.
  final EdgeInsetsGeometry? footerPadding;

  /// Elevation for the card's shadow depth. Defaults to 1.0.
  final double? elevation;

  /// Fixed height of the card. Defaults to 100.
  final double? height;

  /// Fixed width of the card.
  final double? width;

  /// Maximum width constraint for the card.
  final double? maxWidth;

  /// Maximum height constraint for the card.
  final double? maxHeight;

  /// Alignment of the card's content.
  final AlignmentGeometry? alignment;

  // Appearance
  /// Background color of the card. Defaults to white.
  final Color? color;

  /// Gradient background for the card. Cannot be used with backgroundImage.
  final Gradient? gradient;

  /// Background image for the card. Cannot be used with gradient.
  final ImageProvider? backgroundImage;

  /// Fit style for the background image. Defaults to BoxFit.cover.
  final BoxFit? backgroundFit;

  /// Blend mode for the background image.
  final BlendMode? backgroundBlendMode;

  /// Shape style of the card (e.g., rounded, circular). Defaults to rounded.
  final SCardShape shape;

  /// Custom shape border when shape is SCardShape.custom.
  final ShapeBorder? customShape;

  /// Shadow style of the card (e.g., none, subtle). Defaults to subtle.
  final SCardShadow shadowStyle;

  /// Custom shadow when shadowStyle is SCardShadow.custom.
  final BoxShadow? customShadow;

  /// Color of the card's border.
  final Color? borderColor;

  /// Width of the card's border. Defaults to 1.0.
  final double? borderWidth;

  /// Radius for rounded corners when shape is rounded. Defaults to 12.0.
  final double? borderRadius;

  /// Color of the card's shadow.
  final Color? shadowColor;

  /// Offset for the card's shadow.
  final Offset? shadowOffset;

  /// Blur radius for the card's shadow.
  final double? blurRadius;

  /// Spread radius for the card's shadow.
  final double? spreadRadius;

  // Interactions
  /// Callback triggered on tap.
  final VoidCallback? onTap;

  /// Callback triggered on long press.
  final VoidCallback? onLongPress;

  /// Callback triggered on hover, passing hover state.
  final ValueChanged<bool>? onHover;

  /// Scroll physics for the card's content.
  final ScrollPhysics? onScroll;

  /// Callback triggered on double tap.
  final GestureTapCallback? onDoubleTap;

  /// Enables haptic and sound feedback for interactions. Defaults to true.
  final bool enableFeedback;

  /// Enables swipe-to-dismiss functionality. Defaults to true.
  final bool enableInteractiveDismiss;

  // Animation
  /// Duration of animations (e.g., scale, dismiss). Defaults to 200ms.
  final Duration? animationDuration;

  /// Curve for animations. Defaults to Curves.easeInOut.
  final Curve? animationCurve;

  /// Triggers animation when the card loads. Defaults to false.
  final bool animateOnLoad;

  /// Elevation when the card is hovered. Defaults to 4.0.
  final double? hoverElevation;

  /// Background color when the card is hovered.
  final Color? hoverColor;

  /// Scale factor when the card is tapped. Defaults to 0.95.
  final double? tapScale;

  // Dismissible Properties
  /// Unique key for dismissible functionality.
  final Key? dismissKey;

  /// Custom background widget for dismissible (end-to-start swipe).
  final Widget? dismissBackground;

  /// Custom secondary background widget for dismissible (start-to-end swipe).
  final Widget? dismissSecondaryBackground;

  /// Callback to confirm dismiss action.
  final Future<bool?> Function(DismissDirection)? confirmDismiss;

  /// Callback triggered when the card is dismissed.
  final void Function(DismissDirection)? onDismissed;

  /// Direction for dismissible swipe (e.g., horizontal, vertical). Defaults to horizontal.
  final DismissDirection direction;

  /// Duration for resizing during dismiss animation. Defaults to 300ms.
  final Duration resizeDuration;

  /// Thresholds for dismiss sensitivity by direction. Defaults to empty map.
  final Map<DismissDirection, double> dismissThresholds;

  /// Duration for dismiss movement animation. Defaults to 200ms.
  final Duration movementDuration;

  /// Offset for cross-axis movement during dismiss. Defaults to 0.0.
  final double crossAxisEndOffset;

  /// Behavior for starting drag gestures. Defaults to DragStartBehavior.start.
  final DragStartBehavior dragStartBehavior;

  /// Hit test behavior for interactions. Defaults to HitTestBehavior.opaque.
  final HitTestBehavior behavior;

  /// Icon for the dismissible background (end-to-start swipe).
  final IconData? dismissIcon;

  /// Icon for the secondary dismissible background (start-to-end swipe).
  final IconData? dismissSecondaryIcon;

  // Dismissible Background Customization
  /// Background color for dismissible (end-to-start swipe). Defaults to red.
  final Color? dismissBackgroundColor;

  /// Background color for secondary dismissible (start-to-end swipe). Defaults to green.
  final Color? dismissSecondaryBackgroundColor;

  /// Label text for dismissible background (end-to-start swipe). Defaults to 'Delete'.
  final String? dismissBackgroundLabel;

  /// Label text for secondary dismissible background (start-to-end swipe). Defaults to 'Confirm'.
  final String? dismissSecondaryBackgroundLabel;

  /// Text style for dismissible background label.
  final TextStyle? dismissBackgroundLabelStyle;

  /// Text style for secondary dismissible background label.
  final TextStyle? dismissSecondaryBackgroundLabelStyle;

  /// Opacity for dismissible background. Defaults to 1.0.
  final double? dismissBackgroundOpacity;

  /// Animation curve for dismissible background. Defaults to Curves.linear.
  final Curve? dismissBackgroundAnimationCurve;

  /// Padding for dismissible background.
  final EdgeInsetsGeometry? dismissBackgroundPadding;

  /// Alignment for dismissible background content.
  final AlignmentGeometry? dismissBackgroundAlignment;

  // Advanced Features
  /// Enables drag-and-drop functionality. Defaults to false.
  final bool isDraggable;

  /// Controller for scrolling behavior.
  final ScrollController? scrollController;

  /// Custom border for the card.
  final Border? customBorder;

  /// Clipping behavior for the card's content. Defaults to Clip.antiAlias.
  final Clip clipBehavior;

  /// Material type for the card (e.g., card, canvas). Defaults to MaterialType.card.
  final MaterialType materialType;

  /// Additional shadows for the card.
  final List<BoxShadow>? additionalShadows;

  /// Blend mode for the card's color.
  final BlendMode? colorBlendMode;

  // Enhanced Semantics Properties
  /// Semantic label for accessibility, typically the title.
  final String? semanticLabel;

  /// Semantic value for accessibility.
  final String? semanticValue;

  /// Semantic hint for accessibility, typically the description.
  final String? semanticHint;

  /// Semantic tooltip for accessibility.
  final String? semanticTooltip;

  /// Indicates if the card is enabled for accessibility. Defaults to true if onTap is set.
  final bool? semanticEnabled;

  /// Indicates if the card is checked for accessibility.
  final bool? semanticChecked;

  /// Indicates if the card is selected for accessibility.
  final bool? semanticSelected;

  /// Indicates if the card is toggled for accessibility.
  final bool? semanticToggled;

  /// Indicates if the card is a button for accessibility. Defaults to true if onTap is set.
  final bool? semanticButton;

  /// Indicates if the card is a header for accessibility.
  final bool? semanticHeader;

  /// Heading level for accessibility (e.g., 1 to 6).
  final int? semanticHeadingLevel;

  /// Indicates if the card is a text field for accessibility.
  final bool? semanticTextField;

  /// Indicates if the card is read-only for accessibility.
  final bool? semanticReadOnly;

  /// Indicates if the card is focusable for accessibility. Defaults to true.
  final bool? semanticFocusable;

  /// Indicates if the card is focused for accessibility.
  final bool? semanticFocused;

  /// Indicates if the card is hidden for accessibility.
  final bool? semanticHidden;

  /// Indicates if the card is an image for accessibility.
  final bool? semanticImage;

  /// Indicates if the card is a live region for accessibility.
  final bool? semanticLiveRegion;

  /// Hint for tap action for accessibility. Defaults to 'Tap to interact'.
  final String? onTapHint;

  /// Hint for long press action for accessibility.
  final String? onLongPressHint;

  /// Callback for scrolling left.
  final VoidCallback? onScrollLeft;

  /// Callback for scrolling right.
  final VoidCallback? onScrollRight;

  /// Callback for scrolling up.
  final VoidCallback? onScrollUp;

  /// Callback for scrolling down.
  final VoidCallback? onScrollDown;

  /// Callback for increasing a value.
  final VoidCallback? onIncrease;

  /// Callback for decreasing a value.
  final VoidCallback? onDecrease;

  /// Callback for dismiss action for accessibility.
  final VoidCallback? onDismissSemantics;

  /// Custom semantic actions for accessibility.
  final Map<CustomSemanticsAction, VoidCallback>? customSemanticsActions;

  /// Text direction for content (e.g., left-to-right, right-to-left).
  final TextDirection? textDirection;

  /// Focus node for managing focus.
  final FocusNode? focusNode;

  /// Determines if the card can request focus. Defaults to true.
  final bool canRequestFocus;

  @override
  State<SCard> createState() => _SCardState();
}

class _SCardState extends State<SCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  // bool _isHovered = false;
  // double _currentElevation = 0;
  double _dismissProgress = 0.0;
  DismissDirection _currentSwipeDirection = DismissDirection.none;

  @override
  void initState() {
    super.initState();
    // _currentElevation = widget.elevation ?? 1.0;
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.tapScale).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.animationCurve ?? Curves.easeInOut,
      ),
    );

    if (widget.animateOnLoad) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSection(Widget? content, EdgeInsetsGeometry? padding) {
    if (content == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: content,
    );
  }

  List<BoxShadow> _getShadows() {
    final List<BoxShadow> shadows = <BoxShadow>[];
    if (widget.shadowStyle != SCardShadow.none) {
      shadows.add(
        widget.customShadow ??
            BoxShadow(
              color: widget.shadowColor ?? Colors.grey.withOpacity(0.2),
              offset: widget.shadowOffset ?? const Offset(0, 2),
              blurRadius: widget.blurRadius ?? 4.0,
              spreadRadius: widget.spreadRadius ?? 0.0,
            ),
      );
    }
    if (widget.additionalShadows != null) {
      shadows.addAll(widget.additionalShadows!);
    }
    return shadows;
  }

  Widget _buildDismissBackground(DismissDirection direction) {
    // Use provided backgrounds if available
    if (widget.dismissBackground != null &&
        direction == DismissDirection.endToStart) {
      return widget.dismissBackground!;
    }
    if (widget.dismissSecondaryBackground != null &&
        direction == DismissDirection.startToEnd) {
      return widget.dismissSecondaryBackground!;
    }

    // Default background properties
    final Color backgroundColor = (direction == DismissDirection.endToStart
            ? widget.dismissBackgroundColor
            : widget.dismissSecondaryBackgroundColor) ??
        (direction == DismissDirection.endToStart ? Colors.red : Colors.green);
    final IconData icon = (direction == DismissDirection.endToStart
            ? widget.dismissIcon
            : widget.dismissSecondaryIcon) ??
        (direction == DismissDirection.endToStart
            ? Icons.delete
            : Icons.check_circle);
    final String label = (direction == DismissDirection.endToStart
            ? widget.dismissBackgroundLabel
            : widget.dismissSecondaryBackgroundLabel) ??
        (direction == DismissDirection.endToStart ? 'Delete' : 'Confirm');
    final TextStyle labelStyle = (direction == DismissDirection.endToStart
            ? widget.dismissBackgroundLabelStyle
            : widget.dismissSecondaryBackgroundLabelStyle) ??
        const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        );
    // Alignment alignment = widget.dismissBackgroundAlignment
    //         ?.resolve(Directionality.of(context)) ??
    //     (direction == DismissDirection.endToStart
    //         ? Alignment.centerRight
    //         : Alignment.centerLeft);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: widget.shape == SCardShape.rounded
            ? BorderRadius.circular(widget.borderRadius ?? 12.0)
            : null,
      ),
      padding: widget.dismissBackgroundPadding,
      alignment: direction == DismissDirection.endToStart
          ? Alignment.centerLeft
          : Alignment.centerRight,
      // Ensure the container takes the full height of the card
      constraints: BoxConstraints(
        minHeight: widget.height ?? 0,
        maxHeight: widget.maxHeight ?? double.infinity,
      ),
      child: Row(
        mainAxisAlignment: direction == DismissDirection.endToStart
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: <Widget>[
          if (direction == DismissDirection.startToEnd) ...<Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 32.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: labelStyle,
            ),
          ],
          if (direction == DismissDirection.endToStart) ...<Widget>[
            Text(
              label,
              style: labelStyle,
            ),
            const SizedBox(width: 8.0),
            Icon(
              icon,
              color: Colors.white,
              size: 32.0,
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Header content
    final Widget headerContent = _buildSection(
      widget.header ??
          (widget.title != null || widget.description != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (widget.title != null)
                      Text(
                        widget.title!,
                        style: widget.titleStyle ??
                            theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                      ),
                    if (widget.description != null) ...<Widget>[
                      const SizedBox(height: 8),
                      Text(
                        widget.description!,
                        style: widget.descriptionStyle ??
                            theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ],
                )
              : null),
      widget.headerPadding,
    );

    // Card content without SingleChildScrollView
    Widget cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        headerContent,
        _buildSection(widget.body, widget.bodyPadding),
        _buildSection(widget.actions, widget.actionsPadding),
        _buildSection(widget.footer, widget.footerPadding),
      ],
    );

    // Apply maxWidth and maxHeight constraints if provided
    cardContent = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.maxWidth ?? double.infinity,
        maxHeight: widget.maxHeight ?? double.infinity,
      ),
      child: cardContent,
    );

    // Decoration
    final BoxDecoration decoration = BoxDecoration(
      color: widget.color,
      gradient: widget.gradient,
      image: widget.backgroundImage != null
          ? DecorationImage(
              image: widget.backgroundImage!,
              fit: widget.backgroundFit,
              colorFilter: widget.backgroundBlendMode != null
                  ? ColorFilter.mode(Colors.black, widget.backgroundBlendMode!)
                  : null,
            )
          : null,
      border: widget.customBorder ??
          Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth ?? 1.0,
          ),
      borderRadius: widget.shape == SCardShape.rounded
          ? BorderRadius.circular(widget.borderRadius ?? 12.0)
          : null,
      boxShadow: _getShadows(),
    );

    // Interactive wrapper
    final Widget interactiveContent = Material(
      type: widget.materialType,
      color: Colors.transparent,
      clipBehavior: widget.clipBehavior,
      child: InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onDoubleTap,
        onHover: widget.onHover,
        splashColor:
            widget.hoverColor ?? theme.colorScheme.primary.withOpacity(0.1),
        highlightColor: Colors.transparent,
        hoverColor: widget.hoverColor?.withOpacity(0.05),
        enableFeedback: widget.enableFeedback,
        child: cardContent,
      ),
    );

    // Animation wrapper
    final Widget animatedContent = AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: interactiveContent,
    );

    // Base card widget
    Widget cardWidget = Container(
      margin: widget.margin ?? const EdgeInsets.all(8.0),
      padding: widget.padding ?? EdgeInsets.zero,
      width: widget.width,
      decoration: decoration,
      alignment: widget.alignment,
      child: animatedContent,
    );

    // Dismissible wrapper
    if (widget.dismissKey != null && widget.enableInteractiveDismiss) {
      cardWidget = Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: (widget.dismissBackgroundOpacity ?? 1.0) *
                  _dismissProgress.clamp(0.0, 1.0),
              duration: widget.movementDuration,
              curve: widget.dismissBackgroundAnimationCurve ?? Curves.linear,
              child: _buildDismissBackground(_currentSwipeDirection),
            ),
          ),
          Dismissible(
            key: widget.dismissKey!,
            confirmDismiss: widget.confirmDismiss,
            onDismissed: widget.onDismissed,
            direction: widget.direction,
            resizeDuration: widget.resizeDuration,
            dismissThresholds: widget.dismissThresholds,
            movementDuration: widget.movementDuration,
            crossAxisEndOffset: widget.crossAxisEndOffset,
            dragStartBehavior: widget.dragStartBehavior,
            behavior: widget.behavior,
            onUpdate: (DismissUpdateDetails details) {
              setState(() {
                _dismissProgress = details.progress;
                _currentSwipeDirection = details.direction;
                if (widget.direction == DismissDirection.horizontal) {
                  _currentSwipeDirection = details.reached
                      ? DismissDirection.startToEnd
                      : DismissDirection.endToStart;
                }
              });
            },
            child: cardWidget,
          ),
        ],
      );
    }

    // Draggable wrapper
    if (widget.isDraggable) {
      cardWidget = Draggable<SCard>(
        data: widget,
        feedback: Material(
          elevation: widget.hoverElevation ?? 4.0,
          child: cardWidget,
        ),
        childWhenDragging: Opacity(
          opacity: 0.5,
          child: cardWidget,
        ),
        child: cardWidget,
      );
    }

    return Focus(
      focusNode: widget.focusNode,
      canRequestFocus: widget.canRequestFocus,
      child: Semantics(
        container: true,
        label: widget.semanticLabel ?? widget.title,
        value: widget.semanticValue,
        hint: widget.semanticHint ?? widget.description,
        tooltip: widget.semanticTooltip,
        enabled: widget.semanticEnabled ?? (widget.onTap != null),
        checked: widget.semanticChecked,
        selected: widget.semanticSelected,
        toggled: widget.semanticToggled,
        button: widget.semanticButton ?? (widget.onTap != null),
        header: widget.semanticHeader,
        headingLevel: widget.semanticHeadingLevel,
        textField: widget.semanticTextField,
        readOnly: widget.semanticReadOnly,
        focusable: widget.semanticFocusable ?? widget.canRequestFocus,
        focused: widget.semanticFocused,
        hidden: widget.semanticHidden,
        image: widget.semanticImage,
        liveRegion: widget.semanticLiveRegion,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onTapHint: widget.onTapHint ?? 'Tap to interact',
        onLongPressHint: widget.onLongPressHint,
        onScrollLeft: widget.onScrollLeft,
        onScrollRight: widget.onScrollRight,
        onScrollUp: widget.onScrollUp,
        onScrollDown: widget.onScrollDown,
        onIncrease: widget.onIncrease,
        onDecrease: widget.onDecrease,
        onDismiss: widget.onDismissSemantics,
        customSemanticsActions: widget.customSemanticsActions,
        textDirection: widget.textDirection,
        child: cardWidget,
      ),
    );
  }
}

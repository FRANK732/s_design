import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:s_design/src/components/s_card/enums/s_card_shadow.dart';
import 'package:s_design/src/components/s_card/enums/s_card_shape.dart';

class SCard extends StatefulWidget {
  // Core Content
  final String? title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  final Widget? header;
  final Widget? body;
  final Widget? actions;
  final Widget? footer;

  // Layout & Spacing
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? bodyPadding;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? footerPadding;
  final double? elevation;
  final double? height;
  final double? width;
  final double? maxWidth;
  final double? maxHeight;
  final AlignmentGeometry? alignment;

  // Appearance
  final Color? color;
  final Gradient? gradient;
  final ImageProvider? backgroundImage;
  final BoxFit? backgroundFit;
  final BlendMode? backgroundBlendMode;
  final SCardShape shape;
  final ShapeBorder? customShape;
  final SCardShadow shadowStyle;
  final BoxShadow? customShadow;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double? blurRadius;
  final double? spreadRadius;

  // Interactions
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ScrollPhysics? onScroll;
  final GestureTapCallback? onDoubleTap;
  final bool enableFeedback;
  final bool enableInteractiveDismiss;

  // Animation
  final Duration? animationDuration;
  final Curve? animationCurve;
  final bool animateOnLoad;
  final double? hoverElevation;
  final Color? hoverColor;
  final double? tapScale;

  // Dismissible Properties
  final Key? dismissKey;
  final Widget? dismissBackground;
  final Widget? dismissSecondaryBackground;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Function(DismissDirection)? onDismissed;
  final DismissDirection direction;
  final Duration resizeDuration;
  final Map<DismissDirection, double> dismissThresholds;
  final Duration movementDuration;
  final double crossAxisEndOffset;
  final DragStartBehavior dragStartBehavior;
  final HitTestBehavior behavior;
  final IconData? dismissIcon;
  final IconData? dismissSecondaryIcon;

  // Dismissible Background Customization
  final Color? dismissBackgroundColor;
  final Color? dismissSecondaryBackgroundColor;
  final String? dismissBackgroundLabel;
  final String? dismissSecondaryBackgroundLabel;
  final TextStyle? dismissBackgroundLabelStyle;
  final TextStyle? dismissSecondaryBackgroundLabelStyle;
  final double? dismissBackgroundOpacity;
  final Curve? dismissBackgroundAnimationCurve;
  final EdgeInsetsGeometry? dismissBackgroundPadding;
  final AlignmentGeometry? dismissBackgroundAlignment;

  // Advanced Features
  final bool isDraggable;
  final ScrollController? scrollController;
  final Border? customBorder;
  final Clip clipBehavior;
  final MaterialType materialType;
  final List<BoxShadow>? additionalShadows;
  final BlendMode? colorBlendMode;

  // Enhanced Semantics Properties
  final String? semanticLabel;
  final String? semanticValue;
  final String? semanticHint;
  final String? semanticTooltip;
  final bool? semanticEnabled;
  final bool? semanticChecked;
  final bool? semanticSelected;
  final bool? semanticToggled;
  final bool? semanticButton;
  final bool? semanticHeader;
  final int? semanticHeadingLevel;
  final bool? semanticTextField;
  final bool? semanticReadOnly;
  final bool? semanticFocusable;
  final bool? semanticFocused;
  final bool? semanticHidden;
  final bool? semanticImage;
  final bool? semanticLiveRegion;
  final String? onTapHint;
  final String? onLongPressHint;
  final VoidCallback? onScrollLeft;
  final VoidCallback? onScrollRight;
  final VoidCallback? onScrollUp;
  final VoidCallback? onScrollDown;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onDismissSemantics;
  final Map<CustomSemanticsAction, VoidCallback>? customSemanticsActions;
  final TextDirection? textDirection;
  final FocusNode? focusNode;
  final bool canRequestFocus;

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

  @override
  State<SCard> createState() => _SCardState();
}

class _SCardState extends State<SCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;
  double _currentElevation = 0;
  double _dismissProgress = 0.0;
  DismissDirection _currentSwipeDirection = DismissDirection.none;

  @override
  void initState() {
    super.initState();
    _currentElevation = widget.elevation ?? 1.0;
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: widget.tapScale).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve ?? Curves.easeInOut,
    ));

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
    if (content == null) return const SizedBox.shrink();
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: content,
    );
  }

  ShapeBorder _getEffectiveShape() {
    switch (widget.shape) {
      case SCardShape.rounded:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
        );
      case SCardShape.circular:
        return const CircleBorder();
      case SCardShape.beveled:
        return BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
        );
      case SCardShape.custom:
        return widget.customShape!;
    }
  }

  List<BoxShadow> _getShadows() {
    List<BoxShadow> shadows = [];
    if (widget.shadowStyle != SCardShadow.none) {
      shadows.add(widget.customShadow ??
          BoxShadow(
            color: widget.shadowColor ?? Colors.grey.withOpacity(0.2),
            offset: widget.shadowOffset ?? const Offset(0, 2),
            blurRadius: widget.blurRadius ?? 4.0,
            spreadRadius: widget.spreadRadius ?? 0.0,
          ));
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
    Color backgroundColor = (direction == DismissDirection.endToStart
            ? widget.dismissBackgroundColor
            : widget.dismissSecondaryBackgroundColor) ??
        (direction == DismissDirection.endToStart ? Colors.red : Colors.green);
    IconData icon = (direction == DismissDirection.endToStart
            ? widget.dismissIcon
            : widget.dismissSecondaryIcon) ??
        (direction == DismissDirection.endToStart
            ? Icons.delete
            : Icons.check_circle);
    String label = (direction == DismissDirection.endToStart
            ? widget.dismissBackgroundLabel
            : widget.dismissSecondaryBackgroundLabel) ??
        (direction == DismissDirection.endToStart ? 'Delete' : 'Confirm');
    TextStyle labelStyle = (direction == DismissDirection.endToStart
            ? widget.dismissBackgroundLabelStyle
            : widget.dismissSecondaryBackgroundLabelStyle) ??
        const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        );
    Alignment alignment = widget.dismissBackgroundAlignment
            ?.resolve(Directionality.of(context)) ??
        (direction == DismissDirection.endToStart
            ? Alignment.centerRight
            : Alignment.centerLeft);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: widget.shape == SCardShape.rounded
            ? BorderRadius.circular(widget.borderRadius ?? 12.0)
            : null,
      ),
      padding: widget.dismissBackgroundPadding ??
          const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: alignment,
      child: Row(
        mainAxisAlignment: direction == DismissDirection.endToStart
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (direction == DismissDirection.startToEnd) ...[
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
          if (direction == DismissDirection.endToStart) ...[
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
    final theme = Theme.of(context);

    // Header content
    final headerContent = _buildSection(
      widget.header ??
          (widget.title != null || widget.description != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.title != null)
                      Text(
                        widget.title!,
                        style: widget.titleStyle ??
                            theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    if (widget.description != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        widget.description!,
                        style: widget.descriptionStyle ??
                            theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodyMedium?.color
                                  ?.withOpacity(0.7),
                            ),
                      ),
                    ],
                  ],
                )
              : null),
      widget.headerPadding,
    );

    // Card content
    Widget cardContent = SingleChildScrollView(
      controller: widget.scrollController,
      physics: widget.onScroll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          headerContent,
          _buildSection(widget.body, widget.bodyPadding),
          _buildSection(widget.actions, widget.actionsPadding),
          _buildSection(widget.footer, widget.footerPadding),
        ],
      ),
    );

    // Apply maxWidth constraint if provided
    if (widget.maxWidth != null) {
      cardContent = ConstrainedBox(
        constraints: BoxConstraints(maxWidth: widget.maxWidth!),
        child: cardContent,
      );
    }

    // Decoration
    final decoration = BoxDecoration(
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
    Widget interactiveContent = Material(
      type: widget.materialType,
      color: Colors.transparent,
      clipBehavior: widget.clipBehavior,
      child: InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onDoubleTap: widget.onDoubleTap,
        onHover: (hovered) {
          setState(() {
            _isHovered = hovered;
            _currentElevation = hovered
                ? (widget.hoverElevation ?? 4.0)
                : (widget.elevation ?? 1.0);
          });
          widget.onHover?.call(hovered);
        },
        splashColor:
            widget.hoverColor ?? theme.colorScheme.primary.withOpacity(0.1),
        highlightColor: Colors.transparent,
        hoverColor: widget.hoverColor?.withOpacity(0.05),
        enableFeedback: widget.enableFeedback,
        child: cardContent,
      ),
    );

    // Animation wrapper
    Widget animatedContent = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
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
      height: widget.height,
      decoration: decoration,
      alignment: widget.alignment,
      child: animatedContent,
    );

    // Apply maxHeight constraint if provided
    if (widget.maxHeight != null) {
      cardWidget = ConstrainedBox(
        constraints: BoxConstraints(maxHeight: widget.maxHeight!),
        child: cardWidget,
      );
    }

    // Dismissible wrapper using Stack
    if (widget.dismissKey != null && widget.enableInteractiveDismiss) {
      cardWidget = Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough, // Let Dismissible dictate size
        children: [
          // Background layer
          AnimatedOpacity(
            opacity: (widget.dismissBackgroundOpacity ?? 1.0) *
                _dismissProgress.clamp(0.0, 1.0),
            duration: widget.movementDuration,
            curve: widget.dismissBackgroundAnimationCurve ?? Curves.linear,
            child: _buildDismissBackground(_currentSwipeDirection),
          ),
          // Dismissible card
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
            onUpdate: (details) {
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
      cardWidget = Draggable(
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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

import 'dart:ui'; // For BackdropFilter
import 'package:flutter/semantics.dart';

/// Variants involved in the visual style of [SCard].
enum SCardVariant {
  /// Default elevated card with shadow.
  elevated,

  /// Flat card with a solid background color (usually surface container).
  filled,

  /// Transparent card with a visible border.
  outlined,

  /// Glassmorphism style with blur and semi-transparency.
  frosted,

  /// No border, no shadow.
  borderless,
}

/// Position of the media widget within [SCard].
enum SCardImagePosition {
  start,
  end,
  top,
  bottom,
}

/// Position of the badge widget on [SCard].
enum SCardBadgePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

/// A customizable card widget with support for content sections, styling, animations, dismissible behavior, and accessibility features.
///
/// Enhanced with "Future-Ready" features: Variants, Horizontal Layout, Media Slots, and Badges.
class SCard
    extends StatefulWidget {
  const SCard({
    super.key,
    this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
    this.header,
    this.headerTrailing,
    this.body,
    this.actions,
    this.footer,
    this.margin,
    this.padding,
    this.headerPadding,
    this.bodyPadding,
    this.actionsPadding,
    this.footerPadding,
    this.elevation,
    this.height,
    this.width,
    this.maxWidth,
    this.maxHeight,
    this.alignment,
    this.color,
    this.gradient,
    this.backgroundImage,
    this.backgroundFit =
        BoxFit.cover,
    this.backgroundBlendMode,
    this.shape =
        SCardShape.rounded,
    this.customShape,
    this.shadowStyle =
        SCardShadow.subtle,
    this.customShadow,
    this.dismissIcon,
    this.dismissSecondaryIcon,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shadowColor,
    this.shadowOffset,
    this.blurRadius,
    this.spreadRadius,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.onScroll,
    this.onDoubleTap,
    this.enableFeedback =
        true,
    this.enableInteractiveDismiss =
        true,
    this.animationDuration =
        const Duration(milliseconds: 200),
    this.animationCurve =
        Curves.easeInOut,
    this.animateOnLoad =
        false,
    this.hoverElevation =
        4.0,
    this.hoverColor,
    this.tapScale =
        0.95,
    this.dismissKey,
    this.dismissBackground,
    this.dismissSecondaryBackground,
    this.confirmDismiss,
    this.onDismissed,
    this.direction =
        DismissDirection.horizontal,
    this.resizeDuration =
        const Duration(milliseconds: 300),
    this.dismissThresholds =
        const <DismissDirection, double>{},
    this.movementDuration =
        const Duration(milliseconds: 200),
    this.crossAxisEndOffset =
        0.0,
    this.dragStartBehavior =
        DragStartBehavior.start,
    this.behavior =
        HitTestBehavior.opaque,
    this.dismissBackgroundColor,
    this.dismissSecondaryBackgroundColor,
    this.dismissBackgroundLabel,
    this.dismissSecondaryBackgroundLabel,
    this.dismissBackgroundLabelStyle,
    this.dismissSecondaryBackgroundLabelStyle,
    this.dismissBackgroundOpacity =
        1.0,
    this.dismissBackgroundAnimationCurve =
        Curves.linear,
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
    this.canRequestFocus =
        true,
    this.isDraggable =
        false,
    this.scrollController,
    this.customBorder,
    this.clipBehavior =
        Clip.antiAlias,
    this.materialType =
        MaterialType.card,
    this.additionalShadows,
    this.colorBlendMode,
    this.showDivider =
        false,
    this.dividerColor,
    this.isLoading =
        false,
    this.isSelected =
        false,
    this.selectionColor,
    this.onSelectionChanged,
    this.variant =
        SCardVariant.elevated,
    this.axis =
        Axis.vertical,
    this.media,
    this.mediaHeight,
    this.mediaWidth,
    this.mediaPosition =
        SCardImagePosition.top,
    this.badge,
    this.badgePosition =
        SCardBadgePosition.topRight,
    this.badgeOffset,
    this.hoverable =
        false,
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

  /// Whether the card can be hovered to lift up.
  final bool
      hoverable;

  // Core Content
  final String?
      title;
  final TextStyle?
      titleStyle;
  final String?
      description;
  final TextStyle?
      descriptionStyle;
  final Widget?
      header;
  final Widget?
      headerTrailing;
  final Widget?
      body;
  final Widget?
      actions;
  final Widget?
      footer;

  // Layout & Spacing
  final EdgeInsetsGeometry?
      margin;
  final EdgeInsetsGeometry?
      padding;
  final EdgeInsetsGeometry?
      headerPadding;
  final EdgeInsetsGeometry?
      bodyPadding;
  final EdgeInsetsGeometry?
      actionsPadding;
  final EdgeInsetsGeometry?
      footerPadding;
  final double?
      elevation;
  final double?
      height;
  final double?
      width;
  final double?
      maxWidth;
  final double?
      maxHeight;
  final AlignmentGeometry?
      alignment;

  // Appearance
  final Color?
      color;
  final Gradient?
      gradient;
  final ImageProvider?
      backgroundImage;
  final BoxFit?
      backgroundFit;
  final BlendMode?
      backgroundBlendMode;
  final SCardShape
      shape;
  final ShapeBorder?
      customShape;
  final SCardShadow
      shadowStyle;
  final BoxShadow?
      customShadow;
  final Color?
      borderColor;
  final double?
      borderWidth;
  final double?
      borderRadius;
  final Color?
      shadowColor;
  final Offset?
      shadowOffset;
  final double?
      blurRadius;
  final double?
      spreadRadius;

  // Interactions
  final VoidCallback?
      onTap;
  final VoidCallback?
      onLongPress;
  final ValueChanged<bool>?
      onHover;
  final ScrollPhysics?
      onScroll;
  final GestureTapCallback?
      onDoubleTap;
  final bool
      enableFeedback;
  final bool
      enableInteractiveDismiss;

  // Animation
  final Duration?
      animationDuration;
  final Curve?
      animationCurve;
  final bool
      animateOnLoad;
  final double?
      hoverElevation;
  final Color?
      hoverColor;
  final double?
      tapScale;

  // Dismissible Properties
  final Key?
      dismissKey;
  final Widget?
      dismissBackground;
  final Widget?
      dismissSecondaryBackground;
  final Future<bool?>
          Function(DismissDirection)?
      confirmDismiss;
  final void
          Function(DismissDirection)?
      onDismissed;
  final DismissDirection
      direction;
  final Duration
      resizeDuration;
  final Map<
      DismissDirection,
      double> dismissThresholds;
  final Duration
      movementDuration;
  final double
      crossAxisEndOffset;
  final DragStartBehavior
      dragStartBehavior;
  final HitTestBehavior
      behavior;
  final IconData?
      dismissIcon;
  final IconData?
      dismissSecondaryIcon;
  final Color?
      dismissBackgroundColor;
  final Color?
      dismissSecondaryBackgroundColor;
  final String?
      dismissBackgroundLabel;
  final String?
      dismissSecondaryBackgroundLabel;
  final TextStyle?
      dismissBackgroundLabelStyle;
  final TextStyle?
      dismissSecondaryBackgroundLabelStyle;
  final double?
      dismissBackgroundOpacity;
  final Curve?
      dismissBackgroundAnimationCurve;
  final EdgeInsetsGeometry?
      dismissBackgroundPadding;
  final AlignmentGeometry?
      dismissBackgroundAlignment;

  // Advanced Features
  final bool
      isDraggable;
  final ScrollController?
      scrollController;
  final Border?
      customBorder;
  final Clip
      clipBehavior;
  final MaterialType
      materialType;
  final List<BoxShadow>?
      additionalShadows;
  final BlendMode?
      colorBlendMode;

  // Semantics
  final String?
      semanticLabel;
  final String?
      semanticValue;
  final String?
      semanticHint;
  final String?
      semanticTooltip;
  final bool?
      semanticEnabled;
  final bool?
      semanticChecked;
  final bool?
      semanticSelected;
  final bool?
      semanticToggled;
  final bool?
      semanticButton;
  final bool?
      semanticHeader;
  final int?
      semanticHeadingLevel;
  final bool?
      semanticTextField;
  final bool?
      semanticReadOnly;
  final bool?
      semanticFocusable;
  final bool?
      semanticFocused;
  final bool?
      semanticHidden;
  final bool?
      semanticImage;
  final bool?
      semanticLiveRegion;
  final String?
      onTapHint;
  final String?
      onLongPressHint;
  final VoidCallback?
      onScrollLeft;
  final VoidCallback?
      onScrollRight;
  final VoidCallback?
      onScrollUp;
  final VoidCallback?
      onScrollDown;
  final VoidCallback?
      onIncrease;
  final VoidCallback?
      onDecrease;
  final VoidCallback?
      onDismissSemantics;
  final Map<
      CustomSemanticsAction,
      VoidCallback>? customSemanticsActions;
  final TextDirection?
      textDirection;
  final FocusNode?
      focusNode;
  final bool
      canRequestFocus;

  // Wave 17 Features
  final bool
      showDivider;
  final Color?
      dividerColor;
  final bool
      isLoading;
  final bool
      isSelected;
  final Color?
      selectionColor;
  final ValueChanged<bool>?
      onSelectionChanged;

  // Wave 18 Advanced Features
  /// The visual style variant of the card (elevated, filled, outlined, frosted).
  final SCardVariant
      variant;

  /// The layout axis of the card (vertical or horizontal).
  final Axis
      axis;

  /// Dedicated slot for hero media (image/video).
  final Widget?
      media;

  /// Fixed height for the media slot.
  final double?
      mediaHeight;

  /// Fixed width for the media slot.
  final double?
      mediaWidth;

  /// Position of the media relative to content.
  final SCardImagePosition
      mediaPosition;

  /// Badge widget overlaid on the card.
  final Widget?
      badge;

  /// Position of the badge.
  final SCardBadgePosition
      badgePosition;

  /// Custom offset for the badge.
  final Offset?
      badgeOffset;

  @override
  State<SCard>
      createState() =>
          _SCardState();
}

class _SCardState
    extends State<
        SCard>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _controller;
  late Animation<double>
      _scaleAnimation;
  bool
      _isHovering =
      false;

  @override
  void
      initState() {
    super
        .initState();
    _controller = AnimationController(
        vsync: this,
        duration: widget.animationDuration ?? const Duration(milliseconds: 200));
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: widget.tapScale ?? 0.95).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.animationCurve ?? Curves.easeInOut,
      ),
    );

    if (widget
        .animateOnLoad) {
      _controller.forward();
    }
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  Widget _buildSection(
      Widget?
          content,
      EdgeInsetsGeometry?
          padding) {
    if (content ==
        null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding:
          padding ?? const EdgeInsets.all(16.0),
      child:
          content,
    );
  }

  List<BoxShadow>
      _getShadows(SCardThemeData theme) {
    // No shadows for filled or outlined variants unless explicitly requested?
    // Actually, usually filled/outlined have no shadow. Elevated has shadow.
    if (!widget.hoverable &&
        (widget.variant == SCardVariant.filled || widget.variant == SCardVariant.outlined || widget.variant == SCardVariant.frosted || widget.variant == SCardVariant.borderless)) {
      return widget.additionalShadows ??
          [];
    }

    // Borderless/Filled/Outlined usually don't have shadow unless hovered?
    // Borderless = No border, no shadow.
    // Outlined = Border, no shadow.
    // Hoverable = Adds shadow on hover.

    final List<BoxShadow>
        shadows =
        <BoxShadow>[];

    // If hovering, show shadow even if variant usually doesn't have it (if hoverable is true)
    // Actually Card only lifts if hoverable is true.
    final bool
        showShadow =
        (widget.shadowStyle != SCardShadow.none && widget.variant == SCardVariant.elevated) || (widget.hoverable && _isHovering);

    if (showShadow &&
        !widget.isLoading) {
      shadows.add(
        widget.customShadow ??
            BoxShadow(
              color: widget.shadowColor ?? theme.shadowColor,
              offset: widget.shadowOffset ?? const Offset(0, 2),
              blurRadius: _isHovering && widget.hoverable ? (widget.hoverElevation ?? 8.0) : (widget.blurRadius ?? 4.0),
              spreadRadius: widget.spreadRadius ?? 0.0,
            ),
      );
    }
    if (widget.additionalShadows !=
        null) {
      shadows.addAll(widget.additionalShadows!);
    }
    return shadows;
  }

  Widget _buildDivider(
      SCardThemeData
          theme) {
    if (!widget
        .showDivider)
      return const SizedBox.shrink();
    return Divider(
      height:
          1,
      thickness:
          1,
      color:
          widget.dividerColor ?? theme.dividerColor,
    );
  }

  Widget
      _buildLoader() {
    return Padding(
      padding:
          const EdgeInsets.all(16.0),
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 16, width: 150, color: Colors.grey.shade200),
                    const SizedBox(height: 8),
                    Container(height: 12, width: 100, color: Colors.grey.shade200),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(height: 12, width: double.infinity, color: Colors.grey.shade200),
          const SizedBox(height: 8),
          Container(height: 12, width: double.infinity, color: Colors.grey.shade200),
          const SizedBox(height: 8),
          Container(height: 12, width: 200, color: Colors.grey.shade200),
        ],
      ),
    );
  }

  Color _resolveBackgroundColor(
      SCardThemeData
          theme) {
    if (widget
        .isSelected) {
      return widget.selectionColor?.withOpacity(0.1) ??
          theme.selectedBackgroundColor ??
          theme.backgroundColor;
    }
    if (widget.color !=
        null)
      return widget.color!;

    switch (
        widget.variant) {
      case SCardVariant.filled:
        return theme.filledColor ?? theme.backgroundColor;
      case SCardVariant.outlined:
        return Colors.transparent; // Outlined usually transparent bg
      case SCardVariant.frosted:
        // For frosted, we return a semi-transparent color base
        return theme.backgroundColor.withOpacity(theme.frostedOpacity);
      case SCardVariant.elevated:
        return theme.backgroundColor;
      case SCardVariant.borderless:
        return theme.backgroundColor; // Or transparent? Uses background for standard cards even if borderless
    }
  }

  Color _resolveBorderColor(
      SCardThemeData
          theme) {
    if (widget
        .isSelected) {
      return widget.selectionColor ??
          theme.selectedBorderColor ??
          theme.borderColor;
    }
    if (widget.borderColor !=
        null)
      return widget.borderColor!;

    switch (
        widget.variant) {
      case SCardVariant.outlined:
        return theme.outlinedBorderColor ?? theme.borderColor;
      case SCardVariant.filled:
      case SCardVariant.elevated:
      case SCardVariant.frosted:
        // Usually no border for these, or standard subtle border
        // Usually no border for these, or standard subtle border
        return Colors.transparent;
      case SCardVariant.borderless:
        return Colors.transparent;
    }
  }

  Widget _buildContent(
      BuildContext
          context,
      SCardThemeData
          theme) {
    // 1. Organize main content chunks
    final headerWidget = (widget.header != null || widget.title != null || widget.headerTrailing != null)
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: widget.headerPadding ?? const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: widget.header ??
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (widget.title != null) Text(widget.title!, style: widget.titleStyle ?? Theme.of(context).textTheme.titleMedium),
                              if (widget.description != null) ...<Widget>[
                                const SizedBox(height: 4),
                                Text(widget.description!, style: widget.descriptionStyle ?? Theme.of(context).textTheme.bodySmall),
                              ],
                            ],
                          ),
                    ),
                    if (widget.headerTrailing != null) ...[
                      const SizedBox(width: 8),
                      widget.headerTrailing!,
                    ],
                  ],
                ),
              ),
              _buildDivider(theme),
            ],
          )
        : null;

    final bodyWidget = widget.body != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(widget.body, widget.bodyPadding),
              if (widget.footer != null || widget.actions != null) _buildDivider(theme),
            ],
          )
        : null;

    final actionsWidget = widget.actions != null
        ? _buildSection(widget.actions, widget.actionsPadding)
        : null;

    final footerWidget = widget.footer != null
        ? _buildSection(widget.footer, widget.footerPadding)
        : null;

    // 2. Arrange in List for rendering
    final List<Widget>
        children =
        [
      if (headerWidget !=
          null)
        headerWidget,
      if (bodyWidget !=
          null)
        (widget.axis == Axis.vertical) ? Flexible(child: bodyWidget) : Expanded(child: bodyWidget), // Expanded for Row
      if (actionsWidget !=
          null)
        actionsWidget,
      if (footerWidget !=
          null)
        footerWidget,
    ];

    // 3. Assemble Layout based on Axis
    Widget
        mainContent;
    if (widget.axis ==
        Axis.vertical) {
      mainContent =
          Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      // Horizontal Layout
      // Ideally header, actions, footer might behave differently in horizontal.
      // For now, we stack them horizontally? Or keep them as a block?
      // A common pattern for horizontal card: Image (Left) | Content (Right)
      // Content (Right) is a Column of Header, Body, Footer.
      mainContent = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children);
    }

    // 4. Incorporate Media
    if (widget.media !=
        null) {
      // Media Layout
      if (widget.axis ==
          Axis.vertical) {
        // Vertical: Media usually at Top or Bottom
        if (widget.mediaPosition == SCardImagePosition.bottom) {
          mainContent = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(child: mainContent),
              _buildMedia(theme)
            ],
          );
        } else {
          // Default to Top
          mainContent = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMedia(theme),
              Flexible(child: mainContent)
            ],
          );
        }
      } else {
        // Horizontal: Media at Start or End
        // We wrap mainContent in Expanded to fill space next to image
        if (widget.mediaPosition == SCardImagePosition.end) {
          mainContent = Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: mainContent),
              _buildMedia(theme)
            ],
          );
        } else {
          // Default to Start
          mainContent = Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMedia(theme),
              Expanded(child: mainContent)
            ],
          );
        }
      }
    }

    return mainContent;
  }

  Widget _buildMedia(
      SCardThemeData
          theme) {
    // Determine dimensions
    // In vertical layout, width is usually full, height is fixed or content based.
    // In horizontal layout, width is fixed, height is full.
    final double? w = widget.axis == Axis.horizontal
        ? widget.mediaWidth ?? 120.0
        : null;
    final double? h = widget.axis == Axis.vertical
        ? widget.mediaHeight ?? 150.0
        : null;

    // Determine BorderRadius for clipping
    // The media needs to match the card's corners on the side it touches
    final double
        r =
        widget.borderRadius ?? theme.borderRadius;
    BorderRadius
        mediaRadius =
        BorderRadius.zero;

    if (widget.axis ==
        Axis.vertical) {
      if (widget.mediaPosition ==
          SCardImagePosition.top) {
        mediaRadius = BorderRadius.vertical(top: Radius.circular(r));
      } else if (widget.mediaPosition == SCardImagePosition.bottom) {
        mediaRadius = BorderRadius.vertical(bottom: Radius.circular(r));
      }
    } else {
      if (widget.mediaPosition == SCardImagePosition.start ||
          widget.mediaPosition == SCardImagePosition.top) {
        // treating top as start for horizontal
        mediaRadius = BorderRadius.horizontal(left: Radius.circular(r));
      } else {
        mediaRadius = BorderRadius.horizontal(right: Radius.circular(r));
      }
    }

    return ClipRRect(
      borderRadius:
          mediaRadius,
      child:
          SizedBox(
        width: w,
        height: h,
        child: widget.media,
      ),
    );
  }

  Widget _buildBadge(
      Widget
          child) {
    if (widget.badge ==
        null)
      return child;

    // Default positioning
    double?
        top,
        bottom,
        left,
        right;
    final Offset
        offset =
        widget.badgeOffset ?? const Offset(0, 0);

    /*
    enum SCardBadgePosition {
      topLeft,
      topRight,
      bottomLeft,
      bottomRight,
    }
    */
    switch (
        widget.badgePosition) {
      case SCardBadgePosition.topLeft:
        top = 12 + offset.dy;
        left = 12 + offset.dx;
        break;
      case SCardBadgePosition.topRight:
        top = 12 + offset.dy;
        right = 12 + offset.dx;
        break;
      case SCardBadgePosition.bottomLeft:
        bottom = 12 + offset.dy;
        left = 12 + offset.dx;
        break;
      case SCardBadgePosition.bottomRight:
        bottom = 12 + offset.dy;
        right = 12 + offset.dx;
        break;
    }

    return Stack(
      clipBehavior:
          Clip.none,
      children: [
        child,
        Positioned(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
          child: widget.badge!,
        ),
      ],
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SCardThemeData
        theme =
        Theme.of(context).sCardTheme;

    final Color
        backgroundColor =
        _resolveBackgroundColor(theme);
    final Color
        borderColor =
        _resolveBorderColor(theme);
    final double
        borderWidth =
        widget.borderWidth ?? (widget.isSelected ? 2.0 : 1.0);
    final double
        borderRadius =
        widget.borderRadius ?? theme.borderRadius;

    Widget
        card =
        Container(
      width:
          widget.width,
      height:
          widget.height,
      constraints:
          BoxConstraints(
        maxWidth: widget.maxWidth ?? double.infinity,
        maxHeight: widget.maxHeight ?? double.infinity,
      ),
      margin:
          widget.margin,
      decoration:
          BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        boxShadow: _getShadows(theme),
        gradient: widget.gradient,
        image: widget.backgroundImage != null
            ? DecorationImage(
                image: widget.backgroundImage!,
                fit: widget.backgroundFit,
                colorFilter: widget.backgroundBlendMode != null ? ColorFilter.mode(backgroundColor, widget.backgroundBlendMode!) : null,
              )
            : null,
      ),
      child:
          Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: widget.isLoading
              ? null
              : () {
                  widget.onTap?.call();
                  if (widget.onSelectionChanged != null) {
                    widget.onSelectionChanged!(!widget.isSelected);
                  }
                },
          onLongPress: widget.isLoading ? null : widget.onLongPress,
          onDoubleTap: widget.isLoading ? null : widget.onDoubleTap,
          onHover: (value) {
            if (widget.hoverable) {
              setState(() => _isHovering = value);
            }
            widget.onHover?.call(value);
          },
          borderRadius: BorderRadius.circular(borderRadius),
          child: _buildContent(context, theme),
        ),
      ),
    );

    // Frosted Glass Effect
    if (widget.variant ==
        SCardVariant.frosted) {
      card =
          ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: theme.frostedBlur,
            sigmaY: theme.frostedBlur,
          ),
          child: card,
        ),
      );
    }

    // Badge Overlay
    card =
        _buildBadge(card);

    // Selection/Interaction Handling (Scale)
    if (widget.tapScale != null &&
        widget.onTap != null) {
      card =
          ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTapDown: (_) => _controller.forward(),
          onTapUp: (_) => _controller.reverse(),
          onTapCancel: () => _controller.reverse(),
          child: card,
        ),
      );
    }

    // Loading Overlay
    if (widget
        .isLoading) {
      card =
          Stack(
        children: [
          card,
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: _buildLoader(),
            ),
          ),
        ],
      );
    }

    return card;
  }
}

class SCardMeta
    extends StatelessWidget {
  const SCardMeta({
    super.key,
    this.avatar,
    this.title,
    this.description,
  });

  final Widget?
      avatar;
  final Widget?
      title;
  final Widget?
      description;

  @override
  Widget build(
      BuildContext
          context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        if (avatar != null) ...[
          avatar!,
          const SizedBox(width: 16),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  child: title!,
                ),
              if (description != null) ...[
                if (title != null) const SizedBox(height: 8),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade600),
                  child: description!,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class SCardGrid
    extends StatelessWidget {
  const SCardGrid({
    super.key,
    required this.children,
    this.crossAxisCount =
        3,
    this.childAspectRatio =
        1.0,
    this.mainAxisSpacing =
        0.0,
    this.crossAxisSpacing =
        0.0,
    this.padding,
  });

  final List<Widget>
      children;
  final int
      crossAxisCount;
  final double
      childAspectRatio;
  final double
      mainAxisSpacing;
  final double
      crossAxisSpacing;
  final EdgeInsetsGeometry?
      padding;

  @override
  Widget build(
      BuildContext
          context) {
    // SCardGrid usually renders a grid of Cards with specific styling (often borderless inside grid)
    // Grid Card is actually just a Grid where each cell is a Card.
    // We can use GridView for this.
    return GridView
        .count(
      shrinkWrap:
          true,
      physics:
          const NeverScrollableScrollPhysics(),
      crossAxisCount:
          crossAxisCount,
      childAspectRatio:
          childAspectRatio,
      mainAxisSpacing:
          mainAxisSpacing,
      crossAxisSpacing:
          crossAxisSpacing,
      padding:
          padding,
      children:
          children,
    );
  }
}

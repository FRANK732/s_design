import 'package:flutter/material.dart';
import '../../../../../s_design.dart';
import 'paints/add_notes.dart';
import 'paints/arrow_pointer.dart';
import 'paints/empty_notification.dart';
import 'paints/failed_server_paint.dart';
import 'paints/no_calender.dart';
import 'paints/no_data_paint.dart';
import 'paints/server_down_paint.dart';

/// A highly customizable component for displaying application states
/// (e.g., empty, error, server down) with dynamic illustrations and entrance animations.
class SAppState extends StatefulWidget {
  /// The variant determining which predefined illustration to show.
  final SAppStateVariant variant;

  /// Optional title text. If [titleWidget] is provided, this is ignored.
  final String? title;

  /// Optional description text. If [descriptionWidget] is provided, this is ignored.
  final String? description;

  /// A custom widget to use as the title, overriding [title].
  final Widget? titleWidget;

  /// A custom widget to use as the description, overriding [description].
  final Widget? descriptionWidget;

  /// A custom illustration to use when [variant] is [SAppStateVariant.custom].
  final Widget? customIllustration;

  /// The size of the illustration.
  final Size? illustrationSize;

  /// Optional list of action buttons (e.g., Retry, Go Back).
  final List<Widget>? actions;

  /// Padding around the entire state widget.
  final EdgeInsetsGeometry? padding;

  /// Vertical spacing between the illustration, title, description, and actions.
  final double? elementSpacing;

  /// Main axis alignment of the elements.
  final MainAxisAlignment? mainAxisAlignment;

  /// Cross axis alignment of the elements.
  final CrossAxisAlignment? crossAxisAlignment;

  /// Whether to show an entrance animation.
  final bool animate;

  /// Creates a default [SAppState] displaying the provided [variant].
  const SAppState({
    super.key,
    this.variant = SAppStateVariant.noData,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.customIllustration,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  });

  /// Variant for 'Add Notes' state.
  const SAppState.addNotes({
    super.key,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  })  : variant = SAppStateVariant.addNotes,
        customIllustration = null;

  /// Variant for 'Arrow Pointer' state.
  const SAppState.arrowPointer({
    super.key,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  })  : variant = SAppStateVariant.arrowPointer,
        customIllustration = null;

  /// Variant for 'Empty Notification' state.
  const SAppState.emptyNotification({
    super.key,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  })  : variant = SAppStateVariant.emptyNotification,
        customIllustration = null;

  /// Variant for 'Failed Server' state.
  const SAppState.failedServer({
    super.key,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  })  : variant = SAppStateVariant.failedServer,
        customIllustration = null;

  /// Variant for 'No Calendar' state.
  const SAppState.noCalendar({
    super.key,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  })  : variant = SAppStateVariant.noCalendar,
        customIllustration = null;

  /// Variant for 'No Data' state.
  const SAppState.noData({
    super.key,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  })  : variant = SAppStateVariant.noData,
        customIllustration = null;

  /// Variant for 'Under Construction' state.
  const SAppState.underConstruction({
    super.key,
    this.title,
    this.description,
    this.titleWidget,
    this.descriptionWidget,
    this.illustrationSize,
    this.actions,
    this.padding,
    this.elementSpacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.animate = true,
  })  : variant = SAppStateVariant.underConstruction,
        customIllustration = null;

  @override
  State<SAppState> createState() => _SAppStateState();
}

class _SAppStateState extends State<SAppState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
    ));

    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(SAppState oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !oldWidget.animate) {
      _controller.forward();
    } else if (!widget.animate && oldWidget.animate) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIllustration(BuildContext context, SAppStateThemeData theme) {
    if (widget.variant == SAppStateVariant.custom &&
        widget.customIllustration != null) {
      return widget.customIllustration!;
    }

    final Color primaryColor = theme.illustrationColor;

    CustomPainter? painter;
    switch (widget.variant) {
      case SAppStateVariant.addNotes:
        painter = AddNotesPainter(primaryColor: primaryColor);
        break;
      case SAppStateVariant.arrowPointer:
        painter = ArrowPainter(primaryColor: primaryColor);
        break;
      case SAppStateVariant.emptyNotification:
        painter = EmptyNotificationPainter(primaryColor: primaryColor);
        break;
      case SAppStateVariant.failedServer:
        painter = WrongServerPainter(primaryColor: primaryColor);
        break;
      case SAppStateVariant.noCalendar:
        painter = NoCalenderPainter(primaryColor: primaryColor);
        break;
      case SAppStateVariant.noData:
        painter = NoDataPainter(primaryColor: primaryColor);
        break;
      case SAppStateVariant.underConstruction:
        painter = UnderConstructionPainter(primaryColor: primaryColor);
        break;
      case SAppStateVariant.custom:
        break;
    }

    return CustomPaint(
      size: widget.illustrationSize ?? theme.illustrationSize,
      painter: painter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final SAppStateThemeData theme = Theme.of(context).sAppStateTheme;

    final EdgeInsetsGeometry resolvedPadding =
        widget.padding ?? theme.padding;

    Widget? resolvedTitle = widget.titleWidget;
    if (resolvedTitle == null && widget.title != null) {
      resolvedTitle = Text(
        widget.title!,
        style: theme.titleStyle,
        textAlign: TextAlign.center,
      );
    }

    Widget? resolvedDescription = widget.descriptionWidget;
    if (resolvedDescription == null && widget.description != null) {
      resolvedDescription = Text(
        widget.description!,
        style: theme.descriptionStyle,
        textAlign: TextAlign.center,
      );
    }

    final double effectiveElementSpacing =
        widget.elementSpacing ?? theme.elementSpacing;

    return Padding(
      padding: resolvedPadding,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: widget.mainAxisAlignment ?? theme.mainAxisAlignment,
              crossAxisAlignment: widget.crossAxisAlignment ?? theme.crossAxisAlignment,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildIllustration(context, theme),
                if (resolvedTitle != null) ...[
                  SizedBox(height: effectiveElementSpacing),
                  resolvedTitle,
                ],
                if (resolvedDescription != null) ...[
                  SizedBox(
                      height: resolvedTitle != null
                          ? SDimensions.small
                          : effectiveElementSpacing),
                  resolvedDescription,
                ],
                if (widget.actions != null && widget.actions!.isNotEmpty) ...[
                  SizedBox(height: effectiveElementSpacing),
                  Wrap(
                    spacing: SDimensions.medium,
                    runSpacing: SDimensions.medium,
                    alignment: WrapAlignment.center,
                    children: widget.actions!,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

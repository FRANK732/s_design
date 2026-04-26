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
/// (e.g., empty, error, server down) with dynamic illustrations.
class SAppState
    extends StatelessWidget {
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
  })  : variant = SAppStateVariant.underConstruction,
        customIllustration = null;

  /// The variant determining which predefined illustration to show.
  final SAppStateVariant
      variant;

  /// Optional title text. If [titleWidget] is provided, this is ignored.
  final String?
      title;

  /// Optional description text. If [descriptionWidget] is provided, this is ignored.
  final String?
      description;

  /// A custom widget to use as the title, overriding [title].
  final Widget?
      titleWidget;

  /// A custom widget to use as the description, overriding [description].
  final Widget?
      descriptionWidget;

  /// A custom illustration to use when [variant] is [SAppStateVariant.custom].
  final Widget?
      customIllustration;

  /// The size of the illustration.
  final Size?
      illustrationSize;

  /// Optional list of action buttons (e.g., Retry, Go Back).
  final List<Widget>?
      actions;

  /// Padding around the entire state widget.
  final EdgeInsetsGeometry?
      padding;

  /// Vertical spacing between the illustration, title, description, and actions.
  final double?
      elementSpacing;

  /// Main axis alignment of the elements.
  final MainAxisAlignment?
      mainAxisAlignment;

  /// Cross axis alignment of the elements.
  final CrossAxisAlignment?
      crossAxisAlignment;

  /// Returns the appropriate painter or custom illustration for the current variant.
  Widget _buildIllustration(
      BuildContext
          context, SAppStateThemeData theme) {
    if (variant == SAppStateVariant.custom &&
        customIllustration != null) {
      return customIllustration!;
    }

    final Color
        primaryColor =
        theme.illustrationColor;

    CustomPainter?
        painter;
    switch (
        variant) {
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
        // Handled above. Fallback to an empty box.
        break;
    }

    return CustomPaint(
      size:
          illustrationSize ?? theme.illustrationSize,
      painter:
          painter,
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SAppStateThemeData
        theme =
        Theme.of(context).sAppStateTheme;

    final EdgeInsetsGeometry
        resolvedPadding =
        padding ?? theme.padding;

    Widget?
        resolvedTitle =
        titleWidget;
    if (resolvedTitle == null &&
        title != null) {
      resolvedTitle =
          Text(
        title!,
        style: theme.titleStyle,
        textAlign: TextAlign.center,
      );
    }

    Widget?
        resolvedDescription =
        descriptionWidget;
    if (resolvedDescription == null &&
        description != null) {
      resolvedDescription =
          Text(
        description!,
        style: theme.descriptionStyle,
        textAlign: TextAlign.center,
      );
    }

    final double effectiveElementSpacing = elementSpacing ?? theme.elementSpacing;

    return Padding(
      padding:
          resolvedPadding,
      child:
          Center(
        child: Column(
          mainAxisAlignment: mainAxisAlignment ?? theme.mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment ?? theme.crossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildIllustration(context, theme),
            if (resolvedTitle != null) ...[
              SizedBox(height: effectiveElementSpacing),
              resolvedTitle,
            ],
            if (resolvedDescription != null) ...[
              SizedBox(height: resolvedTitle != null ? SDimensions.small : effectiveElementSpacing),
              resolvedDescription,
            ],
            if (actions != null && actions!.isNotEmpty) ...[
              SizedBox(height: effectiveElementSpacing),
              Wrap(
                spacing: SDimensions.medium,
                runSpacing: SDimensions.medium,
                alignment: WrapAlignment.center,
                children: actions!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_dialog/enums/s_dialog_type.dart';
import 'package:s_design/src/widgets/s_dialog/themes/s_dialog_theme.dart';
import 'package:s_design/src/widgets/s_dialog/utils/s_dialog_utils.dart';

/// A comprehensive Dialog Widget that encapsulates triggering, overlay, content,
/// header, footer, title, description, and close actions.
class SDialog extends StatelessWidget {
  /// The widget that triggers the dialog when interacted with.
  final Widget trigger;

  /// The type of the dialog, determining its icon and default texts.
  final SDialogType type;

  /// The title text of the dialog. If not provided, a default title based on [type] is used.
  final String? title;

  /// The description text of the dialog. If not provided, a default description based on [type] is used.
  final String? description;

  /// The main content of the dialog.
  final Widget? content;

  /// The list of action widgets (e.g., buttons) displayed in the footer.
  final List<Widget>? actions;

  /// Whether tapping outside the dialog dismisses it.
  final bool barrierDismissible;

  /// The color of the modal barrier.
  final Color barrierColor;

  /// The duration of the dialog's entrance and exit animations.
  final Duration transitionDuration;

  /// The shape of the dialog's content container.
  final BoxShape? shape;

  /// The background color of the dialog.
  final Color? backgroundColor;

  /// The padding inside the dialog's content container.
  final EdgeInsetsGeometry? contentPadding;

  /// Creates an [SDialog] widget.
  const SDialog({
    super.key,
    required this.trigger,
    this.type = SDialogType.alert,
    this.title,
    this.description,
    this.content,
    this.actions,
    this.barrierDismissible = true,
    this.barrierColor = Colors.black54,
    this.transitionDuration = const Duration(milliseconds: 200),
    this.shape,
    this.backgroundColor,
    this.contentPadding,
  });

  /// Displays the dialog.
  void _showDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return _SDialogContent(
          type: type,
          title: title,
          description: description,
          content: content,
          actions: actions,
          backgroundColor: backgroundColor,
          shape: shape,
          contentPadding: contentPadding,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return FadeTransition(
          opacity: curvedAnimation,
          child: ScaleTransition(
            scale: curvedAnimation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: trigger,
    );
  }
}

/// Internal widget that represents the dialog's content.
class _SDialogContent extends StatelessWidget {
  final SDialogType type;
  final String? title;
  final String? description;
  final Widget? content;
  final List<Widget>? actions;
  final BoxShape? shape;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  const _SDialogContent({
    required this.type,
    this.title,
    this.description,
    this.content,
    this.actions,
    this.shape,
    this.backgroundColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    // To handle responsiveness, constrain the dialog's width based on screen size.
    final maxWidth = MediaQuery.of(context).size.width * 0.9;
    final maxHeight = MediaQuery.of(context).size.height * 0.9;

    // Retrieve theme data
    final SDialogThemeData theme = Theme.of(context).sDialogTheme;

    // Determine effective colors
    final Color effectiveBackgroundColor =
        backgroundColor ?? theme.backgroundColor;
    final Color effectiveTitleColor = theme.titleColor;
    final Color effectiveDescriptionColor = theme.descriptionColor;
    final Color effectiveActionTextColor = theme.actionTextColor;

    // Determine dialog title and description
    final String dialogTitle =
        title ?? SDialogUtils.getDefaultTitleForDialogType(type);
    final String dialogDescription =
        description ?? SDialogUtils.getDefaultDescriptionForDialogType(type);

    // Determine icon based on dialog type
    final IconData dialogIcon = SDialogUtils.getIconForDialogType(type);

    return Center(
      child: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth > 600 ? 600 : maxWidth,
            maxHeight: maxHeight,
          ),
          child: Container(
            padding: contentPadding ?? const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: effectiveBackgroundColor,
              borderRadius: BorderRadius.circular(12.0),
              shape: shape ?? BoxShape.rectangle,
              border: shape != null
                  ? null
                  : Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close button positioned at the top-right corner.
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      tooltip: 'Close',
                    ),
                  ),
                  // Icon based on dialog type
                  if (type != SDialogType.custom) ...[
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        dialogIcon,
                        size: 40.0,
                        color: effectiveTitleColor,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                  // Title
                  Text(
                    dialogTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: effectiveTitleColor,
                        ),
                  ),
                  if (dialogDescription.isNotEmpty) ...[
                    const SizedBox(height: 8.0),
                    Text(
                      dialogDescription,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 14.0,
                            color: effectiveDescriptionColor,
                          ),
                    ),
                  ],
                  if (content != null) ...[
                    const SizedBox(height: 20.0),
                    // Content
                    content!,
                  ],
                  if (actions != null && actions!.isNotEmpty) ...[
                    const SizedBox(height: 20.0),
                    // Actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions!
                          .map(
                            (action) => Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  color: effectiveActionTextColor,
                                  fontSize: 14.0,
                                ),
                                child: action,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SSelectTrigger
    extends StatelessWidget {
  const SSelectTrigger({
    super.key,
    required this.text,
    this.placeholder,
    this.disabled =
        false,
    this.onPressed,
    this.style,
    this.icon,
    this.width,
  });

  /// The text to display (selected item label).
  final String?
      text;

  /// Placeholder text when [text] is null.
  final String?
      placeholder;

  /// Whether the trigger is disabled.
  final bool
      disabled;

  /// Callback when triggered.
  final VoidCallback?
      onPressed;

  /// Custom button style.
  final ButtonStyle?
      style;

  /// Custom icon (default is arrow_drop_down).
  final Widget?
      icon;

  /// Optional width.
  final double?
      width;

  @override
  Widget build(
      BuildContext
          context) {
    final String displayText = text ??
        placeholder ??
        'Select an option';
    final bool
        isPlaceholder =
        text == null;

    return OutlinedButton(
      onPressed: disabled
          ? null
          : onPressed,
      style: style ??
          OutlinedButton.styleFrom(
            minimumSize: Size(width ?? 200, 48),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
      child:
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              displayText,
              style: isPlaceholder ? TextStyle(color: Theme.of(context).hintColor) : null,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          icon ?? const Icon(Icons.keyboard_arrow_down, size: 24),
        ],
      ),
    );
  }
}

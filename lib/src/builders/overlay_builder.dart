import 'package:flutter/material.dart';

/// A function that returns a [Widget Function(BuildContext, Widget?)],
/// used for the [builder] property of your app.
/// Pass in any [OverlayEntry] they want to show above [child].
Widget Function(BuildContext, Widget?) sOverlayBuilder({
  required List<OverlayEntry> overlays,
}) {
  return (BuildContext context, Widget? child) {
    return Stack(
      children: [
        child ?? const SizedBox.shrink(),
        Overlay(
          initialEntries: overlays,
        ),
      ],
    );
  };
}

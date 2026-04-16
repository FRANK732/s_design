import 'package:flutter/material.dart';

/// A function that returns a builder function for the app.
/// This is typically used for the builder property of a [MaterialApp].
/// Pass in any [OverlayEntry] to show widgets above the main app child.
Widget Function(
    BuildContext,
    Widget?) sOverlayBuilder({
  required List<OverlayEntry>
      overlays,
}) {
  return (BuildContext
          context,
      Widget?
          child) {
    return Stack(
      children: <Widget>[
        child ?? const SizedBox.shrink(),
        Overlay(
          initialEntries: overlays,
        ),
      ],
    );
  };
}

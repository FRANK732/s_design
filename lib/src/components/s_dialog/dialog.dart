import 'package:flutter/material.dart';

class SDialog {
  final String? title;
  final String? description;
  final Widget? content;
  final List<Widget>? actions;
  final bool barrierDismissible;
  final Color barrierColor;
  final Duration transitionDuration;
  final ShapeDecoration? shapeDecoration;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? semanticLabel;

  const SDialog({
    this.title,
    this.description,
    this.content,
    this.actions,
    this.barrierDismissible = true,
    this.barrierColor = Colors.black54,
    this.transitionDuration = const Duration(milliseconds: 200),
    this.shapeDecoration,
    this.backgroundColor,
    this.contentPadding,
    this.semanticLabel,
  });
}

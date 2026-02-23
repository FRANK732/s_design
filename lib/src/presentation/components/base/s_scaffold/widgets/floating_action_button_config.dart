import 'package:flutter/material.dart';

class FloatingActionButtonConfig {
  const FloatingActionButtonConfig({
    this.floatingActionButton,
    this.location,
    this.animator,
  });
  final Widget?
      floatingActionButton;
  final FloatingActionButtonLocation?
      location;
  final FloatingActionButtonAnimator?
      animator;
}

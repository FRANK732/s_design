import 'package:flutter/material.dart';

/// Status of a step.
enum SStepStatus {
  wait,
  process,
  finish,
  error,
}

/// A single step item in [SSteps].
class SStepItem {
  const SStepItem({
    required this.title,
    this.subTitle,
    this.description,
    this.icon,
    this.status,
    this.disabled =
        false,
  });

  /// The title of the step.
  final Widget
      title;

  /// The subtitle of the step.
  final Widget?
      subTitle;

  /// The description of the step.
  final Widget?
      description;

  /// Custom icon for the step.
  final Widget?
      icon;

  /// Status of the step.
  /// If null, it will be determined by the current step index.
  final SStepStatus?
      status;

  /// Whether the step is disabled.
  final bool
      disabled;
}

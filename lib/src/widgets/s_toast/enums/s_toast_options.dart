import 'package:flutter/material.dart';

/// Represents the properties of a toast message.
class SToastOptions {
  /// The message to be displayed in the toast.
  final String message;

  /// The duration for which the toast is visible.
  final Duration duration;

  /// The type of the toast, which determines its styling.
  final SToastType type; // Info, Success, Error, Warning

  /// The position where the toast will appear on the screen.
  final SToastPosition position;

  /// Creates an instance of [SToastOptions].
  const SToastOptions({
    required this.message,
    this.duration = const Duration(seconds: 3),
    this.type = SToastType.info,
    this.position = SToastPosition.bottom,
  });
}

/// Enumeration of possible toast types.
enum SToastType { info, success, error, warning }

/// Enumeration of possible toast positions.
enum SToastPosition { top, center, bottom }

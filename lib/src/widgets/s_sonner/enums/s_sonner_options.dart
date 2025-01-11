/// Represents the properties of a toast message.
class SToastOptions {
  /// The message to be displayed in the toast.
  final String message;

  /// The duration for which the toast is visible.
  final Duration duration;

  /// The type of the toast, which determines its styling.
  final SSonnerType type; // Info, Success, Error, Warning

  /// The position where the toast will appear on the screen.
  final SSonnerPosition position;

  /// Creates an instance of [SToastOptions].
  const SToastOptions({
    required this.message,
    this.duration = const Duration(seconds: 3),
    this.type = SSonnerType.info,
    this.position = SSonnerPosition.bottom,
  });
}

/// Enumeration of possible toast types.
enum SSonnerType { info, success, error, warning }

enum SSonnerSize { sm, md, lg }

/// Enumeration of possible toast positions.
enum SSonnerPosition { top, center, bottom }

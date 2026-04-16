/// Size of [STimePicker] trigger field.
enum STimePickerSize {
  /// 40 px tall field.
  large,

  /// 32 px tall field (default).
  middle,

  /// 24 px tall field.
  small,
}

/// Visual variant for the [STimePicker] border/background style.
enum STimePickerVariant {
  /// Visible border, transparent background (default "outlined").
  outlined,

  /// No border, coloured background fill.
  filled,

  /// No border, no fill.
  borderless,

  /// Bottom border only.
  underlined,
}

/// Validation status overlay applied to the trigger field.
enum STimePickerStatus {
  /// Normal, no status (default).
  none,

  /// Red border - indicates validation error.
  error,

  /// Yellow/orange border - indicates a warning.
  warning,
}

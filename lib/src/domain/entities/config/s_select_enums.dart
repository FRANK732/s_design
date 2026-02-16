/// Mode of the SSelect component.
enum SSelectMode {
  /// Default single selection mode.
  single,

  /// Multiple selection mode.
  multiple,

  /// Tags mode (multiple selection with arbitrary values).
  tags,
}

/// Size of the SSelect component.
enum SSelectSize {
  /// Small size (24px height).
  small,

  /// Middle size (32px height) - Default.
  middle,

  /// Large size (40px height).
  large,
}

/// Validation status of the SSelect component.
enum SSelectStatus {
  /// No validation status.
  none,

  /// Error status (red border).
  error,

  /// Warning status (yellow/orange border).
  warning,
}

/// Visual variant of the SSelect component.
enum SSelectVariant {
  /// Outlined border (Default).
  outlined,

  /// No border.
  borderless,

  /// Filled background with underline (Material style, but adapted).
  filled,
}

/// Direction in which the dropdown opens.
enum SSelectDropdownDirection {
  /// Dropdown opens downwards.
  down,

  /// Dropdown opens upwards.
  up,
}

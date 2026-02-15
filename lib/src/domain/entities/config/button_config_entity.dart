/// Domain entity representing button configuration.
///
/// This is a pure data model with no dependencies on Flutter or presentation concerns.
/// Following clean architecture, this entity lives in the domain layer.
/// Domain entity representing button configuration.
///
/// This is a pure data model with no dependencies on Flutter or presentation concerns.
/// Following clean architecture, this entity lives in the domain layer.
class SButtonConfig {
  const SButtonConfig({
    required this.variant,
    required this.size,
    this.state,
    this.isLoading =
        false,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.autofocus =
        false,
    this.tooltip,
    this.isFullWidth =
        false,
    this.debounceDuration,
    this.enableHapticFeedback =
        false,
    this.loadingText,
    this.disabledTooltip,
    this.isSelected =
        false,
  });

  /// The variant of the button (default, destructive, outline, etc.)
  final SButtonVariant
      variant;

  /// The size of the button (defaultSize, sm, lg, icon)
  final SButtonSize
      size;

  /// The current state of the button (enabled, disabled, loading)
  final SButtonState?
      state;

  /// Whether to show a loading indicator
  final bool
      isLoading;

  /// Fixed height of the button
  final double?
      height;

  /// Fixed width of the button
  final double?
      width;

  /// Custom padding values (left, top, right, bottom)
  final SButtonEdgeInsets?
      padding;

  /// Border radius value
  final double?
      borderRadius;

  /// Elevation of the button
  final double?
      elevation;

  /// Shadow color configuration
  final SColorConfig?
      shadowColor;

  /// Whether button should automatically gain focus
  final bool
      autofocus;

  /// Tooltip message
  final String?
      tooltip;

  /// Whether the button should stretch to fill the available width.
  final bool
      isFullWidth;

  /// Duration to debounce the button press.
  final Duration?
      debounceDuration;

  /// Whether to trigger haptic feedback on press.
  final bool
      enableHapticFeedback;

  /// Text to show alongside the spinner when loading.
  final String?
      loadingText;

  /// Tooltip to show when the button is disabled.
  final String?
      disabledTooltip;

  /// Whether the button is in a selected/toggled state.
  final bool
      isSelected;

  /// Creates a copy with modified properties
  SButtonConfig
      copyWith({
    SButtonVariant?
        variant,
    SButtonSize?
        size,
    SButtonState?
        state,
    bool?
        isLoading,
    double?
        height,
    double?
        width,
    SButtonEdgeInsets?
        padding,
    double?
        borderRadius,
    double?
        elevation,
    SColorConfig?
        shadowColor,
    bool?
        autofocus,
    String?
        tooltip,
    bool?
        isFullWidth,
    Duration?
        debounceDuration,
    bool?
        enableHapticFeedback,
    String?
        loadingText,
    String?
        disabledTooltip,
    bool?
        isSelected,
  }) {
    return SButtonConfig(
      variant:
          variant ?? this.variant,
      size:
          size ?? this.size,
      state:
          state ?? this.state,
      isLoading:
          isLoading ?? this.isLoading,
      height:
          height ?? this.height,
      width:
          width ?? this.width,
      padding:
          padding ?? this.padding,
      borderRadius:
          borderRadius ?? this.borderRadius,
      elevation:
          elevation ?? this.elevation,
      shadowColor:
          shadowColor ?? this.shadowColor,
      autofocus:
          autofocus ?? this.autofocus,
      tooltip:
          tooltip ?? this.tooltip,
      isFullWidth:
          isFullWidth ?? this.isFullWidth,
      debounceDuration:
          debounceDuration ?? this.debounceDuration,
      enableHapticFeedback:
          enableHapticFeedback ?? this.enableHapticFeedback,
      loadingText:
          loadingText ?? this.loadingText,
      disabledTooltip:
          disabledTooltip ?? this.disabledTooltip,
      isSelected:
          isSelected ?? this.isSelected,
    );
  }
}

/// Pure data model for color configuration
class SColorConfig {
  const SColorConfig({
    required this.red,
    required this.green,
    required this.blue,
    this.alpha =
        255,
  });

  final int
      red;
  final int
      green;
  final int
      blue;
  final int
      alpha;
}

/// Pure data model for edge insets
class SButtonEdgeInsets {
  const SButtonEdgeInsets({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  const SButtonEdgeInsets.all(
      double
          value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const SButtonEdgeInsets.symmetric({
    double horizontal =
        0,
    double vertical =
        0,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  final double
      left;
  final double
      top;
  final double
      right;
  final double
      bottom;
}

/// Button variant enum - domain layer
enum SButtonVariant {
  defaultVariant,
  destructive,
  destructiveOutline,
  outline,
  secondary,
  ghost,
  link,
}

/// Button size enum - domain layer
enum SButtonSize {
  defaultSize,
  sm,
  lg,
  icon,
}

/// Button state enum - domain layer
enum SButtonState {
  enabled,
  disabled,
  loading,
}

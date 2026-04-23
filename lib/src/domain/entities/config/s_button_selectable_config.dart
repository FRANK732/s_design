/// Configuration for the selectable / toggle state of [SButton.selectable].
///
/// This is a pure Dart domain entity with no Flutter/presentation layer
/// dependencies. It holds all the customization knobs for the selected state.
class SButtonSelectableConfig {
  const SButtonSelectableConfig({
    /// Background color override when the button is in the selected state.
    /// Falls back to a theme-derived tinted background if null.
    this.selectedBackgroundColor,

    /// Foreground (text + icon) color override for the selected state.
    /// Falls back to the button's foreground color if null.
    this.selectedForegroundColor,

    /// Border color when the button is selected.
    /// Only visible for outline or when [selectedBorderWidth] > 0.
    this.selectedBorderColor,

    /// Border width in the selected state. Defaults to [1.5].
    this.selectedBorderWidth = 1.5,

    /// Whether to show a check icon when the button is selected.
    this.showCheckIcon = false,

    /// Position of the check icon. Defaults to [SSelectableCheckAlignment.leading].
    this.checkAlignment = SSelectableCheckAlignment.leading,

    /// Animation duration for the selection transition.
    /// Defaults to 200ms — snappy but noticeable.
    this.animationDuration = const Duration(milliseconds: 200),

    /// Animation curve for the selection transition.
    this.animationCurve = SSelectableCurve.easeInOut,
  });

  final SColorValue? selectedBackgroundColor;
  final SColorValue? selectedForegroundColor;
  final SColorValue? selectedBorderColor;
  final double selectedBorderWidth;
  final bool showCheckIcon;
  final SSelectableCheckAlignment checkAlignment;
  final Duration animationDuration;
  final SSelectableCurve animationCurve;

  SButtonSelectableConfig copyWith({
    SColorValue? selectedBackgroundColor,
    SColorValue? selectedForegroundColor,
    SColorValue? selectedBorderColor,
    double? selectedBorderWidth,
    bool? showCheckIcon,
    SSelectableCheckAlignment? checkAlignment,
    Duration? animationDuration,
    SSelectableCurve? animationCurve,
  }) {
    return SButtonSelectableConfig(
      selectedBackgroundColor: selectedBackgroundColor ?? this.selectedBackgroundColor,
      selectedForegroundColor: selectedForegroundColor ?? this.selectedForegroundColor,
      selectedBorderColor: selectedBorderColor ?? this.selectedBorderColor,
      selectedBorderWidth: selectedBorderWidth ?? this.selectedBorderWidth,
      showCheckIcon: showCheckIcon ?? this.showCheckIcon,
      checkAlignment: checkAlignment ?? this.checkAlignment,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }
}

/// A pure-Dart ARGB color value for use in the domain layer.
///
/// Converted to [Color] by the presentation layer.
class SColorValue {
  const SColorValue(this.value);

  /// Creates from ARGB channel values (0–255).
  const SColorValue.fromARGB(int a, int r, int g, int b)
      : value = (a << 24) | (r << 16) | (g << 8) | b;

  /// The packed 32-bit ARGB integer.
  final int value;
}

/// Position of the check icon inside a selectable button.
enum SSelectableCheckAlignment {
  leading,
  trailing,
}

/// Named animation curves for selectable transitions.
/// Defined here so the domain layer remains free of Flutter's [Curves] class.
enum SSelectableCurve {
  linear,
  easeIn,
  easeOut,
  easeInOut,
  elasticOut,
  bounceOut,
}

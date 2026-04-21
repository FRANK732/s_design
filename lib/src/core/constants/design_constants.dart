/// Core design constants for the sDesign package.
///
/// These constants are shared across the entire package and define
/// fundamental design values used throughout components.
class DesignConstants {
  DesignConstants._();

  // Button Constants
  static const double
      buttonBorderRadiusDefault =
      8.0;
  static const double
      buttonElevationDefault =
      0.0;
  static const Duration
      buttonAnimationDuration =
      Duration(milliseconds: 200);

  // Border Radii
  static const double
      borderRadiusSmall =
      4.0;
  static const double
      borderRadiusMedium =
      8.0;
  static const double
      borderRadiusLarge =
      12.0;

  // Button Padding - Default Size
  static const double
      buttonPaddingHorizontalDefault =
      24.0;
  static const double
      buttonPaddingVerticalDefault =
      16.0;

  // Button Padding - Small
  static const double
      buttonPaddingHorizontalSm =
      16.0;
  static const double
      buttonPaddingVerticalSm =
      12.0;

  // Button Padding - Large
  static const double
      buttonPaddingHorizontalLg =
      32.0;
  static const double
      buttonPaddingVerticalLg =
      20.0;

  // Button Padding - Icon
  static const double
      buttonPaddingIcon =
      12.0;

  // Button Size - Icon (fixed square touch target)
  static const double
      buttonSizeIcon =
      40.0;

  // Loading Indicator Sizes
  static const double
      loaderSizeSm =
      16.0;
  static const double
      loaderSizeDefault =
      20.0;
  static const double
      loaderSizeLg =
      24.0;

  // Opacity Values
  static const double
      opacityPressed =
      0.12;
  static const double
      opacityFocused =
      0.2;
  static const double
      opacityDisabled =
      0.6;

  // Animation Durations
  static const int
      animationDurationMs =
      1000;
}

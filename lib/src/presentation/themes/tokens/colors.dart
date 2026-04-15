import 'package:flutter/material.dart';

/// Base interface for all color definitions
abstract class SColorsBase {
  // Primary Colors
  Color
      get primary;
  Color
      get primaryVariant;

  // Secondary Colors
  Color
      get secondary;
  Color
      get secondaryVariant;

  // Background Colors
  Color
      get background;
  Color
      get surface;
  Color
      get inverseSurface;
  Color
      get onInverseSurface;

  // Status/Feedback Colors
  Color
      get error;
  Color
      get warning;
  Color
      get success;
  Color
      get info;

  // Text Colors
  Color
      get textPrimary;
  Color
      get textSecondary;
  Color
      get textOnPrimary;
  Color
      get textOnSecondary;

  // Additional Colors
  Color
      get disabled;
  Color
      get divider;
  Color
      get shadow;

  // Component-Specific Colors

  // Button Colors
  Color
      get buttonBackground;
  Color
      get buttonText;
  Color
      get buttonDisabledBackground;
  Color
      get buttonDisabledText;

  // Card Colors
  Color
      get cardBackground;
  Color
      get cardShadow;

  // Dialog Colors
  Color
      get dialogBackground;
  Color
      get dialogTitle;
  Color
      get dialogContent;
  Color
      get dialogButtonBackground;
  Color
      get dialogButtonText;

  // Input Field Colors
  Color
      get inputBackground;
  Color
      get inputBorder;
  Color
      get inputFocusBorder;
  Color
      get inputErrorBorder;
  Color
      get inputHintText;

  // Checkbox Colors
  Color
      get checkboxActive;
  Color
      get checkboxInactive;
  Color
      get checkboxDisabled;

  // Switch Colors
  Color
      get switchActive;
  Color
      get switchInactive;
  Color
      get switchDisabled;

  // Tabs Colors
  Color
      get tabsIndicator;
  Color
      get tabsLabel;
  Color
      get tabsUnselectedLabel;

  // Progress Bar Colors
  Color
      get progressBackground;
  Color
      get progressValue;

  // Dropdown Menu Colors
  Color
      get dropdownBackground;
  Color
      get dropdownItemSelected;
  Color
      get dropdownItemUnselected;

  // Toaster Colors
  Color
      get toasterBackground;
  Color
      get toasterText;

  // Additional component colors can be added here if needed
}

/// Light Theme Colors
class SLightColors
    extends SColorsBase {
  // Primary Colors
  @override
  Color get primary => const Color
      .fromARGB(
      255,
      3,
      128,
      218);

  @override
  Color get primaryVariant => const Color
      .fromARGB(
      255,
      3,
      128,
      218);

  // Secondary Colors
  @override
  Color get secondary =>
      const Color(0xFFD87F19);

  @override
  Color get secondaryVariant =>
      const Color(0xFFAF872A);

  // Background Colors
  @override
  Color get background =>
      const Color(0xFFFFFFFF);

  @override
  Color get surface =>
      const Color(0xFFFFFFFF);

  @override
  Color get inverseSurface =>
      const Color(0xFF313131);

  @override
  Color get onInverseSurface =>
      const Color(0xFFF5F5F5);

  // Status/Feedback Colors
  @override
  Color get error =>
      const Color(0x99F6526E);

  @override
  Color get warning =>
      const Color(0xFFFFA726);

  @override
  Color get success =>
      primary;

  @override
  Color get info =>
      secondary;

  // Text Colors
  @override
  Color get textPrimary =>
      const Color(0xFF000000);

  @override
  Color get textSecondary =>
      const Color(0xFF757575);

  @override
  Color get textOnPrimary =>
      const Color(0xFFFFFFFF);

  @override
  Color get textOnSecondary =>
      const Color(0xFF000000);

  // Additional Colors
  @override
  Color get disabled =>
      const Color(0xFFBDBDBD);

  @override
  Color get divider =>
      const Color(0xFFE0E0E0);

  @override
  Color get shadow => Colors
      .black
      .withOpacity(0.2);

  // Button Colors
  @override
  Color get buttonBackground =>
      primary;

  @override
  Color get buttonText =>
      textOnPrimary;

  @override
  Color get buttonDisabledBackground =>
      disabled;

  @override
  Color get buttonDisabledText =>
      textSecondary;

  // Card Colors
  @override
  Color get cardBackground =>
      surface;

  @override
  Color get cardShadow =>
      shadow;

  // Dialog Colors
  @override
  Color get dialogBackground =>
      surface;

  @override
  Color get dialogTitle =>
      textPrimary;

  @override
  Color get dialogContent =>
      textSecondary;

  @override
  Color get dialogButtonBackground =>
      primary;

  @override
  Color get dialogButtonText =>
      textOnPrimary;

  // Input Field Colors
  @override
  Color get inputBackground =>
      background;

  @override
  Color get inputBorder =>
      divider;

  @override
  Color get inputFocusBorder =>
      primary;

  @override
  Color get inputErrorBorder =>
      error;

  @override
  Color get inputHintText =>
      textSecondary;

  // Checkbox Colors
  @override
  Color get checkboxActive =>
      primary;

  @override
  Color get checkboxInactive =>
      divider;

  @override
  Color get checkboxDisabled =>
      disabled;

  // Switch Colors
  @override
  Color get switchActive =>
      primary;

  @override
  Color get switchInactive =>
      divider;

  @override
  Color get switchDisabled =>
      disabled;

  // Tabs Colors
  @override
  Color get tabsIndicator =>
      primary;

  @override
  Color get tabsLabel =>
      textPrimary;

  @override
  Color get tabsUnselectedLabel =>
      textSecondary;

  // Progress Bar Colors
  @override
  Color get progressBackground =>
      divider.withOpacity(0.2);

  @override
  Color get progressValue =>
      primary;

  // Dropdown Menu Colors
  @override
  Color get dropdownBackground =>
      surface;

  @override
  Color get dropdownItemSelected =>
      primary;

  @override
  Color get dropdownItemUnselected =>
      textPrimary;

  // Toaster Colors
  @override
  Color get toasterBackground =>
      surface;

  @override
  Color get toasterText =>
      textPrimary;
}

/// Dark Theme Colors
class SDarkColors
    extends SColorsBase {
  // Primary Colors
  @override
  Color get primary => const Color
      .fromARGB(
      255,
      3,
      128,
      218);

  @override
  Color get primaryVariant => const Color
      .fromARGB(
      255,
      3,
      128,
      218);

  // Secondary Colors
  @override
  Color get secondary =>
      const Color(0xFFD87F19);

  @override
  Color get secondaryVariant =>
      const Color(0xFFD87F19);

  // Background Colors
  @override
  Color get background =>
      const Color(0xFF121212);

  @override
  Color get surface =>
      const Color(0xFF1E1E1E);

  @override
  Color get inverseSurface =>
      const Color(0xFFE3E3E3);

  @override
  Color get onInverseSurface =>
      const Color(0xFF1F1F1F);

  // Status/Feedback Colors
  @override
  Color get error =>
      const Color(0xFFCF6679);

  @override
  Color get warning =>
      const Color(0xFFFFA726);

  @override
  Color get success =>
      primary;

  @override
  Color get info =>
      secondary;

  // Text Colors
  @override
  Color get textPrimary =>
      const Color(0xFFFFFFFF);

  @override
  Color get textSecondary =>
      const Color(0xFFBDBDBD);

  @override
  Color get textOnPrimary =>
      const Color(0xFFBDBDBD);

  @override
  Color get textOnSecondary =>
      const Color(0xFFFFFFFF);

  // Additional Colors
  @override
  Color get disabled =>
      const Color(0xFF757575);

  @override
  Color get divider =>
      const Color(0xFF303030);

  @override
  Color get shadow => Colors
      .white
      .withOpacity(0.2);

  // Button Colors
  @override
  Color get buttonBackground =>
      primary;

  @override
  Color get buttonText =>
      textOnPrimary;

  @override
  Color get buttonDisabledBackground =>
      disabled;

  @override
  Color get buttonDisabledText =>
      textSecondary;

  // Card Colors
  @override
  Color get cardBackground =>
      surface;

  @override
  Color get cardShadow =>
      shadow;

  // Dialog Colors
  @override
  Color get dialogBackground =>
      surface;

  @override
  Color get dialogTitle =>
      textPrimary;

  @override
  Color get dialogContent =>
      textSecondary;

  @override
  Color get dialogButtonBackground =>
      primary;

  @override
  Color get dialogButtonText =>
      textOnPrimary;

  // Input Field Colors
  @override
  Color get inputBackground =>
      surface;

  @override
  Color get inputBorder =>
      divider;

  @override
  Color get inputFocusBorder =>
      primary;

  @override
  Color get inputErrorBorder =>
      error;

  @override
  Color get inputHintText =>
      textSecondary;

  // Checkbox Colors
  @override
  Color get checkboxActive =>
      primary;

  @override
  Color get checkboxInactive =>
      divider;

  @override
  Color get checkboxDisabled =>
      disabled;

  // Switch Colors
  @override
  Color get switchActive =>
      primary;

  @override
  Color get switchInactive =>
      divider;

  @override
  Color get switchDisabled =>
      disabled;

  // Tabs Colors
  @override
  Color get tabsIndicator =>
      disabled;

  @override
  Color get tabsLabel =>
      textPrimary;

  @override
  Color get tabsUnselectedLabel =>
      textSecondary;

  // Progress Bar Colors
  @override
  Color get progressBackground =>
      divider.withOpacity(0.2);

  @override
  Color get progressValue =>
      primary;

  // Dropdown Menu Colors
  @override
  Color get dropdownBackground =>
      surface;

  @override
  Color get dropdownItemSelected =>
      primary;

  @override
  Color get dropdownItemUnselected =>
      textPrimary;

  // Toaster Colors
  @override
  Color get toasterBackground =>
      surface;

  @override
  Color get toasterText =>
      textPrimary;
}

/// Aggregator: provides quick access to light/dark color sets
class SColors {
  final SColorsBase
      light =
      SLightColors();
  final SColorsBase
      dark =
      SDarkColors();

  /// Retrieves the appropriate color scheme based on [brightness]
  SColorsBase
      getColors(Brightness brightness) {
    return brightness == Brightness.dark
        ? dark
        : light;
  }
}

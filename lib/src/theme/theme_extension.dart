import 'package:flutter/material.dart';
import 's_dimension.dart';
import 's_spacers.dart';
import 's_theme.dart';

final STheme _sTheme = STheme();

extension ThemeExtensions on BuildContext {
  // Existing color getters
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get textPrimaryColor => Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black;
  Color get textOnPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get textOnSecondaryColor => Theme.of(this).colorScheme.onSecondary;

  // Additional color getters
  // Color get primaryVariantColor => Theme.of(this).colorScheme.primaryVariant;
  // Color get secondaryVariantColor => Theme.of(this).colorScheme.secondaryVariant;
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get textSecondaryColor => Theme.of(this).textTheme.bodySmall?.color ?? Colors.grey;
  Color get disabledColor => Theme.of(this).disabledColor;
  Color get dividerColor => Theme.of(this).dividerColor;
  Color get shadowColor => Colors.black.withOpacity(0.2);

  // Button Colors
  Color get buttonBackgroundColor => primaryColor;
  Color get buttonTextColor => textOnPrimaryColor;
  Color get buttonDisabledBackgroundColor => disabledColor;
  Color get buttonDisabledTextColor => textSecondaryColor;

  // Card Colors
  Color get cardBackgroundColor => surfaceColor;
  Color get cardShadowColor => shadowColor;

  // Dialog Colors
  Color get dialogBackgroundColor => surfaceColor;
  Color get dialogTitleColor => textPrimaryColor;
  Color get dialogContentColor => textSecondaryColor;
  Color get dialogButtonBackgroundColor => primaryColor;
  Color get dialogButtonTextColor => textOnPrimaryColor;

  // Input Field Colors
  Color get inputBackgroundColor => backgroundColor;
  Color get inputBorderColor => dividerColor;
  Color get inputFocusBorderColor => primaryColor;
  Color get inputErrorBorderColor => errorColor;
  Color get inputHintTextColor => textSecondaryColor;

  // Checkbox Colors
  Color get checkboxActiveColor => primaryColor;
  Color get checkboxInactiveColor => dividerColor;
  Color get checkboxDisabledColor => disabledColor;

  // Switch Colors
  Color get switchActiveColor => primaryColor;
  Color get switchInactiveColor => dividerColor;
  Color get switchDisabledColor => disabledColor;

  // Tabs Colors
  Color get tabsIndicatorColor => disabledColor;
  Color get tabsLabelColor => textPrimaryColor;
  Color get tabsUnselectedLabelColor => textSecondaryColor;

  // Progress Bar Colors
  Color get progressBackgroundColor => dividerColor.withOpacity(0.2);
  Color get progressValueColor => primaryColor;

  // Dropdown Menu Colors
  Color get dropdownBackgroundColor => surfaceColor;
  Color get dropdownItemSelectedColor => primaryColor;
  Color get dropdownItemUnselectedColor => textPrimaryColor;

  // Toaster Colors
  Color get toasterBackgroundColor => surfaceColor;
  Color get toasterTextColor => textPrimaryColor;

  // Access the current typography styles.
  TextTheme get textThemeStyles => Theme.of(this).textTheme;

  // Access spacing dimensions.
  SDimensions get dimensions => SDimensions();

  // Access spacers for consistent spacing.
  Spacers get spacers => Spacers();
}
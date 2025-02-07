import 'package:flutter/material.dart';
import 's_dimension.dart';
import 's_spacers.dart';

extension ThemeExtensions on BuildContext {
  // Common color usage
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get backgroundColor => Theme.of(this).colorScheme.surface;

  Color get textPrimaryColor =>
      Theme.of(this).textTheme.bodyMedium?.color ?? Colors.black;
  Color get textOnPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get textOnSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get textSecondaryColor =>
      Theme.of(this).textTheme.bodySmall?.color ?? Colors.grey;

  Color get disabledColor => Theme.of(this).disabledColor;
  Color get dividerColor => Theme.of(this).dividerColor;
  Color get shadowColor => Theme.of(this).shadowColor;

  // Button Colors
  Color get buttonBackgroundColor => primaryColor;
  Color get buttonTextColor => textOnPrimaryColor;
  Color get buttonDisabledBackgroundColor => disabledColor;
  Color get buttonDisabledTextColor => textSecondaryColor;

  // Card
  Color get cardBackgroundColor => Theme.of(this).cardColor;
  Color get cardShadowColor => shadowColor;

  // Dialog
  Color get dialogBackgroundColor => Theme.of(this).dialogBackgroundColor;
  // For customizing text color, you can rely on textTheme or add your own usage
  Color get dialogTitleColor => textPrimaryColor;
  Color get dialogContentColor => textSecondaryColor;
  Color get dialogButtonBackgroundColor => primaryColor;
  Color get dialogButtonTextColor => textOnPrimaryColor;

  // Input
  Color get inputBackgroundColor =>
      Theme.of(this).inputDecorationTheme.fillColor ?? surfaceColor;
  Color get inputBorderColor => dividerColor;
  Color get inputFocusBorderColor => primaryColor;
  Color get inputErrorBorderColor => errorColor;
  Color get inputHintTextColor => textSecondaryColor;

  // Checkbox
  Color get checkboxActiveColor => primaryColor;
  Color get checkboxInactiveColor => dividerColor;
  Color get checkboxDisabledColor => disabledColor;

  // Switch
  Color get switchActiveColor => primaryColor;
  Color get switchInactiveColor => dividerColor;
  Color get switchDisabledColor => disabledColor;

  // Tabs
  Color get tabsIndicatorColor => primaryColor;
  Color get tabsLabelColor => textPrimaryColor;
  Color get tabsUnselectedLabelColor => textSecondaryColor;

  // Progress Bar
  Color get progressBackgroundColor => dividerColor.withOpacity(0.2);
  Color get progressValueColor => primaryColor;

  // Dropdown
  Color get dropdownBackgroundColor => surfaceColor;
  Color get dropdownItemSelectedColor => primaryColor;
  Color get dropdownItemUnselectedColor => textPrimaryColor;

  // Toaster
  Color get toasterBackgroundColor => surfaceColor;
  Color get toasterTextColor => textPrimaryColor;

  // Typography (TextTheme)
  TextTheme get textThemeStyles => Theme.of(this).textTheme;

  // Spacing & Dimensions
  SDimensions get dimensions => SDimensions();
  Spacers get spacers => Spacers();
}

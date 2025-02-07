import 'package:flutter/material.dart';
import 's_colors.dart';
import 's_typography.dart';

class STheme {
  final SColors sColors = SColors();
  late final STypographyBase lightTypography;
  late final STypographyBase darkTypography;

  STheme() {
    lightTypography = SLightTypography(colors: sColors.light);
    darkTypography = SDarkTypography(colors: sColors.dark);
  }

  ThemeData getLightTheme() {
    final colors = sColors.light;
    final typography = lightTypography;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colors.primary,
      // Core color scheme
      colorScheme: ColorScheme.light(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.surface,
        error: colors.error,
        onPrimary: colors.textOnPrimary,
        onSecondary: colors.textOnSecondary,
        onSurface: colors.textPrimary,
        onError: colors.textOnPrimary,
      ),
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.cardBackground,
      dialogBackgroundColor: colors.dialogBackground,
      disabledColor: colors.disabled,
      dividerColor: colors.divider,
      shadowColor: colors.shadow,

      // ICON THEME
      iconTheme: IconThemeData(
        color: colors.textPrimary,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: colors.primary,
        size: 24,
      ),

      // TEXT THEME
      textTheme: TextTheme(
        displayLarge: typography.displayLarge,
        displayMedium: typography.displayMedium,
        displaySmall: typography.displaySmall,
        headlineLarge: typography.headlineLarge,
        headlineMedium: typography.headlineMedium,
        headlineSmall: typography.headlineSmall,
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
        labelLarge: typography.labelLarge,
        labelMedium: typography.labelMedium,
        labelSmall: typography.labelSmall,
      ),

      // COMPONENT THEMES

      // AppBar
      appBarTheme: AppBarTheme(
        color: colors.primary,
        foregroundColor: colors.textOnPrimary,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textOnPrimary),
        titleTextStyle: typography.titleLarge.copyWith(
          color: colors.textOnPrimary,
        ),
      ),

      // Buttons: Text, Elevated, Outlined, Filled
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          textStyle: typography.labelLarge,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.buttonBackground,
          foregroundColor: colors.buttonText,
          textStyle: typography.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          textStyle: typography.labelLarge,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colors.buttonBackground),
          foregroundColor: WidgetStateProperty.all(colors.buttonText),
          textStyle: WidgetStateProperty.all(typography.labelLarge),
        ),
      ),

      // Old ButtonTheme (optional)
      buttonTheme: ButtonThemeData(
        buttonColor: colors.buttonBackground,
        disabledColor: colors.buttonDisabledBackground,
        textTheme: ButtonTextTheme.primary,
      ),

      // Card
      cardTheme: CardTheme(
        color: colors.cardBackground,
        shadowColor: colors.cardShadow,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Checkbox
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(colors.checkboxActive),
        checkColor: WidgetStateProperty.all(colors.textOnPrimary),
      ),

      // Dialog
      dialogTheme: DialogTheme(
        backgroundColor: colors.dialogBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        titleTextStyle: typography.headlineSmall.copyWith(
          color: colors.dialogTitle,
        ),
        contentTextStyle: typography.bodyMedium.copyWith(
          color: colors.dialogContent,
        ),
      ),

      // Input / TextField
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputBackground,
        hintStyle: typography.bodySmall.copyWith(color: colors.inputHintText),
        labelStyle: typography.bodyMedium.copyWith(color: colors.textPrimary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.inputBorder),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.inputFocusBorder),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.inputErrorBorder),
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // ListTile
      listTileTheme: ListTileThemeData(
        iconColor: colors.textPrimary,
        textColor: colors.textPrimary,
      ),

      // Progress Indicators
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.progressValue,
        circularTrackColor: colors.progressBackground,
      ),

      // Switch
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(colors.switchActive),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? colors.switchActive.withOpacity(0.5)
              : colors.switchInactive;
        }),
      ),

      // Tabs
      tabBarTheme: TabBarTheme(
        labelStyle: typography.labelLarge,
        unselectedLabelStyle: typography.labelLarge,
        labelColor: colors.tabsLabel,
        unselectedLabelColor: colors.tabsUnselectedLabel,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: colors.tabsIndicator, width: 2),
        ),
      ),

      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.surface,
        contentTextStyle:
            typography.bodyMedium.copyWith(color: colors.textPrimary),
        actionTextColor: colors.primary,
      ),

      // Tooltip
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: typography.bodySmall.copyWith(color: colors.textPrimary),
      ),

      // Dropdown (Flutter 3.7+)
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(colors.dropdownBackground),
        ),
      ),
    );
  }

  ThemeData getDarkTheme() {
    final colors = sColors.dark; // SDarkColors
    final typography = darkTypography;

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: colors.primary,
      // Core color scheme
      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.surface,
        error: colors.error,
        onPrimary: colors.textOnPrimary,
        onSecondary: colors.textOnSecondary,
        onSurface: colors.textPrimary,
        onError: colors.textOnPrimary,
      ),
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.cardBackground,
      dialogBackgroundColor: colors.dialogBackground,
      disabledColor: colors.disabled,
      dividerColor: colors.divider,
      shadowColor: colors.shadow,

      iconTheme: IconThemeData(
        color: colors.textPrimary,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: colors.primary,
        size: 24,
      ),

      textTheme: TextTheme(
        displayLarge: typography.displayLarge,
        displayMedium: typography.displayMedium,
        displaySmall: typography.displaySmall,
        headlineLarge: typography.headlineLarge,
        headlineMedium: typography.headlineMedium,
        headlineSmall: typography.headlineSmall,
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
        labelLarge: typography.labelLarge,
        labelMedium: typography.labelMedium,
        labelSmall: typography.labelSmall,
      ),

      // COMPONENT THEMES

      appBarTheme: AppBarTheme(
        color: colors.primary,
        foregroundColor: colors.textOnPrimary,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textOnPrimary),
        titleTextStyle: typography.titleLarge.copyWith(
          color: colors.textOnPrimary,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          textStyle: typography.labelLarge,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.buttonBackground,
          foregroundColor: colors.buttonText,
          textStyle: typography.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.primary),
          textStyle: typography.labelLarge,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colors.buttonBackground),
          foregroundColor: WidgetStateProperty.all(colors.buttonText),
          textStyle: WidgetStateProperty.all(typography.labelLarge),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: colors.buttonBackground,
        disabledColor: colors.buttonDisabledBackground,
        textTheme: ButtonTextTheme.primary,
      ),

      cardTheme: CardTheme(
        color: colors.cardBackground,
        shadowColor: colors.cardShadow,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(colors.checkboxActive),
        checkColor: WidgetStateProperty.all(colors.textOnPrimary),
      ),

      dialogTheme: DialogTheme(
        backgroundColor: colors.dialogBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        titleTextStyle: typography.headlineSmall.copyWith(
          color: colors.dialogTitle,
        ),
        contentTextStyle: typography.bodyMedium.copyWith(
          color: colors.dialogContent,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputBackground,
        hintStyle: typography.bodySmall.copyWith(color: colors.inputHintText),
        labelStyle: typography.bodyMedium.copyWith(color: colors.textPrimary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.inputBorder),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.inputFocusBorder),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.inputErrorBorder),
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      listTileTheme: ListTileThemeData(
        iconColor: colors.textPrimary,
        textColor: colors.textPrimary,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.progressValue,
        circularTrackColor: colors.progressBackground,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(colors.switchActive),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? colors.switchActive.withOpacity(0.5)
              : colors.switchInactive;
        }),
      ),

      tabBarTheme: TabBarTheme(
        labelStyle: typography.labelLarge,
        unselectedLabelStyle: typography.labelLarge,
        labelColor: colors.tabsLabel,
        unselectedLabelColor: colors.tabsUnselectedLabel,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: colors.tabsIndicator, width: 2),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.surface,
        contentTextStyle:
            typography.bodyMedium.copyWith(color: colors.textPrimary),
        actionTextColor: colors.primary,
      ),

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.cardBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: typography.bodySmall.copyWith(color: colors.textPrimary),
      ),

      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(colors.dropdownBackground),
        ),
      ),
    );
  }
}

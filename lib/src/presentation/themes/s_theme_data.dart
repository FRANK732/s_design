import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'extensions/component_themes/s_alert_theme.dart';
import 'extensions/component_themes/s_avatar_theme.dart';
import 'extensions/component_themes/s_button_theme.dart';
import 'extensions/component_themes/s_card_theme.dart';
import 'extensions/component_themes/s_checkbox_theme.dart';
import 'extensions/component_themes/s_dialog_theme.dart';
import 'extensions/component_themes/s_dropdown_menu_theme.dart';
import 'extensions/component_themes/s_floating_panel_theme.dart';
import 'extensions/component_themes/s_input_field_theme.dart';
import 'extensions/component_themes/s_list_tile_theme.dart';
import 'extensions/component_themes/s_loading_indicator_theme.dart';
import 'extensions/component_themes/s_pagination_theme.dart';
import 'extensions/component_themes/s_select_theme.dart';
import 'extensions/component_themes/s_sonner_theme.dart';
import 'extensions/component_themes/s_switch_theme.dart';
import 'extensions/component_themes/s_tabs_theme.dart';
import 'extensions/component_themes/s_time_picker_theme.dart';
import 'extensions/component_themes/s_toast_theme.dart';
import 'tokens/colors.dart';
import 'tokens/typography.dart';

/// Defines the configuration for an SDesign theme.
///
/// A [SThemeData] contains all the colors, typography, and component
/// theme data used to style SDesign widgets. It can be provided to an
/// [STheme] or [SApp] to apply the theme throughout the widget tree.
@immutable
class SThemeData
    with
        Diagnosticable {
  /// Abstract factory constructor to build an SDesign Theme.
  factory SThemeData({
    Brightness?
        brightness,
    SColorsBase?
        colorToken,
    STypographyBase?
        typographyToken,
    SAlertThemeData?
        alertTheme,
    SAvatarThemeData?
        avatarTheme,
    SButtonThemeData?
        buttonTheme,
    SCardThemeData?
        cardTheme,
    SCheckboxThemeData?
        checkboxTheme,
    SDialogThemeData?
        dialogTheme,
    SDropdownMenuThemeData?
        dropdownMenuTheme,
    SFloatingPanelThemeData?
        floatingPanelTheme,
    SInputFieldThemeData?
        inputFieldTheme,
    SListTileThemeData?
        listTileTheme,
    SLoadingIndicatorThemeData?
        loadingIndicatorTheme,
    SPaginationThemeData?
        paginationTheme,
    SSelectThemeData?
        selectTheme,
    SSonnerThemeData?
        sonnerTheme,
    SSwitchThemeData?
        switchTheme,
    STabsThemeData?
        tabsTheme,
    STimePickerThemeData?
        timePickerTheme,
    SToastThemeData?
        toastTheme,
  }) {
    brightness ??=
        Brightness.light;
    final bool
        isLight =
        brightness == Brightness.light;

    // Use default tokens if not provided
    colorToken ??= isLight
        ? SLightColors()
        : SDarkColors();
    typographyToken ??= isLight
        ? SLightTypography(colors: colorToken)
        : SDarkTypography(colors: colorToken);

    // Map exact SColorsBase tokens to the underlying Material ColorScheme.
    // This ensures all component themes using `.fromColorScheme(matColorScheme)`
    // accurately reflect our carefully curated light/dark colors (e.g. pure dark surface)
    // rather than the auto-generated tonal palettes from Material 3.
    final ColorScheme
        matColorScheme =
        ColorScheme(
      brightness:
          brightness,
      primary:
          colorToken.primary,
      onPrimary:
          colorToken.textOnPrimary,
      primaryContainer:
          colorToken.primary.withOpacity(0.12),
      onPrimaryContainer:
          colorToken.primary,
      secondary:
          colorToken.secondary,
      onSecondary:
          colorToken.textOnSecondary,
      secondaryContainer:
          colorToken.secondary.withOpacity(0.12),
      onSecondaryContainer:
          colorToken.secondary,
      error:
          colorToken.error,
      onError:
          colorToken.textOnPrimary,
      surface:
          colorToken.surface,
      onSurface:
          colorToken.textPrimary,
      onSurfaceVariant:
          colorToken.textSecondary,
      outline:
          colorToken.divider,
      outlineVariant:
          colorToken.divider.withOpacity(0.5),
      shadow:
          colorToken.shadow,
    );

    // We map existing constructors that take regular material ColorScheme
    // We map existing constructors that take regular material ColorScheme
    alertTheme ??=
        SAlertThemeData(
      borderRadius:
          BorderRadius.circular(8),
      borderWidth:
          1.0,
      padding:
          const EdgeInsets.all(16),
      iconSize:
          20,
      titleStyle:
          typographyToken.titleMedium,
      descriptionStyle:
          typographyToken.bodyMedium,
      elevation:
          0,
      shadowColor:
          Colors.transparent,
    );
    avatarTheme ??=
        SAvatarThemeData(
      backgroundColor:
          colorToken.primary.withOpacity(0.1),
      foregroundColor:
          colorToken.textPrimary,
      borderColor:
          colorToken.divider,
    );
    buttonTheme ??=
        SButtonThemeData.fromColorScheme(matColorScheme).copyWith(
          defaultBackgroundColor: colorToken.buttonBackground,
          defaultForegroundColor: colorToken.buttonText,
        );
    cardTheme ??=
        SCardThemeData.fromColorScheme(matColorScheme);
    checkboxTheme ??=
        SCheckboxThemeData.fromColorScheme(matColorScheme);
    dialogTheme ??=
        SDialogThemeData.fromColorScheme(matColorScheme);
    dropdownMenuTheme ??=
        SDropdownMenuThemeData.fromColorScheme(matColorScheme);
    floatingPanelTheme ??=
        SFloatingPanelThemeData(
      backgroundColor:
          colorToken.surface,
      barrierColor:
          Colors.black54,
      shadowColor:
          colorToken.shadow,
      elevation:
          8,
      borderRadius:
          BorderRadius.circular(16),
      margin:
          const EdgeInsets.all(16),
      contentPadding:
          const EdgeInsets.all(16),
    );
    inputFieldTheme ??=
        SInputFieldThemeData.fromColorScheme(matColorScheme);
    listTileTheme ??=
        SListTileThemeData.fromColorScheme(matColorScheme);
    loadingIndicatorTheme ??=
        SLoadingIndicatorThemeData(
      spinnerColor:
          colorToken.primary,
      spinnerSize:
          25.0,
      messageStyle:
          typographyToken.bodyMedium,
      useGradient:
          false,
      backgroundColor:
          colorToken.surface,
      shadowColor:
          colorToken.shadow,
      shadowBlurRadius:
          10.0,
      shadowOffset:
          const Offset(0, 4),
      animationCurve:
          Curves.easeInOut,
      spinnerSpeed:
          1.0,
      padding:
          const EdgeInsets.all(20.0),
      margin:
          EdgeInsets.zero,
      borderRadius:
          BorderRadius.circular(20),
    );
    paginationTheme ??=
        SPaginationThemeData(
      activeColor:
          colorToken.primary,
      activeBorderColor:
          colorToken.primary,
      activeTextColor:
          colorToken.surface,
      defaultBorderColor:
          colorToken.divider,
      defaultTextColor:
          colorToken.textPrimary,
      disabledColor:
          colorToken.surface,
      disabledTextColor:
          colorToken.textSecondary,
      hoverBorderColor:
          colorToken.primary,
      hoverTextColor:
          colorToken.primary,
      itemSize:
          32,
      itemSpacing:
          8,
      borderRadius:
          BorderRadius.circular(6),
      itemTextStyle:
          typographyToken.bodyMedium,
      totalTextStyle:
          typographyToken.bodyMedium,
    );
    selectTheme ??=
        SSelectThemeData(
      backgroundColor:
          colorToken.surface,
      itemColor:
          colorToken.textPrimary,
      selectedItemColor:
          colorToken.primary,
      selectedItemBackgroundColor:
          colorToken.primary.withOpacity(0.1),
      disabledColor:
          colorToken.textSecondary.withOpacity(0.5),
      iconColor:
          colorToken.textSecondary,
      borderColor:
          colorToken.divider,
    );
    sonnerTheme ??=
        SSonnerThemeData(
      backgroundColor:
          colorToken.surface,
      textColor:
          colorToken.textPrimary,
      successColor:
          colorToken.success,
      errorColor:
          colorToken.error,
      infoColor:
          colorToken.info,
      warningColor:
          colorToken.warning,
      iconColor:
          colorToken.primary,
      borderRadius:
          BorderRadius.circular(8.0),
      elevation:
          4.0,
      shadowColor:
          colorToken.shadow,
      padding:
          const EdgeInsets.all(16.0),
      margin:
          const EdgeInsets.symmetric(horizontal: 16.0),
      closeIconColor:
          colorToken.textSecondary,
      titleStyle:
          typographyToken.titleMedium.copyWith(fontWeight: FontWeight.bold),
      descriptionStyle:
          typographyToken.bodyMedium,
    );
    switchTheme ??=
        SSwitchThemeData.fromColorScheme(matColorScheme);
    tabsTheme ??=
        STabsThemeData.fromColorScheme(matColorScheme);
    timePickerTheme ??=
        STimePickerThemeData(
      activeColor:
          colorToken.primary,
      panelBackground:
          colorToken.surface,
      columnHighlightColor:
          colorToken.primary.withOpacity(0.1),
      borderColor:
          colorToken.divider,
      borderRadius:
          BorderRadius.circular(8),
      fillColor:
          colorToken.surface,
      textStyle:
          typographyToken.bodyLarge,
      placeholderStyle:
          typographyToken.bodyLarge.copyWith(color: colorToken.textSecondary),
      itemTextStyle:
          typographyToken.bodyMedium,
      itemHeight:
          36.0,
      columnWidth:
          56.0,
    );
    toastTheme ??=
        SToastThemeData(
      backgroundColor:
          colorToken.textPrimary,
      textColor:
          colorToken.surface,
      successColor:
          colorToken.success,
      errorColor:
          colorToken.error,
      infoColor:
          colorToken.info,
      warningColor:
          colorToken.warning,
    );

    return SThemeData
        .raw(
      brightness:
          brightness,
      colorToken:
          colorToken,
      typographyToken:
          typographyToken,
      alertTheme:
          alertTheme,
      avatarTheme:
          avatarTheme,
      buttonTheme:
          buttonTheme,
      cardTheme:
          cardTheme,
      checkboxTheme:
          checkboxTheme,
      dialogTheme:
          dialogTheme,
      dropdownMenuTheme:
          dropdownMenuTheme,
      floatingPanelTheme:
          floatingPanelTheme,
      inputFieldTheme:
          inputFieldTheme,
      listTileTheme:
          listTileTheme,
      loadingIndicatorTheme:
          loadingIndicatorTheme,
      paginationTheme:
          paginationTheme,
      selectTheme:
          selectTheme,
      sonnerTheme:
          sonnerTheme,
      switchTheme:
          switchTheme,
      tabsTheme:
          tabsTheme,
      timePickerTheme:
          timePickerTheme,
      toastTheme:
          toastTheme,
    );
  }

  const SThemeData.raw({
    required this.brightness,
    required this.colorToken,
    required this.typographyToken,
    required this.alertTheme,
    required this.avatarTheme,
    required this.buttonTheme,
    required this.cardTheme,
    required this.checkboxTheme,
    required this.dialogTheme,
    required this.dropdownMenuTheme,
    required this.floatingPanelTheme,
    required this.inputFieldTheme,
    required this.listTileTheme,
    required this.loadingIndicatorTheme,
    required this.paginationTheme,
    required this.selectTheme,
    required this.sonnerTheme,
    required this.switchTheme,
    required this.tabsTheme,
    required this.timePickerTheme,
    required this.toastTheme,
  });

  /// The overall brightness of this theme.
  final Brightness
      brightness;

  /// System-level colors mapped from brightness.
  final SColorsBase
      colorToken;

  /// The text styles for this theme.
  final STypographyBase
      typographyToken;

  // Component Themes
  final SAlertThemeData
      alertTheme;
  final SAvatarThemeData
      avatarTheme;
  final SButtonThemeData
      buttonTheme;
  final SCardThemeData
      cardTheme;
  final SCheckboxThemeData
      checkboxTheme;
  final SDialogThemeData
      dialogTheme;
  final SDropdownMenuThemeData
      dropdownMenuTheme;
  final SFloatingPanelThemeData
      floatingPanelTheme;
  final SInputFieldThemeData
      inputFieldTheme;
  final SListTileThemeData
      listTileTheme;
  final SLoadingIndicatorThemeData
      loadingIndicatorTheme;
  final SPaginationThemeData
      paginationTheme;
  final SSelectThemeData
      selectTheme;
  final SSonnerThemeData
      sonnerTheme;
  final SSwitchThemeData
      switchTheme;
  final STabsThemeData
      tabsTheme;
  final STimePickerThemeData
      timePickerTheme;
  final SToastThemeData
      toastTheme;

  /// Creates a default light theme.
  static SThemeData
      light() {
    return SThemeData(
        brightness: Brightness.light);
  }

  /// Creates a default dark theme.
  static SThemeData
      dark() {
    return SThemeData(
        brightness: Brightness.dark);
  }

  /// Copy with new components
  SThemeData
      copyWith({
    Brightness?
        brightness,
    SColorsBase?
        colorToken,
    STypographyBase?
        typographyToken,
    SAlertThemeData?
        alertTheme,
    SAvatarThemeData?
        avatarTheme,
    SButtonThemeData?
        buttonTheme,
    SCardThemeData?
        cardTheme,
    SCheckboxThemeData?
        checkboxTheme,
    SDialogThemeData?
        dialogTheme,
    SDropdownMenuThemeData?
        dropdownMenuTheme,
    SFloatingPanelThemeData?
        floatingPanelTheme,
    SInputFieldThemeData?
        inputFieldTheme,
    SListTileThemeData?
        listTileTheme,
    SLoadingIndicatorThemeData?
        loadingIndicatorTheme,
    SPaginationThemeData?
        paginationTheme,
    SSelectThemeData?
        selectTheme,
    SSonnerThemeData?
        sonnerTheme,
    SSwitchThemeData?
        switchTheme,
    STabsThemeData?
        tabsTheme,
    STimePickerThemeData?
        timePickerTheme,
    SToastThemeData?
        toastTheme,
  }) {
    return SThemeData
        .raw(
      brightness:
          brightness ?? this.brightness,
      colorToken:
          colorToken ?? this.colorToken,
      typographyToken:
          typographyToken ?? this.typographyToken,
      alertTheme:
          alertTheme ?? this.alertTheme,
      avatarTheme:
          avatarTheme ?? this.avatarTheme,
      buttonTheme:
          buttonTheme ?? this.buttonTheme,
      cardTheme:
          cardTheme ?? this.cardTheme,
      checkboxTheme:
          checkboxTheme ?? this.checkboxTheme,
      dialogTheme:
          dialogTheme ?? this.dialogTheme,
      dropdownMenuTheme:
          dropdownMenuTheme ?? this.dropdownMenuTheme,
      floatingPanelTheme:
          floatingPanelTheme ?? this.floatingPanelTheme,
      inputFieldTheme:
          inputFieldTheme ?? this.inputFieldTheme,
      listTileTheme:
          listTileTheme ?? this.listTileTheme,
      loadingIndicatorTheme:
          loadingIndicatorTheme ?? this.loadingIndicatorTheme,
      paginationTheme:
          paginationTheme ?? this.paginationTheme,
      selectTheme:
          selectTheme ?? this.selectTheme,
      sonnerTheme:
          sonnerTheme ?? this.sonnerTheme,
      switchTheme:
          switchTheme ?? this.switchTheme,
      tabsTheme:
          tabsTheme ?? this.tabsTheme,
      timePickerTheme:
          timePickerTheme ?? this.timePickerTheme,
      toastTheme:
          toastTheme ?? this.toastTheme,
    );
  }

  /// Interpolation between two themes
  static SThemeData lerp(
      SThemeData
          a,
      SThemeData
          b,
      double
          t) {
    if (t ==
        0) {
      return a;
    }
    if (t ==
        1) {
      return b;
    }

    return SThemeData
        .raw(
      brightness: t < 0.5
          ? a.brightness
          : b.brightness,
      colorToken: t < 0.5
          ? a.colorToken
          : b.colorToken,
      typographyToken: t < 0.5
          ? a.typographyToken
          : b.typographyToken,
      alertTheme:
          a.alertTheme.lerp(b.alertTheme, t),
      avatarTheme:
          a.avatarTheme.lerp(b.avatarTheme, t),
      buttonTheme:
          a.buttonTheme.lerp(b.buttonTheme, t),
      cardTheme:
          a.cardTheme.lerp(b.cardTheme, t),
      checkboxTheme:
          a.checkboxTheme.lerp(b.checkboxTheme, t),
      dialogTheme:
          a.dialogTheme.lerp(b.dialogTheme, t),
      dropdownMenuTheme:
          a.dropdownMenuTheme.lerp(b.dropdownMenuTheme, t),
      floatingPanelTheme:
          a.floatingPanelTheme.lerp(b.floatingPanelTheme, t),
      inputFieldTheme:
          a.inputFieldTheme.lerp(b.inputFieldTheme, t),
      listTileTheme:
          a.listTileTheme.lerp(b.listTileTheme, t),
      loadingIndicatorTheme:
          a.loadingIndicatorTheme.lerp(b.loadingIndicatorTheme, t),
      paginationTheme:
          a.paginationTheme.lerp(b.paginationTheme, t),
      selectTheme:
          a.selectTheme.lerp(b.selectTheme, t),
      sonnerTheme:
          a.sonnerTheme.lerp(b.sonnerTheme, t),
      switchTheme:
          a.switchTheme.lerp(b.switchTheme, t),
      tabsTheme:
          a.tabsTheme.lerp(b.tabsTheme, t),
      timePickerTheme:
          a.timePickerTheme.lerp(b.timePickerTheme, t),
      toastTheme:
          a.toastTheme.lerp(b.toastTheme, t),
    );
  }

  @override
  bool operator ==(
      Object
          other) {
    if (identical(
        this,
        other)) {
      return true;
    }
    if (other.runtimeType !=
        runtimeType) {
      return false;
    }
    return other is SThemeData &&
        other.brightness == brightness &&
        other.colorToken == colorToken &&
        other.typographyToken == typographyToken &&
        other.alertTheme == alertTheme &&
        other.avatarTheme == avatarTheme &&
        other.buttonTheme == buttonTheme &&
        other.cardTheme == cardTheme &&
        other.checkboxTheme == checkboxTheme &&
        other.dialogTheme == dialogTheme &&
        other.dropdownMenuTheme == dropdownMenuTheme &&
        other.floatingPanelTheme == floatingPanelTheme &&
        other.inputFieldTheme == inputFieldTheme &&
        other.listTileTheme == listTileTheme &&
        other.loadingIndicatorTheme == loadingIndicatorTheme &&
        other.paginationTheme == paginationTheme &&
        other.selectTheme == selectTheme &&
        other.sonnerTheme == sonnerTheme &&
        other.switchTheme == switchTheme &&
        other.tabsTheme == tabsTheme &&
        other.timePickerTheme == timePickerTheme &&
        other.toastTheme == toastTheme;
  }

  @override
  int get hashCode {
    return Object
        .hashAll(<Object?>[
      brightness,
      colorToken,
      typographyToken,
      alertTheme,
      avatarTheme,
      buttonTheme,
      cardTheme,
      checkboxTheme,
      dialogTheme,
      dropdownMenuTheme,
      floatingPanelTheme,
      inputFieldTheme,
      listTileTheme,
      loadingIndicatorTheme,
      paginationTheme,
      selectTheme,
      sonnerTheme,
      switchTheme,
      tabsTheme,
      timePickerTheme,
      toastTheme,
    ]);
  }
}

/// An interpolation between two [SThemeData]s.
class SThemeDataTween
    extends Tween<
        SThemeData> {
  SThemeDataTween(
      {super.begin,
      super.end});

  @override
  SThemeData lerp(double t) => SThemeData.lerp(
      begin!,
      end!,
      t);
}

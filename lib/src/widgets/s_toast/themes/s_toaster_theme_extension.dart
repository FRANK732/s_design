import 'package:flutter/material.dart';
import 's_toaster_theme.dart';

/// Extension to access [SToasterThemeData] from [ThemeData].
extension SToasterThemeExtension on ThemeData {
  /// Retrieves the current [SToasterThemeData].
  SToasterThemeData get sToasterTheme =>
      extension<SToasterThemeData>() ?? SToasterThemeData.light;
}

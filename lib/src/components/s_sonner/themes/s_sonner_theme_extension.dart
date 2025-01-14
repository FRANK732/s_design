import 'package:flutter/material.dart';
import '../../../components/s_sonner/themes/s_sonner_theme.dart';

/// Extension to access [SSonnerThemeData] from [ThemeData].
extension SToasterThemeExtension on ThemeData {
  /// Retrieves the current [SSonnerThemeData].
  SSonnerThemeData get sToasterTheme =>
      extension<SSonnerThemeData>() ?? SSonnerThemeData.light;
}

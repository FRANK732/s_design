import 'package:flutter/material.dart';
import '../../../components/s_progress_bar/themes/s_progress_bar_theme.dart';

/// Extension to access [SProgressBarThemeData] from [ThemeData].
extension SProgressBarThemeExtension on ThemeData {
  /// Retrieves the current [SProgressBarThemeData].
  SProgressBarThemeData get sProgressBarTheme =>
      extension<SProgressBarThemeData>() ?? SProgressBarThemeData.light;
}

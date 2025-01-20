import 'package:flutter/material.dart';
import '../../../components/s_list_tile/themes/t_list_tile_theme.dart';

/// Extension to access [SListTileThemeData] from [ThemeData].
extension SListTileThemeExtension on ThemeData {
  /// Retrieves the current [SListTileThemeData].
  SListTileThemeData get tListTileTheme =>
      extension<SListTileThemeData>() ?? SListTileThemeData.light;
}

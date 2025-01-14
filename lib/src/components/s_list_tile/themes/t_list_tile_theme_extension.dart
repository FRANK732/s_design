import 'package:flutter/material.dart';
import 't_list_tile_theme.dart';

/// Extension to access [TListTileThemeData] from [ThemeData].
extension TListTileThemeExtension on ThemeData {
  /// Retrieves the current [TListTileThemeData].
  TListTileThemeData get tListTileTheme =>
      extension<TListTileThemeData>() ?? TListTileThemeData.light;
}

// import 'package:flutter/material.dart';
//
// import 's_loading_indicator_theme.dart';
//
// /// Extension to access [SLoadingIndicatorThemeData] from [ThemeData].
// extension SLoadingIndicatorThemeExtension on ThemeData {
//   /// Retrieves the current [SLoadingIndicatorThemeData].
//   SLoadingIndicatorThemeData get sLoadingIndicatorTheme =>
//       extension<SLoadingIndicatorThemeData>() ??
//           SLoadingIndicatorThemeData.light();
//
//   /// Adds or updates the [SLoadingIndicatorThemeData] extension.
//   ThemeData copyWithSLoadingIndicatorTheme(SLoadingIndicatorThemeData theme) {
//     return copyWith(
//       extensions: <ThemeExtension<dynamic>>{
//         // Remove existing SLoadingIndicatorThemeData if present
//         ...extensions.values.where((element) => element is! SLoadingIndicatorThemeData),
//         theme as ThemeExtension<SLoadingIndicatorThemeData>,      },
//     );
//   }
// }

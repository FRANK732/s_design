import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SDropdownMenuThemeData extends ThemeExtension<SDropdownMenuThemeData> with Diagnosticable {
  const SDropdownMenuThemeData();

  factory SDropdownMenuThemeData.fromColorScheme(ColorScheme scheme) {
    return const SDropdownMenuThemeData();
  }

  @override
  SDropdownMenuThemeData copyWith() {
    return this;
  }

  @override
  SDropdownMenuThemeData lerp(ThemeExtension<SDropdownMenuThemeData>? other, double t) {
    return this;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is SDropdownMenuThemeData;

  @override
  int get hashCode => 0;
}

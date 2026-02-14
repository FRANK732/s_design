import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class LoadingConfig {
  const LoadingConfig({
    this.isLoading = false,
    this.indicator,
    this.bodyShimmer,
  });

  final bool isLoading;
  final SLoadingIndicator? indicator;
  final Widget? bodyShimmer;
}

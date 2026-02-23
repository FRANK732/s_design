import 'package:flutter/material.dart';

class RefreshConfig {
  const RefreshConfig({
    this.enabled =
        false,
    this.onRefresh,
    this.indicatorColor,
    this.indicatorBackgroundColor,
    this.triggerMode =
        RefreshIndicatorTriggerMode.onEdge,
    this.minimumDuration =
        1000,
  });
  final bool
      enabled;
  final Future<void>
          Function()?
      onRefresh;
  final Color?
      indicatorColor;
  final Color?
      indicatorBackgroundColor;
  final RefreshIndicatorTriggerMode
      triggerMode;
  final int
      minimumDuration;
}

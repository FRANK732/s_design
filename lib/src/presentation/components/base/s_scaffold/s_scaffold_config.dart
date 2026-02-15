import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widgets/floating_action_button_config.dart';
import 'widgets/loading_config.dart';
import 'widgets/persistent_footer_config.dart';
import 'widgets/refresh_config.dart';

/// Configuration for SScaffold.
///
/// This entity aggregates all configurations for a screen's scaffold.
class SScaffoldConfig {
  const SScaffoldConfig({
    this.appBar,
    this.renderBody,
    this.slivers,
    this.centerBody =
        false,
    this.drawer,
    this.renderFooter,
    this.scrollable =
        false,
    this.floatingActionButtonConfig,
    this.bodyPadding =
        EdgeInsets.zero,
    this.useSafeArea =
        true,
    this.persistentFooterConfig,
    this.persistentFooterDecoration,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.bottomSheetScrimBuilder,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary =
        true,
    this.drawerDragStartBehavior =
        DragStartBehavior.start,
    this.extendBody =
        false,
    this.extendBodyBehindAppBar =
        false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture =
        true,
    this.endDrawerEnableOpenDragGesture =
        true,
    this.drawerBarrierDismissible =
        true,
    this.restorationId,
    this.refreshConfig,
    this.loadingConfig,
  });

  final PreferredSizeWidget?
      appBar;
  final Widget
          Function(BuildContext context)?
      renderBody;
  final List<Widget>
          Function(BuildContext context)?
      slivers;
  final bool
      centerBody;
  final Widget?
      drawer;
  final Widget
          Function(BuildContext context)?
      renderFooter;
  final bool
      scrollable;
  final FloatingActionButtonConfig?
      floatingActionButtonConfig;
  final EdgeInsets
      bodyPadding;
  final bool
      useSafeArea;
  final PersistentFooterConfig?
      persistentFooterConfig;
  final BoxDecoration?
      persistentFooterDecoration;
  final DrawerCallback?
      onDrawerChanged;
  final Widget?
      endDrawer;
  final DrawerCallback?
      onEndDrawerChanged;
  final Widget?
      bottomNavigationBar;
  final Widget?
      bottomSheet;
  final Widget? Function(
      BuildContext,
      Animation<double>)? bottomSheetScrimBuilder;
  final Color?
      backgroundColor;
  final bool?
      resizeToAvoidBottomInset;
  final bool
      primary;
  final DragStartBehavior
      drawerDragStartBehavior;
  final bool
      extendBody;
  final bool
      extendBodyBehindAppBar;
  final Color?
      drawerScrimColor;
  final double?
      drawerEdgeDragWidth;
  final bool
      drawerEnableOpenDragGesture;
  final bool
      endDrawerEnableOpenDragGesture;
  final bool
      drawerBarrierDismissible;
  final String?
      restorationId;
  final RefreshConfig?
      refreshConfig;
  final LoadingConfig?
      loadingConfig;
}

import 'dart:async';
import 'dart:ui';
import 'dart:developer'
    as dev;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../s_design.dart';
import 's_floating_panel_config.dart';

class SFloatingPanel {
  static OverlayState?
      _overlayState;
  static OverlayEntry?
      _overlayEntry;
  static VoidCallback?
      _onCloseCallback;

  static bool
      _isPanelOpen =
      false;
  static AnimationController?
      _animationController;
  static Completer<void>?
      _completer;

  // Getter for isPanelOpen
  static bool
      get isPanelOpen =>
          _isPanelOpen;

  static void
      initialize(OverlayState overlayState) {
    _overlayState =
        overlayState;
    dev.log(
      'SFloatingPanel initialized with overlay state',
      name:
          'SFloatingPanel',
      time:
          DateTime.now(),
    );
  }

  static Future<void>
      show({
    required BuildContext
        context,
    SFloatingPanelConfig?
        config,
    Widget?
        content,
    Color?
        barrierColor,
    double?
        horizontalMargin,
    double?
        bottomMargin,
    double?
        panelSpacing,
    VoidCallback?
        onClose,
    Widget?
        customBottomWidget,
    Duration?
        animationDuration,
    bool isDismissable =
        true,
    BoxConstraints?
        constraints,
    EdgeInsetsGeometry?
        contentPadding,
    double?
        backdropBlur,
    Color?
        shadowColor,
    ShapeBorder?
        shape,
  }) async {
    // If not initialized, try to use context (though initialize is preferred for global usage)
    _overlayState ??=
        Overlay.of(context);

    final SFloatingPanelThemeData
        theme =
        Theme.of(context).sFloatingPanelTheme;

    // Remove existing panel if open
    if (_isPanelOpen) {
      close();
    }

    // Resolve effective values
    final double effectiveHorizontalMargin = horizontalMargin ??
        config?.horizontalMargin ??
        (theme.margin as EdgeInsets?)?.horizontal ??
        16.0 * 2; // Assuming symmetrical margin

    final double effectiveBottomMargin = bottomMargin ??
        config?.bottomMargin ??
        (theme.margin as EdgeInsets?)?.bottom ??
        16.0;

    final SFloatingPanelConfig
        effectiveConfig =
        SFloatingPanelConfig(
      content: content ??
          config?.content ??
          const SizedBox(),
      barrierColor: barrierColor ??
          config?.barrierColor ??
          theme.barrierColor ??
          const Color(0x80000000),
      horizontalMargin:
          effectiveHorizontalMargin,
      bottomMargin:
          effectiveBottomMargin,
      panelSpacing: panelSpacing ??
          config?.panelSpacing ??
          theme.panelSpacing ??
          15.0,
      onClose:
          onClose ?? config?.onClose,
      customBottomWidget:
          customBottomWidget ?? config?.customBottomWidget,
      animationDuration: animationDuration ??
          config?.animationDuration ??
          theme.animationDuration ??
          const Duration(milliseconds: 300),
      isDismissable:
          isDismissable, // Logic, not typically themed but can be in config
      constraints: constraints ??
          config?.constraints ??
          theme.constraints,
      contentPadding: contentPadding ??
          config?.contentPadding ??
          theme.contentPadding,
      backdropBlur: backdropBlur ??
          config?.backdropBlur ??
          theme.backdropBlur ??
          0.0,
      shadowColor: shadowColor ??
          config?.shadowColor ??
          theme.shadowColor,
      shape: shape ??
          config?.shape ??
          theme.shape,
    );

    assert(
        (effectiveConfig.horizontalMargin ?? 0) >= 0,
        'Horizontal margin must be non-negative');
    assert(
        (effectiveConfig.bottomMargin ?? 0) >= 0,
        'Bottom margin must be non-negative');
    assert(
        (effectiveConfig.panelSpacing ?? 0) >= 0,
        'Panel spacing must be non-negative');

    _onCloseCallback =
        effectiveConfig.onClose;

    dev.log(
      'Showing panel (Hot Swap: $_isPanelOpen) with horizontalMargin: ${effectiveConfig.horizontalMargin}, bottomMargin: ${effectiveConfig.bottomMargin}, '
      'panelSpacing: ${effectiveConfig.panelSpacing}, animationDuration: ${effectiveConfig.animationDuration?.inMilliseconds}ms, '
      'hasCustomBottomWidget: ${effectiveConfig.customBottomWidget != null}, isDismissable: ${effectiveConfig.isDismissable}',
      name:
          'SFloatingPanel',
      time:
          DateTime.now(),
    );

    // If already open, just update content and remeasure
    if (_isPanelOpen &&
        _overlayEntry != null &&
        _animationController != null) {
      _overlayEntry!.markNeedsBuild();

      // Remeasure after build
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // No longer need to measure widget sizes as the layout is handled by Positioned and Column
      });
      return _completer?.future ??
          Future.value();
    }

    // New Open
    _hideOverlay();
    _completer =
        Completer<void>();

    _animationController =
        AnimationController(
      duration:
          effectiveConfig.animationDuration,
      vsync:
          TickerProviderImpl(),
    );

    _animationController!.addStatusListener((AnimationStatus
        status) {
      dev.log('Animation status: $status',
          name: 'SFloatingPanel');
    });

    final Animation<Offset>
        slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _animationController!,
          curve: Curves.easeOut),
    );

    final Animation<double>
        opacityAnimation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);

    _overlayEntry =
        OverlayEntry(
      builder:
          (context) {
        return Stack(
          children: [
            // Barrier
            GestureDetector(
              onTap: effectiveConfig.isDismissable ? close : null,
              child: AnimatedBuilder(
                animation: _animationController!,
                builder: (context, child) {
                  final color = ColorTween(
                    begin: Colors.transparent,
                    end: effectiveConfig.barrierColor,
                  ).evaluate(_animationController!);

                  Widget barrier = Container(color: color);
                  if ((effectiveConfig.backdropBlur ?? 0) > 0) {
                    barrier = BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: (effectiveConfig.backdropBlur ?? 0) * _animationController!.value,
                        sigmaY: (effectiveConfig.backdropBlur ?? 0) * _animationController!.value,
                      ),
                      child: barrier,
                    );
                  }
                  return barrier;
                },
              ),
            ),
            // Floating Panel
            Positioned(
              left: (effectiveConfig.horizontalMargin ?? 0) / 2,
              right: (effectiveConfig.horizontalMargin ?? 0) / 2,
              bottom: effectiveConfig.bottomMargin ?? 16.0,
              child: SlideTransition(
                position: slideAnimation,
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: effectiveConfig.constraints ?? BoxConstraints.tightFor(width: double.infinity),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: effectiveConfig.contentPadding,
                              decoration: ShapeDecoration(
                                color: theme.backgroundColor ?? Colors.white,
                                shape: effectiveConfig.shape ??
                                    RoundedRectangleBorder(
                                      borderRadius: theme.borderRadius ?? BorderRadius.circular(16),
                                    ),
                                shadows: [
                                  BoxShadow(
                                    color: effectiveConfig.shadowColor ?? Colors.black12,
                                    blurRadius: theme.elevation ?? 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: effectiveConfig.content,
                            ),
                            if (effectiveConfig.customBottomWidget != null) ...[
                              SizedBox(height: effectiveConfig.panelSpacing),
                              effectiveConfig.customBottomWidget!,
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    _overlayState!
        .insert(_overlayEntry!);
    _isPanelOpen =
        true;
    _animationController!
        .forward();

    return _completer!
        .future;
  }

  static Future<void> _closePanel(
      AnimationController?
          animationController,
      Completer<void>?
          completer) async {
    _isPanelOpen =
        false;
    dev.log(
      'Closing panel, animationController: ${animationController != null}',
      name:
          'SFloatingPanel',
      time:
          DateTime.now(),
    );
    if (animationController !=
        null) {
      try {
        await animationController.reverse();
      } catch (e) {
        dev.log('Animation reverse cancelled: $e', name: 'SFloatingPanel');
      }

      // GUARD: If global controller has changed (due to new 'show'), abort cleanup
      if (_animationController !=
          animationController) {
        dev.log('Close preempted by new Show. Aborting old cleanup.', name: 'SFloatingPanel');
        try {
          animationController.dispose();
        } catch (_) {}
        return;
      }

      dev.log(
        'Animation reversed, hiding overlay',
        name: 'SFloatingPanel',
        time: DateTime.now(),
      );
      _hideOverlay();
      _onCloseCallback?.call();
      try {
        animationController.dispose();
      } catch (_) {}
      _animationController =
          null;
    } else {
      _hideOverlay();
      _onCloseCallback?.call();
    }
    _isPanelOpen =
        false;
    if (completer != null &&
        !completer.isCompleted) {
      completer.complete();
    }
    _completer =
        null;
  }

  static void
      _hideOverlay() {
    dev.log(
      'Hiding overlay and cleaning up resources',
      name:
          'SFloatingPanel',
      time:
          DateTime.now(),
    );
    _overlayEntry
        ?.remove();
    _overlayEntry =
        null;
    _onCloseCallback =
        null;

    // Cleanup Check
    if (_animationController !=
        null) {
      _animationController!.dispose();
      _animationController =
          null;
    }

    if (_completer != null &&
        !_completer!.isCompleted) {
      _completer!.complete();
      _completer =
          null;
    }

    _isPanelOpen =
        false;
  }

  static Future<void>
      close() async {
    if (!_isPanelOpen) {
      dev.log(
        'Close called but panel is not open',
        name: 'SFloatingPanel',
        time: DateTime.now(),
      );
      return;
    }
    await _closePanel(
        _animationController,
        _completer);
  }
}

class TickerProviderImpl
    extends TickerProvider {
  TickerProviderImpl();

  @override
  Ticker createTicker(
      TickerCallback
          onTick) {
    return Ticker(
        onTick);
  }
}

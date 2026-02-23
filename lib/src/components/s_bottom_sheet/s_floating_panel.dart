import 'dart:async';
import 'dart:developer'
    as dev;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  static Widget?
      _currentContent;
  static Widget?
      _currentBottomWidget;
  static GlobalKey
      _contentKey =
      GlobalKey();
  static GlobalKey
      _bottomWidgetKey =
      GlobalKey();

  static Future<void>
      show({
    required Widget
        content,
    Color barrierColor =
        const Color(0x80000000),
    double horizontalMargin =
        16.0,
    double bottomMargin =
        16.0,
    double panelSpacing =
        15.0,
    VoidCallback?
        onClose,
    Widget?
        customBottomWidget,
    Duration animationDuration =
        const Duration(milliseconds: 300),
    bool isDismissable =
        true,
  }) async {
    assert(
        horizontalMargin >= 0,
        'Horizontal margin must be non-negative');
    assert(
        bottomMargin >= 0,
        'Bottom margin must be non-negative');
    assert(
        panelSpacing >= 0,
        'Panel spacing must be non-negative');

    if (_overlayState ==
        null) {
      dev.log(
        'Error: Attempted to show panel without initializing overlay state',
        name: 'SFloatingPanel',
        level: 1000,
        time: DateTime.now(),
      );
      throw FlutterError(
        'SFloatingPanel not initialized. Call SFloatingPanel.initialize() first.',
      );
    }

    _currentContent =
        content;
    _currentBottomWidget =
        customBottomWidget;
    _onCloseCallback =
        onClose;

    dev.log(
      'Showing panel (Hot Swap: $_isPanelOpen) with horizontalMargin: $horizontalMargin, bottomMargin: $bottomMargin, '
      'panelSpacing: $panelSpacing, animationDuration: ${animationDuration.inMilliseconds}ms, '
      'hasCustomBottomWidget: ${customBottomWidget != null}, isDismissable: $isDismissable',
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
        await _measureWidgetSizes();
      });
      return _completer?.future ??
          Future<void>.value();
    }

    // New Open
    // Create a Completer to control when the Future completes
    _completer =
        Completer<void>();
    _hideOverlay();

    _contentKey =
        GlobalKey();
    _bottomWidgetKey =
        GlobalKey();

    _animationController =
        AnimationController(
      duration:
          animationDuration,
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
        fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController!,
          curve: Curves.easeIn),
    );

    _overlayEntry =
        OverlayEntry(
      builder: (BuildContext overlayContext) =>
          PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (!didPop && _isPanelOpen && isDismissable) {
            _closePanel(_animationController, _completer);
          }
        },
        child: Stack(
          children: <Widget>[
            FadeTransition(
              opacity: fadeAnimation,
              child: GestureDetector(
                onTap: isDismissable ? () => _closePanel(_animationController, _completer) : null,
                behavior: HitTestBehavior.opaque,
                child: Container(color: barrierColor),
              ),
            ),
            Positioned(
              left: horizontalMargin,
              right: horizontalMargin,
              bottom: bottomMargin,
              child: SlideTransition(
                position: slideAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Material(
                      key: _contentKey,
                      elevation: 8,
                      borderRadius: BorderRadius.circular(16),
                      clipBehavior: Clip.antiAlias,
                      child: _currentContent,
                    ),
                    if (_currentBottomWidget != null) ...<Widget>[
                      SizedBox(height: panelSpacing),
                      KeyedSubtree(
                        key: _bottomWidgetKey,
                        child: _currentBottomWidget!,
                      )
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    _overlayState!
        .insert(_overlayEntry!);
    _isPanelOpen =
        true;
    _animationController!
        .forward();

    WidgetsBinding
        .instance
        .addPostFrameCallback((_) async {
      await _measureWidgetSizes();
    });

    return _completer!
        .future;
  }

  static Future<void>
      _measureWidgetSizes() async {
    final RenderBox?
        contentRenderBox =
        _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (contentRenderBox !=
        null) {
      dev.log('Content height: ${contentRenderBox.size.height}',
          name: 'SFloatingPanel');
    }
    final RenderBox?
        bottomRenderBox =
        _bottomWidgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (bottomRenderBox !=
        null) {
      dev.log('Bottom widget height: ${bottomRenderBox.size.height}',
          name: 'SFloatingPanel');
    }
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
    _currentContent =
        null;
    _currentBottomWidget =
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

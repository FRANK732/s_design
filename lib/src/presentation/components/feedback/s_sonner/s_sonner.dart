import 'package:flutter/material.dart';
import '../../../../../s_design.dart';
import 'utils/s_sonner_utils.dart';

/// A toast notification system inspired by the Sonner library.
class SSonner {
  SSonner._internal();
  static final SSonner
      _instance =
      SSonner._internal();

  OverlayState?
      _overlayState;
  OverlayEntry?
      _overlayEntry;

  // ignore: prefer_final_fields
  final ValueNotifier<List<SSonnerConfig>>
      _toastsNotifier =
      ValueNotifier<List<SSonnerConfig>>(<SSonnerConfig>[]);

  /// Singleton instance of [SSonner].
  static SSonner
      get instance =>
          _instance;

  /// Initializes the [SSonner] with the [OverlayState].
  /// This must be called before showing any toasts.
  // ignore: use_setters_to_change_properties
  static void
      initialize(OverlayState overlayState) {
    _instance._overlayState =
        overlayState;
  }

  /// Shows a globally floating toast notification (Sonner style).
  ///
  /// Returns the unique ID of the toast generated, which can be passed to [dismiss]
  /// to forcefully remove this specific notification later.
  static String
      show({
    /// The primary string payload displayed prominently in the toast.
    String?
        message,
        
    /// Custom configuration object overriding themes securely.
    SSonnerConfig?
        config,
        
    /// High-level intent mapping (e.g., success, warning, error) that dictates colors and icons natively.
    SSonnerVariant variant =
        SSonnerVariant.info,
        
    /// Length of time the toast lives on screen before auto-dismissal.
    Duration duration =
        const Duration(seconds: 4),
        
    /// Gravitational pull dictating if the toast clusters at the top, center, or bottom of the screen.
    SSonnerPosition position =
        SSonnerPosition.bottom,
        
    /// Inline widget appended to the right side of the message text (typically an undo [SButton]).
    Widget?
        action,
        
    /// Whether to force the rendering of a manual "X" dismissal button.
    bool showCloseButton =
        false,
        
    /// Callback triggered when the user physically taps the body of the toast.
    VoidCallback?
        onTap,
        
    /// Callback triggered the moment the toast dies (either via timeout, swipe, or close API).
    VoidCallback?
        onDismiss,
        
    /// Optional graphical icon overriding the default inferred icon dictated by [variant].
    IconData?
        icon,
        
    /// Hardcoded manual tracking ID. If omitted, the engine assigns an auto-generated unique ID.
    String?
        id,
        
    /// If true, clears any currently visible toasts and replaces them with this new one instead of stacking.
    bool replace = 
        false,
  }) {
    return _instance
        ._show(
      message:
          message,
      config:
          config,
      variant:
          variant,
      duration:
          duration,
      position:
          position,
      action:
          action,
      showCloseButton:
          showCloseButton,
      onTap:
          onTap,
      onDismiss:
          onDismiss,
      icon:
          icon,
      id: id,
      replace: replace,
    );
  }

  String
      _show({
    String?
        message,
    SSonnerConfig?
        config,
    SSonnerVariant variant =
        SSonnerVariant.info,
    Duration duration =
        const Duration(seconds: 4),
    SSonnerPosition position =
        SSonnerPosition.bottom,
    Widget?
        action,
    bool showCloseButton =
        false,
    VoidCallback?
        onTap,
    VoidCallback?
        onDismiss,
    IconData?
        icon,
    String?
        id,
    bool replace = 
        false,
  }) {
    if (_overlayState ==
        null) {
      debugPrint('SSonner: Warning - OverlayState not initialized.');
      return '';
    }

    final String
        toastId =
        id ?? DateTime.now().microsecondsSinceEpoch.toString();

    final SSonnerConfig effectiveConfig = config?.copyWith(id: toastId) ??
        SSonnerConfig(
          id: toastId,
          message: message ?? '',
          variant: variant,
          duration: duration,
          position: position,
          action: action,
          showCloseButton: showCloseButton,
          onTap: onTap,
          onDismiss: onDismiss,
          icon: icon,
        );

    // Add to list
    final List<SSonnerConfig>
        currentToasts =
        List<SSonnerConfig>.from(_toastsNotifier.value);
        
    if (replace) {
      // Trigger onDismiss for existing toasts before clearing them (optional but good practice)
      for (final t in currentToasts) {
        t.onDismiss?.call();
      }
      currentToasts.clear();
    }

    currentToasts
        .add(effectiveConfig);
    _toastsNotifier.value =
        currentToasts;

    // Ensure overlay is present
    _ensureOverlay();

    return toastId;
  }

  /// Dismisses a toast by its ID.
  static void
      dismiss(String id) {
    _instance
        ._dismiss(id);
  }

  void _dismiss(
      String
          id) {
    final List<SSonnerConfig>
        currentToasts =
        List<SSonnerConfig>.from(_toastsNotifier.value);
    final int
        index =
        currentToasts.indexWhere((SSonnerConfig t) => t.id == id);

    if (index !=
        -1) {
      // Trigger callback if exists
      currentToasts[index].onDismiss?.call();

      currentToasts.removeAt(index);
      _toastsNotifier.value =
          currentToasts;

      if (currentToasts.isEmpty) {
        // We could remove the overlay here, but keeping it is fine for performance
        // if we expect more toasts. For now, leave it.
      }
    }
  }

  void
      _ensureOverlay() {
    if (_overlayEntry !=
        null) {
      if (_overlayEntry!.mounted) {
        _overlayEntry!.remove();
        _overlayState?.insert(_overlayEntry!);
      }
      return;
    }

    _overlayEntry =
        OverlayEntry(
      builder:
          (BuildContext context) {
        return _SonnerOverlay(
          toastsNotifier: _toastsNotifier,
          onDismiss: dismiss,
        );
      },
    );

    _overlayState
        ?.insert(_overlayEntry!);
  }
}

class _SonnerOverlay
    extends StatelessWidget {
  const _SonnerOverlay({
    required this.toastsNotifier,
    required this.onDismiss,
  });

  final ValueNotifier<List<SSonnerConfig>>
      toastsNotifier;
  final void
          Function(String id)
      onDismiss;

  @override
  Widget build(
      BuildContext
          context) {
    return ValueListenableBuilder<
        List<SSonnerConfig>>(
      valueListenable:
          toastsNotifier,
      builder: (BuildContext context,
          List<SSonnerConfig> toasts,
          Widget? child) {
        final List<SSonnerConfig> topToasts = toasts.where((SSonnerConfig t) => t.position == SSonnerPosition.top).toList();
        final List<SSonnerConfig> centerToasts = toasts.where((SSonnerConfig t) => t.position == SSonnerPosition.center).toList();
        final List<SSonnerConfig> bottomToasts = toasts.where((SSonnerConfig t) => t.position == SSonnerPosition.bottom).toList();

        return SafeArea(
          child: Stack(
            children: <Widget>[
              if (topToasts.isNotEmpty)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: _ToastStack(
                    toasts: topToasts,
                    isTop: true,
                    onDismiss: onDismiss,
                  ),
                ),
              if (centerToasts.isNotEmpty)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: _ToastStack(
                      toasts: centerToasts,
                      isTop: false,
                      onDismiss: onDismiss,
                    ),
                  ),
                ),
              if (bottomToasts.isNotEmpty)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _ToastStack(
                    toasts: bottomToasts,
                    isTop: false,
                    onDismiss: onDismiss,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ToastStack
    extends StatelessWidget {
  const _ToastStack({
    required this.toasts,
    required this.isTop,
    required this.onDismiss,
  });

  final List<SSonnerConfig>
      toasts;
  final bool
      isTop;
  final void
          Function(String id)
      onDismiss;

  @override
  Widget build(
      BuildContext
          context) {
    return Padding(
      padding:
          const EdgeInsets.all(16.0),
      child:
          Column(
        mainAxisSize: MainAxisSize.min,
        verticalDirection: isTop ? VerticalDirection.down : VerticalDirection.up,
        children: toasts.map((SSonnerConfig toast) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: _ToastWidget(
              key: ValueKey<String>(toast.id ?? ''),
              config: toast,
              onDismiss: () => onDismiss(toast.id ?? ''),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ToastWidget
    extends StatefulWidget {
  const _ToastWidget({
    super.key,
    required this.config,
    required this.onDismiss,
  });

  final SSonnerConfig
      config;
  final VoidCallback
      onDismiss;

  @override
  State<_ToastWidget>
      createState() =>
          _ToastWidgetState();
}

class _ToastWidgetState
    extends State<
        _ToastWidget>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _controller;
  late Animation<double>
      _opacity;
  late Animation<Offset>
      _offset;

  @override
  void
      initState() {
    super
        .initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300));

    _opacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut),
    );

    _offset = Tween<
        Offset>(
      begin:
          _getBeginOffset(widget.config.position),
      end:
          Offset.zero,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack));

    _controller
        .forward();

    // Auto dismiss
    Future<void>.delayed(
        widget.config.duration,
        () {
      if (mounted) {
        // Trigger exit animation
        _dismiss();
      }
    });
  }

  Offset _getBeginOffset(
      SSonnerPosition
          position) {
    switch (
        position) {
      case SSonnerPosition.top:
        return const Offset(0, -0.5);
      case SSonnerPosition.bottom:
      case SSonnerPosition.center:
        return const Offset(0, 0.5);
    }
  }

  Future<void> _dismiss() async {
    try {
      if (!mounted) return;
      await _controller.reverse();
      if (!mounted) return;
      widget.onDismiss();
    } catch (e) {
      if (mounted) {
        widget.onDismiss();
      }
    }
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SSonnerThemeData
        theme =
        STheme.of(context).sonnerTheme;
    final SSonnerConfig
        config =
        widget.config;

    // Per-toast overrides take priority; fall back to variant colour from theme.
    final Color
        variantAccentColor =
        config.accentColor ?? SSonnerUtils.getIconColor(config.variant, context);
    final Color
        baseBackgroundColor =
        config.backgroundColor ?? theme.backgroundColor;
    final Color backgroundColor = config.backgroundColor != null
        ? config.backgroundColor!
        : Color.alphaBlend(variantAccentColor.withOpacity(0.1), baseBackgroundColor);
    final Color
        borderColor =
        variantAccentColor.withOpacity(0.3);
    final Color
        textColor =
        config.textColor ?? theme.textColor;
    final double
        elevation =
        config.elevation ?? theme.elevation;

    return Dismissible(
      key:
          ValueKey<String>(config.id ?? ''),
      onDismissed: (_) =>
          widget.onDismiss(),
      child:
          SlideTransition(
        position: _offset,
        child: FadeTransition(
          opacity: _opacity,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: theme.margin,
              width: MediaQuery.of(context).size.width > 600 ? 400 : double.infinity,
              decoration: BoxDecoration(
                borderRadius: theme.borderRadius,
                border: Border.all(color: borderColor),
                boxShadow: elevation > 0 ? <BoxShadow>[
                  BoxShadow(
                     color: theme.shadowColor ?? Colors.black12,
                     blurRadius: elevation * 2,
                     offset: Offset(0, elevation),
                  ),
                ] : null,
              ),
              child: ClipRRect(
                borderRadius: theme.borderRadius,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Coloured left accent stripe — reflects the variant.
                      Container(width: 4, color: variantAccentColor),
                      // Main toast body.
                      Expanded(
                        child: ColoredBox(
                          color: backgroundColor,
                          child: InkWell(
                            onTap: config.onTap,
                            child: Padding(
                              padding: theme.padding ?? const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  if (config.leading != null)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12.0),
                                      child: config.leading,
                                    )
                                  else if (config.icon != null || config.variant != SSonnerVariant.info)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12.0),
                                      child: Icon(
                                        config.icon ?? SSonnerUtils.getIconData(config.variant),
                                        color: variantAccentColor,
                                        size: 20,
                                      ),
                                    ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        if (config.title != null)
                                          Text(
                                            config.title!,
                                            style: theme.titleStyle?.copyWith(color: textColor),
                                          ),
                                        if (config.title != null && config.message.isNotEmpty) const SizedBox(height: 4),
                                        if (config.message.isNotEmpty)
                                          Text(
                                            config.message,
                                            style: theme.descriptionStyle?.copyWith(
                                              color: config.title != null ? textColor.withOpacity(0.8) : textColor,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (config.action != null) ...<Widget>[
                                    const SizedBox(width: 12),
                                    config.action!,
                                  ],
                                  if (config.showCloseButton) ...<Widget>[
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: _dismiss,
                                      borderRadius: BorderRadius.circular(16),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.close,
                                          size: 16,
                                          color: theme.closeIconColor ?? textColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

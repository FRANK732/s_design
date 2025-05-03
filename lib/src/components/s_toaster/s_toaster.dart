import 'package:flutter/material.dart';
import '../../components/s_toaster/enums/s_toaster_enum.dart';
import 'dart:developer' as developer;

class SToast extends StatefulWidget {
  final String description;
  final String? title;
  final Widget? action;
  final SToastVariant variant;
  final Duration duration;
  final VoidCallback? onClose;

  const SToast({
    super.key,
    required this.description,
    this.title,
    this.action,
    this.variant = SToastVariant.defaultVariant,
    this.duration = const Duration(seconds: 5),
    this.onClose,
  });

  @override
  _SToastState createState() => _SToastState();

  static OverlayState? _overlayState;
  static final Map<String, OverlayEntry> _activeToasts = {};

  static void initialize(OverlayState overlayState) {
    developer.log('SToast: Initializing with OverlayState', name: 'SToast');
    _overlayState = overlayState;
  }

  static void show({
    required String description,
    String? title,
    Widget? action,
    SToastVariant variant = SToastVariant.defaultVariant,
    Duration duration = const Duration(seconds: 5),
    VoidCallback? onClose,
    String? id = 'default',
  }) {
    if (_overlayState == null) {
      developer.log('SToast: Error: OverlayState not initialized',
          name: 'SToast', error: 'Call initialize() first');
      throw Exception('SToast is not initialized. Call initialize() first.');
    }

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => SToast(
        description: description,
        title: title,
        action: action,
        variant: variant,
        duration: duration,
        onClose: () {
          developer.log('SToast: Removing toast with id: $id', name: 'SToast');
          overlayEntry.remove();
          if (id != null) _activeToasts.remove(id);
          onClose?.call();
        },
      ),
    );

    if (id != null) {
      _activeToasts[id]?.remove();
      _activeToasts[id] = overlayEntry;
      developer.log('SToast: Active toasts: ${_activeToasts.keys}',
          name: 'SToast');
    }

    developer.log('SToast: Showing toast with id: $id, duration: $duration',
        name: 'SToast');
    _overlayState!.insert(overlayEntry);
  }

  static void dismiss({String? id}) {
    if (id != null) {
      developer.log('SToast: Dismissing toast with id: $id', name: 'SToast');
      _activeToasts[id]?.remove();
      _activeToasts.remove(id);
    } else {
      developer.log('SToast: Dismissing all toasts', name: 'SToast');
      _activeToasts.values.forEach((entry) => entry.remove());
      _activeToasts.clear();
    }
  }
}

class _SToastState extends State<SToast> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    developer.log('SToast: Initializing toast state', name: 'SToast');

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();

    if (widget.duration != Duration.zero) {
      developer.log('SToast: Scheduling auto-dismiss after ${widget.duration}',
          name: 'SToast');
      Future.delayed(widget.duration, _closeToast);
    } else {
      developer.log('SToast: No auto-dismiss (duration is zero)',
          name: 'SToast');
    }
  }

  @override
  void dispose() {
    developer.log('SToast: Disposing toast state', name: 'SToast');
    _animationController.dispose();
    super.dispose();
  }

  void _closeToast() {
    if (!_isVisible) {
      developer.log('SToast: Toast already closed, skipping', name: 'SToast');
      return;
    }
    developer.log('SToast: Closing toast', name: 'SToast');
    _animationController.reverse().then((_) {
      setState(() {
        _isVisible = false;
      });
      widget.onClose?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      developer.log('SToast: Toast not visible, returning empty widget',
          name: 'SToast');
      return const SizedBox.shrink();
    }

    final mediaQuery = MediaQuery.of(context);
    final topPadding = mediaQuery.viewPadding.top;

    final colorScheme = Theme.of(context).colorScheme;
    final dividerColor = Theme.of(context).dividerColor;
    final isDestructive = widget.variant == SToastVariant.destructive;

    final backgroundColor =
        isDestructive ? colorScheme.errorContainer : colorScheme.surface;
    final textColor =
        isDestructive ? colorScheme.onErrorContainer : colorScheme.onSurface;
    final borderColor = isDestructive ? colorScheme.error : dividerColor;

    return Positioned(
      top: topPadding,
      right: 16.0,
      left: 16.0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            onDismissed: (_) {
              developer.log('SToast: Toast dismissed by swipe', name: 'SToast');
              _closeToast();
            },
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                title: widget.title != null
                    ? Text(
                        widget.title!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      )
                    : null,
                subtitle: Text(
                  widget.description,
                  style: TextStyle(
                    color: textColor.withOpacity(0.9),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.action != null) widget.action!,
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: textColor.withOpacity(0.7),
                      ),
                      onPressed: () {
                        developer.log('SToast: Toast dismissed by close button',
                            name: 'SToast');
                        _closeToast();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

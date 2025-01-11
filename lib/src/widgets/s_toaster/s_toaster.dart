import 'package:flutter/material.dart';

import 'enums/s_toaster_enum.dart';

/// Represents a toast notification with customizable properties.
class SToast extends StatefulWidget {
  /// The message or description to display in the toast.
  final String description;

  /// The title of the toast (optional).
  final String? title;

  /// An optional action button within the toast.
  final Widget? action;

  /// The variant of the toast, affecting its styling.
  final SToastVariant variant;

  /// The duration for which the toast is displayed.
  final Duration duration;

  /// Callback when the toast is closed.
  final VoidCallback? onClose;

  /// Creates an instance of TToast.
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

  /// The OverlayState to insert the toast into.
  static OverlayState? _overlayState;

  /// Initializes the TToast system with the provided OverlayState.
  static void initialize(OverlayState overlayState) {
    _overlayState = overlayState;
  }

  /// Static method to show the toast using the initialized OverlayState.
  static void show({
    required String description,
    String? title,
    Widget? action,
    SToastVariant variant = SToastVariant.defaultVariant,
    Duration duration = const Duration(seconds: 5),
    VoidCallback? onClose,
  }) {
    if (_overlayState == null) {
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
          overlayEntry.remove();
          onClose?.call();
        },
      ),
    );

    _overlayState!.insert(overlayEntry);
  }
}

class _SToastState extends State<SToast> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller.
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

    // Start the timer to auto-dismiss the toast.
    Future.delayed(widget.duration, _closeToast);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeToast() {
    if (!_isVisible) return;
    _animationController.reverse().then((value) {
      setState(() {
        _isVisible = false;
      });
      widget.onClose?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    final isDestructive = widget.variant == SToastVariant.destructive;
    final backgroundColor = isDestructive
        ? Colors.red.shade300
        : Theme.of(context).colorScheme.surface;
    final borderColor =
        isDestructive ? Colors.red.shade900 : Theme.of(context).dividerColor;
    final textColor = isDestructive ? Colors.white : Colors.blue.shade700;

    return Positioned(
      top: 16.0,
      right: 16.0,
      left: 16.0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) => _closeToast(),
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
                      onPressed: _closeToast,
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

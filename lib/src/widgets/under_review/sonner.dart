import 'package:flutter/material.dart';

class Sonner {
  static final Sonner _instance = Sonner._internal();
  OverlayState? _overlayState;
  final List<_ToastEntry> _queue = [];
  bool _isShowing = false;

  Sonner._internal();

  static Sonner get instance => _instance;

  void initialize(OverlayState? overlayState) {
    if (overlayState == null) {
      throw Exception('OverlayState cannot be null');
    }
    if (_overlayState != null) {
      // Prevent reinitialization
      return;
    }
    _overlayState = overlayState;
  }

  /// Show a sonner
  void show({
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    TextStyle? textStyle,
    IconData? icon,
    ToastPosition position = ToastPosition.bottom,
    ToastSize size = ToastSize.md,
  }) {
    if (_overlayState == null) {
      throw Exception(
          'AdvancedToast is not initialized. Call initialize() first.');
    }

    final entry = _ToastEntry(
      message: message,
      type: type,
      duration: duration,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      icon: icon,
      position: position,
      size: size,
    );

    _queue.add(entry);
    _displayNext();
  }

  void _displayNext() {
    if (_isShowing || _queue.isEmpty || _overlayState == null) return;

    _isShowing = true;
    final currentToast = _queue.removeAt(0);

    final overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(entry: currentToast),
    );

    _overlayState?.insert(overlayEntry);

    Future.delayed(currentToast.duration + const Duration(milliseconds: 300),
        () {
      overlayEntry.remove();
      _isShowing = false;
      _displayNext();
    });
  }
}

enum ToastType { success, error, warning, info }

enum ToastPosition { top, center, bottom }

enum ToastSize { sm, md, lg }

class _ToastEntry {
  final String message;
  final ToastType type;
  final Duration duration;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final IconData? icon;
  final ToastPosition position;
  final ToastSize size;

  _ToastEntry({
    required this.message,
    this.type = ToastType.info,
    this.duration = const Duration(seconds: 3),
    this.backgroundColor,
    this.textStyle,
    this.icon,
    this.position = ToastPosition.bottom,
    this.size = ToastSize.md,
  });
}

class _ToastWidget extends StatelessWidget {
  final _ToastEntry entry;

  const _ToastWidget({required this.entry});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        entry.backgroundColor ?? _getBackgroundColor(entry.type);
    IconData icon = entry.icon ?? _getIcon(entry.type);

    Alignment alignment;
    double verticalOffset = 50.0;

    switch (entry.position) {
      case ToastPosition.top:
        alignment = Alignment.topCenter;
        break;
      case ToastPosition.center:
        alignment = Alignment.center;
        verticalOffset = 0;
        break;
      case ToastPosition.bottom:
      default:
        alignment = Alignment.bottomCenter;
        break;
    }

    double paddingValue;
    TextStyle textStyle;

    switch (entry.size) {
      case ToastSize.sm:
        paddingValue = 8.0;
        textStyle = entry.textStyle ?? Theme.of(context).textTheme.bodySmall!;
        break;
      case ToastSize.lg:
        paddingValue = 16.0;
        textStyle = entry.textStyle ?? Theme.of(context).textTheme.bodyLarge!;
        break;
      case ToastSize.md:
      default:
        paddingValue = 12.0;
        textStyle = entry.textStyle ?? Theme.of(context).textTheme.bodyMedium!;
        break;
    }

    EdgeInsetsGeometry? margin;

    switch (entry.size) {
      case ToastSize.sm:
        margin = const EdgeInsets.symmetric(horizontal: 6);
        break;
      case ToastSize.md:
        margin = const EdgeInsets.symmetric(horizontal: 12);
        break;
      case ToastSize.lg:
        margin = const EdgeInsets.symmetric(horizontal: 18);
        break;
      default:
        margin = const EdgeInsets.symmetric(horizontal: 12);
        break;
    }

    return Stack(
      children: [
        Align(
          alignment: alignment,
          child: Padding(
            padding: EdgeInsets.only(
              top: alignment == Alignment.topCenter ? verticalOffset : 0,
              bottom: alignment == Alignment.bottomCenter ? verticalOffset : 0,
            ),
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
              child: Material(
                color: Colors.transparent,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(paddingValue),
                    margin: margin,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, color: Colors.white),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            entry.message,
                            style: textStyle,
                            softWrap: true,
                            overflow: TextOverflow.visible,
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
      ],
    );
  }

  Color _getBackgroundColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.redAccent;
      case ToastType.warning:
        return Colors.blueGrey;
      case ToastType.info:
      default:
        return Colors.blue;
    }
  }

  IconData _getIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Icons.check_circle_outline;
      case ToastType.error:
        return Icons.error_outline_outlined;
      case ToastType.warning:
        return Icons.info_outline_rounded;
      case ToastType.info:
      default:
        return Icons.info_outline_sharp;
    }
  }
}

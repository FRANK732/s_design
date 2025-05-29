import 'package:flutter/material.dart';

import '../../components/s_sonner/utils/s_sonner_utils.dart';
import '../../theme/s_dimension.dart';
import '../../theme/theme_extension.dart';
import 'enums/s_sonner_options.dart';

class SSonner {
  SSonner._internal();
  static final SSonner _instance = SSonner._internal();
  OverlayState? _overlayState;
  final List<_ToastEntry> _queue = <_ToastEntry>[];
  bool _isShowing = false;

  static SSonner get instance => _instance;

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
    SSonnerVariant variant = SSonnerVariant.info,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    TextStyle? textStyle,
    IconData? icon,
    SSonnerPosition position = SSonnerPosition.bottom,
    SSonnerSize size = SSonnerSize.md,
  }) {
    if (_overlayState == null) {
      throw Exception('SSonner is not initialized. Call initialize() first.');
    }

    final _ToastEntry entry = _ToastEntry(
      message: message,
      type: variant,
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
    if (_isShowing || _queue.isEmpty || _overlayState == null) {
      return;
    }

    _isShowing = true;
    final _ToastEntry currentToast = _queue.removeAt(0);

    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _ToastWidget(entry: currentToast),
    );

    _overlayState?.insert(overlayEntry);

    Future<void>.delayed(
        currentToast.duration + const Duration(milliseconds: 300), () {
      overlayEntry.remove();
      _isShowing = false;
      _displayNext();
    });
  }
}

class _ToastEntry {
  _ToastEntry({
    required this.message,
    this.type = SSonnerVariant.info,
    this.duration = const Duration(seconds: 3),
    this.backgroundColor,
    this.textStyle,
    this.icon,
    this.position = SSonnerPosition.bottom,
    this.size = SSonnerSize.md,
  });
  final String message;
  final SSonnerVariant type;
  final Duration duration;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final IconData? icon;
  final SSonnerPosition position;
  final SSonnerSize size;
}

class _ToastWidget extends StatelessWidget {
  const _ToastWidget({required this.entry});
  final _ToastEntry entry;

  @override
  Widget build(BuildContext context) {
    // final colors = context.primaryColor;
    // final onPrimary = context.textOnPrimaryColor;
    final TextTheme textTheme = context.textThemeStyles;
    // final spacers = context.spacers;

    // Determine background color and icon based on variant
    final Color backgroundColor = entry.backgroundColor ??
        SSonnerUtils.getBackgroundColor(entry.type, context);
    final IconData icon = entry.icon ?? SSonnerUtils.getIconData(entry.type);

    Alignment alignment;
    double verticalOffset = 50.0;

    switch (entry.position) {
      case SSonnerPosition.top:
        alignment = Alignment.topCenter;
      case SSonnerPosition.center:
        alignment = Alignment.center;
        verticalOffset = 0;
      case SSonnerPosition.bottom:
        alignment = Alignment.bottomCenter;
    }

    double paddingValue;
    TextStyle textStyle;

    switch (entry.size) {
      case SSonnerSize.sm:
        paddingValue = 8.0;
        textStyle = entry.textStyle ?? textTheme.bodySmall!;
      case SSonnerSize.lg:
        paddingValue = 16.0;
        textStyle = entry.textStyle ?? textTheme.bodyLarge!;
      case SSonnerSize.md:
        paddingValue = 12.0;
        textStyle = entry.textStyle ?? textTheme.bodyMedium!;
    }

    EdgeInsetsGeometry? margin;

    switch (entry.size) {
      case SSonnerSize.sm:
        margin = const EdgeInsets.symmetric(horizontal: 6);
      case SSonnerSize.md:
        margin = const EdgeInsets.symmetric(horizontal: 12);
      case SSonnerSize.lg:
        margin = const EdgeInsets.symmetric(horizontal: 18);
    }

    return Stack(
      children: <Widget>[
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
                      borderRadius:
                          BorderRadius.circular(SDimensions.borderRadiusMedium),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(icon, color: Colors.white),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            entry.message,
                            style: textStyle.copyWith(color: Colors.white),
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
}

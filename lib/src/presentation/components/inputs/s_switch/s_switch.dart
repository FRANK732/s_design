import 'package:flutter/material.dart';

import '../../../../domain/entities/config/s_switch_enums.dart';

class SSwitch
    extends StatefulWidget {
  const SSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.loading =
        false,
    this.size =
        SSwitchSize.medium,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.checkedChildren,
    this.unCheckedChildren,
    this.disabled =
        false,
    this.semanticLabel,
  });

  final bool
      value;
  final ValueChanged<bool>?
      onChanged;
  final bool
      loading;
  final bool
      disabled;
  final SSwitchSize
      size;
  final Color?
      activeColor;
  final Color?
      inactiveColor;
  final Color?
      thumbColor;
  final Widget?
      checkedChildren;
  final Widget?
      unCheckedChildren;
  final String?
      semanticLabel;

  @override
  State<SSwitch>
      createState() =>
          _SSwitchState();
}

class _SSwitchState
    extends State<
        SSwitch>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _animationController;
  late Animation<Alignment>
      _alignmentAnimation;

  @override
  void
      initState() {
    super
        .initState();
    _animationController =
        AnimationController(
      vsync:
          this,
      duration:
          const Duration(milliseconds: 200),
    );

    _alignmentAnimation =
        AlignmentTween(
      begin:
          Alignment.centerLeft,
      end:
          Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent:
          _animationController,
      curve:
          Curves.easeInOut,
    ));

    if (widget
        .value) {
      _animationController.value =
          1.0;
    }
  }

  @override
  void didUpdateWidget(
      SSwitch
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (oldWidget.value !=
        widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void
      dispose() {
    _animationController
        .dispose();
    super
        .dispose();
  }

  void
      _handleTap() {
    if (widget.loading ||
        widget
            .disabled ||
        widget.onChanged == null) {
      return;
    }
    widget
        .onChanged!(!widget.value);
  }

  @override
  Widget build(
      BuildContext
          context) {
    // Defaults
    final double height = widget.size == SSwitchSize.small
        ? 16.0
        : 22.0;
    final double minWidth = widget.size == SSwitchSize.small
        ? 28.0
        : 44.0;
    final double thumbSize = widget.size == SSwitchSize.small
        ? 12.0
        : 18.0;
    const double
        padding =
        2.0;

    final ThemeData theme =
        Theme.of(context);
    final Color activeColor =
        widget.activeColor ?? theme.primaryColor;
    final Color inactiveColor =
        widget.inactiveColor ?? const Color(0xFFBFBFBF); // Gray (approx)
    final Color thumbColor =
        widget.thumbColor ?? Colors.white;

    return Semantics(
      label:
          widget.semanticLabel,
      toggled:
          widget.value,
      enabled:
          !widget.disabled,
      child:
          Opacity(
        opacity: widget.disabled ? 0.5 : 1.0,
        child: IgnorePointer(
          ignoring: widget.disabled || widget.loading,
          child: GestureDetector(
            onTap: _handleTap,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  height: height,
                  constraints: BoxConstraints(minWidth: minWidth),
                  padding: const EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    color: widget.value ? activeColor : inactiveColor,
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      // 1. Ghost Layout determines intrinsics
                      // We show both contents (invisible) to reserve space for the largest one?
                      // Or just the visible one? Resizes.
                      // Let's use the currently relevant children plus thumb space to size it.
                      Opacity(
                        opacity: 0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Left Text Space
                            if (widget.checkedChildren != null && widget.value)
                              Padding(
                                padding: const EdgeInsets.only(left: 6, right: 4),
                                child: widget.checkedChildren,
                              ),

                            // Thumb Space
                            SizedBox(width: thumbSize),

                            // Right Text Space
                            if (widget.unCheckedChildren != null && !widget.value)
                              Padding(
                                padding: const EdgeInsets.only(left: 4, right: 6),
                                child: widget.unCheckedChildren,
                              ),
                          ],
                        ),
                      ),

                      // 2. Visible Children (Positioned)
                      if (widget.value && widget.checkedChildren != null)
                        Positioned(
                          left: 6,
                          child: Center(
                            child: DefaultTextStyle(
                              style: TextStyle(color: Colors.white, fontSize: widget.size == SSwitchSize.small ? 10 : 12, fontWeight: FontWeight.w500),
                              child: widget.checkedChildren!,
                            ),
                          ),
                        ),

                      if (!widget.value && widget.unCheckedChildren != null)
                        Positioned(
                          right: 6,
                          child: Center(
                            child: DefaultTextStyle(
                              style: TextStyle(color: Colors.white, fontSize: widget.size == SSwitchSize.small ? 10 : 12, fontWeight: FontWeight.w500),
                              child: widget.unCheckedChildren!,
                            ),
                          ),
                        ),

                      // 3. Thumb (Align inside Positioned.fill)
                      // Positioned.fill forces the Align widget to match the Stack's size (determined by Ghost Layout)
                      // instead of expanding to infinity.
                      Positioned.fill(
                        child: Align(
                          alignment: _alignmentAnimation.value,
                          child: Container(
                            width: thumbSize,
                            height: thumbSize,
                            decoration: BoxDecoration(
                              color: thumbColor,
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: widget.loading
                                ? Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                      color: widget.value ? activeColor : inactiveColor,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

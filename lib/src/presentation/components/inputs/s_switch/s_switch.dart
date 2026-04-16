import 'package:flutter/material.dart';

import '../../../../domain/entities/config/s_switch_enums.dart';

/// An elegant, heavily customizable switch component for toggling binary states.
///
/// The [SSwitch] natively supports animations, size variants, custom track widgets,
/// and an embedded [thumbIcon] while cleanly matching system design aesthetics.
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
    this.thumbIcon,
    this.disabled =
        false,
    this.semanticLabel,
  });

  /// Determines whether the switch is currently turned on (`true`) or off (`false`).
  final bool
      value;

  /// Callback fired when the user taps on the switch.
  /// The switch does not mutate its own state; it expects the parent to update [value].
  final ValueChanged<bool>?
      onChanged;

  /// If `true`, a circular loading spinner is rendered inside the thumb and the switch ignores interaction.
  final bool
      loading;

  /// Determines if the switch is interactable. When `true`, the switch ignores interaction and visually dims.
  final bool
      disabled;

  /// The physical sizing scale of the switch (defaults to [SSwitchSize.medium]).
  final SSwitchSize
      size;

  /// The background color of the switch track when it is turned on.
  /// Falls back to your application's primary theme color.
  final Color?
      activeColor;

  /// The background color of the switch track when it is turned off.
  final Color?
      inactiveColor;

  /// The color of the moving circular thumb. Defaults to white if null.
  final Color?
      thumbColor;

  /// A widget (usually text or an icon) displayed inside the track's left side when the switch is turned ON.
  final Widget?
      checkedChildren;

  /// A widget (usually text or an icon) displayed inside the track's right side when the switch is turned OFF.
  final Widget?
      unCheckedChildren;

  /// A widget (usually an [Icon]) that is rendered directly inside the moving thumb circle.
  /// Automatically scaled and perfectly centered via FittedBox.
  final Widget?
      thumbIcon;

  /// An optional semantic representation of the switch, highly recommended for Accessibility/TalkBack tools.
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
        widget.disabled ||
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

    final ThemeData
        theme =
        Theme.of(context);
    final Color
        activeColor =
        widget.activeColor ?? theme.colorScheme.primary;
    final Color
        inactiveColor =
        widget.inactiveColor ?? theme.colorScheme.surfaceContainerHighest;
    final Color
        thumbColor =
        widget.thumbColor ?? (theme.brightness == Brightness.dark ? theme.colorScheme.onPrimary : theme.colorScheme.surface);

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
                      Opacity(
                        opacity: 0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (widget.checkedChildren != null && widget.value)
                              Padding(
                                padding: const EdgeInsets.only(left: 6, right: 4),
                                child: widget.checkedChildren,
                              ),
                            SizedBox(width: thumbSize),
                            if (widget.unCheckedChildren != null && !widget.value)
                              Padding(
                                padding: const EdgeInsets.only(left: 4, right: 6),
                                child: widget.unCheckedChildren,
                              ),
                          ],
                        ),
                      ),
                      if (widget.value && widget.checkedChildren != null)
                        Positioned(
                          left: 6,
                          child: Center(
                            child: DefaultTextStyle(
                              style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: widget.size == SSwitchSize.small ? 10 : 12, fontWeight: FontWeight.w500),
                              child: widget.checkedChildren!,
                            ),
                          ),
                        ),
                      if (!widget.value && widget.unCheckedChildren != null)
                        Positioned(
                          right: 6,
                          child: Center(
                            child: DefaultTextStyle(
                              style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: widget.size == SSwitchSize.small ? 10 : 12, fontWeight: FontWeight.w500),
                              child: widget.unCheckedChildren!,
                            ),
                          ),
                        ),
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
                                  color: theme.colorScheme.shadow.withOpacity(0.15),
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
                                : (widget.thumbIcon != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: FittedBox(child: widget.thumbIcon),
                                      )
                                    : null),
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

import 'package:flutter/material.dart';
import 'enums/s_switch_enums.dart';
import 'utils/s_switch_utils.dart';

/// A customizable and accessible switch component
class SSwitch extends StatefulWidget {
  /// Creates an [SSwitch].
  const SSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = SSwitchSize.medium,
    this.variant = SSwitchVariant.filled,
    this.animationDuration,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.semanticLabel,
  });

  /// The current state of the switch.
  final bool value;

  /// Called when the switch is toggled.
  final ValueChanged<bool> onChanged;

  /// Size of the switch.
  final SSwitchSize size;

  /// Variant of the switch.
  final SSwitchVariant variant;

  /// Duration of the toggle animation.
  final Duration? animationDuration;

  /// Active color when the switch is on.
  final Color? activeColor;

  /// Inactive color when the switch is off.
  final Color? inactiveColor;

  /// Color of the switch thumb.
  final Color? thumbColor;

  /// Accessibility label for the switch.
  final String? semanticLabel;

  @override
  State<SSwitch> createState() => _SSwitchState();
}

class _SSwitchState extends State<SSwitch> with SingleTickerProviderStateMixin {
  late bool _value;
  late AnimationController _animationController;
  late Animation<double> _thumbAnimation;

  @override
  void initState() {
    super.initState();
    _value = widget.value;

    // Default to 300ms if no duration is provided
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? const Duration(milliseconds: 300),
    );

    _thumbAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Set initial animation position if the switch is on
    if (_value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant SSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _value = widget.value;
            if (_value) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          });
        }
      });
    }
  }

  void toggleSwitch({bool animated = true}) {
    setState(() {
      _value = !_value;
      if (animated) {
        if (_value) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      } else {
        _animationController.value = _value ? 1.0 : 0.0;
      }
      widget.onChanged(_value);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    // Determine final colors from props or fallback to theme
    final Size switchSize = SSwitchUtils.getSwitchSize(widget.size);

    final Color activeColor = widget.activeColor ?? colorScheme.primary;
    final Color inactiveColor =
        widget.inactiveColor ?? colorScheme.onSurface.withOpacity(0.4);
    final Color thumbColor = widget.thumbColor ?? colorScheme.onSecondaryFixedVariant;

    final SSwitchVariant variant = widget.variant;

    return Semantics(
      label: widget.semanticLabel ?? 'Switch',
      toggled: _value,
      child: GestureDetector(
        onTap: toggleSwitch,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            final Color backgroundColor = _value ? activeColor : inactiveColor;
            return Container(
              width: switchSize.width,
              height: switchSize.height,
              decoration: SSwitchUtils.getVariantDecoration(
                variant,
                backgroundColor,
                inactiveColor,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: _thumbAnimation.value *
                        (switchSize.width - switchSize.height),
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: switchSize.height,
                      height: switchSize.height,
                      decoration: BoxDecoration(
                        color: thumbColor,
                        shape: BoxShape.circle,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

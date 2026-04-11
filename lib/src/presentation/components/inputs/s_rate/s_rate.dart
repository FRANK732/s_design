import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 's_rate_item.dart';
import 's_rate_style.dart';

class SRate
    extends StatefulWidget {
  const SRate({
    super.key,
    this.value,
    this.defaultValue =
        0,
    this.count =
        5,
    this.allowHalf =
        false,
    this.allowClear =
        true,
    this.disabled =
        false,
    this.character,
    this.tooltips,
    this.onChange,
    this.onHoverChange,
    this.style,
  });

  /// Current value (controlled mode).
  final double?
      value;

  /// Default value (uncontrolled mode).
  final double
      defaultValue;

  /// Number of stars/items.
  final int
      count;

  /// Whether to allow half selection.
  final bool
      allowHalf;

  /// Whether to allow clearing by clicking the generic value again.
  final bool
      allowClear;

  /// Whether read-only.
  final bool
      disabled;

  /// Custom character widget (default Star).
  final Widget?
      character;

  /// Tooltips for each item.
  final List<String>?
      tooltips;

  /// Callback when value changes.
  final ValueChanged<double>?
      onChange;

  /// Callback when hover value changes.
  final ValueChanged<double>?
      onHoverChange;

  /// Styling configuration.
  final SRateStyle?
      style;

  @override
  State<SRate>
      createState() =>
          _SRateState();
}

class _SRateState
    extends State<
        SRate> {
  late double
      _value;
  double?
      _hoverValue;

  @override
  void
      initState() {
    super
        .initState();
    _value =
        widget.value ?? widget.defaultValue;
  }

  @override
  void didUpdateWidget(
      covariant SRate
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.value != null &&
        widget.value != oldWidget.value) {
      _value =
          widget.value!;
    }
  }

  void _handleHover(
      int
          index,
      bool
          isHalf) {
    if (widget
        .disabled) {
      return;
    }
    double
        hoverValue =
        index + 1.0;
    if (widget.allowHalf &&
        isHalf) {
      hoverValue -=
          0.5;
    }
    setState(
        () {
      _hoverValue =
          hoverValue;
    });
    widget
        .onHoverChange
        ?.call(hoverValue);
  }

  void
      _handleExit() {
    if (widget
        .disabled) {
      return;
    }
    setState(
        () {
      _hoverValue =
          null;
    });
    widget
        .onHoverChange
        ?.call(0); // Or null? Logic usually resets
  }

  void _handleClick(
      int
          index,
      bool
          isHalf) {
    if (widget
        .disabled) {
      return;
    }
    double
        newValue =
        index + 1.0;
    if (widget.allowHalf &&
        isHalf) {
      newValue -=
          0.5;
    }

    // Clear logic
    if (widget.allowClear &&
        newValue == _value) {
      newValue =
          0;
      setState(() {
        _value = 0;
        _hoverValue = null; // Reset hover on click clear?
      });
      widget.onChange?.call(0);
      return;
    }

    setState(
        () {
      _value =
          newValue;
    });
    widget
        .onChange
        ?.call(newValue);
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SRateStyle
        defaultStyle =
        SRateStyle(
      color:
          Colors.amber, // Default equivalent
      unselectedColor:
          Theme.of(context).colorScheme.outlineVariant,
      size:
          20,
      gap:
          8,
    );

    final Color?
        effectiveColor =
        widget.style?.color ?? defaultStyle.color;
    final Color?
        effectiveUnselectedColor =
        widget.style?.unselectedColor ?? defaultStyle.unselectedColor;
    final double?
        effectiveSize =
        widget.style?.size ?? defaultStyle.size;
    final double?
        effectiveGap =
        widget.style?.gap ?? defaultStyle.gap;

    final double
        displayValue =
        _hoverValue ?? _value;
    final Widget
        effectiveCharacter =
        widget.character ?? const Icon(Icons.star_rate_rounded);

    return Row(
      mainAxisSize:
          MainAxisSize.min,
      children:
          List<Widget>.generate(widget.count, (int index) {
        final double itemValue = index + 1.0;
        final bool isFull = displayValue >= itemValue;
        final bool isHalf = widget.allowHalf && (displayValue + 0.5 >= itemValue) && !isFull;

        // Render Item Logic
        // 0 = empty, 0.5 = half, 1 = full
        double percent = 0;
        if (isFull) {
          percent = 1;
        } else if (isHalf) {
          percent = 0.5;
        }

        Widget item = SRateItem(
          percent: percent,
          character: effectiveCharacter,
          color: widget.disabled && widget.style?.disabledColor != null ? widget.style?.disabledColor : effectiveColor,
          unselectedColor: effectiveUnselectedColor,
          size: effectiveSize,
        );

        if (widget.tooltips != null && index < widget.tooltips!.length) {
          item = Tooltip(
            message: widget.tooltips![index],
            child: item,
          );
        }

        return Padding(
          padding: EdgeInsets.only(right: index == widget.count - 1 ? 0 : (effectiveGap ?? 0)),
          child: MouseRegion(
            onEnter: (_) {},
            onExit: (_) {},
            child: GestureDetector(
              onTapUp: (TapUpDetails details) {
                // Logic moved to inner items
              },
              child: _buildInteractiveItem(index, item),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildInteractiveItem(
      int
          index,
      Widget
          child) {
    return MouseRegion(
      onExit: (PointerExitEvent event) =>
          _handleExit(),
      child:
          LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GestureDetector(
            onTapUp: (TapUpDetails details) {
              final RenderBox? box = context.findRenderObject() as RenderBox?;
              if (box != null) {
                final Offset localPos = box.globalToLocal(details.globalPosition);
                final bool isLeft = localPos.dx < box.size.width / 2;
                _handleClick(index, isLeft);
              }
            },
            child: MouseRegion(
              onHover: (PointerHoverEvent event) {
                final RenderBox? box = context.findRenderObject() as RenderBox?;
                if (box != null) {
                  final Offset localPos = box.globalToLocal(event.position);
                  final bool isLeft = localPos.dx < box.size.width / 2;
                  _handleHover(index, isLeft);
                }
              },
              child: child,
            ),
          );
        },
      ),
    );
  }
}

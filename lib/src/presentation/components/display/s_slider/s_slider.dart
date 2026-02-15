import 'package:flutter/material.dart';

enum SSliderType {
  single,
  range
}

class SSlider
    extends StatefulWidget {
  const SSlider.single({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min =
        0.0,
    this.max =
        1.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.tooltipVisible =
        true,
    this.marks,
    this.vertical =
        false,
  })  : type = SSliderType.single,
        rangeValues = null,
        onRangeChanged = null;

  const SSlider.range({
    super.key,
    required this.rangeValues,
    required this.onRangeChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min =
        0.0,
    this.max =
        1.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.tooltipVisible =
        true,
    this.marks,
    this.vertical =
        false,
  })  : type = SSliderType.range,
        value = 0,
        onChanged = null;

  final SSliderType
      type;

  // Single
  final double
      value;
  final ValueChanged<double>?
      onChanged;

  // Range
  final RangeValues?
      rangeValues;
  final ValueChanged<RangeValues>?
      onRangeChanged;

  // Common
  final ValueChanged<double>?
      onChangeStart;
  final ValueChanged<double>?
      onChangeEnd;
  final double
      min;
  final double
      max;
  final int?
      divisions;
  final String?
      label;
  final Color?
      activeColor;
  final Color?
      inactiveColor;
  final Color?
      thumbColor;
  final bool
      tooltipVisible;
  final Map<
      double,
      Widget>? marks;
  final bool
      vertical;

  @override
  State<SSlider>
      createState() =>
          _SSliderState();
}

class _SSliderState
    extends State<
        SSlider> {
  @override
  Widget build(
      BuildContext
          context) {
    if (widget
        .vertical) {
      return RotatedBox(
        quarterTurns: 3, // Rotates 270 degrees (Bottom to Top)
        child: _buildSliderLayout(context),
      );
    }
    return _buildSliderLayout(
        context);
  }

  Widget _buildSliderLayout(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    final primaryColor =
        widget.activeColor ?? theme.primaryColor;

    // Ant Design Style Theme
    final sliderTheme =
        SliderThemeData(
      trackHeight:
          4.0,
      activeTrackColor:
          primaryColor,
      inactiveTrackColor:
          widget.inactiveColor ?? Colors.grey.shade300,
      disabledActiveTrackColor:
          Colors.grey.shade400,
      disabledInactiveTrackColor:
          Colors.grey.shade200,
      activeTickMarkColor:
          Colors.white.withOpacity(0.7),
      inactiveTickMarkColor:
          primaryColor.withOpacity(0.7),
      thumbColor:
          widget.thumbColor ?? Colors.white,
      thumbShape:
          const _AntDesignThumbShape(),
      overlayColor:
          primaryColor.withOpacity(0.12),
      overlayShape:
          const RoundSliderOverlayShape(overlayRadius: 20.0),
      tickMarkShape:
          const RoundSliderTickMarkShape(tickMarkRadius: 0), // Hide default ticks or custom?
      showValueIndicator: widget.tooltipVisible
          ? ShowValueIndicator.always
          : ShowValueIndicator.never,
      valueIndicatorShape:
          _AntDesignValueIndicatorShape(),
      valueIndicatorColor:
          Colors.black.withOpacity(0.8), // Tooltip bg
      valueIndicatorTextStyle:
          const TextStyle(color: Colors.white, fontSize: 12),
      rangeThumbShape:
          const _AntDesignRangeThumbShape(),
    );

    Widget
        sliderWidget =
        SliderTheme(
      data:
          sliderTheme,
      child: widget.type == SSliderType.single
          ? Slider(
              value: widget.value,
              onChanged: widget.onChanged,
              onChangeStart: widget.onChangeStart,
              onChangeEnd: widget.onChangeEnd,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              label: widget.label ?? (widget.tooltipVisible ? widget.value.toStringAsFixed(0) : null),
            )
          : RangeSlider(
              values: widget.rangeValues!,
              onChanged: widget.onRangeChanged,
              onChangeStart: widget.onChangeStart != null ? (RangeValues val) => widget.onChangeStart!(val.start) : null,
              onChangeEnd: widget.onChangeEnd != null ? (RangeValues val) => widget.onChangeEnd!(val.end) : null,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              labels: widget.label != null ? RangeLabels(widget.label!, widget.label!) : (widget.tooltipVisible ? RangeLabels(widget.rangeValues!.start.toStringAsFixed(0), widget.rangeValues!.end.toStringAsFixed(0)) : null),
            ),
    );

    if (widget.marks != null &&
        widget.marks!.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sliderWidget,
          _buildMarks(context),
        ],
      );
    }

    return sliderWidget;
  }

  Widget _buildMarks(
      BuildContext
          context) {
    return LayoutBuilder(
      builder:
          (context, constraints) {
        final double width = constraints.maxWidth;
        // Slider has default padding depending on thumb size.
        // We assume standard Material Slider padding of 24.
        const double sidePadding = 24.0;
        final double trackWidth = width - (sidePadding * 2);

        return Container(
          height: 30,
          margin: const EdgeInsets.symmetric(horizontal: sidePadding),
          // We use Stack to position marks absolutely based on value
          child: Stack(
            clipBehavior: Clip.none,
            children: widget.marks!.entries.map((entry) {
              final double value = entry.key;
              final Widget label = entry.value;

              // Normalize value to 0..1
              final double percent = (value - widget.min) / (widget.max - widget.min);
              final double left = percent * trackWidth;

              return Positioned(
                left: left - 15, // center 30 wide box
                width: 30,
                top: 4,
                child: Center(
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    child: label,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

// Custom Paint for Ant Design Handle (White circle with border and shadow)
class _AntDesignThumbShape
    extends SliderComponentShape {
  final double
      thumbRadius =
      6.0;

  const _AntDesignThumbShape();

  @override
  Size getPreferredSize(
      bool
          isEnabled,
      bool
          isDiscrete) {
    return Size.fromRadius(
        thumbRadius);
  }

  @override
  void
      paint(
    PaintingContext
        context,
    Offset
        center, {
    required Animation<double>
        activationAnimation,
    required Animation<double>
        enableAnimation,
    required bool
        isDiscrete,
    required TextPainter
        labelPainter,
    required RenderBox
        parentBox,
    required SliderThemeData
        sliderTheme,
    required TextDirection
        textDirection,
    required double
        value,
    required double
        textScaleFactor,
    required Size
        sizeWithOverflow,
  }) {
    final Canvas
        canvas =
        context.canvas;

    // Shadow
    final Path
        shadowPath =
        Path()..addOval(Rect.fromCircle(center: center, radius: thumbRadius + 2));
    canvas.drawShadow(
        shadowPath,
        Colors.black.withOpacity(0.15),
        3.0,
        true);

    // Fill (White)
    final Paint
        fillPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    canvas.drawCircle(
        center,
        thumbRadius,
        fillPaint);

    // Border (Primary Color)
    final Paint
        borderPaint =
        Paint()
          ..color = sliderTheme.activeTrackColor ?? Colors.blue
          ..strokeWidth = 2.0
          ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        center,
        thumbRadius,
        borderPaint);

    // Ant Design specific: On hover/active, the thumb might grow or show tooltip.
    // SliderTheme handles overlay.
  }
}

class _AntDesignRangeThumbShape
    extends RangeSliderThumbShape {
  final double
      thumbRadius =
      6.0;

  const _AntDesignRangeThumbShape();

  @override
  Size getPreferredSize(
      bool
          isEnabled,
      bool
          isDiscrete) {
    return Size.fromRadius(
        thumbRadius);
  }

  @override
  void
      paint(
    PaintingContext
        context,
    Offset
        center, {
    required Animation<double>
        activationAnimation,
    required Animation<double>
        enableAnimation,
    bool isDiscrete =
        false,
    bool isEnabled =
        false,
    bool isOnTop =
        false,
    required SliderThemeData
        sliderTheme,
    TextDirection?
        textDirection,
    Thumb?
        thumb,
    bool?
        isPressed,
  }) {
    final Canvas
        canvas =
        context.canvas;

    // Shadow
    final Path
        shadowPath =
        Path()..addOval(Rect.fromCircle(center: center, radius: thumbRadius + 2));
    canvas.drawShadow(
        shadowPath,
        Colors.black.withOpacity(0.15),
        3.0,
        true);

    // Fill
    final Paint
        fillPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    canvas.drawCircle(
        center,
        thumbRadius,
        fillPaint);

    // Border
    final Paint
        borderPaint =
        Paint()
          ..color = sliderTheme.activeTrackColor ?? Colors.blue
          ..strokeWidth = 2.0
          ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        center,
        thumbRadius,
        borderPaint);
  }
}

class _AntDesignValueIndicatorShape
    extends SliderComponentShape {
  @override
  Size getPreferredSize(
      bool
          isEnabled,
      bool
          isDiscrete) {
    return const Size(
        40,
        30);
  }

  @override
  void
      paint(
    PaintingContext
        context,
    Offset
        center, {
    required Animation<double>
        activationAnimation,
    required Animation<double>
        enableAnimation,
    required bool
        isDiscrete,
    required TextPainter
        labelPainter,
    required RenderBox
        parentBox,
    required SliderThemeData
        sliderTheme,
    required TextDirection
        textDirection,
    required double
        value,
    required double
        textScaleFactor,
    required Size
        sizeWithOverflow,
  }) {
    final Canvas
        canvas =
        context.canvas;
    final double
        scale =
        activationAnimation.value;
    if (scale ==
        0)
      return;

    // Adjust position above thumb
    final Offset
        tooltipCenter =
        center - const Offset(0, 38);
    final Rect tooltipRect = Rect.fromCenter(
        center: tooltipCenter,
        width: labelPainter.width + 16,
        height: labelPainter.height + 8);

    final Paint
        paint =
        Paint()
          ..color = sliderTheme.valueIndicatorColor!
          ..style = PaintingStyle.fill;

    final RRect
        rrect =
        RRect.fromRectAndRadius(tooltipRect, const Radius.circular(4));
    canvas.drawRRect(
        rrect,
        paint);

    // Small arrow down
    final Path
        arrowPath =
        Path()
          ..moveTo(tooltipCenter.dx - 4, tooltipRect.bottom)
          ..lineTo(tooltipCenter.dx, tooltipRect.bottom + 4)
          ..lineTo(tooltipCenter.dx + 4, tooltipRect.bottom)
          ..close();
    canvas.drawPath(
        arrowPath,
        paint);

    labelPainter
        .paint(
      canvas,
      tooltipCenter -
          Offset(labelPainter.width / 2, labelPainter.height / 2),
    );
  }
}

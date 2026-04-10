import 'package:flutter/material.dart';

import '../../../themes/s_theme.dart';
import '../../../themes/s_theme_data.dart';

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

  /// The active progression mapping exactly where the thumb sits (specifically for `SSlider.single`).
  final double
      value;

  /// Interaction callback triggered constantly during dragging for `SSlider.single`.
  final ValueChanged<double>?
      onChanged;

  // Range

  /// Twin values defining the start and end thumbs (specifically for `SSlider.range`).
  final RangeValues?
      rangeValues;

  /// Interaction callback triggered constantly during dragging for `SSlider.range`.
  final ValueChanged<RangeValues>?
      onRangeChanged;

  // Common

  /// Callback fired specifically when the user initiates contact with the thumb.
  final ValueChanged<double>?
      onChangeStart;

  /// Callback fired physically when the user releases the thumb.
  final ValueChanged<double>?
      onChangeEnd;

  /// The absolute floor value mapping to the left-most edge (defaults to `0.0`).
  final double
      min;

  /// The absolute ceiling value mapping to the right-most edge (defaults to `1.0`).
  final double
      max;

  /// Enforces integer snapping steps if provided, breaking the smooth slide interpolation.
  final int?
      divisions;

  /// Explicit string text overriding the physical tooltip value rendering.
  final String?
      label;

  /// Explicit color dictating the active 'filled' track and thumb highlighting.
  final Color?
      activeColor;

  /// Tint covering the remaining empty track.
  final Color?
      inactiveColor;

  /// Tint covering the thumb handle explicitly (defaults to surface white).
  final Color?
      thumbColor;

  /// Instructs the engine to render hovering tooltips above the active thumbs.
  final bool
      tooltipVisible;

  /// Complex mapping of numeric step values to physical custom widgets (draws tick-marks labels underneath).
  final Map<
      double,
      Widget>? marks;

  /// Instructs the rendering layout to rotate the slider 90 degrees into a vertical axis.
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
        quarterTurns: 3,
        child: _buildSliderLayout(context),
      );
    }
    return _buildSliderLayout(
        context);
  }

  Widget _buildSliderLayout(
      BuildContext
          context) {
    final SThemeData
        sTheme =
        STheme.of(context);
    final Color
        primaryColor =
        widget.activeColor ?? sTheme.colorToken.primary;

    // Style Theme
    final SliderThemeData
        sliderTheme =
        SliderThemeData(
      trackHeight:
          4.0,
      activeTrackColor:
          primaryColor,
      inactiveTrackColor:
          widget.inactiveColor ?? sTheme.colorToken.divider,
      disabledActiveTrackColor:
          primaryColor.withOpacity(0.5),
      disabledInactiveTrackColor:
          sTheme.colorToken.divider.withOpacity(0.5),
      activeTickMarkColor:
          Colors.white.withOpacity(0.7),
      inactiveTickMarkColor:
          primaryColor.withOpacity(0.7),
      thumbColor:
          widget.thumbColor ?? sTheme.colorToken.surface,
      thumbShape:
          const _DefaultThumbShape(),
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
          _DefaultValueIndicatorShape(),
      valueIndicatorColor:
          sTheme.colorToken.textPrimary, // Tooltip bg
      valueIndicatorTextStyle:
          TextStyle(color: sTheme.colorToken.surface, fontSize: 12),
      rangeThumbShape:
          const _DefaultRangeThumbShape(),
    );

    String
        formatValue(double v) {
      final String
          s =
          v.toStringAsFixed(2);
      if (s.endsWith('.00')) {
        return s.substring(0, s.length - 3);
      }
      if (s.endsWith('0')) {
        return s.substring(0, s.length - 1);
      }
      return s;
    }

    final Widget
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
              label: widget.label ?? (widget.tooltipVisible ? formatValue(widget.value) : null),
            )
          : RangeSlider(
              values: widget.rangeValues!,
              onChanged: widget.onRangeChanged,
              onChangeStart: widget.onChangeStart != null ? (RangeValues val) => widget.onChangeStart!(val.start) : null,
              onChangeEnd: widget.onChangeEnd != null ? (RangeValues val) => widget.onChangeEnd!(val.end) : null,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              labels: widget.label != null ? RangeLabels(widget.label!, widget.label!) : (widget.tooltipVisible ? RangeLabels(formatValue(widget.rangeValues!.start), formatValue(widget.rangeValues!.end)) : null),
            ),
    );

    if (widget.marks != null &&
        widget.marks!.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
    final SThemeData
        sTheme =
        STheme.of(context);
    return LayoutBuilder(
      builder:
          (BuildContext context, BoxConstraints constraints) {
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
            children: widget.marks!.entries.map((MapEntry<double, Widget> entry) {
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
                    style: TextStyle(fontSize: 12, color: sTheme.colorToken.textSecondary),
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

// Custom Paint for Handle (White circle with border and shadow)
class _DefaultThumbShape
    extends SliderComponentShape {
  const _DefaultThumbShape();

  final double
      thumbRadius =
      10.0;

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

    // Fill
    final Paint
        fillPaint =
        Paint()
          ..color = sliderTheme.thumbColor ?? Colors.white
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

    // Specific: On hover/active, the thumb might grow or show tooltip.
    // SliderTheme handles overlay.
  }
}

class _DefaultRangeThumbShape
    extends RangeSliderThumbShape {
  const _DefaultRangeThumbShape();

  final double
      thumbRadius =
      10.0;

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
          ..color = sliderTheme.thumbColor ?? Colors.white
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

class _DefaultValueIndicatorShape
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
        0) {
      return;
    }

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

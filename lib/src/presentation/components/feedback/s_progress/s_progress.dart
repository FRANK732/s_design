import 'dart:math'
    as math;
import 'package:flutter/material.dart';

import '../../../themes/s_theme.dart';
import '../../../themes/s_theme_data.dart';
import '../../../themes/tokens/colors.dart';
import '../../../themes/tokens/typography.dart';

enum SProgressType {
  line,
  circle,
  dashboard
}

enum SProgressStatus {
  normal,
  success,
  exception,
  active
}

class SProgress
    extends StatelessWidget {
  const SProgress.line({
    super.key,
    this.percent =
        0,
    this.status,
    this.showInfo =
        true,
    this.format,
    this.strokeColor,
    this.trailColor,
    this.strokeWidth,
    this.strokeGradient,
    this.steps,
    this.width,
    this.strokeLinecap =
        StrokeCap.round,
    this.indeterminate =
        false,
    this.bufferValue,
    this.bufferColor,
    this.vertical =
        false,
    this.animationDuration,
  })  : type = SProgressType.line,
        gapDegree = null,
        gapPosition = null;

  const SProgress.circle({
    super.key,
    this.percent =
        0,
    this.status,
    this.showInfo =
        true,
    this.format,
    this.strokeColor,
    this.trailColor,
    this.strokeWidth,
    this.strokeGradient,
    this.width,
    this.strokeLinecap =
        StrokeCap.round,
    this.animationDuration,
  })  : type = SProgressType.circle,
        gapDegree = null,
        gapPosition = null,
        steps = null,
        indeterminate = false,
        bufferValue = null,
        bufferColor = null,
        vertical = false;

  const SProgress.dashboard({
    super.key,
    this.percent =
        0,
    this.status,
    this.showInfo =
        true,
    this.format,
    this.strokeColor,
    this.trailColor,
    this.strokeWidth,
    this.strokeGradient,
    this.width,
    this.gapDegree =
        75,
    this.gapPosition,
    this.strokeLinecap =
        StrokeCap.round,
    this.animationDuration,
  })  : type = SProgressType.dashboard,
        steps = null,
        indeterminate = false,
        bufferValue = null,
        bufferColor = null,
        vertical = false;

  final double
      percent; // 0 to 100
  final SProgressType
      type;
  final SProgressStatus?
      status;
  final bool
      showInfo;
  final Widget?
      format;
  final Color?
      strokeColor;
  final Color?
      trailColor;
  final double?
      strokeWidth;
  final Gradient?
      strokeGradient;
  final int?
      steps;
  final double?
      width;
  final double?
      gapDegree;
  final SProgressGapPosition?
      gapPosition;
  final StrokeCap
      strokeLinecap;

  // New properties from SProgressBar
  final bool
      indeterminate;
  final double?
      bufferValue;
  final Color?
      bufferColor;
  final bool
      vertical;
  final Duration?
      animationDuration;

  @override
  Widget build(
      BuildContext
          context) {
    // Determine effective status
    SProgressStatus
        effectiveStatus =
        status ?? SProgressStatus.normal;
    if (percent >= 100 &&
        status == null) {
      effectiveStatus =
          SProgressStatus.success;
    }

    // Colors
    final SThemeData
        theme =
        STheme.of(context);
    final SColorsBase
        colorToken =
        theme.colorToken;

    final Color
        effectiveTrailColor =
        trailColor ?? colorToken.progressBackground;
    Color
        effectiveStrokeColor =
        strokeColor ?? colorToken.progressValue;

    if (effectiveStatus ==
        SProgressStatus
            .success) {
      effectiveStrokeColor =
          strokeColor ?? colorToken.primary;
    } else if (effectiveStatus ==
        SProgressStatus.exception) {
      effectiveStrokeColor =
          strokeColor ?? colorToken.error;
    }

    if (type ==
        SProgressType.line) {
      return _buildLineProgress(
          context,
          effectiveStatus,
          effectiveStrokeColor,
          effectiveTrailColor);
    }

    // Circle / Dashboard
    return _buildCircleProgress(
        context,
        effectiveStatus,
        effectiveStrokeColor,
        effectiveTrailColor);
  }

  Widget _buildCircleProgress(
      BuildContext
          context,
      SProgressStatus
          status,
      Color
          strokeColor,
      Color
          trailColor) {
    return LayoutBuilder(builder:
        (BuildContext context, BoxConstraints constraints) {
      final double
          size =
          width ?? constraints.maxWidth;
      // Ensure specific size if constraints are infinite (e.g. inside Column)
      final double effectiveSize = size.isFinite
          ? size
          : 120.0;

      return SizedBox(
        width: effectiveSize,
        height: effectiveSize,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CustomPaint(
              size: Size(effectiveSize, effectiveSize),
              painter: _CircleProgressPainter(
                percent: percent,
                strokeWidth: strokeWidth ?? 6.0,
                strokeColor: strokeColor,
                trailColor: trailColor,
                strokeGradient: strokeGradient,
                gapDegree: type == SProgressType.dashboard ? (gapDegree ?? 75.0) : 0.0,
                gapPosition: gapPosition ?? SProgressGapPosition.bottom,
                strokeLinecap: strokeLinecap,
              ),
            ),
            if (showInfo) _buildInfo(context, status, strokeColor),
          ],
        ),
      );
    });
  }

  Widget _buildLineProgress(
      BuildContext
          context,
      SProgressStatus
          status,
      Color
          strokeColor,
      Color
          trailColor) {
    if (steps !=
        null) {
      return _buildStepsProgress(
          context,
          status,
          strokeColor,
          trailColor);
    }

    return LayoutBuilder(builder:
        (BuildContext context, BoxConstraints constraints) {
      final double
          trackThickness =
          strokeWidth ?? 8.0;
      final Color
          effBufferColor =
          bufferColor ?? strokeColor.withOpacity(0.3);

      final Widget
          progressWidget =
          Container(
        clipBehavior: Clip.antiAlias,
        height: vertical ? (width ?? constraints.maxHeight) : trackThickness,
        width: vertical ? trackThickness : (width ?? constraints.maxWidth),
        decoration: BoxDecoration(
          color: trailColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          alignment: vertical ? Alignment.bottomCenter : Alignment.centerLeft,
          children: <Widget>[
            // Buffer Value
            if (bufferValue != null && !indeterminate)
              FractionallySizedBox(
                heightFactor: vertical ? (bufferValue! / 100).clamp(0.0, 1.0) : null,
                widthFactor: vertical ? null : (bufferValue! / 100).clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: effBufferColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),

            // Actual Progress (Indeterminate)
            if (indeterminate)
              Positioned.fill(
                child: _IndeterminateProgressAnimation(
                  color: strokeGradient?.colors.first ?? strokeColor,
                  vertical: vertical,
                ),
              )
            else
              // Actual Progress (Determinate)
              FractionallySizedBox(
                heightFactor: vertical ? (percent / 100).clamp(0.0, 1.0) : null,
                widthFactor: vertical ? null : (percent / 100).clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: strokeGradient == null ? strokeColor : null,
                    gradient: strokeGradient,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: status == SProgressStatus.active ? const _ActiveProgressAnimation() : null,
                ),
              ),
          ],
        ),
      );

      // Wrap with Info if not vertical (usually vertical bars don't have text besides them in the same row)
      if (showInfo &&
          !vertical) {
        return Row(
          children: <Widget>[
            Expanded(child: progressWidget),
            const SizedBox(width: 8),
            _buildInfo(context, status, strokeColor),
          ],
        );
      } else if (showInfo &&
          vertical) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(child: progressWidget),
            const SizedBox(height: 8),
            _buildInfo(context, status, strokeColor),
          ],
        );
      }

      return progressWidget;
    });
  }

  Widget _buildStepsProgress(
      BuildContext
          context,
      SProgressStatus
          status,
      Color
          strokeColor,
      Color
          trailColor) {
    // Implement steps logic separately if needed using Row of containers
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: List.generate(steps!, (int index) {
              final double stepValue = 100 / steps!;
              final bool isActive = percent >= (index + 1) * stepValue;

              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: index == steps! - 1 ? 0 : 2),
                  height: strokeWidth ?? 8.0,
                  decoration: BoxDecoration(
                    color: isActive ? strokeColor : trailColor,
                    // Only first and last get rounded corners? Or all? Usually all rounded.
                    // But if small gap, maybe. Let's assume typical step bar.
                  ),
                ),
              );
            }),
          ),
        ),
        if (showInfo) ...<Widget>[
          const SizedBox(width: 8),
          _buildInfo(context, status, strokeColor),
        ],
      ],
    );
  }

  Widget _buildInfo(
      BuildContext
          context,
      SProgressStatus
          status,
      Color
          strokeColor) {
    if (format !=
        null) {
      return format!;
    }

    final SThemeData
        sTheme =
        STheme.of(context);
    final SColorsBase
        colorToken =
        sTheme.colorToken;
    final STypographyBase
        typographyToken =
        sTheme.typographyToken;

    if (status ==
        SProgressStatus.exception) {
      return Icon(Icons.cancel,
          color: colorToken.error,
          size: 16); // Circle Cross
    }
    if (status ==
        SProgressStatus.success) {
      return Icon(Icons.check_circle,
          color: strokeColor,
          size: 16);
    }

    return Text(
      '${percent.toInt()}%',
      style:
          typographyToken.bodyMedium.copyWith(
        color: colorToken.textSecondary,
        fontSize: 13,
      ),
    );
  }
}

enum SProgressGapPosition {
  top,
  bottom,
  left,
  right
}

class _ActiveProgressAnimation
    extends StatefulWidget {
  const _ActiveProgressAnimation();

  @override
  State<_ActiveProgressAnimation>
      createState() =>
          _ActiveProgressAnimationState();
}

class _ActiveProgressAnimationState
    extends State<
        _ActiveProgressAnimation>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _controller;

  @override
  void
      initState() {
    super
        .initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return LayoutBuilder(
      builder:
          (BuildContext context, BoxConstraints constraints) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: _ActivePainter(_controller.value),
            );
          },
        );
      },
    );
  }
}

class _ActivePainter
    extends CustomPainter {
  _ActivePainter(
      this.value);
  final double
      value;

  @override
  void paint(
      Canvas
          canvas,
      Size
          size) {
    final double
        width =
        size.width;
    // The shimmer effect needs to move from left to right.
    // We create a gradient that spans a portion of the width and translate it.

    final double
        shimmerWidth =
        width * 0.3; // 30% of width is the shine
    final double
        startX =
        (width + shimmerWidth) * value - shimmerWidth;

    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: <Color>[
          Colors.white.withOpacity(0),
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(startX, 0, shimmerWidth, size.height));

    canvas.drawRect(
        Rect.fromLTWH(0, 0, width, size.height),
        paint);
  }

  @override
  bool shouldRepaint(covariant _ActivePainter oldDelegate) =>
      value !=
      oldDelegate.value;
}

class _CircleProgressPainter
    extends CustomPainter {
  _CircleProgressPainter({
    required this.percent,
    required this.strokeWidth,
    required this.strokeColor,
    required this.trailColor,
    this.strokeGradient,
    required this.gapDegree,
    required this.gapPosition,
    required this.strokeLinecap,
  });
  final double
      percent;
  final double
      strokeWidth;
  final Color
      strokeColor;
  final Color
      trailColor;
  final Gradient?
      strokeGradient;
  final double
      gapDegree;
  final SProgressGapPosition
      gapPosition;
  final StrokeCap
      strokeLinecap;

  @override
  void paint(
      Canvas
          canvas,
      Size
          size) {
    final Offset
        center =
        Offset(size.width / 2, size.height / 2);
    final double
        radius =
        (math.min(size.width, size.height) - strokeWidth) / 2;

    // Calculate angles based on gap
    double
        startAngle =
        -math.pi / 2; // Default top
    double
        sweepAngle =
        2 * math.pi;

    if (gapDegree >
        0) {
      final double gapRadians = gapDegree *
          math.pi /
          180;
      sweepAngle =
          2 * math.pi - gapRadians;

      switch (gapPosition) {
        case SProgressGapPosition.top:
          startAngle = -math.pi / 2 + gapRadians / 2;
        case SProgressGapPosition.bottom:
          startAngle = math.pi / 2 + gapRadians / 2;
        case SProgressGapPosition.left:
          startAngle = math.pi + gapRadians / 2;
        case SProgressGapPosition.right:
          startAngle = gapRadians / 2;
      }
    }

    // Draw Trail
    final Paint
        trailPaint =
        Paint()
          ..color = trailColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = strokeLinecap;

    canvas
        .drawArc(
      Rect.fromCircle(
          center: center,
          radius: radius),
      startAngle,
      sweepAngle,
      false,
      trailPaint,
    );

    // Draw Progress
    if (percent >
        0) {
      final double
          progressRadians =
          sweepAngle * (percent / 100).clamp(0.0, 1.0);

      final Paint progressPaint = Paint()
        ..color = strokeColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = strokeLinecap;

      if (strokeGradient !=
          null) {
        progressPaint.shader = SweepGradient(
          colors: strokeGradient!.colors,
          stops: strokeGradient!.stops,
          transform: GradientRotation(startAngle),
          // Note: Gradient rotation might need adjustment matching startAngle
        ).createShader(Rect.fromCircle(center: center, radius: radius));
        // Sweep gradient covers 360, but we want it to cover the progress...
        // For simple usage, applying standard SweepGradient is usually acceptable behavior.
      }

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        progressRadians,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _CircleProgressPainter
          oldDelegate) {
    return percent != oldDelegate.percent ||
        strokeColor != oldDelegate.strokeColor ||
        trailColor != oldDelegate.trailColor ||
        gapDegree != oldDelegate.gapDegree;
  }
}

class _IndeterminateProgressAnimation
    extends StatefulWidget {
  final Color
      color;
  final bool
      vertical;

  const _IndeterminateProgressAnimation({
    required this.color,
    this.vertical =
        false,
  });

  @override
  State<_IndeterminateProgressAnimation>
      createState() =>
          _IndeterminateProgressAnimationState();
}

class _IndeterminateProgressAnimationState
    extends State<
        _IndeterminateProgressAnimation>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _controller;
  late Animation<double>
      _animation;

  @override
  void
      initState() {
    super
        .initState();
    _controller =
        AnimationController(
      vsync:
          this,
      duration:
          const Duration(milliseconds: 1500),
    )..repeat();

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOutSine),
    );
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return AnimatedBuilder(
      animation:
          _animation,
      builder:
          (context, child) {
        // alignValue calculates from -2.33 to +2.33. That mathematically
        // places a 40% width box fully outside the left edge (-2.33), smoothly
        // sliding until it gets fully outside the right edge (+2.33).
        final double alignValue = (_animation.value * 4.66) - 2.33;

        return Stack(
          children: [
            Positioned.fill(
              child: FractionallySizedBox(
                alignment: widget.vertical ? Alignment(0.0, alignValue) : Alignment(alignValue, 0.0),
                widthFactor: widget.vertical ? null : 0.4,
                heightFactor: widget.vertical ? 0.4 : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

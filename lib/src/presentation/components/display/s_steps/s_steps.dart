import 'package:flutter/material.dart';
import 's_step_item.dart';
import 's_steps_style_helper.dart';
import 'widgets/s_step.dart';

export 's_step_item.dart';
export 's_steps_style_helper.dart';

class SSteps
    extends StatelessWidget {
  const SSteps({
    super.key,
    required this.items,
    this.current =
        0,
    this.status, // Override status for current step
    this.direction =
        Axis.horizontal,
    this.labelPlacement =
        SStepsLabelPlacement.horizontal,
    this.size =
        SStepsSize.defaultSize,
    this.responsive =
        true,
    this.scrollable =
        false,
    this.onChange,
  });

  final List<SStepItem>
      items;
  final int
      current;
  final SStepStatus?
      status;
  final Axis
      direction;
  final SStepsLabelPlacement
      labelPlacement;
  final SStepsSize
      size;
  final bool
      responsive;
  final bool
      scrollable;
  final ValueChanged<int>?
      onChange;

  @override
  Widget build(
      BuildContext
          context) {
    if (items
        .isEmpty) {
      return const SizedBox();
    }

    return LayoutBuilder(
      builder:
          (BuildContext context, BoxConstraints constraints) {
        final bool isSmallScreen = responsive && constraints.maxWidth < 400;
        final Axis effectiveDirection = isSmallScreen ? Axis.vertical : direction;

        return effectiveDirection == Axis.horizontal ? _buildHorizontalLayout() : _buildVerticalLayout();
      },
    );
  }

  Widget
      _buildHorizontalLayout() {
    final Widget
        row =
        Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children:
          List.generate(items.length, (int index) {
        final SStepItem item = items[index];
        final SStepStatus stepStatus = _getStepStatus(index, item);

        return SStep(
          item: item,
          index: index,
          status: stepStatus,
          isActive: index == current,
          isLast: index == items.length - 1,
          size: size,
          direction: Axis.horizontal,
          labelPlacement: labelPlacement,
          scrollable: scrollable,
          onTap: onChange != null ? () => onChange!(index) : null,
        );
      }),
    );

    if (scrollable) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: row,
      );
    }
    return row;
  }

  Widget
      _buildVerticalLayout() {
    // For vertical layout, we need to ensure the line connects properly.
    // The SStep widget handles drawing the line to the next step.
    final Widget
        col =
        Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children:
          List.generate(items.length, (int index) {
        final SStepItem item = items[index];
        final SStepStatus stepStatus = _getStepStatus(index, item);

        return IntrinsicHeight(
          child: SStep(
            item: item,
            index: index,
            status: stepStatus,
            isActive: index == current,
            isLast: index == items.length - 1,
            size: size,
            direction: Axis.vertical,
            labelPlacement: labelPlacement, // Vertical direction implies horizontal label placement implicitly usually
            scrollable: scrollable,
            onTap: onChange != null ? () => onChange!(index) : null,
          ),
        );
      }),
    );

    if (scrollable) {
      return SingleChildScrollView(
        child: col,
      );
    }
    return col;
  }

  SStepStatus _getStepStatus(
      int
          index,
      SStepItem
          item) {
    if (item.status !=
        null) {
      return item.status!;
    }

    if (index <
        current) {
      return SStepStatus.finish;
    } else if (index ==
        current) {
      return status ??
          SStepStatus.process;
    } else {
      return SStepStatus.wait;
    }
  }
}

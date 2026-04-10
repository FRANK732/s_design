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

  /// A structured list of nodes representing each sequential step in the process.
  final List<SStepItem>
      items;
      
  /// The specific zero-based index of the currently active step.
  final int
      current;
      
  /// Explicitly overrides the visual state of the `current` step (e.g. `error`, `wait`).
  final SStepStatus?
      status;
      
  /// Layout geometry controlling whether the chain flows horizontally or vertically.
  final Axis
      direction;
      
  /// Toggles whether step titles are textually rendered alongside or underneath the bubble icon.
  final SStepsLabelPlacement
      labelPlacement;
      
  /// Physical dimension preset modifying the internal radius and line thickness.
  final SStepsSize
      size;
      
  /// Instructs the chain to automatically collapse into a vertical list on critically small screens.
  final bool
      responsive;
      
  /// Wraps the internal layout frame inside a viewport enabling raw touch scrolling.
  final bool
      scrollable;
      
  /// Triggers a state interaction callback explicitly when a user physically taps a step bubble.
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
          List<Widget>.generate(items.length, (int index) {
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
          List<Widget>.generate(items.length, (int index) {
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

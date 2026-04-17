import 'package:flutter/material.dart';

import '../../../../../s_design.dart';

enum SDropdownPlacement {
  bottomLeft,
  bottomCenter,
  bottomRight,
  topLeft,
  topCenter,
  topRight,
  leftTop,
  leftCenter,
  leftBottom,
  rightTop,
  rightCenter,
  rightBottom,
}

enum SDropdownTrigger {
  hover,
  click,
  contextMenu,
}

class SDropdown
    extends StatelessWidget {
  const SDropdown({
    super.key,
    required this.child,
    required this.overlay,
    this.placement =
        SDropdownPlacement.bottomLeft,
    this.trigger =
        const <SDropdownTrigger>[
      SDropdownTrigger.hover
    ],
    this.disabled =
        false,
    this.open,
    this.onOpenChange,
    this.arrow =
        false,
    this.destroyOnHidden =
        false,
    this.minWidth,
    this.elevation = 0.0,
  });

  final Widget
      child;
  final Widget
      overlay;
  final SDropdownPlacement
      placement;
  final List<SDropdownTrigger>
      trigger;
  final bool
      disabled;
  final bool?
      open;
  final ValueChanged<bool>?
      onOpenChange;
  final bool
      arrow;
  final bool
      destroyOnHidden;
  final double?
      minWidth;
  final double
      elevation;

  @override
  Widget build(
      BuildContext
          context) {
    // Map Triggers
    final List<STriggerAction>
        actions =
        trigger.map((SDropdownTrigger t) {
      switch (t) {
        case SDropdownTrigger.hover:
          return STriggerAction.hover;
        case SDropdownTrigger.click:
          return STriggerAction.click;
        case SDropdownTrigger.contextMenu:
          return STriggerAction.contextMenu;
      }
    }).toList();

    // Map Placement
    STriggerPlacement
        triggerPlacement;
    switch (
        placement) {
      case SDropdownPlacement.bottomLeft:
        triggerPlacement = STriggerPlacement.bottomLeft;
      case SDropdownPlacement.bottomCenter:
        triggerPlacement = STriggerPlacement.bottomCenter;
      case SDropdownPlacement.bottomRight:
        triggerPlacement = STriggerPlacement.bottomRight;
      case SDropdownPlacement.topLeft:
        triggerPlacement = STriggerPlacement.topLeft;
      case SDropdownPlacement.topCenter:
        triggerPlacement = STriggerPlacement.topCenter;
      case SDropdownPlacement.topRight:
        triggerPlacement = STriggerPlacement.topRight;
      case SDropdownPlacement.leftTop:
        triggerPlacement = STriggerPlacement.leftTop;
      case SDropdownPlacement.leftCenter:
        triggerPlacement = STriggerPlacement.leftCenter;
      case SDropdownPlacement.leftBottom:
        triggerPlacement = STriggerPlacement.leftBottom;
      case SDropdownPlacement.rightTop:
        triggerPlacement = STriggerPlacement.rightTop;
      case SDropdownPlacement.rightCenter:
        triggerPlacement = STriggerPlacement.rightCenter;
      case SDropdownPlacement.rightBottom:
        triggerPlacement = STriggerPlacement.rightBottom;
    }

    final Widget
        styledOverlay =
        Material(
      elevation:
          elevation,
      shadowColor:
          STheme.of(context).colorToken.shadow.withOpacity(0.2),
      color:
          Colors.transparent,
      borderRadius:
          BorderRadius.circular(DesignConstants.borderRadiusMedium),
      child:
          Container(
        constraints: BoxConstraints(
          minWidth: minWidth ?? 100, // Using 100 as fallback since we can't measure root perfectly here yet
        ),
        decoration: BoxDecoration(
          color: STheme.of(context).colorToken.surface,
          borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
          border: Border.all(color: STheme.of(context).colorToken.divider.withOpacity(0.5)),
        ),
        child: overlay,
      ),
    );

    return STrigger(
      action:
          actions,
      placement:
          triggerPlacement,
      disabled:
          disabled,
      popupVisible:
          open,
      onPopupVisibleChange:
          onOpenChange,
      destroyPopupOnHide:
          destroyOnHidden,
      showArrow:
          arrow,
      popup:
          styledOverlay,
      child:
          child,
    );
  }
}

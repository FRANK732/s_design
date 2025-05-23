import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class STriggerContainerSizeUtils {
  // Base scaling factor for responsiveness
  static double _getScalingFactor(STriggerContainerSize size) {
    // Example: Use the average of height and width to determine scaling
    return (size.height + size.width) / 2;
  }

  // Container height and width
  static double getContainerHeight(STriggerContainerSize size) {
    return size.height;
  }

  static double getContainerWidth(STriggerContainerSize size) {
    return size.width;
  }

  // Menu item height and width
  static double getMenuItemHeight(STriggerContainerSize size) {
    return size.height * 0.8; // 80% of container height
  }

  static double getMenuItemWidth(STriggerContainerSize size) {
    return size.width * 0.9; // 90% of container width
  }

  // Container padding
  static EdgeInsetsGeometry getContainerPadding(STriggerContainerSize size) {
    final double padding =
        _getScalingFactor(size) * 0.05; // 5% of scaling factor
    return EdgeInsets.all(padding);
  }

  // Menu max height and width
  static double getMenuMaxHeight(
    STriggerContainerSize size,
    BuildContext context,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double maxHeight = screenHeight * 0.4; // 40% of screen height
    return maxHeight.clamp(100, 500); // Constrain between 100 and 500
  }

  static double getMenuWidth(STriggerContainerSize size, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double maxWidth = screenWidth * 0.5; // 50% of screen width
    return maxWidth.clamp(200, 600); // Constrain between 200 and 600
  }

  // Chip-related utilities
  static double getChipHeight(STriggerContainerSize size) {
    return size.height * 0.6;
  }

  static double getChipWidth(STriggerContainerSize size) {
    return size.width * 0.8; // 80% of container width
  }

  static EdgeInsetsGeometry getChipPadding(STriggerContainerSize size) {
    final double padding =
        _getScalingFactor(size) * 0.03; // 3% of scaling factor
    return EdgeInsets.all(padding);
  }

  static double getChipIconSize(STriggerContainerSize size) {
    return size.height * 0.3; // 40% of container height
  }

  static double getChipElevation(STriggerContainerSize size) {
    return size.height * 0.02; // 2% of container height
  }

  // Icon-related utilities
  static double getIconSize(STriggerContainerSize size) {
    return size.height * 0.5; // 50% of container height
  }

  // Divider-related utilities
  static double getDividerThickness(STriggerContainerSize size) {
    return size.height * 0.02; // 2% of container height
  }

  // Scrollbar-related utilities
  static double getScrollbarThickness(STriggerContainerSize size) {
    return size.height * 0.03; // 3% of container height
  }
}

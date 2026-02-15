import 'package:flutter/material.dart';

class STabItem {
  STabItem({
    required this.label,
    required this.content,
    this.icon,
    this.disabled =
        false,
    this.closable =
        true,
    String?
        key,
  }) : key = key ?? label; // Fallback to label if key is not provided

  final String
      label;
  final Widget
      content;
  final Widget?
      icon;
  final bool
      disabled;
  final bool
      closable;
  final String
      key;
}

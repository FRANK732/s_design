import 'package:flutter/material.dart';

class PersistentFooterConfig {
  final List<Widget>? buttons;
  final AlignmentDirectional alignment;

  const PersistentFooterConfig({
    this.buttons,
    this.alignment = AlignmentDirectional.centerEnd,
  });
}

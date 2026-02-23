import 'package:flutter/material.dart';

class PersistentFooterConfig {
  const PersistentFooterConfig({
    this.buttons,
    this.alignment =
        AlignmentDirectional.centerEnd,
  });
  final List<Widget>?
      buttons;
  final AlignmentDirectional
      alignment;
}

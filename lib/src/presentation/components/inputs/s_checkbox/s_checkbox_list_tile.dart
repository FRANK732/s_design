import 'package:flutter/material.dart';

import 's_checkbox.dart';
import 'utils/s_checkbox_util.dart';
import '../../../../domain/entities/config/s_checkbox_state.dart';
import '../../layout/s_list_tile/s_list_tile.dart';

/// A list tile with an [SCheckbox].
class SCheckboxListTile
    extends StatelessWidget {
  /// Creates a list tile with an [SCheckbox].
  const SCheckboxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.secondary,
    this.isThreeLine =
        false,
    this.dense,
    this.contentPadding,
    this.controlAffinity =
        ListTileControlAffinity.platform,
    this.activeColor,
    this.checkColor,
    this.enabled =
        true,
  });

  /// The current state of the checkbox.
  final SCheckboxState
      value;

  /// Callback invoke when the checkbox state changes.
  final ValueChanged<SCheckboxState>?
      onChanged;

  /// The primary content of the list tile.
  final Widget
      title;

  /// Additional content displayed below the title.
  final Widget?
      subtitle;

  /// A widget to display on the opposite side of the tile from the checkbox.
  final Widget?
      secondary;

  /// Whether this list tile is intended to display three lines of text.
  final bool
      isThreeLine;

  /// Whether this list tile is part of a vertically dense list.
  final bool?
      dense;

  /// The tile's internal padding.
  final EdgeInsetsGeometry?
      contentPadding;

  /// Where to place the control relative to the text.
  final ListTileControlAffinity
      controlAffinity;

  /// The color to use when this checkbox is checked.
  final Color?
      activeColor;

  /// The color to use for the check icon when this checkbox is checked.
  final Color?
      checkColor;

  /// Whether the list tile is enabled.
  final bool
      enabled;

  @override
  Widget build(
      BuildContext
          context) {
    final Widget
        control =
        SCheckbox(
      value:
          value,
      onChanged: enabled
          ? onChanged
          : null,
      activeColor:
          activeColor,
      checkColor:
          checkColor,
      isDisabled:
          !enabled,
    );

    Widget?
        leading,
        trailing;
    switch (
        controlAffinity) {
      case ListTileControlAffinity.leading:
        leading = control;
        trailing = secondary;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        leading = secondary;
        trailing = control;
    }

    return MergeSemantics(
      child:
          SListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        isThreeLine: isThreeLine,
        isDense: dense ?? false,
        enabled: enabled,
        onTap: enabled && onChanged != null
            ? () {
                onChanged!.call(SCheckboxUtils.toggleState(value, true));
              }
            : null,
        contentPadding: contentPadding as EdgeInsets?,
      ),
    );
  }
}

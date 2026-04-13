import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SwitchDemoPage
    extends StatefulWidget {
  const SwitchDemoPage(
      {super.key});

  @override
  State<SwitchDemoPage>
      createState() =>
          _SwitchDemoPageState();
}

class _SwitchDemoPageState
    extends State<
        SwitchDemoPage> {
  bool
      _basic =
      true;
  bool
      _wifi =
      false;
  bool
      _bluetooth =
      true;
  bool
      _notifications =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final l10n = SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SSwitch',
      description: l10n.switchDesc,
      whenToUse: [
        l10n.switchTip1,
        l10n.switchTip2,
        l10n.switchTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.switchSectionBasic,
          description: 'A simple controlled switch.',
          demo: Row(
            children: [
              SSwitch(
                value: _basic,
                onChanged: (v) => setState(() => _basic = v),
              ),
              const SizedBox(width: 12),
              Text(_basic ? l10n.switchStatusEnabled : l10n.switchStatusDisabled),
            ],
          ),
          code: '''
bool _enabled = true;

SSwitch(
  value: _enabled,
  onChanged: (v) => setState(() => _enabled = v),
);''',
        ),
        ComponentSection(
          title: l10n.switchSectionSettings,
          description: 'Switches are often used in a vertical list of settings.',
          demo: Column(
            children: [
              _SettingRow(
                icon: Icons.wifi,
                label: l10n.switchLabelWifi,
                value: _wifi,
                onChanged: (v) => setState(() => _wifi = v),
              ),
              _SettingRow(
                icon: Icons.bluetooth,
                label: l10n.switchLabelBluetooth,
                value: _bluetooth,
                onChanged: (v) => setState(() => _bluetooth = v),
              ),
              _SettingRow(
                icon: Icons.notifications_outlined,
                label: l10n.switchLabelNotifications,
                value: _notifications,
                onChanged: (v) => setState(() => _notifications = v),
              ),
            ],
          ),
          code: '''
Row(
  children: [
    const Icon(Icons.wifi),
    const SizedBox(width: 12),
    const Expanded(child: Text(l10n.switchLabelWifi)),
    SSwitch(value: _wifi, onChanged: (v) => setState(() => _wifi = v)),
  ],
);''',
        ),
        ComponentSection(
          title: l10n.demoDisabled,
          description: 'Set `onChanged: null` to disable the switch.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const SSwitch(value: true, onChanged: null),
                const SizedBox(width: 12),
                Text(l10n.switchLabelEnabledDisabled),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                const SSwitch(value: false, onChanged: null),
                const SizedBox(width: 12),
                Text(l10n.switchLabelDisabledOff),
              ]),
            ],
          ),
          code: '''
SSwitch(value: true, onChanged: null);   // disabled, on
SSwitch(value: false, onChanged: null);  // disabled, off''',
        ),
      ],
    );
  }
}

class _SettingRow
    extends StatelessWidget {
  const _SettingRow(
      {required this.icon,
      required this.label,
      required this.value,
      required this.onChanged});
  final IconData
      icon;
  final String
      label;
  final bool
      value;
  final ValueChanged<bool>
      onChanged;

  @override
  Widget build(
      BuildContext
          context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 6),
      child:
          Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          SSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

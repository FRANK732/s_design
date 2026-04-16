import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class CheckboxPage
    extends StatefulWidget {
  const CheckboxPage(
      {super.key});

  @override
  State<CheckboxPage>
      createState() =>
          _CheckboxPageState();
}

class _CheckboxPageState
    extends State<
        CheckboxPage> {
  SCheckboxState
      _basic =
      SCheckboxState.unchecked;
  SCheckboxState
      _groupAll =
      SCheckboxState.indeterminate;
  final List<SCheckboxState>
      _group =
      [
    SCheckboxState
        .checked,
    SCheckboxState
        .unchecked,
    SCheckboxState
        .checked,
  ];

  void
      _updateGroupAll() {
    final allChecked = _group.every((s) =>
        s ==
        SCheckboxState.checked);
    final noneChecked = _group.every((s) =>
        s ==
        SCheckboxState.unchecked);
    setState(
        () {
      _groupAll = allChecked
          ? SCheckboxState.checked
          : noneChecked
              ? SCheckboxState.unchecked
              : SCheckboxState.indeterminate;
    });
  }

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SCheckbox',
      description:
          l10n.checkboxDesc,
      whenToUse: [
        l10n.checkboxTip1,
        l10n.checkboxTip2,
        l10n.checkboxTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.demoBasicUsage,
          description: 'A simple controlled checkbox.',
          demo: Row(
            children: [
              SCheckbox(
                intermediate: false,
                value: _basic,
                onChanged: (v) => setState(() => _basic = v),
              ),
              const SizedBox(width: 8),
              Text(_basic == SCheckboxState.checked ? l10n.checkboxLabelAgreed : l10n.checkboxLabelPleaseAgree),
            ],
          ),
          code: '''
SCheckboxState _state = SCheckboxState.unchecked;

SCheckbox(
  value: _state,
  onChanged: (v) => setState(() => _state = v),
);''',
        ),
        ComponentSection(
          title: l10n.checkboxSectionIndeterminate,
          description: 'Use `SCheckboxState.indeterminate` for a partial selection.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SCheckbox(
                    value: _groupAll,
                    onChanged: (v) {
                      setState(() {
                        _groupAll = v;
                        for (int i = 0; i < _group.length; i++) {
                          _group[i] = v == SCheckboxState.checked ? SCheckboxState.checked : SCheckboxState.unchecked;
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(l10n.checkboxLabelSelectAll, style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 8),
              ...List.generate(
                  _group.length,
                  (i) => Padding(
                        padding: const EdgeInsets.only(left: 32, bottom: 4),
                        child: Row(
                          children: [
                            SCheckbox(
                              value: _group[i],
                              onChanged: (v) {
                                setState(() => _group[i] = v);
                                _updateGroupAll();
                              },
                            ),
                            const SizedBox(width: 8),
                            Text('${l10n.checkboxLabelOption} ${i + 1}'),
                          ],
                        ),
                      )),
            ],
          ),
          code: '''
SCheckbox(
  value: _groupAll,   // SCheckboxState.indeterminate for partial
  intermediate: true,
  onChanged: (v) { /* select/deselect all */ },
);''',
        ),
        ComponentSection(
          title: l10n.demoDisabled,
          description: 'Pass `isDisabled: true` to prevent interaction.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SCheckbox(value: SCheckboxState.checked, onChanged: null, isDisabled: true),
                  const SizedBox(width: 8),
                  Text(l10n.checkboxLabelCheckedDisabled),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SCheckbox(value: SCheckboxState.unchecked, onChanged: null, isDisabled: true),
                  const SizedBox(width: 8),
                  Text(l10n.checkboxLabelUncheckedDisabled),
                ],
              ),
            ],
          ),
          code: '''
SCheckbox(value: SCheckboxState.checked, onChanged: null, isDisabled: true);
SCheckbox(value: SCheckboxState.unchecked, onChanged: null, isDisabled: true);''',
        ),
      ],
    );
  }
}

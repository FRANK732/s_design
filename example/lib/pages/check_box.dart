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
    return ComponentPage(
      name:
          'SCheckbox',
      description:
          'A checkbox component for selecting one or multiple options. '
          'Supports checked, unchecked, and indeterminate states.',
      whenToUse: const [
        'When the user needs to select one or more items from a list.',
        'To toggle a boolean setting on or off.',
        'As part of a form where multi-selection is required.',
      ],
      sections: [
        ComponentSection(
          title: 'Basic Checkbox',
          description: 'A simple controlled checkbox.',
          demo: Row(
            children: [
              SCheckbox(
                intermediate: false,
                value: _basic,
                onChanged: (v) => setState(() => _basic = v),
              ),
              const SizedBox(width: 8),
              Text(_basic == SCheckboxState.checked ? 'Agreed' : 'Please agree'),
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
          title: 'Indeterminate / Select All',
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
                  const Text('Select all', style: TextStyle(fontWeight: FontWeight.w600)),
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
                            Text('Option ${i + 1}'),
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
        const ComponentSection(
          title: 'Disabled',
          description: 'Pass `isDisabled: true` to prevent interaction.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SCheckbox(value: SCheckboxState.checked, onChanged: null, isDisabled: true),
                  SizedBox(width: 8),
                  Text('Checked & Disabled'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SCheckbox(value: SCheckboxState.unchecked, onChanged: null, isDisabled: true),
                  SizedBox(width: 8),
                  Text('Unchecked & Disabled'),
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

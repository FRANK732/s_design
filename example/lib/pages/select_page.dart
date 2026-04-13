import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SelectPage
    extends StatefulWidget {
  const SelectPage(
      {super.key});

  @override
  State<SelectPage>
      createState() =>
          _SelectPageState();
}

class _SelectPageState
    extends State<
        SelectPage> {
  String?
      _single;
  final List<String>
      _multi =
      [];
  @override
  Widget build(
      BuildContext
          context) {
    final l10n = SLocalizations.ofContext(context);

    final fruits = [
      SSelectItem(value: 'apple', label: l10n.selectLabelApple),
      SSelectItem(value: 'banana', label: l10n.selectLabelBanana),
      SSelectItem(value: 'cherry', label: l10n.selectLabelCherry),
      SSelectItem(value: 'durian', label: l10n.selectLabelDurian),
      SSelectItem(value: 'elderberry', label: l10n.selectLabelElderberry),
      SSelectItem(value: 'fig', label: l10n.selectLabelFig),
      SSelectItem(value: 'grape', label: l10n.selectLabelGrape),
    ];

    return ComponentPage(
      name:
          'SSelect',
      description:
          'A searchable select/autocomplete component that supports single and multi-select, '
          'tags mode, search filtering, allow-clear, and custom icons.',
      whenToUse: [
        l10n.selectTip4,
        l10n.selectTip2,
        l10n.selectTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.selectSectionSingle,
          description: 'Choose exactly one item from the dropdown.',
          demo: SSelect<String>(
            items: fruits,
            value: _single,
            placeholder: l10n.selectLabelPickFruit,
            onChanged: (v) => setState(() => _single = v as String?),
          ),
          code: '''
String? _selected;

SSelect<String>(
  items: const [
    SSelectItem(value: 'apple', label: 'Apple'),
    SSelectItem(value: 'banana', label: 'Banana'),
  ],
  value: _selected,
  placeholder: l10n.selectLabelPickFruit,
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: l10n.selectSectionWithSearch,
          description: 'Enable `showSearch: true` to filter items by typing.',
          demo: SSelect<String>(
            items: fruits,
            value: _single,
            placeholder: l10n.selectLabelSearchSelect,
            showSearch: true,
            allowClear: true,
            onChanged: (v) => setState(() => _single = v as String?),
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _selected,
  showSearch: true,
  allowClear: true,
  placeholder: l10n.selectLabelSearchSelect,
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: l10n.selectSectionMulti,
          description: 'Set `mode: SSelectMode.multiple` to allow picking several items as tags.',
          demo: SSelect<String>(
            items: fruits,
            value: _multi,
            mode: SSelectMode.multiple,
            placeholder: l10n.selectLabelPickMultiple,
            allowClear: true,
            onChanged: (v) => setState(() {
              _multi
                ..clear()
                ..addAll(List<String>.from(v as List));
            }),
          ),
          code: '''
List<String> _selected = [];

SSelect<String>(
  items: items,
  value: _selected,
  mode: SSelectMode.multiple,
  allowClear: true,
  placeholder: l10n.selectLabelPickMultiple,
  onChanged: (v) => setState(() => _selected = List<String>.from(v)),
);''',
        ),
        ComponentSection(
          title: l10n.demoDisabled,
          description: 'Set `disabled: true` to prevent interaction.',
          demo: SSelect<String>(
            items: [
              SSelectItem(value: 'tech', label: l10n.selectLabelTech)
            ],
            value: 'tech',
            disabled: true,
          ),
          code: '''
SSelect<String>(
  items: items,
  value: 'tech',
  disabled: true,
  onChanged: null,
);''',
        ),
      ],
    );
  }
}

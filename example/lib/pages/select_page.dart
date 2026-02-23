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

  static final _fruits =
      [
    const SSelectItem(
        value: 'apple',
        label: 'Apple'),
    const SSelectItem(
        value: 'banana',
        label: 'Banana'),
    const SSelectItem(
        value: 'cherry',
        label: 'Cherry'),
    const SSelectItem(
        value: 'durian',
        label: 'Durian'),
    const SSelectItem(
        value: 'elderberry',
        label: 'Elderberry'),
    const SSelectItem(
        value: 'fig',
        label: 'Fig'),
    const SSelectItem(
        value: 'grape',
        label: 'Grape'),
  ];

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SSelect',
      description:
          'A searchable select/autocomplete component that supports single and multi-select, '
          'tags mode, search filtering, allow-clear, and custom icons.',
      whenToUse: const [
        'When the dropdown list is long (10+ options) and filtering is helpful.',
        'When users may need to select more than one item (mode: multiple).',
        'As a richer alternative to native <select> elements.',
      ],
      sections: [
        ComponentSection(
          title: 'Single Select',
          description: 'Choose exactly one item from the dropdown.',
          demo: SSelect<String>(
            items: _fruits,
            value: _single,
            placeholder: 'Select a fruit',
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
  placeholder: 'Select a fruit',
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: 'With Search',
          description: 'Enable `showSearch: true` to filter items by typing.',
          demo: SSelect<String>(
            items: _fruits,
            value: _single,
            placeholder: 'Search and select...',
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
  placeholder: 'Search and select...',
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: 'Multi-Select',
          description: 'Set `mode: SSelectMode.multiple` to allow picking several items as tags.',
          demo: SSelect<String>(
            items: _fruits,
            value: _multi,
            mode: SSelectMode.multiple,
            placeholder: 'Pick multiple fruits',
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
  placeholder: 'Pick multiple',
  onChanged: (v) => setState(() => _selected = List<String>.from(v)),
);''',
        ),
        const ComponentSection(
          title: 'Disabled',
          description: 'Set `disabled: true` to prevent interaction.',
          demo: SSelect<String>(
            items: [
              SSelectItem(value: 'tech', label: 'Technology')
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

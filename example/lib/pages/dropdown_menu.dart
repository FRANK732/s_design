import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class DropdownMenuPage
    extends StatefulWidget {
  const DropdownMenuPage(
      {super.key});

  @override
  State<DropdownMenuPage>
      createState() =>
          _DropdownMenuPageState();
}

class _DropdownMenuPageState
    extends State<
        DropdownMenuPage> {
  String?
      _selected;
  final List<String?>
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
        value: 'date',
        label: 'Date'),
    const SSelectItem(
        value: 'elderberry',
        label: 'Elderberry'),
  ];

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SSelect',
      description:
          'A powerful select dropdown component supporting single selection, multi-select, tags mode, '
          'search/filter, grouped items, and custom icons. Similar to Ant Design Select.',
      whenToUse: const [
        'Replacing native <select> elements with richer UX.',
        'Selecting one or multiple items from a long list.',
        'When you need searchable dropdowns for form inputs.',
      ],
      sections: [
        ComponentSection(
          title: 'Basic Single Select',
          description: 'Pick one item from a dropdown list.',
          demo: SSelect<String>(
            items: _fruits,
            value: _selected,
            placeholder: 'Select a fruit',
            onChanged: (v) => setState(() => _selected = v as String?),
          ),
          code: '''
SSelect<String>(
  items: const [
    SSelectItem(value: 'apple', label: 'Apple'),
    SSelectItem(value: 'banana', label: 'Banana'),
    SSelectItem(value: 'cherry', label: 'Cherry'),
  ],
  value: _selected,
  placeholder: 'Select a fruit',
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: 'With Allow Clear',
          description: 'Add a clear button to reset the selection.',
          demo: SSelect<String>(
            items: _fruits,
            value: _selected,
            placeholder: 'Select a fruit',
            allowClear: true,
            onChanged: (v) => setState(() => _selected = v as String?),
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _selected,
  allowClear: true,
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: 'Searchable',
          description: 'Enable `showSearch: true` for client-side filtering.',
          demo: SSelect<String>(
            items: _fruits,
            value: _selected,
            placeholder: 'Search a fruit...',
            showSearch: true,
            onChanged: (v) => setState(() => _selected = v as String?),
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _selected,
  showSearch: true,
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: 'Multi-Select',
          description: 'Use `mode: SSelectMode.multiple` to allow picking several items.',
          demo: SSelect<String>(
            items: _fruits,
            value: _multi,
            mode: SSelectMode.multiple,
            placeholder: 'Pick multiple fruits',
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
  placeholder: 'Pick multiple',
  onChanged: (v) => setState(() => _selected = List<String>.from(v)),
);''',
        ),
        ComponentSection(
          title: 'Disabled',
          description: 'Set `disabled: true` to prevent interaction.',
          demo: SSelect<String>(
            items: _fruits,
            value: 'apple',
            disabled: true,
            onChanged: null,
          ),
          code: '''
SSelect<String>(
  items: items,
  value: 'apple',
  disabled: true,
  onChanged: null,
);''',
        ),
      ],
    );
  }
}

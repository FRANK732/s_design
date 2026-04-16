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
    final l10n =
        SLocalizations.ofContext(context);

    final fruits =
        [
      SSelectItem(
          value: 'apple',
          label: l10n.selectLabelApple),
      SSelectItem(
          value: 'banana',
          label: l10n.selectLabelBanana),
      SSelectItem(
          value: 'cherry',
          label: l10n.selectLabelCherry),
      SSelectItem(
          value: 'durian',
          label: l10n.selectLabelDurian),
      SSelectItem(
          value: 'elderberry',
          label: l10n.selectLabelElderberry),
      SSelectItem(
          value: 'fig',
          label: l10n.selectLabelFig),
      SSelectItem(
          value: 'grape',
          label: l10n.selectLabelGrape),
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
        ComponentSection(
          title: 'Custom Dropdown Render',
          description: 'Use `dropdownRender` to inject custom widgets above or below the option list, like an "Add Item" button.',
          demo: SSelect<String>(
            items: fruits,
            value: _single,
            placeholder: 'Custom Dropdown',
            dropdownRender: (BuildContext context, Widget menu) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  menu,
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SButton(
                      variant: SButtonVariant.secondary,
                      child: const Text('+ Add new item'),
                      onPressed: () {},
                      isFullWidth: true,
                    ),
                  ),
                ],
              );
            },
            onChanged: (v) => setState(() => _single = v as String?),
          ),
          code: '''
SSelect<String>(
  items: items,
  dropdownRender: (context, menu) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      menu,
      const Divider(height: 1),
      SButton(
        variant: SButtonVariant.text,
        child: const Text('+ Add new item'),
        onPressed: () {},
        isFullWidth: true,
      ),
    ],
  ),
);''',
        ),
        ComponentSection(
          title: 'Custom Option Render',
          description: 'Use `optionRender` to completely customize how each row looks.',
          demo: SSelect<String>(
            items: fruits,
            value: _single,
            placeholder: 'Custom Option Rows',
            optionRender: (BuildContext context, SSelectItem<String> option, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.person, size: 16, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(option.label ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
            onChanged: (v) => setState(() => _single = v as String?),
          ),
          code: '''
SSelect<String>(
  items: items,
  optionRender: (context, option, index) => Row(
    children: [
      const Icon(Icons.person),
      Text(option.label),
    ],
  ),
);''',
        ),
        ComponentSection(
          title: 'Custom Tag Render',
          description: 'Use `tagRender` to modify the look of selected chips in multiple/tags mode.',
          demo: SSelect<String>(
            items: fruits,
            value: _multi,
            mode: SSelectMode.multiple,
            placeholder: 'Custom Tags',
            tagRender: (String label, VoidCallback onClose) {
              return Container(
                margin: const EdgeInsets.only(right: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(label, style: const TextStyle(color: Colors.orange, fontSize: 12)),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: onClose,
                      child: const Icon(Icons.close, size: 12, color: Colors.orange),
                    ),
                  ],
                ),
              );
            },
            onChanged: (v) => setState(() {
              _multi
                ..clear()
                ..addAll(List<String>.from(v as List));
            }),
          ),
          code: '''
SSelect<String>(
  mode: SSelectMode.multiple,
  items: items,
  tagRender: (label, onClose) => Container(
    color: Colors.orange,
    child: Text(label),
  ),
);''',
        ),
        ComponentSection(
          title: 'Option Group',
          description: 'Use hierarchical `options` to group items.',
          demo: SSelect<String>(
            items: [
              SSelectItem(
                label: 'Manager',
                options: [
                  SSelectItem(value: 'jack', label: 'Jack'),
                  SSelectItem(value: 'lucy', label: 'Lucy'),
                ],
              ),
              SSelectItem(
                label: 'Engineer',
                options: [
                  SSelectItem(value: 'chloe', label: 'Chloe'),
                  SSelectItem(value: 'lucas', label: 'Lucas'),
                ],
              ),
            ],
            placeholder: 'Select a person',
            onChanged: (v) => setState(() => _single = v as String?),
          ),
          code: '''
SSelect<String>(
  items: [
    SSelectItem(
      label: 'Manager',
      options: [
        SSelectItem(value: 'jack', label: 'Jack'),
        SSelectItem(value: 'lucy', label: 'Lucy'),
      ],
    ),
    SSelectItem(
      label: 'Engineer',
      options: [
        SSelectItem(value: 'chloe', label: 'Chloe'),
        SSelectItem(value: 'lucas', label: 'Lucas'),
      ],
    ),
  ],
  onChanged: (v) => print(v),
);''',
        ),
      ],
    );
  }
}

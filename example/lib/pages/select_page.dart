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
  // Basic
  String?
      _single;
  // Multiple / Tags
  List<String>
      _multi =
      [];
  // Tags
  List<String>
      _tags =
      [];
  // Tokenize
  List<String>
      _tokenized =
      [];
  // Coordinate
  String
      _province =
      'Accra';
  String
      _city =
      'Kumasi';
  // Hide selected
  List<String>
      _hideSelected =
      [];
  // Max tag count
  List<String>
      _maxTag =
      [
    'a10',
    'c12',
    'h17',
    'j19',
    'k20'
  ];

  static const Map<
      String,
      List<String>> _cityData = {
    'Accra':
        [
      'Osu',
      'Labone',
      'Cantonments'
    ],
    'Kumasi':
        [
      'Nhyiaeso',
      'Adum',
      'Asokwa'
    ],
  };

  static const List<String>
      _hideOptions =
      [
    'Apples',
    'Nails',
    'Bananas',
    'Helicopters'
  ];

  static List<SSelectItem<String>>
      get _alphaItems {
    final items =
        <SSelectItem<String>>[];
    for (int i = 10;
        i < 36;
        i++) {
      final v =
          i.toRadixString(36) + i.toString();
      items.add(SSelectItem(
          value: v,
          label: v));
    }
    return items;
  }

  static List<
      SSelectItem<
          String>> get _personItems =>
      [
        SSelectItem(value: 'schrift', label: 'Schrift'),
        SSelectItem(value: 'lya', label: 'Lya'),
        SSelectItem(value: 'tom', label: 'Tom'),
        SSelectItem(value: 'disabled', label: 'Disabled', disabled: true),
      ];

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    final theme =
        STheme.of(context);

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

    final filteredHideOptions = _hideOptions
        .where((o) => !_hideSelected.contains(o))
        .map((o) => SSelectItem(value: o, label: o))
        .toList();

    final provinceItems = _cityData
        .keys
        .map((p) => SSelectItem(value: p, label: p))
        .toList();
    final cityItems = (_cityData[_province] ?? [])
        .map((c) => SSelectItem(value: c, label: c))
        .toList();

    return ComponentPage(
      name:
          'SSelect',
      description:
          'A dropdown menu for displaying choices. An elegant alternative to the native select element. '
          'Supports single, multiple, tags modes with search, grouping, custom renders, keyboard navigation, and more.',
      whenToUse: [
        l10n.selectTip4,
        l10n.selectTip2,
        l10n.selectTip3,
      ],
      sections: [
        // ──────────────────────────────────────────────────────────
        // 1. Basic Usage
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Basic Usage',
          description: 'Basic select of default value.',
          demo: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SizedBox(
                width: 160,
                child: SSelect<String>(
                  items: _personItems,
                  value: _single,
                  placeholder: 'Select a person',
                  onChanged: (v) => setState(() => _single = v as String?),
                ),
              ),
              SizedBox(
                width: 160,
                child: SSelect<String>(
                  items: [
                    SSelectItem(value: 'lucy', label: 'Lucy')
                  ],
                  value: 'lucy',
                  disabled: true,
                ),
              ),
              SizedBox(
                width: 160,
                child: SSelect<String>(
                  items: [
                    SSelectItem(value: 'lucy', label: 'Lucy')
                  ],
                  value: 'lucy',
                  loading: true,
                ),
              ),
              SizedBox(
                width: 160,
                child: SSelect<String>(
                  items: _personItems,
                  value: _single,
                  placeholder: 'select it',
                  allowClear: true,
                  onChanged: (v) => setState(() => _single = v as String?),
                ),
              ),
            ],
          ),
          code: '''
SSelect<String>(
  items: [
    SSelectItem(value: 'jack', label: 'Jack'),
    SSelectItem(value: 'lucy', label: 'Lucy'),
    SSelectItem(value: 'Yiminghe', label: 'yiminghe'),
    SSelectItem(value: 'disabled', label: 'Disabled', disabled: true),
  ],
  value: _selected,
  placeholder: 'Select a person',
  allowClear: true,
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 2. Select with Search
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Select with Search Field',
          description: 'Enable `showSearch: true` to filter items by typing.',
          demo: SizedBox(
            width: 240,
            child: SSelect<String>(
              items: _personItems,
              value: _single,
              placeholder: 'Select a person',
              showSearch: true,
              onChanged: (v) => setState(() => _single = v as String?),
            ),
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _selected,
  showSearch: true,
  placeholder: 'Select a person',
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 3. Multiple Selection
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Multiple Selection',
          description: 'Set `mode: SSelectMode.multiple` to allow picking several items as tags.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SSelect<String>(
                items: _alphaItems,
                value: _multi,
                mode: SSelectMode.multiple,
                allowClear: true,
                placeholder: 'Please select',
                onChanged: (v) => setState(() {
                  _multi
                    ..clear()
                    ..addAll(List<String>.from(v as List));
                }),
              ),
              const SizedBox(height: 8),
              SSelect<String>(
                items: _alphaItems,
                value: const [
                  'a10',
                  'c12'
                ],
                mode: SSelectMode.multiple,
                disabled: true,
                placeholder: 'Please select',
                onChanged: null,
              ),
            ],
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _selected,
  mode: SSelectMode.multiple,
  allowClear: true,
  placeholder: 'Please select',
  onChanged: (v) => setState(() => _selected = List<String>.from(v)),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 4. Sizes
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Sizes',
          description: 'The height of the input box can be set with `size`. The options are `large`, `middle` (default), and `small`.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SSelect<String>(
                items: _personItems,
                placeholder: 'Large',
                size: SSelectSize.large,
                onChanged: (_) {},
              ),
              const SizedBox(height: 8),
              SSelect<String>(
                items: _personItems,
                placeholder: 'Middle (default)',
                size: SSelectSize.middle,
                onChanged: (_) {},
              ),
              const SizedBox(height: 8),
              SSelect<String>(
                items: _personItems,
                placeholder: 'Small',
                size: SSelectSize.small,
                onChanged: (_) {},
              ),
              const SizedBox(height: 8),
              SSelect<String>(
                items: _alphaItems,
                value: _multi.isEmpty
                    ? [
                        'a10',
                        'c12'
                      ]
                    : _multi,
                mode: SSelectMode.multiple,
                placeholder: 'Multiple – middle',
                onChanged: (v) => setState(() {
                  _multi
                    ..clear()
                    ..addAll(List<String>.from(v as List));
                }),
              ),
              const SizedBox(height: 8),
              SSelect<String>(
                items: _alphaItems,
                value: _tags.isEmpty
                    ? [
                        'a10',
                        'c12'
                      ]
                    : _tags,
                mode: SSelectMode.tags,
                placeholder: 'Tags – middle',
                onChanged: (v) => setState(() {
                  _tags
                    ..clear()
                    ..addAll(List<String>.from(v as List));
                }),
              ),
            ],
          ),
          code: '''
SSelect<String>(items: items, placeholder: 'Large', size: SSelectSize.large, onChanged: (_) {});
SSelect<String>(items: items, placeholder: 'Middle', size: SSelectSize.middle, onChanged: (_) {});
SSelect<String>(items: items, placeholder: 'Small', size: SSelectSize.small, onChanged: (_) {});''',
        ),

        // ──────────────────────────────────────────────────────────
        // 5. Tags Mode
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Tags',
          description: 'Set `mode: SSelectMode.tags` to allow creating new tags. '
              'Users can type any value and press Enter to add it.',
          demo: SSelect<String>(
            items: _alphaItems,
            value: _tags,
            mode: SSelectMode.tags,
            placeholder: 'Tags Mode',
            onChanged: (v) => setState(() {
              _tags
                ..clear()
                ..addAll(List<String>.from(v as List));
            }),
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _tags,
  mode: SSelectMode.tags,
  placeholder: 'Tags Mode',
  onChanged: (v) => setState(() => _tags = List<String>.from(v)),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 6. Option Group
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Option Group',
          description: 'Use nested `options` to create grouped items, equivalent to Ant Design\'s `OptGroup`.',
          demo: SizedBox(
            width: 240,
            child: SSelect<String>(
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
              value: _single,
              defaultValue: 'lucy',
              placeholder: 'Select a person',
              onChanged: (v) => setState(() => _single = v as String?),
            ),
          ),
          code: '''
SSelect<String>(
  items: [
    SSelectItem(label: 'Manager', options: [
      SSelectItem(value: 'jack', label: 'Jack'),
      SSelectItem(value: 'lucy', label: 'Lucy'),
    ]),
    SSelectItem(label: 'Engineer', options: [
      SSelectItem(value: 'chloe', label: 'Chloe'),
      SSelectItem(value: 'lucas', label: 'Lucas'),
    ]),
  ],
  onChanged: (v) => print(v),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 7. Coordinate Selects
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Coordinate',
          description: 'Coordination between `SSelect` components. Selecting a province resets the city selection.',
          demo: Wrap(
            spacing: 8,
            children: [
              SizedBox(
                width: 160,
                child: SSelect<String>(
                  items: provinceItems,
                  value: _province,
                  onChanged: (v) {
                    final p = v as String;
                    setState(() {
                      _province = p;
                      _city = _cityData[p]!.first;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 160,
                child: SSelect<String>(
                  items: cityItems,
                  value: _city,
                  onChanged: (v) => setState(() => _city = v as String),
                ),
              ),
            ],
          ),
          code: '''
SSelect<String>(
  items: provinceItems,
  value: _province,
  onChanged: (v) => setState(() {
    _province = v;
    _city = cityData[v]!.first;
  }),
),
SSelect<String>(
  items: cityItems,
  value: _city,
  onChanged: (v) => setState(() => _city = v),
),''',
        ),

        // ──────────────────────────────────────────────────────────
        // 8. Status
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Status',
          description: 'Add status to `SSelect` with `status`, options: `error`, `warning`.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SSelect<String>(
                items: fruits,
                placeholder: 'Error status',
                status: SSelectStatus.error,
                onChanged: (_) {},
              ),
              const SizedBox(height: 8),
              SSelect<String>(
                items: fruits,
                placeholder: 'Warning status',
                status: SSelectStatus.warning,
                onChanged: (_) {},
              ),
            ],
          ),
          code: '''
SSelect<String>(items: items, status: SSelectStatus.error, onChanged: (_) {});
SSelect<String>(items: items, status: SSelectStatus.warning, onChanged: (_) {});''',
        ),

        // ──────────────────────────────────────────────────────────
        // 9. Variants
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Variants',
          description: 'There are 3 variants: `outlined` (default), `filled`, and `borderless`.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                Flexible(
                    child: SSelect<String>(
                  items: fruits,
                  placeholder: 'Outlined',
                  variant: SSelectVariant.outlined,
                  onChanged: (_) {},
                )),
                const SizedBox(width: 8),
                Flexible(
                    child: SSelect<String>(
                  items: fruits,
                  value: _multi.isEmpty ? null : _multi.first,
                  placeholder: 'Outlined (multiple)',
                  mode: SSelectMode.multiple,
                  variant: SSelectVariant.outlined,
                  onChanged: (_) {},
                )),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                Flexible(
                    child: SSelect<String>(
                  items: fruits,
                  placeholder: 'Filled',
                  variant: SSelectVariant.filled,
                  onChanged: (_) {},
                )),
                const SizedBox(width: 8),
                Flexible(
                    child: SSelect<String>(
                  items: fruits,
                  placeholder: 'Filled (multiple)',
                  mode: SSelectMode.multiple,
                  variant: SSelectVariant.filled,
                  onChanged: (_) {},
                )),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                Flexible(
                    child: SSelect<String>(
                  items: fruits,
                  placeholder: 'Borderless',
                  variant: SSelectVariant.borderless,
                  onChanged: (_) {},
                )),
                const SizedBox(width: 8),
                Flexible(
                    child: SSelect<String>(
                  items: fruits,
                  placeholder: 'Borderless (multiple)',
                  mode: SSelectMode.multiple,
                  variant: SSelectVariant.borderless,
                  onChanged: (_) {},
                )),
              ]),
            ],
          ),
          code: '''
SSelect<String>(items: items, placeholder: 'Outlined', variant: SSelectVariant.outlined, onChanged: (_) {});
SSelect<String>(items: items, placeholder: 'Filled', variant: SSelectVariant.filled, onChanged: (_) {});
SSelect<String>(items: items, placeholder: 'Borderless', variant: SSelectVariant.borderless, onChanged: (_) {});''',
        ),

        // ──────────────────────────────────────────────────────────
        // 10. Hide Already Selected
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Hide Already Selected',
          description: 'Filter the dropdown `items` list based on selected values to hide already-selected options.',
          demo: SSelect<String>(
            items: filteredHideOptions,
            value: _hideSelected,
            mode: SSelectMode.multiple,
            placeholder: 'Inserted are removed',
            onChanged: (v) => setState(() {
              _hideSelected
                ..clear()
                ..addAll(List<String>.from(v as List));
            }),
          ),
          code: '''
// Filter items to hide already selected
final filteredOptions = allOptions
    .where((o) => !selectedItems.contains(o))
    .map((o) => SSelectItem(value: o, label: o))
    .toList();

SSelect<String>(
  items: filteredOptions,
  value: selectedItems,
  mode: SSelectMode.multiple,
  onChanged: (v) => setState(() => selectedItems = List<String>.from(v)),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 11. Automatic Tokenization
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Automatic Tokenization',
          description: 'Set `tokenSeparators` to auto-create tags when the user types a separator '
              '(e.g., comma `,`). Only available in `tags` mode.',
          demo: SSelect<String>(
            items: _alphaItems,
            value: _tokenized,
            mode: SSelectMode.tags,
            tokenSeparators: const [
              ','
            ],
            placeholder: 'Type values separated by commas',
            onChanged: (v) => setState(() {
              _tokenized
                ..clear()
                ..addAll(List<String>.from(v as List));
            }),
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _tags,
  mode: SSelectMode.tags,
  tokenSeparators: const [','],
  onChanged: (v) => setState(() => _tags = List<String>.from(v)),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 12. Responsive maxTagCount
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Max Tag Count',
          description: 'Use `maxTagCount` to limit how many tags are shown. '
              'Use `maxTagPlaceholder` to customize the overflow indicator.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SSelect<String>(
                items: _alphaItems,
                value: _maxTag,
                mode: SSelectMode.multiple,
                maxTagCount: 3,
                placeholder: 'Select items',
                onChanged: (v) => setState(() {
                  _maxTag
                    ..clear()
                    ..addAll(List<String>.from(v as List));
                }),
              ),
              const SizedBox(height: 8),
              SSelect<String>(
                items: _alphaItems,
                value: _maxTag,
                mode: SSelectMode.multiple,
                maxTagCount: 3,
                maxTagPlaceholder: (omitted) => STooltip(
                  content: Text(omitted.join(', ')),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: theme.colorToken.divider.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '+${omitted.length} more',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                placeholder: 'Custom overflow label',
                onChanged: (v) => setState(() {
                  _maxTag
                    ..clear()
                    ..addAll(List<String>.from(v as List));
                }),
              ),
            ],
          ),
          code: '''
SSelect<String>(
  items: items,
  value: _selected,
  mode: SSelectMode.multiple,
  maxTagCount: 3,
  maxTagPlaceholder: (omitted) => Text('+\${omitted.length} more'),
  onChanged: (v) => setState(() => _selected = List<String>.from(v)),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 13. Custom Dropdown (dropdownRender)
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Custom Dropdown',
          description: 'Use `dropdownRender` to inject custom widgets above or below the option list.',
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
      SButton(child: const Text('+ Add new item'), onPressed: () {}),
    ],
  ),
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 14. Custom Option Render
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Custom Option Render',
          description: 'Use `optionRender` to completely customize how each option row looks.',
          demo: SSelect<String>(
            items: fruits,
            value: _single,
            placeholder: 'Custom Option Rows',
            optionRender: (BuildContext context, SSelectItem<String> option, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.emoji_nature, size: 16, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(option.label ?? '', style: const TextStyle(fontWeight: FontWeight.w500)),
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
      const Icon(Icons.emoji_nature),
      Text(option.label ?? ''),
    ],
  ),
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 15. Custom Tag Render
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Custom Tag Render',
          description: 'Use `tagRender` to customize the look of selected chips in `multiple`/`tags` mode.',
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
                  color: Colors.orange.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(label, style: const TextStyle(color: Colors.orange, fontSize: 12)),
                    const SizedBox(width: 4),
                    GestureDetector(
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
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.orange),
    ),
    child: Row(children: [
      Text(label, style: TextStyle(color: Colors.orange)),
      GestureDetector(onTap: onClose, child: Icon(Icons.close)),
    ]),
  ),
);''',
        ),

        // ──────────────────────────────────────────────────────────
        // 16. Disabled
        // ──────────────────────────────────────────────────────────
        ComponentSection(
          title: l10n.demoDisabled,
          description: 'Set `disabled: true` to prevent interaction.',
          demo: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SizedBox(
                width: 200,
                child: SSelect<String>(
                  items: [
                    SSelectItem(value: 'tech', label: l10n.selectLabelTech)
                  ],
                  value: 'tech',
                  disabled: true,
                ),
              ),
              SizedBox(
                width: 200,
                child: SSelect<String>(
                  items: fruits,
                  value: const [
                    'apple',
                    'banana'
                  ],
                  mode: SSelectMode.multiple,
                  disabled: true,
                  onChanged: null,
                ),
              ),
            ],
          ),
          code: '''
SSelect<String>(
  items: items,
  value: 'tech',
  disabled: true,
);''',
        ),
      ],
    );
  }
}

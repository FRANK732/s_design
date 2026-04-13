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
  @override
  Widget build(
      BuildContext
          context) {
    final l10n = SLocalizations.ofContext(context);

    final fruits = [
      SSelectItem(value: 'apple', label: l10n.selectLabelApple),
      SSelectItem(value: 'banana', label: l10n.selectLabelBanana),
      SSelectItem(value: 'cherry', label: l10n.selectLabelCherry),
      SSelectItem(value: 'date', label: l10n.selectLabelDate),
      SSelectItem(value: 'elderberry', label: l10n.selectLabelElderberry),
    ];

    return ComponentPage(
      name:
          'SSelect',
      description: l10n.selectDescExtended,
      whenToUse: [
        l10n.selectTip1,
        l10n.selectTip2,
        l10n.selectTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.selectSectionSingle,
          description: 'Pick one item from a dropdown list.',
          demo: SSelect<String>(
            items: fruits,
            value: _selected,
            placeholder: l10n.selectLabelPickFruit,
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
  placeholder: l10n.selectLabelPickFruit,
  onChanged: (v) => setState(() => _selected = v),
);''',
        ),
        ComponentSection(
          title: 'With Allow Clear',
          description: 'Add a clear button to reset the selection.',
          demo: SSelect<String>(
            items: fruits,
            value: _selected,
            placeholder: l10n.selectLabelPickFruit,
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
            items: fruits,
            value: _selected,
            placeholder: l10n.selectLabelSearchFruit,
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
          title: l10n.selectSectionMulti,
          description: 'Use `mode: SSelectMode.multiple` to allow picking several items.',
          demo: SSelect<String>(
            items: fruits,
            value: _multi,
            mode: SSelectMode.multiple,
            placeholder: l10n.selectLabelPickMultiple,
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
  placeholder: l10n.selectLabelPickMultiple,
  onChanged: (v) => setState(() => _selected = List<String>.from(v)),
);''',
        ),
        ComponentSection(
          title: l10n.demoDisabled,
          description: 'Set `disabled: true` to prevent interaction.',
          demo: SSelect<String>(
            items: fruits,
            value: 'apple',
            disabled: true,
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

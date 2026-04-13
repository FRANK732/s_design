import 'dart:developer'
    as dev;
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class TabsPage
    extends StatefulWidget {
  const TabsPage(
      {super.key});

  @override
  State<TabsPage>
      createState() =>
          _TabsPageState();
}

class _TabsPageState
    extends State<
        TabsPage> {
  // Demo State
  String
      _activeKey =
      'tab1';
  STabPosition
      _position =
      STabPosition.top;
  STabType
      _type =
      STabType.line;
  STabSize
      _size =
      STabSize.medium;
  bool
      _centered =
      false;
  bool
      _manyTabs =
      false;

  void
      _updateTabs() {
    setState(
        () {
      _activeKey =
          'tab1';
    });
  }

  List<STabItem>
      _currentTabs(
          SLocalizations
              l10n) {
    if (_manyTabs) {
      return List.generate(20,
          (index) {
        return STabItem(
          label: l10n.tabsLabelTab(index + 1),
          key: 'tab${index + 1}',
          content: ListView.builder(
            itemCount: 20,
            padding: EdgeInsets.zero,
            itemBuilder: (context, i) => ListTile(
              title: Text('${l10n.tabsLabelListItem(i)} ${l10n.tabsLabelInTab(index + 1)}'),
              leading: const Icon(Icons.circle, size: 8),
              tileColor: i.isEven ? Colors.grey.shade50 : Colors.white,
            ),
          ),
        );
      });
    }

    return [
      STabItem(
        label: l10n.tabsLabelShort,
        key: 'tab1',
        icon: const Icon(Icons.home),
        content: ColoredBox(
          color: Colors.blue.shade50,
          child: Center(child: Text(l10n.tabsContentShort)),
        ),
      ),
      STabItem(
        label: l10n.tabsLabelMedium,
        key: 'tab2',
        icon: const Icon(Icons.settings),
        content: Center(child: Text(l10n.tabsContentMedium)),
      ),
      STabItem(
        label: l10n.tabsLabelCard,
        key: 'tab3',
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(l10n.tabsContentPadding),
              const SizedBox(height: 16),
              SCard(title: l10n.tabsLabelNestedCard, body: Text(l10n.tabsLabelComposition)),
            ],
          ),
        ),
      ),
      STabItem(
        label: l10n.tabsLabelDisabled,
        key: 'tab4',
        disabled: true,
        content: Center(child: Text(l10n.tabsLabelDisabledContent)),
      ),
    ];
  }

  @override
  Widget build(
      BuildContext
          context) {
    final l10n = SLocalizations.ofContext(context);
    return SScaffold(
      appBar:
          AppBar(
        title: Text(l10n.tabsTitleShowcase),
      ),
      renderBody:
          (BuildContext context) {
        return Column(
          children: [
            // Controls (Fixed at top)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _buildDropdown<STabType>(
                        value: _type,
                        items: STabType.values,
                        label: l10n.tabsControlLabelType,
                        onChanged: (v) => setState(() => _type = v!),
                      ),
                      _buildDropdown<STabPosition>(
                        value: _position,
                        items: STabPosition.values,
                        label: l10n.tabsControlLabelPosition,
                        onChanged: (v) => setState(() => _position = v!),
                      ),
                      _buildDropdown<STabSize>(
                        value: _size,
                        items: STabSize.values,
                        label: l10n.tabsControlLabelSize,
                        onChanged: (v) => setState(() => _size = v!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 24,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(l10n.tabsControlLabelCentered),
                          Switch(
                            value: _centered,
                            onChanged: (v) => setState(() => _centered = v),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(l10n.tabsControlLabelMany),
                          Switch(
                            value: _manyTabs,
                            onChanged: (v) {
                              setState(() => _manyTabs = v);
                              _updateTabs();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Tabs Container (Expanded to fill rest of screen)
            Expanded(
              child: ColoredBox(
                color: Colors.grey.shade100, // Background to see transparency
                child: STabs(
                  items: _currentTabs(l10n),
                  activeKey: _activeKey,
                  onTabClick: (key) {
                    setState(() => _activeKey = key);
                    dev.log('Active Tab: $key');
                  },
                  type: _type,
                  tabPosition: _position,
                  size: _size,
                  centered: _centered,
                  tabBarExtraContent: _type == STabType.editableCard
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {},
                          tooltip: l10n.tabsTooltipExtra,
                        ),
                  onEdit: (key, action) {
                    dev.log('Edit: $key, $action');
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDropdown<
      T>({
    required T
        value,
    required List<T>
        items,
    required String
        label,
    required ValueChanged<T?>
        onChanged,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      mainAxisSize:
          MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last))).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

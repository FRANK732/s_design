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
  final List<STabItem>
      _tabs =
      [
    STabItem(
      label:
          'Tab 1',
      key:
          'tab1',
      icon:
          const Icon(Icons.home),
      content:
          const Center(child: Text('Content of Tab 1')),
    ),
    STabItem(
      label:
          'Tab 2',
      key:
          'tab2',
      icon:
          const Icon(Icons.settings),
      content:
          const Center(child: Text('Content of Tab 2')),
    ),
    STabItem(
      label:
          'Disabled',
      key:
          'tab3',
      disabled:
          true,
      content:
          const Center(child: Text('You cannot see this')),
    ),
  ];

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

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      scrollable:
          true,
      appBar:
          AppBar(
        title: const Text('Tabs Showcase'),
      ),
      renderBody:
          (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Controls
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  DropdownButton<STabType>(
                    value: _type,
                    onChanged: (v) => setState(() => _type = v!),
                    items: STabType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                  ),
                  DropdownButton<STabPosition>(
                    value: _position,
                    onChanged: (v) => setState(() => _position = v!),
                    items: STabPosition.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                  ),
                  DropdownButton<STabSize>(
                    value: _size,
                    onChanged: (v) => setState(() => _size = v!),
                    items: STabSize.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Tabs
              Container(
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: STabs(
                  items: _tabs,
                  activeKey: _activeKey,
                  onTabClick: (key) {
                    setState(() => _activeKey = key);
                    dev.log('Active Tab: $key');
                  },
                  type: _type,
                  tabPosition: _position,
                  size: _size,
                  tabBarExtraContent: _type == STabType.editableCard
                      ? null
                      : SButton(
                          onPressed: () {},
                          child: const Text('Extra Action'),
                        ),
                  onEdit: (key, action) {
                    if (action == 'add') {
                      setState(() {
                        final newKey = 'newTab${_tabs.length + 1}';
                        _tabs.add(STabItem(
                          label: 'New Tab',
                          key: newKey,
                          closable: true,
                          content: Center(child: Text('Content of $newKey')),
                        ));
                        _activeKey = newKey;
                      });
                    } else if (action == 'remove' && key != null) {
                      setState(() {
                        final index = _tabs.indexWhere((t) => t.key == key);
                        if (index != -1) {
                          _tabs.removeAt(index);
                          if (_activeKey == key) {
                            _activeKey = _tabs.isNotEmpty ? _tabs.last.key : '';
                          }
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

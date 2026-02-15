import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'sticky_tabs_demo.dart';

class TabsDemoV3Page
    extends StatefulWidget {
  const TabsDemoV3Page(
      {super.key});

  @override
  State<TabsDemoV3Page>
      createState() =>
          _TabsDemoV3PageState();
}

class _TabsDemoV3PageState
    extends State<
        TabsDemoV3Page>
    with
        SingleTickerProviderStateMixin {
  late TabController
      _tabController;
  final List<STabItem>
      _items =
      [
    STabItem(
      label:
          'Home',
      key:
          'home',
      icon:
          const Icon(Icons.home),
      content:
          const Center(child: Text('Home Content')),
    ),
    STabItem(
      label:
          'Settings',
      key:
          'settings',
      icon:
          const Icon(Icons.settings),
      content:
          const Center(child: Text('Settings Content')),
    ),
    STabItem(
      label:
          'Profile',
      key:
          'profile',
      icon:
          const Icon(Icons.person),
      content:
          const Center(child: Text('Profile Content')),
    ),
  ];

  @override
  void
      initState() {
    super
        .initState();
    _tabController = TabController(
        length: _items.length,
        vsync: this);
  }

  @override
  void
      dispose() {
    _tabController
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(title: const Text('STabs V3: Decoupled Architecture')),
      renderBody:
          (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('1. Unified Component (Backward Compatibility)', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                  child: STabs(items: _items),
                ),
              ),

              const SizedBox(height: 32),

              const Text('2. Decoupled (Shared TabController)', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('Note: Header and Content are separate widgets synced by controller.', style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 8),

              // Header
              Container(
                color: Colors.grey.shade100,
                child: STabNavBar(
                  items: _items,
                  activeKey: '',
                  controller: _tabController,
                  onTabClick: (_) {}, // Driven by controller
                  onEdit: null,
                ),
              ),

              const Divider(color: Colors.red, thickness: 2, height: 2),

              // Content
              Expanded(
                child: Container(
                  color: Colors.grey.shade50,
                  child: STabView(
                    controller: _tabController,
                    children: _items.map((e) => Center(child: Text('Decoupled: ${e.label}'))).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              SButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const StickyTabsDemoPage()));
                },
                child: const Text('View Sticky Header Demo'),
              ),
            ],
          ),
        );
      },
    );
  }
}

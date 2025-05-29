import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  bool _changeIcon = false;

  String? dropdownValue;
  final List<String> dropdownItems = <String>['One', 'Two', 'Free', 'Four'];
  void _toggleIcon() {
    setState(() {
      _changeIcon = !_changeIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDropdownMenu Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            IconButton(
              onPressed: _toggleIcon,
              icon: Icon(_changeIcon ? Icons.abc : Icons.accessible_outlined),
            ),
            _buildSectionTitle('Searchable Dropdown Menu'),
            SDropdownMenu(
              items: const <String>['Item 1', 'Item 2', 'Item 3'],
              onChanged: (value) {
                dev.log('Selected: $value');
              },
              backgroundColor: const Color.fromARGB(255, 96, 104, 110),
              menuType: SDropdownMenuItemType.multiSelect,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

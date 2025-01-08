import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  bool _isFeatureEnabled = false;
  // String? _selectedOption;
  String? _selectedRadio;
  final List<String> _checkedItems = [];
  // String? _selectedSubOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDropdownMenu Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionTitle('Default Dropdown Menu'),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              trigger: const Text('Default Dropdown'),
              items: [
                SDropdownMenuItemData(
                  label: 'Item 1',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  label: 'Item 2',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  label: 'Item 3',
                  onTap: () {},
                ),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Dropdown with Icons'),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              trigger: const Text('Dropdown with Icons'),
              items: [
                SDropdownMenuItemData(
                  label: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  label: 'Settings',
                  icon: const Icon(Icons.settings),
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  label: 'Profile',
                  icon: const Icon(Icons.person),
                  onTap: () {},
                ),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Dropdown with Checkboxes'),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              // closeOnItemTap: false,
              trigger: const Text('Dropdown with Checkboxes'),
              items: [
                SDropdownMenuItemData(
                  label: 'Enable Feature',
                  type: SDropdownMenuItemType.checkbox,
                  isChecked: _isFeatureEnabled,
                  onCheckedChanged: (bool value) {
                    setState(() {
                      _isFeatureEnabled = value;
                    });
                  },
                ),
                SDropdownMenuItemData(
                  label: 'Option A',
                  type: SDropdownMenuItemType.checkbox,
                  isChecked: _checkedItems.contains('Option A'),
                  onCheckedChanged: (bool value) {
                    setState(() {
                      if (value) {
                        _checkedItems.add('Option A');
                      } else {
                        _checkedItems.remove('Option A');
                      }
                    });
                  },
                ),
                SDropdownMenuItemData(
                  label: 'Option B',
                  type: SDropdownMenuItemType.checkbox,
                  isChecked: _checkedItems.contains('Option B'),
                  onCheckedChanged: (bool value) {
                    setState(() {
                      if (value) {
                        _checkedItems.add('Option B');
                      } else {
                        _checkedItems.remove('Option B');
                      }
                    });
                  },
                ),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Dropdown with Radio Buttons'),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              trigger: const Text('Dropdown with Radio Buttons'),
              selectedRadioValue: _selectedRadio,
              onRadioValueChanged: (String? value) {
                setState(() {
                  _selectedRadio = value;
                });
              },
              items: [
                SDropdownMenuItemData(
                  label: 'Option 1',
                  type: SDropdownMenuItemType.radio,
                  value: 'Option 1',
                ),
                SDropdownMenuItemData(
                  label: 'Option 2',
                  type: SDropdownMenuItemType.radio,
                  value: 'Option 2',
                ),
                SDropdownMenuItemData(
                  label: 'Option 3',
                  type: SDropdownMenuItemType.radio,
                  value: 'Option 3',
                ),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Dropdown with Submenu'),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              trigger: const Text('Dropdown with Submenu'),
              items: [
                SDropdownMenuItemData(
                  label: 'File',
                  type: SDropdownMenuItemType.submenu,
                  submenuItems: [
                    SDropdownMenuItemData(
                      label: 'New',
                      onTap: () {},
                    ),
                    SDropdownMenuItemData(
                      label: 'Open',
                      onTap: () {},
                    ),
                    SDropdownMenuItemData(
                      label: 'Save',
                      onTap: () {},
                    ),
                  ],
                ),
                SDropdownMenuItemData(
                  label: 'Edit',
                  type: SDropdownMenuItemType.submenu,
                  submenuItems: [
                    SDropdownMenuItemData(
                      label: 'Undo',
                      onTap: () {},
                    ),
                    SDropdownMenuItemData(
                      label: 'Redo',
                      onTap: () {},
                    ),
                  ],
                ),
                SDropdownMenuItemData(
                  label: 'View',
                  type: SDropdownMenuItemType.submenu,
                  submenuItems: [
                    SDropdownMenuItemData(
                      label: 'Zoom In',
                      onTap: () {},
                    ),
                    SDropdownMenuItemData(
                      label: 'Zoom Out',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Dropdown with Separators and Labels'),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              trigger: const Text('Dropdown with Separators and Labels'),
              items: [
                SDropdownMenuItemData(
                  label: 'Section 1',
                  type: SDropdownMenuItemType.label,
                ),
                SDropdownMenuItemData(
                  label: 'Item 1',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  type: SDropdownMenuItemType.separator,
                ),
                SDropdownMenuItemData(
                  label: 'Section 2',
                  type: SDropdownMenuItemType.label,
                ),
                SDropdownMenuItemData(
                  label: 'Item 2',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  label: 'Item 3',
                  onTap: () {},
                ),
              ],
            ),
            const Divider(height: 40),
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

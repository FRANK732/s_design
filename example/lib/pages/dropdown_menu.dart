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
              menuPosition: SDropdownMenuPosition.bottomRight,
              // trigger: const Text('Default Dropdown'),
              items: [
                SDropdownMenuItemData(
                  key: 'item1',
                  label: 'Item 1',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  key: 'item2',
                  label: 'Item 2',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  key: 'item3',
                  label: 'Item 3',
                  onTap: () {},
                ),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Dropdown with Icons'),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              // trigger: const Text('Dropdown with Icons'),
              items: [
                SDropdownMenuItemData(
                  key: 'home',
                  label: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  key: 'settings',
                  label: 'Settings',
                  icon: const Icon(Icons.settings),
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  key: 'profile',
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
              closeOnItemTap: false,
              menuPosition: SDropdownMenuPosition.topCenter,
              // closeOnItemTap: false,
              // trigger: const Text('Dropdown with Checkboxes'),
              items: [
                SDropdownMenuItemData(
                  key: 'enable',
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
                  key: 'optionA',
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
                  key: 'optionB',
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
              closeOnItemTap: false,
              // trigger: const Text('Dropdown with Radio Buttons'),
              selectedRadioValue: _selectedRadio,
              onRadioValueChanged: (String? value) {
                setState(() {
                  _selectedRadio = value;
                });
              },
              items: [
                SDropdownMenuItemData(
                  key: 'option1',
                  label: 'Option 1',
                  type: SDropdownMenuItemType.radio,
                  value: 'Option 1',
                ),
                SDropdownMenuItemData(
                  key: 'option2',
                  label: 'Option 2',
                  type: SDropdownMenuItemType.radio,
                  value: 'Option 2',
                ),
                SDropdownMenuItemData(
                  key: 'option3',
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
              // closeOnItemTap: false,
              // trigger: const Text('Dropdown with Submenu'),
              items: [
                SDropdownMenuItemData(
                  key: 'file',
                  label: 'File',
                  type: SDropdownMenuItemType.submenu,
                  submenuItems: [
                    SDropdownMenuItemData(
                      key: 'new',
                      label: 'New',
                      onTap: () {},

                    ),
                    SDropdownMenuItemData(
                      key: 'open',
                      label: 'Open',
                      onTap: () {},
                    ),
                    SDropdownMenuItemData(
                      key: 'save',
                      label: 'Save',
                      onTap: () {},
                    ),
                  ],
                ),
                SDropdownMenuItemData(
                  key: 'edit',
                  label: 'Edit',
                  type: SDropdownMenuItemType.submenu,
                  submenuItems: [
                    SDropdownMenuItemData(
                      key: 'undo',
                      label: 'Undo',
                      onTap: () {},
                    ),
                    SDropdownMenuItemData(
                      key: 'redo',
                      label: 'Redo',
                      onTap: () {},
                    ),
                  ],
                ),
                SDropdownMenuItemData(
                  key: 'view',
                  label: 'View',
                  type: SDropdownMenuItemType.submenu,
                  submenuItems: [
                    SDropdownMenuItemData(
                      key: 'zoomIn',
                      label: 'Zoom In',
                      onTap: () {},
                    ),
                    SDropdownMenuItemData(
                      key: 'zoomOut',
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
              // trigger: const Text('Dropdown with Separators and Labels'),
              items: [
                SDropdownMenuItemData(
                  key: 'section1',
                  label: 'Section 1',
                  type: SDropdownMenuItemType.label,
                ),
                SDropdownMenuItemData(
                  key: 'item1',
                  label: 'Item 1',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  key: 'item2',
                  type: SDropdownMenuItemType.separator,
                ),
                SDropdownMenuItemData(
                  key: 'item3',
                  label: 'Section 2',
                  type: SDropdownMenuItemType.label,
                ),
                SDropdownMenuItemData(
                  key: 'item4',
                  label: 'Item 2',
                  onTap: () {},
                ),
                SDropdownMenuItemData(
                  key: 'item5',
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

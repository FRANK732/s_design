import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDropdownMenu Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          _buildSectionTitle('Default Dropdown Menu'),
          SDropdownMenu(
            items: ['Apple', 'Banana', 'Orange', 'Mango', 'Grapes'],
            onChanged: (selectedItem) {
              print('Selected: $selectedItem');
            },
            hintText: 'Select a fruit',
            menuType: SDropdownMenuItemType.multiSelect,
            preferredPosition: SDropdownMenuPosition.bottom,
            backgroundColor: Colors.blue[50],
            borderRadius: 12,
            shadow: BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
            textStyle: TextStyle(color: Colors.blue),
            menuBackgroundColor: Colors.blue[50],
            menuElevation: 8,
            menuWidth: 300,
          )
        ]),
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

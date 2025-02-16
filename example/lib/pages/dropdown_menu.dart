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
          _buildSectionTitle('Searchable Dropdown Menu'),
          SDropdownMenu(
            items: ['Item 1', 'Item 2', 'Item 3'],
            onChanged: (value) {
              print('Selected: $value');
            },
            backgroundColor: const Color.fromARGB(255, 96, 104, 110),
            menuType: SDropdownMenuItemType.searchable,
            expandToMax: true,
            triggerMaxHeight: 100,
            triggerMaxWidth: 200,
          ),
          _buildSectionTitle('Default Dropdown Menu 2'),
          SDropdownMenu(
            items: ['Banana', 'Orange', 'Mango', 'Grapes'],
            onChanged: (selectedItem) {
              print('Selected: $selectedItem');
            },
            hintText: 'Select a fruit',
            menuType: SDropdownMenuItemType.normal,
            preferredPosition: SDropdownMenuPosition.top,
            backgroundColor: const Color.fromARGB(255, 96, 104, 110),
            borderRadius: 12,
            triggerSize: STriggerContainerSize.custom(
                50, MediaQuery.of(context).size.width),
            shadow: BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
            textStyle: TextStyle(color: Colors.blue),
            showClearButton: true,
            // menuBackgroundColor: Colors.blue[50],
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

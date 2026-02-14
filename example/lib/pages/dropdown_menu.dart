import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class DropdownMenuPage
    extends StatefulWidget {
  const DropdownMenuPage(
      {super.key});

  @override
  State<DropdownMenuPage>
      createState() =>
          _DropdownMenuPageState();
}

class User {
  final String
      id;
  final String
      name;

  User(
      this.id,
      this.name);

  @override
  String toString() =>
      name;
}

class _DropdownMenuPageState
    extends State<
        DropdownMenuPage> {
  // String Dropdown
  List<String>
      items =
      [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry'
  ];
  String?
      selectedItem;

  // Object Dropdown
  List<User>
      users =
      [
    User(
        '1',
        'Alice'),
    User(
        '2',
        'Bob'),
    User(
        '3',
        'Charlie'),
  ];
  User?
      selectedUser;

  // Async Dropdown
  User?
      selectedAsyncUser;

  Future<
      List<
          User>> _fetchUsers(
      String
          query) async {
    await Future<void>.delayed(
        const Duration(seconds: 1)); // Simulate weird network latency
    if (query
        .isEmpty)
      return users;
    return users
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('SDropdown Showcase')),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Generic String Dropdown', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SDropdownMenu<String>(
              items: items,
              hintText: 'Select a fruit',
              onChanged: (value) {
                setState(() => selectedItem = value as String?);
              },
            ),
            const SizedBox(height: 24),
            const Text('Generic Object Dropdown (User)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SDropdownMenu<User>(
              items: users,
              hintText: 'Select a user',
              itemLabel: (user) => user.name,
              onChanged: (value) {
                setState(() => selectedUser = value as User?);
              },
            ),
            const SizedBox(height: 24),
            const Text('Async Search Dropdown', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SDropdownMenu<User>(
              // Async dropdown doesn't strictly need initial items if asyncItems is provided,
              // but our current impl requires non-empty items assertion?
              // Let's check the assertion. It says items.isNotEmpty.
              // We should probably allow empty items if asyncItems is present.
              // For now, pass empty list and hope I fix the assertion or pass dummy.
              items: users,
              menuType: SDropdownMenuItemType.searchable,
              asyncItems: _fetchUsers,
              hintText: 'Search user (async)...',
              itemLabel: (user) => user.name,
              onChanged: (value) {
                setState(() => selectedAsyncUser = value as User?);
              },
            ),
            const SizedBox(height: 24),
            const Text('Disabled Items (Alice is disabled)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SDropdownMenu<User>(
              items: users,
              hintText: 'Select a user',
              itemLabel: (user) => user.name,
              itemDisabled: (user) => user.name == 'Alice',
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const Text('Form Field Integration', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SDropdownFormField<String>(
              items: items,
              hintText: 'Select fruit in Form',
              validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const Text('Large List (Virtualization)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SDropdownMenu<int>(
              items: List<int>.generate(1000, (int index) => index),
              hintText: 'Select number (0-999)',
              itemLabel: (int item) => 'Item $item',
              menuMaxHeight: 300,
              onChanged: (dynamic value) {},
            ),
          ],
        ),
      ),
    );
  }
}

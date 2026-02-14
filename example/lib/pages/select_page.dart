import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SelectPage
    extends StatefulWidget {
  const SelectPage(
      {super.key});

  @override
  State<SelectPage>
      createState() =>
          _SelectPageState();
}

class _SelectPageState
    extends State<
        SelectPage> {
  final _formKey =
      GlobalKey<FormState>();

  String?
      _selectedFruit;
  List<String>
      _selectedFrameworks =
      [];
  String?
      _selectedCity;

  final List<SSelectItem<String>>
      _fruits =
      [
    const SSelectItem(
        value: 'apple',
        label: 'Apple',
        subtitle: 'A crunchy red fruit'),
    const SSelectItem(
        value: 'banana',
        label: 'Banana',
        subtitle: 'A long yellow fruit'),
    const SSelectItem(
        value: 'cherry',
        label: 'Cherry',
        subtitle: 'A small red fruit'),
    const SSelectItem(
        value: 'date',
        label: 'Date',
        subtitle: 'A sweet brown fruit',
        disabled: true),
    const SSelectItem(
        value: 'elderberry',
        label: 'Elderberry',
        subtitle: 'A small purple fruit'),
  ];

  final List<SSelectItem<String>>
      _frameworks =
      [
    const SSelectItem(
        value: 'flutter',
        label: 'Flutter'),
    const SSelectItem(
        value: 'react',
        label: 'React Native'),
    const SSelectItem(
        value: 'swift',
        label: 'SwiftUI'),
    const SSelectItem(
        value: 'kotlin',
        label: 'Compose'),
  ];

  Future<
      List<
          SSelectItem<String>>> _searchCities(
      String
          query) async {
    await Future<void>.delayed(
        const Duration(seconds: 1));
    final cities =
        [
      'New York',
      'London',
      'Tokyo',
      'Paris',
      'Berlin',
      'Accra',
      'Lagos',
      'Nairobi'
    ];
    return cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .map((city) => SSelectItem(value: city, label: city))
        .toList();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(
        title: const Text('SSelect Showcase'),
      ),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                'Basic Single Select',
                SSelect<String>(
                  items: _fruits,
                  value: _selectedFruit,
                  placeholder: 'Pick a fruit',
                  onChanged: (value) => setState(() => _selectedFruit = value),
                ),
              ),
              const SizedBox(height: 24),
              _buildSection(
                'Basic Multi Select',
                SMultiSelect<String>(
                  items: _frameworks,
                  values: _selectedFrameworks,
                  placeholder: 'Select frameworks',
                  onChanged: (values) => setState(() => _selectedFrameworks = values),
                ),
              ),
              const SizedBox(height: 24),
              _buildSection(
                'Async Search (Cities)',
                SSelect<String>(
                  items: const [], // Initial items empty
                  value: _selectedCity,
                  isAsync: true,
                  onSearch: _searchCities,
                  placeholder: 'Search for a city...',
                  onChanged: (value) => setState(() => _selectedCity = value),
                ),
              ),
              const SizedBox(height: 24),
              _buildSection(
                'Form Field with Validation',
                SSelectFormField<String>(
                  items: _fruits,
                  placeholder: 'REQUIRED: Select a fruit',
                  validator: (value) => value == null ? 'Please select a fruit' : null,
                ),
              ),
              const SizedBox(height: 24),
              _buildSection(
                'Adaptive UI (Sheet)',
                SSelect<String>(
                  items: _fruits,
                  value: _selectedFruit,
                  isAdaptive: true, // Will show sheet on mobile emulator/device
                  sheetTitle: 'Select your favorite fruit',
                  placeholder: 'Adaptive Select',
                  onChanged: (value) => setState(() => _selectedFruit = value),
                ),
              ),
              const SizedBox(height: 32),
              SButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid!')),
                    );
                  }
                },
                child: const Text('Validate Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      String
          title,
      Widget
          child) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

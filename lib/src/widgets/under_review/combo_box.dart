import 'package:flutter/material.dart';

/// Represents a framework item with a value and label.
class Framework {
  final String value;
  final String label;

  Framework({required this.value, required this.label});
}

/// The main ComboboxDemo widget.
class ComboboxDemo extends StatefulWidget {
  const ComboboxDemo({super.key});

  @override
  _ComboboxDemoState createState() => _ComboboxDemoState();
}

class _ComboboxDemoState extends State<ComboboxDemo> {
  String? _selectedValue;

  /// List of available frameworks.
  final List<Framework> frameworks = [
    Framework(value: 'next.js', label: 'Next.js'),
    Framework(value: 'sveltekit', label: 'SvelteKit'),
    Framework(value: 'nuxt.js', label: 'Nuxt.js'),
    Framework(value: 'remix', label: 'Remix'),
    Framework(value: 'astro', label: 'Astro'),
  ];

  void _openPopup() async {
    final String? selectedValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return ComboboxPopup(
          frameworks: frameworks,
          selectedValue: _selectedValue,
        );
      },
    );
    if (selectedValue != null) {
      setState(() {
        _selectedValue = selectedValue == _selectedValue ? null : selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String buttonText = _selectedValue != null
        ? frameworks.firstWhere((f) => f.value == _selectedValue).label
        : 'Select framework...';

    return OutlinedButton(
      onPressed: _openPopup,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(200, 40)),
        alignment: Alignment.centerLeft,
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(buttonText),
          Icon(Icons.unfold_more, size: 20, color: Colors.grey.shade600),
        ],
      ),
    );
  }
}

/// The popup dialog containing the search input and list of items.
class ComboboxPopup extends StatefulWidget {
  final List<Framework> frameworks;
  final String? selectedValue;

  const ComboboxPopup({super.key, required this.frameworks, this.selectedValue});

  @override
  _ComboboxPopupState createState() => _ComboboxPopupState();
}

class _ComboboxPopupState extends State<ComboboxPopup> {
  final TextEditingController _searchController = TextEditingController();
  List<Framework> filteredFrameworks = [];

  @override
  void initState() {
    super.initState();
    filteredFrameworks = widget.frameworks;
    _searchController.addListener(_filterFrameworks);
  }

  void _filterFrameworks() {
    setState(() {
      filteredFrameworks = widget.frameworks
          .where((f) => f.label
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterFrameworks);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search Input
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search framework...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // List of items
            if (filteredFrameworks.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: filteredFrameworks.length,
                  itemBuilder: (context, index) {
                    final Framework framework = filteredFrameworks[index];
                    final bool isSelected =
                        widget.selectedValue == framework.value;
                    return ListTile(
                      leading: Icon(
                        Icons.check,
                        color:
                        isSelected ? Colors.blue : Colors.transparent,
                      ),
                      title: Text(framework.label),
                      onTap: () {
                        Navigator.pop(context, framework.value);
                      },
                    );
                  },
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No framework found.'),
              ),
          ],
        ),
      ),
    );
  }
}

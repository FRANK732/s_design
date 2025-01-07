import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  // Example state variables to demonstrate button states
  bool _isLoading = false;
  bool _isEnabled = true;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _toggleEnabled() {
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SButton Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Variants
            const Text(
              'Variants',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SButton(
                  variant: SButtonVariant.defaultVariant,
                  onPressed: () {
                    // Handle default button press
                  },
                  child: const Text('Default'),
                ),
                SButton(
                  variant: SButtonVariant.destructive,
                  onPressed: () {
                    // Handle destructive button press
                  },
                  child: const Text('Destructive'),
                ),
                SButton(
                  variant: SButtonVariant.secondary,
                  onPressed: () {
                    // Handle secondary button press
                  },
                  child: const Text('Secondary'),
                ),
                SButton(
                  variant: SButtonVariant.outline,
                  onPressed: () {
                    // Handle outline button press
                  },
                  child: const Text('Outline'),
                ),
                SButton(
                  variant: SButtonVariant.destructiveOutline,
                  onPressed: () {
                    // Handle destructive outline button press
                  },
                  child: const Text('Destructive Outline'),
                ),
                SButton(
                  variant: SButtonVariant.ghost,
                  onPressed: () {
                    // Handle ghost button press
                  },
                  child: const Text('Ghost'),
                ),
                SButton(
                  variant: SButtonVariant.link,
                  onPressed: () {
                    // Handle link button press
                  },
                  child: const Text('Link'),
                ),
              ],
            ),
            const Divider(height: 40),

            // Section: Sizes
            const Text(
              'Sizes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SButton(
                  size: SButtonSize.sm,
                  onPressed: () {},
                  child: const Text('Small'),
                ),
                SButton(
                  size: SButtonSize.defaultSize,
                  onPressed: () {},
                  child: const Text('Default'),
                ),
                SButton(
                  size: SButtonSize.lg,
                  onPressed: () {},
                  child: const Text('Large'),
                ),
                SButton(
                  size: SButtonSize.icon,
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  child: const Text('Icon'),
                ),
              ],
            ),
            const Divider(height: 40),

            // Section: States
            const Text(
              'States',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SButton(
                  onPressed: _toggleLoading,
                  child: Text(_isLoading ? 'Stop Loading' : 'Start Loading'),
                ),
                SButton(
                  loading: _isLoading,
                  onPressed: () {},
                  child: const Text('Loading'),
                ),
                SButton(
                  state: SButtonState.enabled,
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
                SButton(
                  state: SButtonState.disabled,
                  onPressed: () {},
                  child: const Text('Disabled'),
                ),
                SButton(
                  state:
                      _isEnabled ? SButtonState.enabled : SButtonState.disabled,
                  onPressed: _isEnabled ? () {} : null,
                  child: Text(_isEnabled ? 'Enabled' : 'Disabled'),
                ),
                SButton(
                  onPressed: _toggleEnabled,
                  child: Text(_isEnabled ? 'Disable Button' : 'Enable Button'),
                ),
              ],
            ),
            const Divider(height: 40),

            // Section: With Icons
            const Text(
              'With Icons',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  child: const Text('Add'),
                ),
                SButton(
                  variant: SButtonVariant.destructive,
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
                SButton(
                  variant: SButtonVariant.secondary,
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                  child: const Text('Edit'),
                ),
                SButton(
                  size: SButtonSize.icon,
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                  child: null,
                ),
              ],
            ),
            const Divider(height: 40),

            // Section: Custom Dimensions
            const Text(
              'Custom Dimensions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SButton(
                  height: 50,
                  width: 150,
                  onPressed: () {},
                  child: const Text('Fixed Size'),
                ),
                SButton(
                  height: 60,
                  width: 200,
                  variant: SButtonVariant.destructive,
                  onPressed: () {},
                  child: const Text('Large Fixed'),
                ),
                SButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  onPressed: () {},
                  child: const Text('Custom Padding'),
                ),
              ],
            ),
            const Divider(height: 40),

            // Section: Themed Buttons
            const Text(
              'Custom Themed Buttons',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SButton(
                  backgroundColor: const Color.fromARGB(170, 98, 25, 187),
                  onPressed: () {},
                  child: const Text('Background Color'),
                ),
                SButton(
                  buttonStyle: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    shadowColor: WidgetStateProperty.all(Colors.blueAccent),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: WidgetStateProperty.all(5),
                  ),
                  variant: SButtonVariant.defaultVariant,
                  onPressed: () {},
                  child: const Text('Custom Styling'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

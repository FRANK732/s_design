import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_design/s_design.dart';

class ButtonPage
    extends StatefulWidget {
  const ButtonPage(
      {super.key});

  @override
  State<ButtonPage>
      createState() =>
          _ButtonPageState();
}

class _ButtonPageState
    extends State<
        ButtonPage> {
  // Example state variables to demonstrate button states
  bool
      _isLoading =
      false;
  bool
      _isEnabled =
      true;

  void
      _toggleLoading() {
    setState(
        () {
      _isLoading =
          !_isLoading;
    });
  }

  void
      _toggleEnabled() {
    setState(
        () {
      _isEnabled =
          !_isEnabled;
    });
  }

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(
        title: const Text('SButton Showcase'),
      ),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Section: Variants
            const Text(
              'Variants',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                SButton(
                  onPressed: () {
                    // Handle default button press
                  },
                  child: const Text('Default'),
                ),
                SButton(
                  variant: ButtonVariant.destructive,
                  onPressed: () {
                    // Handle destructive button press
                  },
                  child: const Text('Destructive'),
                ),
                SButton(
                  variant: ButtonVariant.secondary,
                  onPressed: () {
                    // Handle secondary button press
                  },
                  child: const Text('Secondary'),
                ),
                SButton(
                  variant: ButtonVariant.outline,
                  onPressed: () {
                    // Handle outline button press
                  },
                  child: const Text('Outline'),
                ),
                SButton(
                  variant: ButtonVariant.destructiveOutline,
                  onPressed: () {
                    // Handle destructive outline button press
                  },
                  child: const Text('Destructive Outline'),
                ),
                SButton(
                  variant: ButtonVariant.ghost,
                  onPressed: () {
                    // Handle ghost button press
                  },
                  child: const Text('Ghost'),
                ),
                SButton(
                  variant: ButtonVariant.link,
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
              children: <Widget>[
                SButton(
                  size: ButtonSize.sm,
                  onPressed: () {},
                  child: const Text('Small'),
                ),
                SButton(
                  onPressed: () {},
                  child: const Text('Default'),
                ),
                SButton(
                  size: ButtonSize.lg,
                  onPressed: () {},
                  child: const Text('Large'),
                ),
                SButton(
                  size: ButtonSize.icon,
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
              children: <Widget>[
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
                  state: ButtonState.enabled,
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
                SButton(
                  state: ButtonState.disabled,
                  onPressed: () {},
                  child: const Text('Disabled'),
                ),
                SButton(
                  state: _isEnabled ? ButtonState.enabled : ButtonState.disabled,
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
              children: <Widget>[
                SButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  child: const Text('Add'),
                ),
                SButton(
                  variant: ButtonVariant.destructive,
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
                SButton(
                  variant: ButtonVariant.secondary,
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                  child: const Text('Edit'),
                ),
                SButton(
                  size: ButtonSize.icon,
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
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
              children: <Widget>[
                SButton(
                  height: 50,
                  width: 150,
                  onPressed: () {},
                  child: const Text('Fixed Size'),
                ),
                SButton(
                  height: 60,
                  width: 200,
                  variant: ButtonVariant.destructive,
                  onPressed: () {},
                  child: const Text('Large Fixed'),
                ),
                SButton(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
              children: <Widget>[
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
                  onPressed: () {},
                  child: const Text('Custom Styling'),
                ),
              ],
            ),
            const Divider(height: 40),

            // Section: Advanced Features
            const Text(
              'Advanced Features',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Leading & Trailing Icons:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: () {},
              leadingIcon: const Icon(Icons.arrow_back, size: 18),
              trailingIcon: const Icon(Icons.arrow_forward, size: 18),
              child: const Text('Navigation'),
            ),
            const SizedBox(height: 16),
            const Text('Full Width:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: () {},
              isFullWidth: true,
              child: const Text('Full Width Button'),
            ),
            const SizedBox(height: 16),
            const Text('Debounced (1s):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: () {
                debugPrint('Debounced button pressed!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Action Executed!'),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
              debounceDuration: const Duration(seconds: 1),
              child: const Text('Press Repeatedly'),
            ),
            const SizedBox(height: 16),
            const Text('Haptic Feedback:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: () {},
              enableHapticFeedback: true,
              variant: ButtonVariant.secondary,
              child: const Text('Press for Haptics'),
            ),
            const Divider(height: 40),

            // Section: UX & Interaction
            const Text(
              'UX & Interaction',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Loading with Text:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: [
                SButton(
                  onPressed: _toggleLoading,
                  loading: _isLoading,
                  loadingText: 'Saving...',
                  child: const Text('Save Record'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Disabled with Tooltip:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: null, // Disabled
              disabledTooltip: 'Permission required to delete',
              variant: ButtonVariant.destructive,
              child: const Text('Delete Account'),
            ),
            const SizedBox(height: 16),
            const Text('Badge / Notification:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: () {},
              variant: ButtonVariant.secondary,
              badge: const Text('3'),
              child: const Text('Inbox'),
            ),
            const SizedBox(height: 16),
            const Text('Toggle Button (Selected State):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: _toggleEnabled, // Reusing toggle for demo
              isSelected: !_isEnabled, // Using !_isEnabled as selected state for demo
              variant: ButtonVariant.outline,
              child: Text(!_isEnabled ? 'Selected' : 'Not Selected'),
            ),
            const SizedBox(height: 16),
            const Text('Keyboard Shortcut (Ctrl+S):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Shortcut Triggered!')),
                );
              },
              shortcut: const SingleActivator(LogicalKeyboardKey.keyS, control: true),
              child: const Text('Save (Ctrl+S)'),
            ),
          ],
        ),
      ),
    );
  }
}

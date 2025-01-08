import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  SCheckboxState _defaultCheckboxState = SCheckboxState.unchecked;
  SCheckboxState _customColoredCheckboxState = SCheckboxState.unchecked;
  SCheckboxState _largeStyledCheckboxState = SCheckboxState.unchecked;
  final SCheckboxState _disabledCheckboxState = SCheckboxState.unchecked;
  SCheckboxState _indeterminateCheckboxState = SCheckboxState.unchecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCheckbox Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Default Checkbox'),
            const SizedBox(height: 8),
            Row(
              children: [
                SCheckbox(
                  value: _defaultCheckboxState,
                  onChanged: (SCheckboxState newState) {
                    setState(() {
                      _defaultCheckboxState = newState;
                    });
                  },
                ),
                const SizedBox(width: 10),
                const Text('Default Checkbox'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Custom Colored Checkbox'),
            const SizedBox(height: 8),
            Row(
              children: [
                SCheckbox(
                  value: _customColoredCheckboxState,
                  onChanged: (SCheckboxState newState) {
                    setState(() {
                      _customColoredCheckboxState = newState;
                    });
                  },
                  size: 24.0,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  borderColor: Colors.green,
                ),
                const SizedBox(width: 10),
                const Text('Custom Colored Checkbox'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Large Sized Checkbox with Custom Styling'),
            const SizedBox(height: 8),
            Row(
              children: [
                SCheckbox(
                  value: _largeStyledCheckboxState,
                  onChanged: (SCheckboxState newState) {
                    setState(() {
                      _largeStyledCheckboxState = newState;
                    });
                  },
                  size: 30.0,
                  activeColor: Colors.blue,
                  checkColor: Colors.yellow,
                  borderColor: Colors.blueAccent,
                ),
                const SizedBox(width: 10),
                const Text('Large Styled Checkbox'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Disabled Checkbox'),
            const SizedBox(height: 8),
            Row(
              children: [
                SCheckbox(
                  value: _disabledCheckboxState,
                  onChanged: null,
                  size: 24.0,
                  activeColor: Colors.grey,
                  checkColor: Colors.white,
                  borderColor: Colors.grey,
                  isDisabled: true,
                ),
                const SizedBox(width: 10),
                const Text('Disabled Checkbox'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Indeterminate Checkbox'),
            const SizedBox(height: 8),
            Row(
              children: [
                SCheckbox(
                  intermediate: false,
                  value: _indeterminateCheckboxState,
                  onChanged: (SCheckboxState newState) {
                    setState(() {
                      _indeterminateCheckboxState = newState;
                    });
                  },
                  size: 24.0,
                  activeColor: Colors.orange,
                  checkColor: Colors.white,
                  borderColor: Colors.orange,
                ),
                const SizedBox(width: 10),
                const Text('Determinate Checkbox'),
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

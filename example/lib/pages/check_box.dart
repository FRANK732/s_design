import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
// Note: Extensions/exports are usually in s_design.dart.
// If s_design.dart exports the new files, we don't need extra imports here if we import s_design.dart.
// CheckboxPage imports 'package:s_design/s_design.dart'; at line 2.
// So if I fix s_design.dart, I don't need to add imports here!
// But I will verify.

class CheckboxPage
    extends StatefulWidget {
  const CheckboxPage(
      {super.key});

  @override
  State<CheckboxPage>
      createState() =>
          _CheckboxPageState();
}

class _CheckboxPageState
    extends State<
        CheckboxPage> {
  SCheckboxState
      _defaultCheckboxState =
      SCheckboxState.unchecked;
  SCheckboxState
      _customColoredCheckboxState =
      SCheckboxState.unchecked;
  SCheckboxState
      _largeStyledCheckboxState =
      SCheckboxState.unchecked;
  final SCheckboxState
      _disabledCheckboxState =
      SCheckboxState.unchecked;
  SCheckboxState
      _indeterminateCheckboxState =
      SCheckboxState.unchecked;

  // Enterprise Features State
  SCheckboxState
      _listTileState =
      SCheckboxState.unchecked;
  bool
      _formFieldValue =
      false;
  final GlobalKey<FormState>
      _formKey =
      GlobalKey<FormState>();

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(
        title: const Text('SCheckbox Showcase'),
      ),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTitle('Default Checkbox'),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
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
              children: <Widget>[
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
              children: <Widget>[
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
              children: <Widget>[
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
            _buildSectionTitle('Determinate Checkbox'),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
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
            _buildSectionTitle('States & Validation'),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                SCheckbox(
                  value: _defaultCheckboxState,
                  onChanged: (SCheckboxState newState) {
                    setState(() {
                      _defaultCheckboxState = newState;
                    });
                  },
                  isError: true,
                ),
                const SizedBox(width: 10),
                const Text('Error State'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Focus & Hover supported automatically.'),
            const Divider(height: 40),
            _buildSectionTitle('Enterprise Features'),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  SCheckboxListTile(
                    title: const Text('Notifications'),
                    subtitle: const Text('Receive push notifications'),
                    value: _listTileState,
                    onChanged: (SCheckboxState newState) {
                      setState(() {
                        _listTileState = newState;
                      });
                    },
                    secondary: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SCheckboxFormField(
                    title: const Text('I accept the Terms and Conditions'),
                    initialValue: _formFieldValue,
                    onChanged: (bool value) {
                      setState(() {
                        _formFieldValue = value;
                      });
                    },
                    validator: (bool? value) {
                      if (value != true) {
                        return 'You must accept the terms.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  SButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted!')),
                        );
                      }
                    },
                    textStyle: const TextStyle(color: Colors.white),
                    child: const Text('Submit Form'),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      String
          title) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0),
      child:
          Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

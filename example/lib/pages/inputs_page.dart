import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class InputFieldPage extends StatefulWidget {
  const InputFieldPage({super.key});

  @override
  State<InputFieldPage> createState() => _InputFieldPageState();
}

class _InputFieldPageState extends State<InputFieldPage> {
  final TextEditingController _defaultController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _iconController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _validationController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _defaultFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _iconFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _validationFocusNode = FocusNode();

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // print('Form is valid');
    }
  }

  @override
  void dispose() {
    _defaultController.dispose();
    _passwordController.dispose();
    _iconController.dispose();
    _dateController.dispose();
    _validationController.dispose();

    _defaultFocusNode.dispose();
    _passwordFocusNode.dispose();
    _iconFocusNode.dispose();
    _dateFocusNode.dispose();
    _validationFocusNode.dispose();

    super.dispose();
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SInputField Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildSectionTitle('Default Input Field'),
              const SizedBox(height: 8),
              SInputField(
                controller: _defaultController,
                focusNode: _defaultFocusNode,
                hintText: 'Enter text',
              ),
              const Divider(height: 40),
              _buildSectionTitle('Password Field'),
              const SizedBox(height: 8),
              SInputField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                hintText: 'Enter password',
                obscureText: true,
              ),
              const Divider(height: 40),
              _buildSectionTitle('Input with Icons'),
              const SizedBox(height: 8),
              SInputField.search(
                controller: _iconController,
                focusNode: _iconFocusNode,
                hintText: 'Search',
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    _iconController.clear();
                  }
                },
              ),
              const Divider(height: 40),
              _buildSectionTitle('Date Picker Input'),
              const SizedBox(height: 8),
              SInputField.datePicker(
                controller: _dateController,
                focusNode: _dateFocusNode,
                hintText: 'Select date',
                initialDate: DateTime.now(),
              ),
              const Divider(height: 40),
              _buildSectionTitle('Input with Validation'),
              const SizedBox(height: 8),
              SInputField(
                controller: _validationController,
                focusNode: _validationFocusNode,
                hintText: 'Enter your name',
                validator: _validateNotEmpty,
                onSaved: (value) {
                  // Handle saved value
                },
              ),
              const SizedBox(height: 20),
              SButton(
                onPressed: _onSubmit,
                child: const Text('Submit'),
              ),
              const Divider(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

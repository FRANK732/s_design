import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'package:intl/intl.dart';

class InputFieldPage extends StatefulWidget {
  const InputFieldPage({super.key});

  @override
  State<InputFieldPage> createState() => _InputFieldPageState();
}

class _InputFieldPageState extends State<InputFieldPage> {
  final TextEditingController _defaultController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _iconController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(DateTime.now()),);
  final TextEditingController _validationController = TextEditingController();
  final TextEditingController _customController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _defaultFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _iconFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _validationFocusNode = FocusNode();
  final FocusNode _customFocusNode = FocusNode();

  _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
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
              SInputField.number(
                validator: (val) {
                  if (val!.isEmpty || val.length < 10) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                controller: _defaultController,
                focusNode: _defaultFocusNode,
                hintText: 'Enter number',
              ),
              const Divider(height: 40),
              _buildSectionTitle('Password Field'),
              const SizedBox(height: 8),
              SInputField.password(
                // size: SInputFieldSize.small,
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                hintText: 'Enter password',
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
              ),
              const Divider(height: 40),
              _buildSectionTitle('Input with Validation'),
              const SizedBox(height: 8),
              SInputField.email(
                controller: _validationController,
                focusNode: _validationFocusNode,
                hintText: 'Enter your email',
                validator: _validateNotEmpty,
                onChanged: (value) {
                  // Handle saved value
                },
              ),
              const Divider(height: 40),
              _buildSectionTitle('Input Customization'),
              const SizedBox(height: 8),
              SInputField(
                // initialValue: 'Hello',
                size: SInputFieldSize.large,
                controller: _customController,
                focusNode: _customFocusNode,
                hintText: 'Custom',
                validator: _validateNotEmpty,
                onChanged: (value) {
                  print('Value changed: $value');
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

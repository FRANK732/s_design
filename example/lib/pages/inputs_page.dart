import 'dart:developer'
    as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:s_design/s_design.dart';

class InputFieldPage
    extends StatefulWidget {
  const InputFieldPage(
      {super.key});

  @override
  State<InputFieldPage>
      createState() =>
          _InputFieldPageState();
}

class _InputFieldPageState
    extends State<
        InputFieldPage> {
  final TextEditingController
      _defaultController =
      TextEditingController();
  final TextEditingController
      _passwordController =
      TextEditingController();
  final TextEditingController
      _iconController =
      TextEditingController();
  final TextEditingController
      _dateController =
      TextEditingController(
    text:
        DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  final TextEditingController
      _validationController =
      TextEditingController();
  final TextEditingController
      _customController =
      TextEditingController();

  final GlobalKey<FormState>
      _formKey =
      GlobalKey<FormState>();

  final FocusNode
      _defaultFocusNode =
      FocusNode();
  final FocusNode
      _passwordFocusNode =
      FocusNode();
  final FocusNode
      _iconFocusNode =
      FocusNode();
  final FocusNode
      _dateFocusNode =
      FocusNode();
  final FocusNode
      _validationFocusNode =
      FocusNode();
  final FocusNode
      _customFocusNode =
      FocusNode();

  Future<void>
      _onSubmit() async {
    if (_formKey
        .currentState!
        .validate()) {}
  }

  @override
  void
      dispose() {
    _defaultController
        .dispose();
    _passwordController
        .dispose();
    _iconController
        .dispose();
    _dateController
        .dispose();
    _validationController
        .dispose();

    _defaultFocusNode
        .dispose();
    _passwordFocusNode
        .dispose();
    _iconFocusNode
        .dispose();
    _dateFocusNode
        .dispose();
    _validationFocusNode
        .dispose();

    super
        .dispose();
  }

  String? _validateNotEmpty(
      String?
          value) {
    if (value == null ||
        value.isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(
        title: const Text('SInputField Showcase'),
      ),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildSectionTitle('Default Input Field'),
              const SizedBox(height: 8),
              SInputField.number(
                validator: (String? val) {
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
                validator: (String? data) {
                  if (data!.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                onChanged: (String value) {
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
                onChanged: (String value) {
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
                onChanged: (String value) {
                  dev.log('Value changed: $value');
                },
              ),
              const Divider(height: 40),
              _buildSectionTitle('Formatted Input (Credit Card)'),
              const SizedBox(height: 8),
              SInputField(
                controller: TextEditingController(),
                hintText: '0000 0000 0000 0000',
                labelText: 'Card Number',
                helperText: 'We do not store your card details',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _CreditCardFormatter(),
                ],
                startIcon: const Icon(Icons.credit_card),
              ),
              const SizedBox(height: 20),
              SButton(
                onPressed: _onSubmit,
                child: const Text('Submit'),
              ),
              const Divider(height: 40),
              _buildSectionTitle('Real World Features'),
              const SizedBox(height: 8),
              SInputField(
                controller: TextEditingController(),
                labelText: 'Price',
                hintText: '0.00',
                prefixText: r'$',
                suffixText: 'USD',
                helperText: 'Enter the price in USD',
                size: SInputFieldSize.large,
              ),
              const SizedBox(height: 16),
              SInputField(
                controller: TextEditingController(),
                labelText: 'Server Status',
                hintText: 'Checking...',
                isLoading: true,
                helperText: 'Validating connection...',
              ),
              const SizedBox(height: 16),
              SInputField(
                controller: TextEditingController(text: 'invalid_api_key'),
                labelText: 'API Key',
                errorText: 'Invalid API Key (Server Error)',
              ),
              const Divider(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      String
          title) {
    return Align(
      alignment:
          Alignment.centerLeft,
      child:
          Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _CreditCardFormatter
    extends TextInputFormatter {
  @override
  TextEditingValue
      formatEditUpdate(
    TextEditingValue
        oldValue,
    TextEditingValue
        newValue,
  ) {
    final String
        text =
        newValue.text;

    if (newValue.selection.baseOffset ==
        0) {
      return newValue;
    }

    final StringBuffer
        buffer =
        StringBuffer();
    for (int i = 0;
        i < text.length;
        i++) {
      buffer.write(text[i]);
      final int
          nonZeroIndex =
          i + 1;
      if (nonZeroIndex % 4 == 0 &&
          nonZeroIndex != text.length) {
        buffer.write(' '); // Add double spaces.
      }
    }

    final String
        string =
        buffer.toString();
    return newValue
        .copyWith(
      text:
          string,
      selection:
          TextSelection.collapsed(offset: string.length),
    );
  }
}

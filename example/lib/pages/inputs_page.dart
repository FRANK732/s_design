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

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);

    String?
        validateNotEmpty(String? value) {
      if (value == null ||
          value.isEmpty) {
        return l10n.inputErrorEmpty;
      }
      return null;
    }

    return SScaffold(
      appBar:
          AppBar(
        title: Text(l10n.inputTitleShowcase),
      ),
      renderBody: (context) =>
          SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildSectionTitle(l10n.inputSectionDefault),
              const SizedBox(height: 8),
              SInputField.number(
                validator: (String? val) {
                  if (val!.isEmpty || val.length < 10) {
                    return l10n.inputErrorNumber;
                  }
                  return null;
                },
                controller: _defaultController,
                focusNode: _defaultFocusNode,
                hintText: l10n.inputHintNumber,
              ),
              const Divider(height: 40),
              _buildSectionTitle(l10n.inputSectionPassword),
              const SizedBox(height: 8),
              SInputField.password(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                hintText: l10n.inputHintPassword,
              ),
              const Divider(height: 40),
              _buildSectionTitle(l10n.inputSectionIcons),
              const SizedBox(height: 8),
              SInputField.search(
                controller: _iconController,
                focusNode: _iconFocusNode,
                hintText: l10n.inputHintSearch,
                validator: validateNotEmpty,
                onChanged: (String value) {
                  if (value.isEmpty) {
                    _iconController.clear();
                  }
                },
              ),
              const Divider(height: 40),
              _buildSectionTitle(l10n.inputSectionDatePicker),
              const SizedBox(height: 8),
              SInputField.datePicker(
                controller: _dateController,
                focusNode: _dateFocusNode,
                hintText: l10n.inputHintDate,
              ),
              const Divider(height: 40),
              _buildSectionTitle(l10n.inputSectionValidation),
              const SizedBox(height: 8),
              SInputField.email(
                controller: _validationController,
                focusNode: _validationFocusNode,
                hintText: l10n.inputHintEmail,
                validator: validateNotEmpty,
                onChanged: (String value) {
                  // Handle saved value
                },
              ),
              const Divider(height: 40),
              _buildSectionTitle(l10n.inputSectionCustom),
              const SizedBox(height: 8),
              SInputField(
                size: SInputFieldSize.large,
                controller: _customController,
                focusNode: _customFocusNode,
                hintText: l10n.inputHintCustom,
                onChanged: (String value) {
                  dev.log('Value changed: $value');
                },
              ),
              const Divider(height: 40),
              _buildSectionTitle(l10n.inputSectionCard),
              const SizedBox(height: 8),
              SInputField(
                controller: TextEditingController(),
                hintText: l10n.inputHintCard,
                labelText: l10n.inputLabelCard,
                helperText: l10n.inputHelperCard,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _CreditCardFormatter(),
                ],
                startIcon: const Icon(Icons.credit_card),
              ),
              const SizedBox(height: 20),
              SButton(
                onPressed: _onSubmit,
                child: Text(l10n.inputBtnSubmit),
              ),
              const Divider(height: 40),
              _buildSectionTitle(l10n.inputSectionRealWorld),
              const SizedBox(height: 8),
              SInputField(
                controller: TextEditingController(),
                labelText: l10n.inputLabelPrice,
                hintText: l10n.inputHintPrice,
                prefixText: r'$',
                suffixText: 'USD',
                helperText: l10n.inputHelperPrice,
                size: SInputFieldSize.large,
              ),
              const SizedBox(height: 16),
              SInputField(
                controller: TextEditingController(),
                labelText: l10n.inputLabelStatus,
                hintText: l10n.inputHintStatus,
                isLoading: true,
                helperText: l10n.inputHelperStatus,
              ),
              const SizedBox(height: 16),
              SInputField(
                controller: TextEditingController(text: 'invalid_api_key'),
                labelText: l10n.inputLabelApiKey,
                errorText: l10n.inputErrorApiKey,
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

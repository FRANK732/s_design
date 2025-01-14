import 'package:flutter/material.dart';

/// A self-contained form widget that manages form state, validation,
/// and displays form fields with labels, inputs, and error messages.
class AdvancedFormWidget extends StatefulWidget {
  /// A callback function that receives the form values when the form is submitted.
  final void Function(Map<String, dynamic> values) onSubmit;

  /// A list of fields to be rendered in the form.
  final List<FormFieldData> fields;

  /// Creates an instance of AdvancedFormWidget.
  const AdvancedFormWidget({
    super.key,
    required this.onSubmit,
    required this.fields,
  });

  @override
  _AdvancedFormWidgetState createState() => _AdvancedFormWidgetState();
}

class _AdvancedFormWidgetState extends State<AdvancedFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _values = {};
  final Map<String, String?> _errors = {};

  @override
  void initState() {
    super.initState();
    // Initialize field values with initialValue if provided.
    for (var field in widget.fields) {
      _values[field.name] = field.initialValue;
    }
  }

  void _setFieldValue(String name, dynamic value) {
    setState(() {
      _values[name] = value;
    });
  }

  dynamic _getFieldValue(String name) {
    return _values[name];
  }

  String? _validateField(FormFieldData field, dynamic value) {
    if (field.validator != null) {
      return field.validator!(value);
    }
    return null;
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      widget.onSubmit(_values);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Spread the list of field widgets into the children list
          ...widget.fields.map((field) {
            final error = _errors[field.name];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _buildFormField(field, error),
            );
          }),
          // Add the submit button as a separate widget
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(FormFieldData field, String? error) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (field.label != null)
          Text(
            field.label!,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: error != null ? Colors.redAccent[100]: null,
            ),
          ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: _getFieldValue(field.name)?.toString(),
          decoration: InputDecoration(
            hintText: field.hintText,
            errorText: error,
          ),
          obscureText: field.obscureText,
          keyboardType: field.keyboardType,
          onChanged: (value) {
            _setFieldValue(field.name, value);
            final validationError = _validateField(field, value);
            setState(() {
              _errors[field.name] = validationError;
            });
          },
          validator: (value) => _validateField(field, value),
        ),
        if (field.description != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              field.description!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}

/// Represents the data for a form field.
class FormFieldData {
  /// The name of the field, used as a key in the form values map.
  final String name;

  /// The label displayed above the input.
  final String? label;

  /// The hint text displayed inside the input.
  final String? hintText;

  /// An optional description displayed below the input.
  final String? description;

  /// The initial value of the field.
  final String? initialValue;

  /// Whether the input should obscure the text (e.g., for passwords).
  final bool obscureText;

  /// The keyboard type for the input.
  final TextInputType keyboardType;

  /// A validator function that returns an error message if the input is invalid.
  final String? Function(String?)? validator;

  /// Creates an instance of FormFieldData.
  FormFieldData({
    required this.name,
    this.label,
    this.hintText,
    this.description,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });
}

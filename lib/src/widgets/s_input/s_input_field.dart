import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_input/enums/s_input_field_size.dart';
import 'package:s_design/src/widgets/s_input/themes/s_input_field_theme.dart';
import 'package:s_design/src/widgets/s_input/utils/s_input_field_utils.dart';

/// A comprehensive Input Field Widget that supports various configurations,
/// including size variants, icons, validation.
class SInputField extends StatefulWidget {
  /// The controller for the input field.
  final TextEditingController? controller;

  /// The focus node for the input field.
  final FocusNode? focusNode;

  /// The size variant of the input field.
  final SInputFieldSize size;

  /// The hint text displayed when the input field is empty.
  final String? hintText;

  /// Whether to obscure the input text (e.g., for passwords).
  final bool obscureText;

  /// Whether the input field is enabled.
  final bool enabled;

  /// The style for the hint text.
  final TextStyle? hintStyle;

  /// Whether the input field is read-only.
  final bool readOnly;

  /// The initial value of the input field.
  final String? initialValue;

  /// The type of keyboard to use for input.
  final TextInputType? keyboardType;

  /// The action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// The widget to display at the start of the input field.
  final Widget? startIcon;

  /// The widget to display at the end of the input field.
  final Widget? endIcon;

  /// The validator function for form validation.
  final String? Function(String?)? validator;

  /// The function to call when the form is saved.
  final FormFieldSetter<String>? onSaved;

  /// The function to call when the input value changes.
  final ValueChanged<String>? onChanged;

  /// The function to call when editing is complete.
  final VoidCallback? onEditingComplete;

  /// The function to call when the input field is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// The maximum number of lines for the input field.
  final int? maxLines;

  /// The minimum number of lines for the input field.
  final int? minLines;

  /// The maximum length of input.
  final int? maxLength;

  /// The padding inside the input field.
  final EdgeInsetsGeometry? contentPadding;

  /// The decoration for the input field.
  final InputDecoration? decoration;

  /// The text style for the input text.
  final TextStyle? style;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Whether to autofocus the input field.
  final bool autofocus;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Autofill hints for the input field.
  final Iterable<String>? autofillHints;

  /// Background Color
  final Color? backgroundColor;

  /// Creates an [SInputField] widget.
  const SInputField({
    Key? key,
    this.controller,
    this.focusNode,
    this.size = SInputFieldSize.sm,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.startIcon,
    this.endIcon,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.minLines,
    this.backgroundColor,
    this.maxLength,
    this.contentPadding,
    this.decoration,
    this.style,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.autofillHints,
    this.hintStyle,
  }) : super(key: key);

  factory SInputField.password({
    Key? key,
    required TextEditingController controller,
    FocusNode? focusNode,
    String? hintText,
    bool enabled = true,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    int? maxLength,
    EdgeInsetsGeometry? contentPadding,
    InputDecoration? decoration,
    TextStyle? style,
    bool autocorrect = false,
    bool autofocus = false,
    bool enableSuggestions = false,
    Iterable<String>? autofillHints,
  }) {
    return SInputField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      obscureText: true,
      enabled: enabled,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      contentPadding: contentPadding,
      decoration: decoration,
      style: style,
      autocorrect: autocorrect,
      autofocus: autofocus,
      enableSuggestions: enableSuggestions,
      autofillHints: autofillHints,
    );
  }
  factory SInputField.datePicker({
    Key? key,
    required TextEditingController controller,
    FocusNode? focusNode,
    String? hintText,
    bool enabled = true,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    int? maxLength,
    EdgeInsetsGeometry? contentPadding,
    InputDecoration? decoration,
    TextStyle? style,
    bool autocorrect = true,
    bool autofocus = false,
    bool enableSuggestions = true,
    Iterable<String>? autofillHints,
    DateTime? initialDate,
    String? dateFormat,
  }) {
    return SInputField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      enabled: enabled,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      contentPadding: contentPadding,
      decoration: decoration,
      style: style,
      autocorrect: autocorrect,
      autofocus: autofocus,
      enableSuggestions: enableSuggestions,
      autofillHints: autofillHints,
      endIcon: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime initialDateValue = initialDate ?? DateTime.now();
              DateTime firstDate = DateTime(1900);
              DateTime lastDate =
                  DateTime.now().add(const Duration(days: 365 * 100));

              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: initialDateValue,
                firstDate: firstDate,
                lastDate: lastDate,
              );

              if (pickedDate != null) {
                controller.text = dateFormat ??
                    "${pickedDate.day.toString().padLeft(2, '0')}-"
                        "${pickedDate.month.toString().padLeft(2, '0')}-"
                        "${pickedDate.year}";
                if (onChanged != null) {
                  onChanged(controller.text);
                }
              }
            },
          );
        },
      ),
    );
  }

  factory SInputField.search({
    Key? key,
    required TextEditingController controller,
    FocusNode? focusNode,
    String? hintText,
    bool enabled = true,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    int? maxLength,
    EdgeInsetsGeometry? contentPadding,
    InputDecoration? decoration,
    TextStyle? style,
    bool autocorrect = true,
    bool autofocus = false,
    bool enableSuggestions = true,
    Iterable<String>? autofillHints,

  }) {
    return SInputField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      enabled: enabled,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      contentPadding: contentPadding,
      decoration: decoration,
      style: style,
      autocorrect: autocorrect,
      autofocus: autofocus,
      enableSuggestions: enableSuggestions,
      autofillHints: autofillHints,
      startIcon: Icon(Icons.search),
      endIcon: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          controller.clear();
          if (onChanged != null) {
            onChanged('');
          }
        },
      ),
    );
  }

  @override
  _SInputFieldState createState() => _SInputFieldState();
}

/// State class for [SInputField].
class _SInputFieldState extends State<SInputField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _obscureText = false;
  bool _showObscureToggle = false;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.obscureText;
    _showObscureToggle = widget.obscureText;

    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  double _getHeight() {
    return SInputFieldUtils.getHeight(widget.size);
  }

  EdgeInsetsGeometry _getContentPadding() {
    return widget.contentPadding ??
        SInputFieldUtils.getContentPadding(widget.size).copyWith(
          left: widget.startIcon != null ? 40.0 : 16.0,
          right: (_showObscureToggle || widget.endIcon != null) ? 40.0 : 16.0,
        );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = SInputFieldUtils.getBorderRadius(widget.size);

    InputBorder buildBorder(Color color) {
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: color, width: 1.0),
      );
    }

    // Determine the hint style
    TextStyle? determineHintStyle() {
      if (widget.hintStyle != null) {
        return widget.hintStyle;
      } else {
        return Theme.of(context).sInputFieldTheme.hintTextColor != Colors.grey
            ? Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).sInputFieldTheme.hintTextColor,
                )
            : null;
      }
    }
    InputDecoration _mergeDecorations(InputDecoration base, InputDecoration? override) {
      return base.copyWith(
        hintText: override?.hintText ?? base.hintText,
        hintStyle: override?.hintStyle ?? base.hintStyle,
        filled: override?.filled ?? base.filled,
        fillColor: override?.fillColor ?? base.fillColor,
        contentPadding: override?.contentPadding ?? base.contentPadding,
        enabledBorder: override?.enabledBorder ?? base.enabledBorder,
        focusedBorder: override?.focusedBorder ?? base.focusedBorder,
        errorBorder: override?.errorBorder ?? base.errorBorder,
        disabledBorder: override?.disabledBorder ?? base.disabledBorder,
        prefixIcon: override?.prefixIcon ?? base.prefixIcon,
        suffixIcon: override?.suffixIcon ?? base.suffixIcon,
      );
    }

    final InputDecoration effectiveDecoration =
        (widget.decoration ?? const InputDecoration()).copyWith(
      hintText: widget.hintText,
      hintStyle: determineHintStyle(),
      filled: true,
      fillColor: widget.backgroundColor ??
          Theme.of(context).sInputFieldTheme.backgroundColor,
      contentPadding: _getContentPadding(),
      enabledBorder:
          buildBorder(Theme.of(context).sInputFieldTheme.enabledBorderColor),
      focusedBorder:
          buildBorder(Theme.of(context).sInputFieldTheme.focusedBorderColor),
      errorBorder:
          buildBorder(Theme.of(context).sInputFieldTheme.errorBorderColor),
      disabledBorder:
          buildBorder(Theme.of(context).sInputFieldTheme.enabledBorderColor),
      prefixIcon: widget.startIcon,
      suffixIcon: _showObscureToggle
          ? IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                size: 20.0,
                color: Theme.of(context).sInputFieldTheme.iconColor,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              tooltip: _obscureText ? 'Show Password' : 'Hide Password',
            )
          : widget.endIcon,
    );

    final InputDecoration finalDecoration = _mergeDecorations(effectiveDecoration, widget.decoration);


    return Stack(
      children: [
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: widget.style ??
              Theme.of(context).sInputFieldTheme.textStyle ??
              TextStyle(
                color: Theme.of(context).sInputFieldTheme.textColor,
                fontSize: 14.0,
              ),
          autocorrect: widget.autocorrect,
          autofocus: widget.autofocus,
          enableSuggestions: widget.enableSuggestions,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          autofillHints: widget.autofillHints,
          validator: widget.validator,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: finalDecoration,
        ),
      ],
    );
  }
}

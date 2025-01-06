import 'package:flutter/material.dart';
import 'package:s_design/src/widgets/s_input/enums/s_input_field_size.dart';
import 'package:s_design/src/widgets/s_input/themes/s_input_field_theme.dart';
import 'package:s_design/src/widgets/s_input/utils/s_input_field_utils.dart';

/// A comprehensive Input Field Widget that supports various configurations,
/// including size variants, icons, validation, and optional date picker functionality.
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
  final FormFieldValidator<String>? validator;

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

  /// Determines if the input field should act as a date picker.
  final bool isDatePicker;

  /// Initial date value for the date picker.
  final DateTime? initialDate;

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
    this.isDatePicker = false,
    this.initialDate,
  }) : super(key: key);

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

    // If it's a date picker and an initial date is provided, set it
    if (widget.isDatePicker && widget.initialDate != null) {
      _controller.text = _formatDate(widget.initialDate!);
    }
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

  /// Helper method to format the date.
  String _formatDate(DateTime date) {
    // You can customize the format as needed
    // For example, using intl package for better formatting
    return "${date.day.toString().padLeft(2, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.year}";
  }

  /// Method to handle date picking.
  Future<void> _selectDate() async {
    DateTime initialDate = widget.initialDate ?? DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now().add(const Duration(days: 365 * 100));

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        _controller.text = _formatDate(pickedDate);
      });
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text);
      }
    }
  }

  /// Determines the height of the input field based on its size.
  double _getHeight() {
    return SInputFieldUtils.getHeight(widget.size);
  }

  /// Determines the content padding based on the input field's size and icons.
  EdgeInsetsGeometry _getContentPadding() {
    return widget.contentPadding ??
        SInputFieldUtils.getContentPadding(widget.size).copyWith(
          left: widget.startIcon != null ? 40.0 : 16.0,
          right: (_showObscureToggle ||
                  widget.endIcon != null ||
                  widget.isDatePicker)
              ? 40.0
              : 16.0,
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
      // If it's a date picker, add a calendar icon as suffix
      suffixIcon: widget.isDatePicker
          ? IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).sInputFieldTheme.iconColor,
              ),
              onPressed:
                  widget.enabled && !widget.readOnly ? _selectDate : null,
              tooltip: 'Select Date',
            )
          : (_showObscureToggle ? null : widget.endIcon),
    );

    return SizedBox(
      height: _getHeight(),
      child: Stack(
        children: [
          TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            obscureText: _obscureText,
            enabled: widget.enabled,
            readOnly: widget.isDatePicker || widget.readOnly,
            keyboardType:
                widget.isDatePicker ? TextInputType.none : widget.keyboardType,
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
            onTap: widget.isDatePicker ? _selectDate : null,
            decoration: effectiveDecoration,
          ),
          // Start Icon
          if (widget.startIcon != null)
            Positioned(
              left: 16.0,
              top: (_getHeight() - 24.0) / 2,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: widget.startIcon,
              ),
            ),
          // End Icon or Obscure Toggle or Calendar Icon
          if (_showObscureToggle ||
              (widget.endIcon != null && !widget.isDatePicker) ||
              widget.isDatePicker)
            Positioned(
              right: 16.0,
              top: (_getHeight() - 24.0) / 2,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: _showObscureToggle
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20.0,
                          color: Theme.of(context).sInputFieldTheme.iconColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        tooltip:
                            _obscureText ? 'Show Password' : 'Hide Password',
                      )
                    : widget.endIcon,
              ),
            ),
        ],
      ),
    );
  }
}

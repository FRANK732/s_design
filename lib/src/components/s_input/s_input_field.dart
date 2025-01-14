import 'package:flutter/material.dart';
import '../../../s_design.dart';
import 'package:intl/intl.dart' hide TextDirection;

class SInputField extends StatefulWidget {
  /// High-level “type” of this field (e.g., password, email, etc.).
  final SInputFieldType inputType;

  /// Allows controlling the text programmatically.
  final TextEditingController? controller;

  /// For controlling focus programmatically.
  final FocusNode? focusNode;

  /// If provided, used as the initial text (ignored if [controller] is set).
  final String? initialValue;

  /// Whether the field is enabled or not.
  final bool? enabled;

  /// Whether to hide the text (e.g., for a password).
  final bool obscureText;

  /// The keyboard type (text, number, etc.).
  /// If null, it’s inferred from [inputType].
  final TextInputType? keyboardType;

  /// Defines the action button (e.g., “search”, “done”).
  final TextInputAction? textInputAction;

  /// Validator for forms.
  final FormFieldValidator<String>? validator;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user indicates submission (keyboard “enter”).
  final ValueChanged<String>? onFieldSubmitted;

  /// The label text to display.
  final String? labelText;

  /// The hint text to display.
  final String? hintText;

  /// Provides custom decoration, if you’d like to override all defaults.
  final InputDecoration? decoration;

  /// If true, auto-focusing the field when shown.
  final bool autofocus;

  /// If true, the field is read-only.
  final bool readOnly;

  /// The maximum number of lines. Defaults to 1.
  final int? maxLines;

  /// The minimum number of lines.
  final int? minLines;

  /// The maximum length, if not null.
  final int? maxLength;

  /// The style to use inside the field.
  final TextStyle? style;

  /// Aligns the text in the field (start, center, end).
  final TextAlign textAlign;

  /// If true, the field will fill the parent vertically if possible.
  final bool expands;

  /// Whether to show the cursor.
  final bool showCursor;

  /// Whether the user can interactively select text.
  final bool enableInteractiveSelection;

  /// How to capitalize the text (none, words, sentences, etc.).
  final TextCapitalization textCapitalization;

  /// Forces a certain text direction (LTR or RTL).
  final TextDirection? textDirection;

  /// Called when the user taps the “done” button.
  final VoidCallback? onEditingComplete;

  /// Called when the field is tapped.
  final VoidCallback? onTap;

  /// Whether to enable suggestions in the keyboard.
  final bool? enableSuggestions;

  /// Whether to enable auto-correction.
  final bool autocorrect;

  /// Padding inside the field.
  final EdgeInsetsGeometry? contentPadding;

  /// The size of the field (small, medium, large).
  /// We can interpret this to adjust font size, padding, etc.
  final SInputFieldSize size;

  /// The widget to display at the start of the input field.
  final Widget? startIcon;

  /// The widget to display at the end of the input field.
  final Widget? endIcon;

  /// Main constructor (use the factories below for specialized input “types”).
  const SInputField({
    super.key,
    this.inputType = SInputFieldType.text,
    this.controller,
    this.focusNode,
    this.startIcon,
    this.endIcon,
    this.initialValue,
    this.enabled,
    bool? obscureText,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.labelText,
    this.hintText,
    this.decoration,
    this.autofocus = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.style,
    this.textAlign = TextAlign.start,
    this.expands = false,
    this.showCursor = true,
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.onEditingComplete,
    this.onTap,
    this.enableSuggestions,
    this.autocorrect = true,
    this.contentPadding,
    this.size = SInputFieldSize.small,
    SInputFieldTheme? theme,
  })  : obscureText = obscureText ?? (inputType == SInputFieldType.password),
        assert(
          initialValue == null || controller == null,
          'You cannot provide both initialValue and controller at the same time.',
        );

  factory SInputField.password({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    TextInputAction? textInputAction,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    String? labelText,
    String? hintText,
    InputDecoration? decoration,
    bool autofocus = false,
    bool readOnly = false,
    int? maxLines = 1,
    int? minLines,
    int? maxLength,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    bool expands = false,
    bool showCursor = true,
    bool enableInteractiveSelection = true,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextDirection? textDirection,
    VoidCallback? onEditingComplete,
    VoidCallback? onTap,
    bool? enableSuggestions,
    bool autocorrect = false,
    EdgeInsetsGeometry? contentPadding,
    SInputFieldSize size = SInputFieldSize.small,
    SInputFieldTheme? theme,
  }) {
    return SInputField(
      key: key,
      inputType: SInputFieldType.password,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      labelText: labelText,
      hintText: hintText,
      decoration: decoration,
      autofocus: autofocus,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: style,
      textAlign: textAlign,
      expands: expands,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      contentPadding: contentPadding,
      size: size,
      theme: theme,
    );
  }

  factory SInputField.datePicker({
    Key? key,
    required TextEditingController controller,
    FocusNode? focusNode,
    String? hintText,
    bool enabled = true,
    FormFieldValidator<String>? validator,
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
    DateTime? initialDate,
    String? dateFormat,
  }) {
    final effectiveDate = initialDate ?? DateTime.now();

    final formattedDate = dateFormat != null
        ? DateFormat(dateFormat).format(effectiveDate)
        : '${effectiveDate.day.toString().padLeft(2, '0')}-'
            '${effectiveDate.month.toString().padLeft(2, '0')}-'
            '${effectiveDate.year}';

    return SInputField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      enabled: enabled,
      validator: validator,
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
      initialValue: initialDate != null ? formattedDate : null,
      endIcon: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: effectiveDate,
                firstDate: DateTime(1900),
                lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
              );
              if (pickedDate != null) {
                // Reformat the picked date
                final pickedDateStr = dateFormat != null
                    ? DateFormat(dateFormat).format(pickedDate)
                    : '${pickedDate.day.toString().padLeft(2, '0')}-'
                        '${pickedDate.month.toString().padLeft(2, '0')}-'
                        '${pickedDate.year}';

                // Update controller.text
                controller.text = pickedDateStr;

                // Trigger onChanged, if any
                if (onChanged != null) {
                  onChanged(pickedDateStr);
                }
              }
            },
          );
        },
      ),
    );
  }

  /// Factory for a **search**-type field.
  factory SInputField.search({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    String? labelText,
    String? hintText,
    InputDecoration? decoration,
    bool autofocus = false,
    bool readOnly = false,
    int? maxLines = 1,
    int? minLines,
    int? maxLength,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    bool expands = false,
    bool showCursor = true,
    bool enableInteractiveSelection = true,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextDirection? textDirection,
    VoidCallback? onEditingComplete,
    VoidCallback? onTap,
    bool? enableSuggestions,
    bool autocorrect = true,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    SInputFieldSize size = SInputFieldSize.small,
    SInputFieldTheme? theme,
  }) {
    return SInputField(
      key: key,
      inputType: SInputFieldType.search,
      textInputAction: TextInputAction.search,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      labelText: labelText,
      hintText: hintText,
      decoration: decoration,
      autofocus: autofocus,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: style,
      textAlign: textAlign,
      expands: expands,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      contentPadding: contentPadding,
      size: size,
      theme: theme,
      startIcon: const Icon(Icons.search),
      endIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          controller?.clear();
          if (onChanged != null) {
            onChanged('');
          }
        },
      ),
    );
  }

  factory SInputField.number({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    TextInputAction? textInputAction,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    String? labelText,
    String? hintText,
    InputDecoration? decoration,
    bool autofocus = false,
    bool readOnly = false,
    int? maxLines = 1,
    int? minLines,
    int? maxLength,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    bool expands = false,
    bool showCursor = true,
    bool enableInteractiveSelection = true,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextDirection? textDirection,
    VoidCallback? onEditingComplete,
    VoidCallback? onTap,
    bool? enableSuggestions,
    bool autocorrect = true,
    EdgeInsetsGeometry? contentPadding,
    SInputFieldSize size = SInputFieldSize.small,
    SInputFieldTheme? theme,
  }) {
    return SInputField(
      key: key,
      inputType: SInputFieldType.number,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      labelText: labelText,
      hintText: hintText,
      decoration: decoration,
      autofocus: autofocus,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: style,
      textAlign: textAlign,
      expands: expands,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      contentPadding: contentPadding,
      size: size,
      theme: theme,
    );
  }

  factory SInputField.email({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    TextInputAction? textInputAction,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    String? labelText,
    String? hintText,
    InputDecoration? decoration,
    bool autofocus = false,
    bool readOnly = false,
    int? maxLines = 1,
    int? minLines,
    int? maxLength,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    bool expands = false,
    bool showCursor = true,
    bool enableInteractiveSelection = true,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextDirection? textDirection,
    VoidCallback? onEditingComplete,
    VoidCallback? onTap,
    bool? enableSuggestions,
    bool autocorrect = true,
    EdgeInsetsGeometry? contentPadding,
    SInputFieldSize size = SInputFieldSize.small,
    SInputFieldTheme? theme,
  }) {
    return SInputField(
      key: key,
      inputType: SInputFieldType.email,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      labelText: labelText,
      hintText: hintText,
      decoration: decoration,
      autofocus: autofocus,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: style,
      textAlign: textAlign,
      expands: expands,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      contentPadding: contentPadding,
      size: size,
      theme: theme,
    );
  }

  factory SInputField.phone({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    TextInputAction? textInputAction,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    String? labelText,
    String? hintText,
    InputDecoration? decoration,
    bool autofocus = false,
    bool readOnly = false,
    int? maxLines = 1,
    int? minLines,
    int? maxLength,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    bool expands = false,
    bool showCursor = true,
    bool enableInteractiveSelection = true,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextDirection? textDirection,
    VoidCallback? onEditingComplete,
    VoidCallback? onTap,
    bool? enableSuggestions,
    bool autocorrect = true,
    EdgeInsetsGeometry? contentPadding,
    SInputFieldSize size = SInputFieldSize.small,
    SInputFieldTheme? theme,
  }) {
    return SInputField(
      key: key,
      inputType: SInputFieldType.phone,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      labelText: labelText,
      hintText: hintText,
      decoration: decoration,
      autofocus: autofocus,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: style,
      textAlign: textAlign,
      expands: expands,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      contentPadding: contentPadding,
      size: size,
      theme: theme,
    );
  }

  @override
  State<SInputField> createState() => _SInputFieldState();
}

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

  @override
  Widget build(BuildContext context) {
    final effectiveKeyboardType =
        widget.keyboardType ?? mapInputTypeToKeyboard(widget.inputType);

    final SInputFieldTheme theme = SInputFieldTheme.defaults();
    final OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(theme.borderRadius),
    );

    final EdgeInsetsGeometry defaultContentPadding =
        getContentPadding(widget.size);

    InputDecoration mergeDecorations(
        InputDecoration base, InputDecoration? override) {
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

    // Base or user-provided InputDecoration.
    InputDecoration effectiveDecoration = widget.decoration ??
        InputDecoration(
          isDense: true,
          labelText: widget.labelText,
          hintText: widget.hintText,
          contentPadding: widget.contentPadding ?? defaultContentPadding,
          border: inputBorder.copyWith(
            borderRadius: BorderRadius.circular(theme.borderRadius),
          ),
          enabledBorder: inputBorder.copyWith(
            borderSide: BorderSide(
              color: theme.borderColor,
              width: theme.borderWidth,
            ),
          ),
          focusedBorder: inputBorder.copyWith(
            borderSide: BorderSide(
              color: theme.focusedBorderColor,
              width: theme.focusedBorderWidth,
            ),
          ),
          disabledBorder: inputBorder.copyWith(
            borderSide: BorderSide(
              color: theme.disabledBorderColor,
              width: theme.borderWidth,
            ),
          ),
          prefixIcon: widget.startIcon,
          suffixIcon: _showObscureToggle
              ? IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20.0,
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

    final sizeAdjustedStyle = buildSizedTextStyle(widget.style, widget.size);

    final InputDecoration finalDecoration =
        mergeDecorations(effectiveDecoration, widget.decoration);

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      initialValue: widget.controller == null ? widget.initialValue : null,
      enabled: widget.enabled,
      obscureText: _obscureText,
      keyboardType: effectiveKeyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      style: widget.style ?? sizeAdjustedStyle,
      textAlign: widget.textAlign,
      expands: widget.expands,
      showCursor: widget.showCursor,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      textCapitalization: widget.textCapitalization,
      textDirection: widget.textDirection,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      enableSuggestions: widget.enableSuggestions ?? false,
      autocorrect: widget.autocorrect,
      decoration: finalDecoration,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'
    hide
        TextDirection;
import '../../../../../s_design.dart';

import 'utils/s_input_decoration_helper.dart';
import 'utils/s_input_interaction_helper.dart';
import 'utils/s_input_style_helper.dart';

part 's_input_field_state.dart';

class SInputField
    extends StatefulWidget {
  /// Main constructor (use the factories below for specialized input "types").
  const SInputField({
    super.key,
    this.inputType =
        SInputFieldType.text,
    this.controller,
    this.focusNode,
    this.startIcon,
    this.endIcon,
    this.initialValue,
    this.enabled,
    bool?
        obscureText,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.labelText,
    this.helperText,
    this.errorText,
    this.hintText,
    this.prefixText,
    this.prefixStyle,
    this.suffixText,
    this.suffixStyle,
    this.isLoading =
        false,
    this.decoration,
    this.inputFormatters,
    this.autofocus =
        false,
    this.filled =
        false,
    this.hasBorder =
        true,
    this.readOnly =
        false,
    this.maxLines =
        1,
    this.minLines,
    this.maxLength,
    this.style,
    this.textAlign =
        TextAlign.start,
    this.expands =
        false,
    this.showCursor =
        true,
    this.enableInteractiveSelection =
        true,
    this.textCapitalization =
        TextCapitalization.none,
    this.textDirection,
    this.onEditingComplete,
    this.onTap,
    this.enableSuggestions,
    this.autocorrect =
        true,
    this.contentPadding,
    this.size =
        SInputFieldSize.small,
    this.scrollPadding = const EdgeInsets
        .all(
        20.0),
    this.scrollPhysics,
    this.autofillHints,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.restorationId,
    this.enableIMEPersonalizedLearning =
        true,
  })  : obscureText = obscureText ?? (inputType == SInputFieldType.password),
        assert(
          initialValue == null || controller == null,
          'You cannot provide both initialValue and controller at the same time.',
        );

  factory SInputField.password({
    Key?
        key,
    TextEditingController?
        controller,
    FocusNode?
        focusNode,
    String?
        initialValue,
    bool?
        enabled,
    TextInputAction?
        textInputAction,
    FormFieldValidator<String>?
        validator,
    ValueChanged<String>?
        onChanged,
    ValueChanged<String>?
        onFieldSubmitted,
    String?
        labelText,
    String?
        hintText,
    InputDecoration?
        decoration,
    bool autofocus =
        false,
    bool filled =
        false,
    bool hasBorder =
        true,
    bool readOnly =
        false,
    int? maxLines =
        1,
    int?
        minLines,
    int?
        maxLength,
    TextStyle?
        style,
    TextAlign textAlign =
        TextAlign.start,
    bool expands =
        false,
    bool showCursor =
        true,
    bool enableInteractiveSelection =
        true,
    TextCapitalization textCapitalization =
        TextCapitalization.none,
    TextDirection?
        textDirection,
    VoidCallback?
        onEditingComplete,
    VoidCallback?
        onTap,
    bool?
        enableSuggestions,
    bool autocorrect =
        false,
    EdgeInsetsGeometry?
        contentPadding,
    SInputFieldSize size =
        SInputFieldSize.small,
  }) {
    return SInputField(
      key:
          key,
      inputType:
          SInputFieldType.password,
      controller:
          controller,
      focusNode:
          focusNode,
      initialValue:
          initialValue,
      enabled:
          enabled,
      textInputAction:
          textInputAction,
      validator:
          validator,
      onChanged:
          onChanged,
      onFieldSubmitted:
          onFieldSubmitted,
      labelText:
          labelText,
      hintText:
          hintText,
      decoration:
          decoration,
      autofocus:
          autofocus,
      filled:
          filled,
      hasBorder:
          hasBorder,
      readOnly:
          readOnly,
      maxLines:
          maxLines,
      minLines:
          minLines,
      maxLength:
          maxLength,
      style:
          style,
      textAlign:
          textAlign,
      expands:
          expands,
      showCursor:
          showCursor,
      enableInteractiveSelection:
          enableInteractiveSelection,
      textCapitalization:
          textCapitalization,
      textDirection:
          textDirection,
      onEditingComplete:
          onEditingComplete,
      onTap:
          onTap,
      enableSuggestions:
          enableSuggestions,
      autocorrect:
          autocorrect,
      contentPadding:
          contentPadding,
      size:
          size,
    );
  }

  factory SInputField.datePicker({
    Key?
        key,
    required TextEditingController
        controller,
    FocusNode?
        focusNode,
    String?
        hintText,
    bool enabled =
        true,
    bool filled =
        false,
    bool hasBorder =
        true,
    bool readOnly =
        false,
    void Function()?
        onTap,
    FormFieldValidator<String>?
        validator,
    ValueChanged<String>?
        onChanged,
    VoidCallback?
        onEditingComplete,
    ValueChanged<String>?
        onFieldSubmitted,
    int?
        maxLength,
    EdgeInsetsGeometry?
        contentPadding,
    InputDecoration?
        decoration,
    TextStyle?
        style,
    bool autocorrect =
        true,
    bool autofocus =
        false,
    bool enableSuggestions =
        true,
    DateTime?
        initialDate,
    String?
        dateFormat,
  }) {
    final DateTime
        effectiveDate =
        initialDate ?? DateTime.now();

    final String formattedDate = dateFormat != null
        ? DateFormat(dateFormat).format(effectiveDate)
        : '${effectiveDate.day.toString().padLeft(2, '0')}-'
            '${effectiveDate.month.toString().padLeft(2, '0')}-'
            '${effectiveDate.year}';

    return SInputField(
      key:
          key,
      controller:
          controller,
      focusNode:
          focusNode,
      hintText:
          hintText,
      enabled:
          enabled,
      validator:
          validator,
      onChanged:
          onChanged,
      onEditingComplete:
          onEditingComplete,
      onFieldSubmitted:
          onFieldSubmitted,
      maxLength:
          maxLength,
      contentPadding:
          contentPadding,
      decoration:
          decoration,
      style:
          style,
      autocorrect:
          autocorrect,
      autofocus:
          autofocus,
      onTap:
          onTap,
      filled:
          filled,
      hasBorder:
          hasBorder,
      readOnly:
          readOnly,
      enableSuggestions:
          enableSuggestions,
      initialValue: initialDate != null
          ? formattedDate
          : null,
      endIcon:
          Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => SInputInteractionHelper.handleDatePicker(
              context: context,
              controller: controller,
              onChanged: onChanged,
              initialDate: effectiveDate,
              dateFormat: dateFormat,
            ),
          );
        },
      ),
    );
  }

  /// Factory for a **search**-type field.
  factory SInputField.search({
    Key?
        key,
    TextEditingController?
        controller,
    FocusNode?
        focusNode,
    String?
        initialValue,
    bool?
        enabled,
    FormFieldValidator<String>?
        validator,
    ValueChanged<String>?
        onChanged,
    VoidCallback?
        onClear,
    ValueChanged<String>?
        onFieldSubmitted,
    String?
        labelText,
    String?
        hintText,
    InputDecoration?
        decoration,
    bool autofocus =
        false,
    bool filled =
        false,
    bool hasBorder =
        true,
    bool readOnly =
        false,
    int? maxLines =
        1,
    int?
        minLines,
    int?
        maxLength,
    TextStyle?
        style,
    TextAlign textAlign =
        TextAlign.start,
    bool expands =
        false,
    bool showCursor =
        true,
    bool enableInteractiveSelection =
        true,
    TextCapitalization textCapitalization =
        TextCapitalization.none,
    TextDirection?
        textDirection,
    VoidCallback?
        onEditingComplete,
    VoidCallback?
        onTap,
    bool?
        enableSuggestions,
    bool autocorrect =
        true,
    EdgeInsetsGeometry contentPadding = const EdgeInsets
        .symmetric(
        horizontal: 12,
        vertical: 8),
    SInputFieldSize size =
        SInputFieldSize.small,
  }) {
    return SInputField(
      key:
          key,
      inputType:
          SInputFieldType.search,
      textInputAction:
          TextInputAction.search,
      controller:
          controller,
      focusNode:
          focusNode,
      initialValue:
          initialValue,
      enabled:
          enabled,
      validator:
          validator,
      onChanged:
          onChanged,
      onFieldSubmitted:
          onFieldSubmitted,
      labelText:
          labelText,
      hintText:
          hintText,
      decoration:
          decoration,
      autofocus:
          autofocus,
      filled:
          filled,
      hasBorder:
          hasBorder,
      readOnly:
          readOnly,
      maxLines:
          maxLines,
      minLines:
          minLines,
      maxLength:
          maxLength,
      style:
          style,
      textAlign:
          textAlign,
      expands:
          expands,
      showCursor:
          showCursor,
      enableInteractiveSelection:
          enableInteractiveSelection,
      textCapitalization:
          textCapitalization,
      textDirection:
          textDirection,
      onEditingComplete:
          onEditingComplete,
      onTap:
          onTap,
      enableSuggestions:
          enableSuggestions,
      autocorrect:
          autocorrect,
      contentPadding:
          contentPadding,
      size:
          size,
      startIcon:
          const Icon(Icons.search),
      endIcon:
          IconButton(
        icon: const Icon(Icons.clear),
        onPressed: onClear ??
            () => SInputInteractionHelper.handleSearchClear(
                  controller: controller,
                  onChanged: onChanged,
                ),
      ),
    );
  }

  factory SInputField.number({
    Key?
        key,
    TextEditingController?
        controller,
    FocusNode?
        focusNode,
    String?
        initialValue,
    bool?
        enabled,
    TextInputAction?
        textInputAction,
    FormFieldValidator<String>?
        validator,
    ValueChanged<String>?
        onChanged,
    ValueChanged<String>?
        onFieldSubmitted,
    String?
        labelText,
    String?
        hintText,
    InputDecoration?
        decoration,
    bool autofocus =
        false,
    bool filled =
        false,
    bool hasBorder =
        true,
    bool readOnly =
        false,
    int? maxLines =
        1,
    int?
        minLines,
    int?
        maxLength,
    TextStyle?
        style,
    TextAlign textAlign =
        TextAlign.start,
    bool expands =
        false,
    bool showCursor =
        true,
    bool enableInteractiveSelection =
        true,
    TextCapitalization textCapitalization =
        TextCapitalization.none,
    TextDirection?
        textDirection,
    VoidCallback?
        onEditingComplete,
    VoidCallback?
        onTap,
    bool?
        enableSuggestions,
    bool autocorrect =
        true,
    EdgeInsetsGeometry?
        contentPadding,
    SInputFieldSize size =
        SInputFieldSize.small,
  }) {
    return SInputField(
      key:
          key,
      inputType:
          SInputFieldType.number,
      controller:
          controller,
      focusNode:
          focusNode,
      initialValue:
          initialValue,
      enabled:
          enabled,
      textInputAction:
          textInputAction,
      validator:
          validator,
      onChanged:
          onChanged,
      onFieldSubmitted:
          onFieldSubmitted,
      labelText:
          labelText,
      hintText:
          hintText,
      decoration:
          decoration,
      autofocus:
          autofocus,
      filled:
          filled,
      hasBorder:
          hasBorder,
      readOnly:
          readOnly,
      maxLines:
          maxLines,
      minLines:
          minLines,
      maxLength:
          maxLength,
      style:
          style,
      textAlign:
          textAlign,
      expands:
          expands,
      showCursor:
          showCursor,
      enableInteractiveSelection:
          enableInteractiveSelection,
      textCapitalization:
          textCapitalization,
      textDirection:
          textDirection,
      onEditingComplete:
          onEditingComplete,
      onTap:
          onTap,
      enableSuggestions:
          enableSuggestions,
      autocorrect:
          autocorrect,
      contentPadding:
          contentPadding,
      size:
          size,
    );
  }

  factory SInputField.email({
    Key?
        key,
    TextEditingController?
        controller,
    FocusNode?
        focusNode,
    String?
        initialValue,
    bool?
        enabled,
    TextInputAction?
        textInputAction,
    FormFieldValidator<String>?
        validator,
    ValueChanged<String>?
        onChanged,
    ValueChanged<String>?
        onFieldSubmitted,
    String?
        labelText,
    String?
        hintText,
    InputDecoration?
        decoration,
    bool autofocus =
        false,
    bool filled =
        false,
    bool hasBorder =
        true,
    bool readOnly =
        false,
    int? maxLines =
        1,
    int?
        minLines,
    int?
        maxLength,
    TextStyle?
        style,
    TextAlign textAlign =
        TextAlign.start,
    bool expands =
        false,
    bool showCursor =
        true,
    bool enableInteractiveSelection =
        true,
    TextCapitalization textCapitalization =
        TextCapitalization.none,
    TextDirection?
        textDirection,
    VoidCallback?
        onEditingComplete,
    VoidCallback?
        onTap,
    bool?
        enableSuggestions,
    bool autocorrect =
        true,
    EdgeInsetsGeometry?
        contentPadding,
    SInputFieldSize size =
        SInputFieldSize.small,
  }) {
    return SInputField(
      key:
          key,
      inputType:
          SInputFieldType.email,
      controller:
          controller,
      focusNode:
          focusNode,
      initialValue:
          initialValue,
      enabled:
          enabled,
      startIcon:
          const Icon(Icons.email),
      textInputAction:
          textInputAction,
      validator:
          validator,
      onChanged:
          onChanged,
      onFieldSubmitted:
          onFieldSubmitted,
      labelText:
          labelText,
      hintText:
          hintText,
      decoration:
          decoration,
      autofocus:
          autofocus,
      filled:
          filled,
      hasBorder:
          hasBorder,
      readOnly:
          readOnly,
      maxLines:
          maxLines,
      minLines:
          minLines,
      maxLength:
          maxLength,
      style:
          style,
      textAlign:
          textAlign,
      expands:
          expands,
      showCursor:
          showCursor,
      enableInteractiveSelection:
          enableInteractiveSelection,
      textCapitalization:
          textCapitalization,
      textDirection:
          textDirection,
      onEditingComplete:
          onEditingComplete,
      onTap:
          onTap,
      enableSuggestions:
          enableSuggestions,
      autocorrect:
          autocorrect,
      contentPadding:
          contentPadding,
      size:
          size,
    );
  }

  factory SInputField.phone({
    Key?
        key,
    TextEditingController?
        controller,
    FocusNode?
        focusNode,
    String?
        initialValue,
    bool?
        enabled,
    TextInputAction?
        textInputAction,
    FormFieldValidator<String>?
        validator,
    ValueChanged<String>?
        onChanged,
    ValueChanged<String>?
        onFieldSubmitted,
    String?
        labelText,
    String?
        hintText,
    InputDecoration?
        decoration,
    bool autofocus =
        false,
    bool filled =
        false,
    bool hasBorder =
        true,
    bool readOnly =
        false,
    int? maxLines =
        1,
    int?
        minLines,
    int?
        maxLength,
    TextStyle?
        style,
    TextAlign textAlign =
        TextAlign.start,
    bool expands =
        false,
    bool showCursor =
        true,
    bool enableInteractiveSelection =
        true,
    TextCapitalization textCapitalization =
        TextCapitalization.none,
    TextDirection?
        textDirection,
    VoidCallback?
        onEditingComplete,
    VoidCallback?
        onTap,
    bool?
        enableSuggestions,
    bool autocorrect =
        true,
    EdgeInsetsGeometry?
        contentPadding,
    SInputFieldSize size =
        SInputFieldSize.small,
  }) {
    return SInputField(
      key:
          key,
      inputType:
          SInputFieldType.phone,
      controller:
          controller,
      focusNode:
          focusNode,
      initialValue:
          initialValue,
      enabled:
          enabled,
      textInputAction:
          textInputAction,
      validator:
          validator,
      onChanged:
          onChanged,
      onFieldSubmitted:
          onFieldSubmitted,
      labelText:
          labelText,
      hintText:
          hintText,
      decoration:
          decoration,
      autofocus:
          autofocus,
      filled:
          filled,
      hasBorder:
          hasBorder,
      readOnly:
          readOnly,
      maxLines:
          maxLines,
      minLines:
          minLines,
      maxLength:
          maxLength,
      style:
          style,
      textAlign:
          textAlign,
      expands:
          expands,
      showCursor:
          showCursor,
      enableInteractiveSelection:
          enableInteractiveSelection,
      textCapitalization:
          textCapitalization,
      textDirection:
          textDirection,
      onEditingComplete:
          onEditingComplete,
      onTap:
          onTap,
      enableSuggestions:
          enableSuggestions,
      autocorrect:
          autocorrect,
      contentPadding:
          contentPadding,
      size:
          size,
    );
  }

  /// High-level "type" of this field (e.g., password, email, etc.).
  final SInputFieldType
      inputType;

  /// Allows controlling the text programmatically.
  final TextEditingController?
      controller;

  /// For controlling focus programmatically.
  final FocusNode?
      focusNode;

  /// Optional input formatters (e.g., masking).
  final List<TextInputFormatter>?
      inputFormatters;

  /// If provided, used as the initial text (ignored if [controller] is set).
  final String?
      initialValue;

  /// Whether the field is enabled or not.
  final bool?
      enabled;

  /// Whether to hide the text (e.g., for a password).
  final bool
      obscureText;

  /// The keyboard type (text, number, etc.).
  /// If null, it's inferred from [inputType].
  final TextInputType?
      keyboardType;

  /// Defines the action button (e.g., "search", "done").
  final TextInputAction?
      textInputAction;

  /// Validator for forms.
  final FormFieldValidator<String>?
      validator;

  /// Called when the text changes.
  final ValueChanged<String>?
      onChanged;

  /// Called when the user indicates submission (keyboard "enter").
  final ValueChanged<String>?
      onFieldSubmitted;

  /// The label text to display.
  final String?
      labelText;

  /// Helper text to display below the input.
  final String?
      helperText;

  /// Error text to display (overrides validator error if present).
  final String?
      errorText;

  /// Prefix text (e.g. currency symbol).
  final String?
      prefixText;

  /// Style for prefix text.
  final TextStyle?
      prefixStyle;

  /// Suffix text (e.g. unit).
  final String?
      suffixText;

  /// Style for suffix text.
  final TextStyle?
      suffixStyle;

  /// Whether to show a loading indicator.
  final bool
      isLoading;

  /// The hint text to display.
  final String?
      hintText;

  /// Provides custom decoration, if you'd like to override all defaults.
  final InputDecoration?
      decoration;

  /// If true, auto-focusing the field when shown.
  final bool
      autofocus;

  /// If true, the field is read-only.
  /// Whether the input should be filled with the theme background color.
  final bool
      filled;

  /// Whether the input should have a border.
  final bool
      hasBorder;

  /// If true, the field is read-only.
  final bool
      readOnly;

  /// The maximum number of lines. Defaults to 1.
  final int?
      maxLines;

  /// The minimum number of lines.
  final int?
      minLines;

  /// The maximum length, if not null.
  final int?
      maxLength;

  /// The style to use inside the field.
  final TextStyle?
      style;

  /// Aligns the text in the field (start, center, end).
  final TextAlign
      textAlign;

  /// If true, the field will fill the parent vertically if possible.
  final bool
      expands;

  /// Whether to show the cursor.
  final bool
      showCursor;

  /// Whether the user can interactively select text.
  final bool
      enableInteractiveSelection;

  /// How to capitalize the text (none, words, sentences, etc.).
  final TextCapitalization
      textCapitalization;

  /// Forces a certain text direction (LTR or RTL).
  final TextDirection?
      textDirection;

  /// Called when the user taps the "done" button.
  final VoidCallback?
      onEditingComplete;

  /// Called when the field is tapped.
  final VoidCallback?
      onTap;

  /// Whether to enable suggestions in the keyboard.
  final bool?
      enableSuggestions;

  /// Whether to enable auto-correction.
  final bool
      autocorrect;

  /// Padding inside the field.
  final EdgeInsetsGeometry?
      contentPadding;

  /// The size of the field (small, medium, large).
  /// We can interpret this to adjust font size, padding, etc.
  final SInputFieldSize
      size;

  /// The widget to display at the start of the input field.
  final Widget?
      startIcon;

  /// The widget to display at the end of the input field.
  final Widget?
      endIcon;

  /// The amount of space by which to inset the TextFormField when scrolling.
  final EdgeInsets
      scrollPadding;

  /// The ScrollPhysics to use for the TextFormField.
  final ScrollPhysics?
      scrollPhysics;

  /// The autofill hints for the TextFormField.
  final Iterable<String>?
      autofillHints;

  /// The mouse cursor for the TextFormField.
  final MouseCursor?
      mouseCursor;

  /// The context menu builder for the TextFormField.
  final EditableTextContextMenuBuilder?
      contextMenuBuilder;

  /// The restoration ID for the TextFormField.
  final String?
      restorationId;

  /// Whether to enable IME personalized learning.
  final bool
      enableIMEPersonalizedLearning;

  @override
  State<SInputField>
      createState() =>
          _SInputFieldState();
}

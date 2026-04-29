part of 's_input_field.dart';

class _SInputFieldState
    extends State<
        SInputField> {
  late TextEditingController
      _controller;
  late FocusNode
      _focusNode;
  bool
      _obscureText =
      false;
  bool
      _showObscureToggle =
      false;

  @override
  void
      initState() {
    super
        .initState();

    _obscureText =
        widget.obscureText;
    _showObscureToggle =
        widget.obscureText;

    _controller =
        widget.controller ?? TextEditingController();
    _focusNode =
        widget.focusNode ?? FocusNode();
  }

  @override
  void
      dispose() {
    if (widget.controller ==
        null) {
      _controller.dispose();
    }
    if (widget.focusNode ==
        null) {
      _focusNode.dispose();
    }
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final TextInputType
        effectiveKeyboardType =
        SInputStyleHelper.resolveKeyboardType(
      userKeyboardType:
          widget.keyboardType,
      inputType:
          widget.inputType,
    );

    final SInputFieldThemeData
        theme =
        Theme.of(context).sInputFieldTheme;

    final InputDecoration
        finalDecoration =
        SInputDecorationHelper.resolve(
      theme:
          theme,
      size:
          widget.size,
      labelText:
          widget.labelText,
      helperText:
          widget.helperText,
      errorText:
          widget.errorText,
      prefixText:
          widget.prefixText,
      prefixStyle:
          widget.prefixStyle,
      suffixText:
          widget.suffixText,
      suffixStyle:
          widget.suffixStyle,
      hintText:
          widget.hintText,
      startIcon:
          widget.startIcon,
      endIcon:
          widget.endIcon,
      suffixIconOverride: widget.isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : (_showObscureToggle
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
              : null),
      filled:
          widget.filled,
      hasBorder:
          widget.hasBorder,
      contentPadding:
          widget.contentPadding,
      userDecoration:
          widget.decoration,
    );

    final TextStyle?
        sizeAdjustedStyle =
        SInputStyleHelper.resolveStyle(
      userStyle:
          widget.style,
      size:
          widget.size,
      theme:
          theme,
    );

    return TextFormField(
      controller:
          _controller,
      focusNode:
          _focusNode,
      enabled:
          widget.enabled,
      obscureText:
          _obscureText,
      keyboardType:
          effectiveKeyboardType,
      inputFormatters:
          widget.inputFormatters,
      textInputAction:
          widget.textInputAction,
      validator:
          widget.validator,
      onChanged:
          widget.onChanged,
      onFieldSubmitted:
          widget.onFieldSubmitted,
      autofocus:
          widget.autofocus,
      readOnly:
          widget.readOnly,
      maxLines:
          widget.maxLines,
      minLines:
          widget.minLines,
      maxLength:
          widget.maxLength,
      style:
          widget.style ?? sizeAdjustedStyle,
      textAlign:
          widget.textAlign,
      expands:
          widget.expands,
      showCursor:
          widget.showCursor,
      enableInteractiveSelection:
          widget.enableInteractiveSelection,
      textCapitalization:
          widget.textCapitalization,
      textDirection:
          widget.textDirection,
      onEditingComplete:
          widget.onEditingComplete,
      onTap:
          widget.onTap,
      enableSuggestions:
          widget.enableSuggestions ?? false,
      autocorrect:
          widget.autocorrect,
      decoration:
          finalDecoration,
      scrollPadding:
          widget.scrollPadding,
      scrollPhysics:
          widget.scrollPhysics,
      autofillHints:
          widget.autofillHints,
      mouseCursor:
          widget.mouseCursor,
      contextMenuBuilder:
          widget.contextMenuBuilder,
      restorationId:
          widget.restorationId,
      enableIMEPersonalizedLearning:
          widget.enableIMEPersonalizedLearning,
    );
  }
}

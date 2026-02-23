import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../s_design.dart';

enum SInputSize {
  small,
  middle,
  large,
}

enum SInputStatus {
  error,
  warning,
}

class SInput
    extends StatefulWidget {
  const SInput({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization =
        TextCapitalization.none,
    this.style,
    this.textAlign =
        TextAlign.start,
    this.readOnly =
        false,
    this.enabled =
        true,
    this.autofocus =
        false,
    this.obscureText =
        false,
    this.autocorrect =
        true,
    this.maxLines =
        1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.placeholder,
    this.size =
        SInputSize.middle,
    this.status,
    this.prefix,
    this.suffix,
    this.addonBefore,
    this.addonAfter,
    this.allowClear =
        false,
    this.showCount =
        false,
    this.countBuilder,
    this.borderRadius,
  });

  final TextEditingController?
      controller;
  final String?
      initialValue;
  final FocusNode?
      focusNode;
  final TextInputType?
      keyboardType;
  final TextInputAction?
      textInputAction;
  final TextCapitalization
      textCapitalization;
  final TextStyle?
      style;
  final TextAlign
      textAlign;
  final bool
      readOnly;
  final bool
      enabled;
  final bool
      autofocus;
  final bool
      obscureText;
  final bool
      autocorrect;
  final int?
      maxLines;
  final int?
      minLines;
  final int?
      maxLength;
  final ValueChanged<String>?
      onChanged;
  final VoidCallback?
      onTap;
  final VoidCallback?
      onEditingComplete;
  final ValueChanged<String>?
      onSubmitted;
  final List<TextInputFormatter>?
      inputFormatters;
  final String?
      placeholder;
  final SInputSize
      size;
  final SInputStatus?
      status;
  final Widget?
      prefix;
  final Widget?
      suffix;
  final Widget?
      addonBefore;
  final Widget?
      addonAfter;
  final bool
      allowClear;
  final bool
      showCount;
  final Widget Function(
      int
          current,
      int?
          max)? countBuilder;
  final BorderRadius?
      borderRadius;

  // Factories
  static Widget
      password({
    Key?
        key,
    TextEditingController?
        controller,
    String?
        initialValue,
    String?
        placeholder,
    SInputSize size =
        SInputSize.middle,
    SInputStatus?
        status,
    Widget?
        prefix,
    Widget?
        suffix,
    Widget?
        addonBefore,
    Widget?
        addonAfter,
    bool visibilityToggle =
        true,
    ValueChanged<String>?
        onChanged,
    ValueChanged<String>?
        onSubmitted,
    bool?
        enabled,
  }) {
    return _SInputPassword(
      key:
          key,
      controller:
          controller,
      initialValue:
          initialValue,
      placeholder:
          placeholder,
      size:
          size,
      status:
          status,
      prefix:
          prefix,
      suffix:
          suffix,
      addonBefore:
          addonBefore,
      addonAfter:
          addonAfter,
      visibilityToggle:
          visibilityToggle,
      onChanged:
          onChanged,
      onSubmitted:
          onSubmitted,
      enabled:
          enabled ?? true,
    );
  }

  static Widget
      search({
    Key?
        key,
    TextEditingController?
        controller,
    String?
        initialValue,
    String?
        placeholder,
    SInputSize size =
        SInputSize.middle,
    SInputStatus?
        status,
    Widget?
        prefix,
    Widget?
        suffix,
    Widget?
        addonBefore,
    Widget?
        addonAfter,
    bool allowClear =
        false,
    ValueChanged<String>?
        onSearch,
    ValueChanged<String>?
        onChanged,
    bool loading =
        false,
    dynamic
        enterButton,
  }) {
    return _SInputSearch(
      key:
          key,
      controller:
          controller,
      initialValue:
          initialValue,
      placeholder:
          placeholder,
      size:
          size,
      status:
          status,
      prefix:
          prefix,
      suffix:
          suffix,
      addonBefore:
          addonBefore,
      addonAfter:
          addonAfter,
      allowClear:
          allowClear,
      onSearch:
          onSearch,
      onChanged:
          onChanged,
      loading:
          loading,
      enterButton:
          enterButton,
    );
  }

  static Widget
      textArea({
    Key?
        key,
    TextEditingController?
        controller,
    String?
        initialValue,
    String?
        placeholder,
    SInputSize size =
        SInputSize.middle,
    SInputStatus?
        status,
    bool allowClear =
        false,
    bool showCount =
        false,
    int?
        maxLength,
    int?
        maxLines,
    int?
        minLines,
    ValueChanged<String>?
        onChanged,
  }) {
    return SInput(
      key:
          key,
      controller:
          controller,
      initialValue:
          initialValue,
      placeholder:
          placeholder,
      size:
          size,
      status:
          status,
      allowClear:
          allowClear,
      showCount:
          showCount,
      maxLength:
          maxLength,
      maxLines:
          maxLines ?? 4,
      minLines:
          minLines ?? 4,
      onChanged:
          onChanged,
    );
  }

  @override
  State<SInput>
      createState() =>
          _SInputState();
}

class _SInputState
    extends State<
        SInput> {
  late TextEditingController
      _controller;
  late FocusNode
      _focusNode;
  bool
      _isHovering =
      false;
  bool
      _isFocused =
      false;

  @override
  void
      initState() {
    super
        .initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode =
        widget.focusNode ?? FocusNode();
    _focusNode
        .addListener(_handleFocusChange);
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
      _focusNode.removeListener(_handleFocusChange);
      _focusNode.dispose();
    }
    super
        .dispose();
  }

  void
      _handleFocusChange() {
    setState(
        () {
      _isFocused =
          _focusNode.hasFocus;
    });
  }

  Color _getBorderColor(
      SThemeData
          theme) {
    if (widget.status ==
        SInputStatus.error) {
      return theme.inputFieldTheme.errorBorderColor;
    }
    if (widget.status ==
        SInputStatus.warning) {
      return Colors.amber; // Warning color (could be added to theme later)
    }
    if (_isFocused) {
      return theme.inputFieldTheme.focusedBorderColor;
    }
    if (_isHovering) {
      return theme.inputFieldTheme.focusedBorderColor.withOpacity(0.7);
    }
    return theme
        .inputFieldTheme
        .borderColor;
  }

  double
      _getFontSize() {
    return widget.size == SInputSize.small
        ? 14
        : 14; // Uses 14px mostly
  }

  EdgeInsetsGeometry
      _getPadding() {
    switch (
        widget.size) {
      case SInputSize.small:
        return const EdgeInsets.symmetric(horizontal: 7);
      case SInputSize.large:
        return const EdgeInsets.symmetric(horizontal: 11, vertical: 6.5);
      default:
        return const EdgeInsets.symmetric(horizontal: 11, vertical: 4);
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData sTheme =
        STheme.of(context);
    final SInputFieldThemeData ext =
        sTheme.inputFieldTheme;

    final SInputGroupScope? groupScope =
        SInputGroupScope.of(context);
    BorderRadius
        effectiveRadius =
        widget.borderRadius ?? BorderRadius.circular(6);
    if (groupScope != null &&
        groupScope.compact) {
      if (groupScope.isFirst) {
        effectiveRadius = const BorderRadius.horizontal(left: Radius.circular(6));
      } else if (groupScope.isLast) {
        effectiveRadius = const BorderRadius.horizontal(right: Radius.circular(6));
      } else {
        effectiveRadius = BorderRadius.zero;
      }
    }

    // Core Input Widget
    final Widget
        input =
        MouseRegion(
      onEnter: (_) =>
          setState(() => _isHovering = true),
      onExit: (_) =>
          setState(() => _isHovering = false),
      child:
          AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.enabled ? ext.backgroundColor : ext.disabledBorderColor.withOpacity(0.1),
          border: Border.all(
            color: _getBorderColor(sTheme),
            width: _isFocused ? ext.focusedBorderWidth : ext.borderWidth,
          ),
          borderRadius: effectiveRadius,
          boxShadow: _isFocused && widget.status != SInputStatus.error
              ? <BoxShadow>[
                  BoxShadow(color: ext.focusedBorderColor.withOpacity(0.2), spreadRadius: 2)
                ]
              : (_isFocused && widget.status == SInputStatus.error
                  ? <BoxShadow>[
                      BoxShadow(color: ext.errorBorderColor.withOpacity(0.2), spreadRadius: 2)
                    ]
                  : null),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 11), // Padding for prefix/suffix
        child: Row(
          crossAxisAlignment: widget.maxLines != 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: <Widget>[
            if (widget.prefix != null)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: DefaultTextStyle(
                  style: TextStyle(color: ext.hintTextColor),
                  child: IconTheme(data: IconThemeData(color: ext.hintTextColor, size: 16), child: widget.prefix!),
                ),
              ),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: widget.placeholder,
                  hintStyle: TextStyle(color: ext.hintTextColor, fontSize: _getFontSize()),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: _getPadding(),
                  counterText: '', // Hide default counter
                ),
                style: widget.style?.copyWith(fontSize: _getFontSize(), color: ext.textColor) ?? TextStyle(fontSize: _getFontSize(), color: ext.textColor),
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                textAlign: widget.textAlign,
                readOnly: widget.readOnly,
                enabled: widget.enabled,
                autofocus: widget.autofocus,
                obscureText: widget.obscureText,
                autocorrect: widget.autocorrect,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                maxLength: widget.maxLength,
                onChanged: (String val) {
                  setState(() {}); // Rebuild for clear button / count
                  widget.onChanged?.call(val);
                },
                onTap: widget.onTap,
                onEditingComplete: widget.onEditingComplete,
                onSubmitted: widget.onSubmitted,
                inputFormatters: widget.inputFormatters,
                cursorColor: ext.focusedBorderColor,
                cursorWidth: 1,
              ),
            ),
            if (widget.allowClear && _controller.text.isNotEmpty && _controller.text.isNotEmpty && widget.enabled)
              GestureDetector(
                onTap: () {
                  _controller.clear();
                  setState(() {});
                  widget.onChanged?.call('');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.cancel, color: ext.hintTextColor, size: 14),
                ),
              ),
            if (widget.showCount && widget.maxLength != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '${_controller.text.length} / ${widget.maxLength}',
                  style: TextStyle(color: ext.hintTextColor, fontSize: 12),
                ),
              ),
            if (widget.suffix != null)
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: DefaultTextStyle(
                  style: TextStyle(color: ext.hintTextColor),
                  child: IconTheme(data: IconThemeData(color: ext.hintTextColor, size: 16), child: widget.suffix!),
                ),
              ),
          ],
        ),
      ),
    );

    // Wrapper for Addons
    if (widget.addonBefore != null ||
        widget.addonAfter != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.addonBefore != null) _buildAddon(widget.addonBefore!, context, isBefore: true),
          Expanded(child: input),
          if (widget.addonAfter != null) _buildAddon(widget.addonAfter!, context, isBefore: false),
        ],
      );
    }

    return input;
  }

  Widget _buildAddon(
      Widget
          child,
      BuildContext
          context,
      {required bool
          isBefore}) {
    // Addons have a gray background and border, merging with the input
    // This is a simplification; perfect merging requires careful border management
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 11),
      height: widget.maxLines == 1
          ? (widget.size == SInputSize.large ? 40 : (widget.size == SInputSize.small ? 24 : 32))
          : null,
      alignment:
          Alignment.center,
      decoration:
          BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: isBefore ? const BorderRadius.horizontal(left: Radius.circular(6)) : const BorderRadius.horizontal(right: Radius.circular(6)),
      ),
      child:
          DefaultTextStyle(
        style: TextStyle(color: Colors.grey.shade800),
        child: child,
      ),
    );
  }
}

class _SInputPassword
    extends StatefulWidget {
  const _SInputPassword({
    super.key,
    this.controller,
    this.initialValue,
    this.placeholder,
    this.size =
        SInputSize.middle,
    this.status,
    this.prefix,
    this.suffix,
    this.addonBefore,
    this.addonAfter,
    this.visibilityToggle =
        true,
    this.onChanged,
    this.onSubmitted,
    this.enabled =
        true,
  });

  final TextEditingController?
      controller;
  final String?
      initialValue;
  final String?
      placeholder;
  final SInputSize
      size;
  final SInputStatus?
      status;
  final Widget?
      prefix;
  final Widget?
      suffix;
  final Widget?
      addonBefore;
  final Widget?
      addonAfter;
  final bool
      visibilityToggle;
  final ValueChanged<String>?
      onChanged;
  final ValueChanged<String>?
      onSubmitted;
  final bool
      enabled;

  @override
  State<_SInputPassword>
      createState() =>
          _SInputPasswordState();
}

class _SInputPasswordState
    extends State<
        _SInputPassword> {
  bool
      _obscureText =
      true;

  @override
  Widget build(
      BuildContext
          context) {
    return SInput(
      controller:
          widget.controller,
      initialValue:
          widget.initialValue,
      placeholder:
          widget.placeholder,
      size:
          widget.size,
      status:
          widget.status,
      prefix:
          widget.prefix,
      addonBefore:
          widget.addonBefore,
      addonAfter:
          widget.addonAfter,
      obscureText:
          _obscureText,
      enabled:
          widget.enabled,
      onChanged:
          widget.onChanged,
      onSubmitted:
          widget.onSubmitted,
      suffix:
          Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.suffix != null) widget.suffix!,
          if (widget.visibilityToggle)
            GestureDetector(
              onTap: () => setState(() => _obscureText = !_obscureText),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SInputSearch
    extends StatefulWidget {
  const _SInputSearch({
    super.key,
    this.controller,
    this.initialValue,
    this.placeholder,
    this.size =
        SInputSize.middle,
    this.status,
    this.prefix,
    this.suffix,
    this.addonBefore,
    this.addonAfter,
    this.allowClear =
        false,
    this.onSearch,
    this.onChanged,
    this.loading =
        false,
    this.enterButton,
  });

  final TextEditingController?
      controller;
  final String?
      initialValue;
  final String?
      placeholder;
  final SInputSize
      size;
  final SInputStatus?
      status;
  final Widget?
      prefix;
  final Widget?
      suffix;
  final Widget?
      addonBefore;
  final Widget?
      addonAfter;
  final bool
      allowClear;
  final ValueChanged<String>?
      onSearch;
  final ValueChanged<String>?
      onChanged;
  final bool
      loading;
  final dynamic
      enterButton;

  @override
  State<_SInputSearch>
      createState() =>
          _SInputSearchState();
}

class _SInputSearchState
    extends State<
        _SInputSearch> {
  late TextEditingController
      _controller;

  @override
  void
      initState() {
    super
        .initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  void
      _handleSearch() {
    widget
        .onSearch
        ?.call(_controller.text);
  }

  @override
  Widget build(
      BuildContext
          context) {
    // If enterButton is supplied, it replaces the suffix search icon (or acts as an addon)
    //
    // If enterButton is Text/Boolean(true), it's a Button addonAfter.
    // If it's null/false, just a search icon suffix.

    Widget?
        activeSuffix =
        widget.suffix;
    Widget?
        activeAddonAfter =
        widget.addonAfter;

    if (widget.enterButton !=
        null) {
      // Render as Button in addonAfter
      final Widget buttonContent = (widget.enterButton is bool && widget.enterButton == true)
          ? const Icon(Icons.search, size: 16, color: Colors.white)
          : (widget.enterButton is Widget ? widget.enterButton as Widget : const Icon(Icons.search));

      activeAddonAfter =
          GestureDetector(
        onTap: _handleSearch,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: widget.size == SInputSize.large ? 40 : (widget.size == SInputSize.small ? 24 : 32),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(6)),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: IconTheme(
            data: const IconThemeData(color: Colors.white, size: 16),
            child: buttonContent is Text ? DefaultTextStyle(style: const TextStyle(color: Colors.white), child: buttonContent) : buttonContent,
          ),
        ),
      );
    } else {
      // Just suffix icon
      activeSuffix =
          GestureDetector(
        onTap: _handleSearch,
        child: widget.loading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.search, size: 16),
      );
    }

    return SInput(
      controller:
          _controller, // Use local controller if not provided? No, shared logic needed
      initialValue: widget.initialValue == null && widget.controller == null
          ? null
          : widget.initialValue, // Fix logic
      // Actually if I pass controller to SInput it works, but I need access to text for search.
      // SInput handles controller creation if null. But I need it here.
      // So I should pass _controller down.
      // But wait _controller init above logic is distinct from SInput state.
      // I will pass _controller to SInput.
      placeholder:
          widget.placeholder,
      size:
          widget.size,
      status:
          widget.status,
      prefix:
          widget.prefix,
      suffix:
          activeSuffix,
      addonBefore:
          widget.addonBefore,
      addonAfter: activeAddonAfter != widget.addonAfter
          ? activeAddonAfter
          : widget.addonAfter, // If modified, use modified
      allowClear:
          widget.allowClear,
      onChanged:
          widget.onChanged,
      onSubmitted:
          widget.onSearch,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../s_design.dart';
import 's_input.dart';

class SInputOTP
    extends StatefulWidget {
  const SInputOTP({
    super.key,
    this.length =
        6,
    this.size =
        SInputFieldSize.medium,
    this.status,
    this.onChanged,
    this.onCompleted,
    this.enabled =
        true,
  });

  final int
      length;
  final SInputFieldSize
      size;
  final SInputStatus?
      status;
  final ValueChanged<String>?
      onChanged;
  final ValueChanged<String>?
      onCompleted;
  final bool
      enabled;

  @override
  State<SInputOTP>
      createState() =>
          _SInputOTPState();
}

class _SInputOTPState
    extends State<
        SInputOTP> {
  late List<TextEditingController>
      _controllers;
  late List<FocusNode>
      _focusNodes;

  @override
  void
      initState() {
    super
        .initState();
    _controllers = List<TextEditingController>.generate(
        widget.length,
        (int index) => TextEditingController());
    _focusNodes = List<FocusNode>.generate(
        widget.length,
        (int index) => FocusNode());
  }

  @override
  void
      dispose() {
    for (final TextEditingController c
        in _controllers) {
      c.dispose();
    }
    for (final FocusNode f
        in _focusNodes) {
      f.dispose();
    }
    super
        .dispose();
  }

  void _handleChanged(
      String
          value,
      int index) {
    if (value
        .isNotEmpty) {
      if (index <
          widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        final String code = _controllers.map((TextEditingController c) => c.text).join();
        widget.onCompleted?.call(code);
      }
    } else {
      if (index >
          0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    final String
        currentCode =
        _controllers.map((TextEditingController c) => c.text).join();
    widget
        .onChanged
        ?.call(currentCode);
  }

  Color _getBorderColor(
      ThemeData
          theme,
      bool
          isFocused) {
    if (widget.status ==
        SInputStatus.error) {
      return theme.colorScheme.error;
    }
    if (widget.status ==
        SInputStatus.warning) {
      return Colors.amber;
    }
    if (isFocused) {
      return theme.primaryColor;
    }
    return theme
        .colorScheme
        .outline;
  }

  double
      _getSize() {
    switch (
        widget.size) {
      case SInputSize.small:
        return 24;
      case SInputSize.large:
        return 40;
      default:
        return 32;
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final ThemeData
        theme =
        Theme.of(context);
    return Row(
      mainAxisSize:
          MainAxisSize.min,
      mainAxisAlignment:
          MainAxisAlignment.center,
      children:
          List<Widget>.generate(widget.length, (int index) {
        return Container(
          width: _getSize(),
          height: _getSize(),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Builder(builder: (BuildContext context) {
            return Focus(
              onFocusChange: (bool focused) => setState(() {}),
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                maxLength: 1,
                enabled: widget.enabled,
                style: TextStyle(fontSize: widget.size == SInputSize.small ? 14 : 16),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (String val) => _handleChanged(val, index),
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: theme.colorScheme.outline),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: _getBorderColor(theme, false)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: _getBorderColor(theme, true)),
                  ),
                  filled: true,
                  fillColor: widget.enabled ? theme.colorScheme.surface : theme.colorScheme.surfaceContainerHighest,
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}

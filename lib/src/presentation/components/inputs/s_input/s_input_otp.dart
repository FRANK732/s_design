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
        SInputSize.middle,
    this.status,
    this.onChanged,
    this.onCompleted,
    this.enabled =
        true,
  });

  final int
      length;
  final SInputSize
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
    _controllers = List.generate(
        widget.length,
        (int index) => TextEditingController());
    _focusNodes = List.generate(
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
      // Handle backspace moving to previous field is usually handled by RawKeyboardListener wrap
      // but here onChanged is triggered after text change.
      // If empty, it means text was deleted.
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
    return Colors
        .grey
        .shade300;
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
        return 32; // Default Input height
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final ThemeData theme =
        Theme.of(context);

    // Since focus state is per-input, we need multiple focus listeners or just use Focus widget logic.
    // For simplicity, we build individual boxes.

    return Row(
      mainAxisSize:
          MainAxisSize.min,
      mainAxisAlignment:
          MainAxisAlignment.center,
      children:
          List.generate(widget.length, (int index) {
        return Container(
          width: _getSize(),
          height: _getSize(),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Builder(builder: (BuildContext context) {
            // We need to listen to focus change to update border color, but FocusNode listener requires setState.
            // Using Focus widget or AnimatedContainer with manual focus tracking.
            // Let's wrap in a Stateful builder for focus or just rely on Flutter rebuilds if possible?
            // Actually TextField repaints on focus. But border is on Container? No, border should be on TextField decoration or Container.
            // OTP is individual boxes.

            return Focus(
              onFocusChange: (bool focused) => setState(() {}), // Trigger rebuild to update border
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
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: _getBorderColor(theme, false)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: _getBorderColor(theme, true)), // Focused border
                  ),
                  filled: !widget.enabled,
                  fillColor: widget.enabled ? Colors.white : Colors.grey.shade100,
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}

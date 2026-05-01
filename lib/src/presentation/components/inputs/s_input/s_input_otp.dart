import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// A stand-alone OTP input widget.
///
/// **Deprecated.** Use [SInputField.otp] instead:
///
/// ```dart
/// SInputField.otp(
///   length: 6,
///   onCompleted: (code) => verifyOTP(code),
/// )
/// ```
@Deprecated(
  'Use SInputField.otp() instead. '
  'SInputOTP will be removed in a future release.',
)
class SInputOTP extends StatelessWidget {
  const SInputOTP({
    super.key,
    this.length = 6,
    this.size = SInputFieldSize.medium,
    this.enabled = true,
    this.onChanged,
    this.onCompleted,
  });

  final int length;
  final SInputFieldSize size;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  @override
  Widget build(BuildContext context) {
    return SInputField.otp(
      length: length,
      size: size,
      enabled: enabled,
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}

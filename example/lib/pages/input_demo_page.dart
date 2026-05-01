import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class InputDemoPage
    extends StatefulWidget {
  const InputDemoPage(
      {super.key});

  @override
  State<InputDemoPage>
      createState() =>
          _InputDemoPageState();
}

class _InputDemoPageState
    extends State<
        InputDemoPage> {
  final _formKey =
      GlobalKey<FormState>();
  final _cardController =
      TextEditingController();
  final _dateController =
      TextEditingController();
  // Used in the disabled/readOnly demo — seeded with a starting value.
  final _readOnlyController =
      TextEditingController(text: 'Cannot be changed');
  bool
      _isLoading =
      false;

  @override
  void
      dispose() {
    _cardController
        .dispose();
    _dateController
        .dispose();
    _readOnlyController
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SInputField',
      description:
          l10n.inputDesc,
      whenToUse: [
        l10n.inputTip1,
        l10n.inputTip2,
        l10n.inputTip3,
      ],
      sections: [
        // ── 1. Basic Usage ────────────────────────────────────────────────
        ComponentSection(
          title: l10n.demoBasicUsage,
          description: 'A simple text field with hint, label, and helper text.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SInputField(
                hintText: l10n.inputLabelMiddle,
                labelText: 'Text',
                helperText: 'This is a helper message.',
              ),
              const SizedBox(height: 12),
              SInputField.email(
                hintText: l10n.inputHintEmail,
                labelText: 'Email',
              ),
              const SizedBox(height: 12),
              SInputField.number(
                hintText: l10n.inputHintNumber,
                labelText: 'Number',
              ),
            ],
          ),
          code: '''
SInputField(
  hintText: 'Middle input (default)',
  labelText: 'Text',
  helperText: 'This is a helper message.',
);

SInputField.email(hintText: 'Enter your email', labelText: 'Email');

SInputField.number(hintText: 'Enter number', labelText: 'Number');''',
        ),

        // ── 2. Password ────────────────────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionPassword,
          description: 'Use `SInputField.password()` to get a field with a built-in '
              'show/hide toggle.',
          demo: SInputField.password(
            hintText: l10n.inputHintPassword,
            labelText: 'Password',
          ),
          code: '''
SInputField.password(
  hintText: 'Enter password',
  labelText: 'Password',
);''',
        ),

        // ── 3. Prefix & Suffix Icons ───────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionPrefixSuffix,
          description: 'Add widgets inside the field using `startIcon` and `endIcon`.',
          demo: Column(
            children: [
              SInputField.search(
                hintText: l10n.inputLabelSearch,
              ),
              const SizedBox(height: 12),
              SInputField(
                hintText: l10n.inputLabelAmount,
                startIcon: const Text(r'$',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                endIcon: const Text('USD',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              SInputField(
                hintText: l10n.inputHintCustom,
                startIcon: const Icon(Icons.person_outline),
                endIcon: const Icon(Icons.check_circle_outline,
                    color: Colors.green),
              ),
            ],
          ),
          code: r'''
SInputField.search(hintText: 'Search...');

SInputField(
  hintText: 'amount',
  startIcon: Text(r'$', style: TextStyle(fontWeight: FontWeight.bold)),
  endIcon: Text('USD', style: TextStyle(fontWeight: FontWeight.bold)),
  keyboardType: TextInputType.number,
);

SInputField(
  hintText: 'Custom',
  startIcon: Icon(Icons.person_outline),
  endIcon: Icon(Icons.check_circle_outline, color: Colors.green),
);''',
        ),

        // ── 4. Input with Icons (named section) ────────────────────────────
        ComponentSection(
          title: l10n.inputSectionIcons,
          description: 'Combine icons with typed factories for rich, purpose-built fields.',
          demo: const Column(
            children: [
              SInputField(
                inputType: SInputFieldType.phone,
                hintText: '+1 (555) 000-0000',
                labelText: 'Phone',
                startIcon: Icon(Icons.phone_outlined),
              ),
              SizedBox(height: 12),
              SInputField(
                hintText: 'https://',
                labelText: 'Website',
                startIcon: Icon(Icons.link_outlined),
                keyboardType: TextInputType.url,
              ),
              SizedBox(height: 12),
              SInputField(
                hintText: '@username',
                labelText: 'Twitter',
                startIcon: Icon(Icons.alternate_email),
              ),
            ],
          ),
          code: '''
SInputField(
  inputType: SInputFieldType.phone,
  hintText: '+1 (555) 000-0000',
  labelText: 'Phone',
  startIcon: Icon(Icons.phone_outlined),
);

SInputField(
  hintText: 'https://',
  labelText: 'Website',
  startIcon: Icon(Icons.link_outlined),
  keyboardType: TextInputType.url,
);''',
        ),

        // ── 5. Sizes ────────────────────────────────────────────────────────
        ComponentSection(
          title: l10n.demoSizes,
          description: 'Three sizes: `small` (default), `medium`, `large`.',
          demo: Column(
            children: [
              SInputField(
                hintText: l10n.inputLabelLarge,
                size: SInputFieldSize.large,
              ),
              const SizedBox(height: 8),
              SInputField(
                hintText: l10n.inputLabelMiddle,
              ),
              const SizedBox(height: 8),
              SInputField(
                hintText: l10n.inputLabelSmall,
              ),
            ],
          ),
          code: '''
SInputField(hintText: 'Large input',  size: SInputFieldSize.large);
SInputField(hintText: 'Middle input', size: SInputFieldSize.medium);
SInputField(hintText: 'Small input',  size: SInputFieldSize.small);''',
        ),

        // ── 6. Validation States ───────────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionValidation,
          description: 'Pass `errorText` or `validator` to show inline validation. '
              'Use `helperText` for neutral hints.',
          demo: Form(
            key: _formKey,
            child: Column(
              children: [
                SInputField(
                  hintText: l10n.inputLabelEmailError,
                  errorText: l10n.inputLabelEmailError,
                  startIcon: const Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                SInputField(
                  hintText: l10n.inputLabelPassword,
                  helperText: l10n.inputLabelPasswordWarning,
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                SInputField(
                  hintText: l10n.inputLabelApiKey,
                  labelText: l10n.inputLabelApiKey,
                  errorText: l10n.inputErrorApiKey,
                  startIcon: const Icon(Icons.key_outlined),
                ),
              ],
            ),
          ),
          code: '''
SInputField(
  hintText: 'Valid email required',
  errorText: 'Valid email required',
  startIcon: Icon(Icons.email_outlined),
);

SInputField(
  hintText: 'Enter password',
  helperText: 'Password should be stronger',
  obscureText: true,
);''',
        ),

        // ── 7. Disabled & ReadOnly ─────────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionDisabled,
          description: 'Prevent interaction with `enabled: false` or allow viewing '
              'without editing via `readOnly: true`.',
          demo: Column(
            children: [
              SInputField(
                hintText: l10n.inputLabelDisabled,
                labelText: 'Disabled',
                enabled: false,
              ),
              const SizedBox(height: 12),
              SInputField(
                controller: _readOnlyController,
                labelText: 'Read-only',
                readOnly: true,
              ),
            ],
          ),
          code: r'''
// Disabled — no interaction possible
SInputField(hintText: 'Disabled', enabled: false);

// Read-only — seed the controller with the value to display
final ctrl = TextEditingController(text: 'Cannot be changed');
SInputField(controller: ctrl, readOnly: true);''',
        ),

        // ── 8. Loading State ───────────────────────────────────────────────
        ComponentSection(
          title: l10n.demoLoadingState,
          description: 'Show a loading indicator via `isLoading: true`. Tap the button '
              'below to toggle.',
          demo: Column(
            children: [
              SInputField(
                hintText: l10n.inputHintStatus,
                labelText: l10n.inputLabelStatus,
                helperText: l10n.inputHelperStatus,
                isLoading: _isLoading,
                readOnly: true,
              ),
              const SizedBox(height: 12),
              SButton(
                onPressed: () => setState(() => _isLoading = !_isLoading),
                child: Text(_isLoading ? 'Stop Loading' : 'Start Loading'),
              ),
            ],
          ),
          code: '''
SInputField(
  hintText: 'Checking...',
  labelText: 'Server Status',
  isLoading: true,
  readOnly: true,
);''',
        ),

        // ── 9. Date Picker ─────────────────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionDatePicker,
          description: 'Use `SInputField.datePicker()` to get a field that opens '
              'the native date picker on tap.',
          demo: SInputField.datePicker(
            controller: _dateController,
            hintText: l10n.inputHintDate,
          ),
          code: '''
final controller = TextEditingController();

SInputField.datePicker(
  controller: controller,
  hintText: 'Select date',
);''',
        ),

        // ── 10. Text Area ──────────────────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionTextArea,
          description: 'Set `maxLines` > 1 (and optionally `minLines`) to create a '
              'multi-line textarea.',
          demo: SInputField(
            hintText: l10n.inputLabelMessage,
            labelText: 'Message',
            maxLines: 5,
            minLines: 3,
          ),
          code: '''
SInputField(
  hintText: 'Write your message...',
  labelText: 'Message',
  maxLines: 5,
  minLines: 3,
);''',
        ),

        // ── 11. Formatted Input (Credit Card) ──────────────────────────────
        ComponentSection(
          title: l10n.inputSectionCard,
          description: 'Use `inputFormatters` to mask or format input — e.g., credit '
              'card numbers grouped in blocks of four.',
          demo: SInputField(
            controller: _cardController,
            hintText: l10n.inputHintCard,
            labelText: l10n.inputLabelCard,
            helperText: l10n.inputHelperCard,
            keyboardType: TextInputType.number,
            startIcon: const Icon(Icons.credit_card),
            maxLength: 19,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              _CardNumberFormatter(),
            ],
          ),
          code: r'''
SInputField(
  hintText: '0000 0000 0000 0000',
  labelText: 'Card Number',
  helperText: 'We do not store your card details',
  keyboardType: TextInputType.number,
  startIcon: Icon(Icons.credit_card),
  maxLength: 19,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    _CardNumberFormatter(),
  ],
);''',
        ),

        // ── 12. Input Customization ────────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionCustom,
          description: 'Combine `filled`, `hasBorder`, `prefixText`, and `suffixText` '
              'for fully custom appearances.',
          demo: Column(
            children: [
              SInputField(
                hintText: l10n.inputHintPrice,
                labelText: l10n.inputLabelPrice,
                helperText: l10n.inputHelperPrice,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                prefixText: r'$',
                suffixText: 'USD',
                filled: true,
              ),
              const SizedBox(height: 12),
              SInputField(
                hintText: l10n.inputHintCustom,
                hasBorder: false,
                filled: true,
                startIcon: const Icon(Icons.tune),
              ),
            ],
          ),
          code: r'''
SInputField(
  hintText: '0.00',
  labelText: 'Price',
  helperText: 'Enter the price in USD',
  keyboardType: TextInputType.numberWithOptions(decimal: true),
  prefixText: r'$',
  suffixText: 'USD',
  filled: true,
);

SInputField(
  hintText: 'Custom',
  hasBorder: false,
  filled: true,
  startIcon: Icon(Icons.tune),
);''',
        ),

        // ── 13. OTP Input ──────────────────────────────────────────────────
        ComponentSection(
          title: 'OTP Input',
          description: 'Use `SInputField.otp()` to render a row of individual digit '
              'boxes. Focus moves automatically as the user types.',
          demo: Column(
            children: [
              SInputField.otp(
                onCompleted: (code) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('OTP entered: $code')),
                  );
                },
              ),
              const SizedBox(height: 12),
              SInputField.otp(
                length: 4,
                size: SInputFieldSize.large,
              ),
            ],
          ),
          code: '''
SInputField.otp(
  length: 6,
  onCompleted: (code) => verifyOTP(code),
);

SInputField.otp(
  length: 4,
  size: SInputFieldSize.large,
);''',
        ),

        // ── 14. Real-World Features ────────────────────────────────────────
        ComponentSection(
          title: l10n.inputSectionRealWorld,
          description: 'A sign-up form combining email, password, and a submit button '
              'to demonstrate real-world usage.',
          demo: _SignUpFormDemo(),
          code: '''
Form(
  key: _formKey,
  child: Column(
    children: [
      SInputField.email(
        hintText: 'Enter your email',
        labelText: 'Email',
        validator: (v) =>
            v == null || !v.contains('@') ? 'Enter a valid email' : null,
      ),
      SizedBox(height: 12),
      SInputField.password(
        hintText: 'Enter password',
        labelText: 'Password',
        validator: (v) =>
            v == null || v.length < 8 ? 'Min 8 characters' : null,
      ),
      SizedBox(height: 16),
      SButton(
        label: 'Submit',
        onPressed: () {
          if (_formKey.currentState!.validate()) { /* submit */ }
        },
      ),
    ],
  ),
);''',
        ),
      ],
    );
  }
}

class _CardNumberFormatter
    extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue
          oldValue,
      TextEditingValue
          newValue) {
    final digits = newValue.text.replaceAll(
        ' ',
        '');
    final buffer =
        StringBuffer();
    for (int i = 0;
        i < digits.length;
        i++) {
      if (i > 0 &&
          i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(digits[i]);
    }
    final formatted =
        buffer.toString();
    return newValue
        .copyWith(
      text:
          formatted,
      selection:
          TextSelection.collapsed(offset: formatted.length),
    );
  }
}

// ─── Sign-up form demo ────────────────────────────────────────────────────

class _SignUpFormDemo
    extends StatefulWidget {
  @override
  State<_SignUpFormDemo>
      createState() =>
          _SignUpFormDemoState();
}

class _SignUpFormDemoState
    extends State<
        _SignUpFormDemo> {
  final _key =
      GlobalKey<FormState>();
  bool
      _submitted =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return Form(
      key:
          _key,
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SInputField.email(
            hintText: l10n.inputHintEmail,
            labelText: 'Email',
            validator: (v) {
              if (v == null || !v.contains('@')) return l10n.inputErrorEmpty;
              return null;
            },
          ),
          const SizedBox(height: 12),
          SInputField.password(
            hintText: l10n.inputHintPassword,
            labelText: 'Password',
            validator: (v) {
              if (v == null || v.length < 8) return 'Min 8 characters';
              return null;
            },
          ),
          const SizedBox(height: 16),
          SButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                setState(() => _submitted = true);
              }
            },
            child: Text(_submitted ? 'Submitted ✓' : l10n.inputBtnSubmit),
          ),
        ],
      ),
    );
  }
}

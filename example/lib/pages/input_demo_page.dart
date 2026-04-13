import 'package:flutter/material.dart';
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
  @override
  Widget build(
      BuildContext
          context) {
    final l10n = SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SInput',
      description: l10n.inputDesc,
      whenToUse: [
        l10n.inputTip1,
        l10n.inputTip2,
        l10n.inputTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.demoBasicUsage,
          description: 'A simple text field with a placeholder.',
          demo: SInput(placeholder: l10n.inputLabelMiddle),
          code: '''
SInput(placeholder: l10n.inputLabelMiddle);''',
        ),
        ComponentSection(
          title: l10n.inputSectionPrefixSuffix,
          description: 'Add widgets inside the input field using `prefix` and `suffix`.',
          demo: Column(
            children: [
              SInput(
                placeholder: l10n.inputLabelSearch,
                prefix: Icon(Icons.search, size: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 12),
              SInput.password(
                placeholder: l10n.inputLabelPassword,
              ),
              const SizedBox(height: 12),
              SInput(
                placeholder: l10n.inputLabelAmount,
                addonBefore: const Text(r'$'),
                addonAfter: const Text('USD'),
              ),
            ],
          ),
          code: r'''
SInput(
  placeholder: l10n.inputLabelSearch,
  prefix: Icon(Icons.search, size: 16),
);

SInput.password(placeholder: l10n.inputLabelPassword);

SInput(
  placeholder: l10n.inputLabelAmount,
  addonBefore: const Text('$'),
  addonAfter: const Text('USD'),
);''',
        ),
        ComponentSection(
          title: l10n.inputSectionValidation,
          description: 'Use `status` to communicate validation feedback to the user.',
          demo: Column(
            children: [
              SInput(
                placeholder: l10n.inputLabelEmailError,
                status: SInputStatus.error,
              ),
              const SizedBox(height: 12),
              SInput(
                placeholder: l10n.inputLabelPasswordWarning,
                status: SInputStatus.warning,
              ),
            ],
          ),
          code: '''
SInput(
  placeholder: l10n.inputLabelEmailError,
  status: SInputStatus.error,
);
SInput(
  placeholder: l10n.inputLabelPasswordWarning,
  status: SInputStatus.warning,
);''',
        ),
        ComponentSection(
          title: l10n.demoSizes,
          description: 'Three sizes: small, middle (default), large.',
          demo: Column(
            children: [
              SInput(placeholder: l10n.inputLabelLarge, size: SInputSize.large),
              const SizedBox(height: 8),
              SInput(placeholder: l10n.inputLabelMiddle),
              const SizedBox(height: 8),
              SInput(placeholder: l10n.inputLabelSmall, size: SInputSize.small),
            ],
          ),
          code: '''
SInput(placeholder: l10n.inputLabelLarge, size: SInputSize.large);
SInput(placeholder: l10n.inputLabelMiddle);
SInput(placeholder: l10n.inputLabelSmall, size: SInputSize.small);''',
        ),
        ComponentSection(
          title: l10n.inputSectionDisabled,
          description: 'Prevent user interaction using `enabled: false` or `readOnly: true`.',
          demo: Column(
            children: [
              SInput(placeholder: l10n.inputLabelDisabled, enabled: false),
              const SizedBox(height: 12),
              SInput(initialValue: l10n.inputLabelReadOnly, readOnly: true),
            ],
          ),
          code: '''
SInput(placeholder: l10n.inputLabelDisabled, enabled: false);
SInput(initialValue: l10n.inputLabelReadOnly, readOnly: true);''',
        ),
        ComponentSection(
          title: l10n.inputSectionClear,
          description: 'Show a clear button on the right when the field has content.',
          demo: SInput(
            placeholder: l10n.inputLabelTypeClear,
            allowClear: true,
          ),
          code: '''
SInput(placeholder: l10n.inputLabelTypeClear, allowClear: true);''',
        ),
        ComponentSection(
          title: l10n.inputSectionTextArea,
          description: 'Use `SInput.textArea()` for multi-line input.',
          demo: SInput.textArea(
            placeholder: l10n.inputLabelMessage,
            maxLength: 200,
            showCount: true,
          ),
          code: '''
SInput.textArea(
  placeholder: l10n.inputLabelMessage,
  maxLength: 200,
  showCount: true,
);''',
        ),
      ],
    );
  }
}

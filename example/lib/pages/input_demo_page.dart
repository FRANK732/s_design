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
    return ComponentPage(
      name:
          'SInput',
      description:
          'A text input field with support for prefix/suffix icons, addon before/after, '
          'validation states (error, warning), clear button, and multiple sizes.',
      whenToUse: const [
        'When collecting text data from the user in a form.',
        'For search fields, filters, and data-entry screens.',
        'When you need built-in validation feedback (error, warning states).',
      ],
      sections: [
        const ComponentSection(
          title: 'Basic Input',
          description: 'A simple text field with a placeholder.',
          demo: SInput(placeholder: 'Enter your username'),
          code: '''
const SInput(placeholder: 'Enter your username');''',
        ),
        ComponentSection(
          title: 'With Prefix and Suffix Widgets',
          description: 'Add widgets inside the input field using `prefix` and `suffix`.',
          demo: Column(
            children: [
              SInput(
                placeholder: 'Search...',
                prefix: Icon(Icons.search, size: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 12),
              SInput.password(
                placeholder: 'Enter password',
              ),
              const SizedBox(height: 12),
              const SInput(
                placeholder: 'amount',
                addonBefore: Text(r'$'),
                addonAfter: Text('USD'),
              ),
            ],
          ),
          code: r'''
SInput(
  placeholder: 'Search...',
  prefix: Icon(Icons.search, size: 16),
);

SInput.password(placeholder: 'Enter password');

SInput(
  placeholder: 'amount',
  addonBefore: const Text('$'),
  addonAfter: const Text('USD'),
);''',
        ),
        const ComponentSection(
          title: 'Validation States',
          description: 'Use `status` to communicate validation feedback to the user.',
          demo: Column(
            children: [
              SInput(
                placeholder: 'Valid email required',
                status: SInputStatus.error,
              ),
              SizedBox(height: 12),
              SInput(
                placeholder: 'Password should be stronger',
                status: SInputStatus.warning,
              ),
            ],
          ),
          code: '''
SInput(
  placeholder: 'Valid email required',
  status: SInputStatus.error,
);
SInput(
  placeholder: 'Password should be stronger',
  status: SInputStatus.warning,
);''',
        ),
        const ComponentSection(
          title: 'Sizes',
          description: 'Three sizes: small, middle (default), large.',
          demo: Column(
            children: [
              SInput(placeholder: 'Large input', size: SInputSize.large),
              SizedBox(height: 8),
              SInput(placeholder: 'Middle input (default)'),
              SizedBox(height: 8),
              SInput(placeholder: 'Small input', size: SInputSize.small),
            ],
          ),
          code: '''
const SInput(placeholder: 'Large input', size: SInputSize.large);
const SInput(placeholder: 'Middle input');
const SInput(placeholder: 'Small input', size: SInputSize.small);''',
        ),
        const ComponentSection(
          title: 'Disabled and ReadOnly',
          description: 'Prevent user interaction using `enabled: false` or `readOnly: true`.',
          demo: Column(
            children: [
              SInput(placeholder: 'Disabled', enabled: false),
              SizedBox(height: 12),
              SInput(initialValue: 'Cannot be changed', readOnly: true),
            ],
          ),
          code: '''
const SInput(placeholder: 'Disabled', enabled: false);
const SInput(initialValue: 'Cannot be changed', readOnly: true);''',
        ),
        const ComponentSection(
          title: 'Allow Clear',
          description: 'Show a clear button on the right when the field has content.',
          demo: SInput(
            placeholder: 'Type something then clear it',
            allowClear: true,
          ),
          code: '''
const SInput(placeholder: 'Type something', allowClear: true);''',
        ),
        ComponentSection(
          title: 'Text Area',
          description: 'Use `SInput.textArea()` for multi-line input.',
          demo: SInput.textArea(
            placeholder: 'Write your message...',
            maxLength: 200,
            showCount: true,
          ),
          code: '''
SInput.textArea(
  placeholder: 'Write your message...',
  maxLength: 200,
  showCount: true,
);''',
        ),
      ],
    );
  }
}

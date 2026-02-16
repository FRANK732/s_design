import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class InputDemoPage
    extends StatelessWidget {
  const InputDemoPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('SInput Showcase')),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Basic Usage', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const SInput(placeholder: 'Basic Usage'),
            const SizedBox(height: 32),
            const Text('Three Sizes', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const SInput(size: SInputSize.large, placeholder: 'Large Size'),
            const SizedBox(height: 8),
            const SInput(size: SInputSize.middle, placeholder: 'Default Size'),
            const SizedBox(height: 8),
            const SInput(size: SInputSize.small, placeholder: 'Small Size'),
            const SizedBox(height: 32),
            const Text('Pre / Post Tab (Addons)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const SInput(
              addonBefore: Text('Http://'),
              addonAfter: Text('.com'),
              placeholder: 'mysite',
            ),
            const SizedBox(height: 8),
            SInput(
              addonBefore: const Icon(Icons.settings),
              addonAfter: const Icon(Icons.check),
              placeholder: 'With Icons',
            ),
            const SizedBox(height: 32),
            const Text('Prefix / Suffix', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const SInput(
              prefix: Icon(Icons.person),
              suffix: Icon(Icons.info_outline),
              placeholder: 'Username',
            ),
            const SizedBox(height: 8),
            const SInput(
              prefix: Text('￥'),
              suffix: Text('RMB'),
              placeholder: 'Price',
            ),
            const SizedBox(height: 32),
            const Text('Search Input', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SInput.search(
              placeholder: 'input search text',
              onSearch: (value) => debugPrint('Search: $value'),
            ),
            const SizedBox(height: 8),
            SInput.search(
              placeholder: 'input search text',
              enterButton: true, // Shows generic search button
              onSearch: (value) => debugPrint('Search: $value'),
            ),
            const SizedBox(height: 8),
            SInput.search(
              placeholder: 'input search text',
              enterButton: const Text('Search'), // Custom text button
              size: SInputSize.large,
              onSearch: (value) => debugPrint('Search: $value'),
            ),
            const SizedBox(height: 32),
            const Text('Password Input', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SInput.password(
              placeholder: 'Input password',
            ),
            const SizedBox(height: 8),
            SInput.password(
              placeholder: 'Input password',
              visibilityToggle: false, // No toggle
            ),
            const SizedBox(height: 32),
            const Text('TextArea', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SInput.textArea(
              placeholder: 'Text area with 4 rows',
              maxLines: 4,
            ),
            const SizedBox(height: 8),
            SInput.textArea(
              placeholder: 'Text area with count',
              showCount: true,
              maxLength: 100,
            ),
            const SizedBox(height: 32),
            const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const SInput(status: SInputStatus.error, placeholder: 'Error status'),
            const SizedBox(height: 8),
            const SInput(status: SInputStatus.warning, placeholder: 'Warning status'),
            const SizedBox(height: 32),
            const Text('Clear Icon', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const SInput(allowClear: true, placeholder: 'Type to see clear icon'),
            const SizedBox(height: 32),
            const Text('Input Group', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SInputGroup(children: [
              SInput(placeholder: '0571'),
              SInput(placeholder: '26888888'),
            ]),
            const SizedBox(height: 32),
            const Text('OTP Code', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SInputOTP(
              onCompleted: (val) => debugPrint('OTP Completed: $val'),
            ),
            const SizedBox(height: 8),
            SInputOTP(
              length: 4,
              size: SInputSize.large,
              status: SInputStatus.warning,
            ),
          ],
        ),
      ),
    );
  }
}

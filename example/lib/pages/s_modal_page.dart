// lib/src/pages/modal_page.dart

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({super.key});

  // Helper method to create action buttons
  List<Widget> _buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(); // Dismiss the modal
        },
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () {
          // Perform some action
          Navigator.of(context).pop(); // Dismiss the modal
        },
        child: const Text('OK'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SModal Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Success Modal Button
                SButton(
                  onPressed: () {
                    SModal.showSuccess(
                      context,
                      message: 'The operation was successful!',
                      actions: _buildActions(context),
                    );
                  },
                  child: const Text('Show Success Modal'),
                ),
                const SizedBox(height: 20),

                // Error Modal Button
                SButton(
                  onPressed: () {
                    SModal.showError(
                      context,
                      message: 'An error has occurred. Please try again.',
                      actions: _buildActions(context),
                    );
                  },
                  child: const Text('Show Error Modal'),
                ),
                const SizedBox(height: 20),

                // Info Modal Button
                SButton(
                  onPressed: () {
                    SModal.showInfo(
                      context,
                      message: 'Here is some important information for you.',
                      actions: _buildActions(context),
                    );
                  },
                  child: const Text('Show Info Modal'),
                ),
                const SizedBox(height: 20),

                // Warning Modal Button
                ElevatedButton(
                  onPressed: () {
                    SModal.showWarning(
                      context,
                      message: 'Please be cautious about the next steps.',
                      actions: _buildActions(context),
                    );
                  },
                  child: const Text('Show Warning Modal'),
                ),
                const SizedBox(height: 20),

                // Custom Modal Button
                SButton(
                  onPressed: () {
                    SModal.showCustom(
                      context,
                      type: SModalType.custom,
                      title: 'Custom Modal',
                      message:
                          'This is a custom modal with a unique icon and actions.',
                      customIcon: Icons.star,
                      customIconColor: Colors.purple,
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Perform custom action
                            Navigator.of(context).pop();
                          },
                          child: const Text('Proceed'),
                        ),
                      ],
                      backgroundColor: Colors.purple[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      animationType: SModalAnimationType
                          .slideFromLeft, // Assuming slide is another enum
                      size: SModalSize.large,
                    );
                  },
                  child: const Text('Show Custom Modal'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

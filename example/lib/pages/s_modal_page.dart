import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SModalPage
    extends StatelessWidget {
  const SModalPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SDialog',
      description:
          'A highly customizable dialog with support for multiple animations and background effects. '
          'Use SDialog.show() for a convenient static factory, or construct SDialog directly.',
      whenToUse: const [
        'For confirmation prompts before irreversible actions.',
        'To show forms or detail content that require user focus.',
        'For alerts or informational messages that block background interaction.',
      ],
      sections: [
        ComponentSection(
          title: 'Confirmation Dialog',
          description: 'A basic confirmation dialog with Cancel and Confirm actions.',
          demo: SButton(
            onPressed: () {
              SDialog.show<void>(
                context: context,
                title: 'Delete Item',
                description: 'This action cannot be undone. Are you sure you want to delete?',
                actions: [
                  SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  SButton(
                    variant: SButtonVariant.destructive,
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Delete'),
                  ),
                ],
              );
            },
            child: const Text('Open Confirmation'),
          ),
          code: '''
SDialog.show<void>(
  context: context,
  title: 'Delete Item',
  description: 'This action cannot be undone.',
  actions: [
    SButton(
      variant: SButtonVariant.outline,
      onPressed: () => Navigator.of(context).pop(),
      child: const Text('Cancel'),
    ),
    SButton(
      variant: SButtonVariant.destructive,
      onPressed: () => Navigator.of(context).pop(true),
      child: const Text('Delete'),
    ),
  ],
);''',
        ),
        ComponentSection(
          title: 'Dialog with Content',
          description: 'Use the `content` parameter to show arbitrary widgets inside the dialog.',
          demo: SButton(
            variant: SButtonVariant.outline,
            onPressed: () {
              SDialog.show<void>(
                context: context,
                title: 'Edit Profile',
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SInput(placeholder: 'Full name'),
                    SizedBox(height: 12),
                    SInput(placeholder: 'Email address', keyboardType: TextInputType.emailAddress),
                  ],
                ),
                actions: [
                  SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  SButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Save'),
                  ),
                ],
              );
            },
            child: const Text('Open Form Dialog'),
          ),
          code: '''
SDialog.show<void>(
  context: context,
  title: 'Edit Profile',
  content: Column(
    children: [
      const SInput(placeholder: 'Full name'),
      const SInput(placeholder: 'Email'),
    ],
  ),
  actions: [
    SButton(variant: SButtonVariant.outline, onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
    SButton(onPressed: () => Navigator.pop(context), child: const Text('Save')),
  ],
);''',
        ),
        ComponentSection(
          title: 'Info Dialog with Icon',
          description: 'Add an `iconWidget` for visual context at the top.',
          demo: SButton(
            variant: SButtonVariant.outline,
            onPressed: () {
              SDialog.show<void>(
                context: context,
                iconWidget: const Icon(Icons.info_outline, size: 36, color: Colors.blue),
                title: 'Information',
                description: 'Your session will expire in 5 minutes. Please save your work.',
                actions: [
                  SButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Got it'),
                  ),
                ],
                actionsAlignment: MainAxisAlignment.center,
              );
            },
            child: const Text('Open Info Dialog'),
          ),
          code: '''
SDialog.show<void>(
  context: context,
  iconWidget: const Icon(Icons.info_outline, size: 36, color: Colors.blue),
  title: 'Information',
  description: 'Your session will expire in 5 minutes.',
  actions: [
    SButton(onPressed: () => Navigator.pop(context), child: const Text('Got it')),
  ],
  actionsAlignment: MainAxisAlignment.center,
);''',
        ),
      ],
    );
  }
}

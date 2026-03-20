import 'package:flutter/material.dart';
// ignore: deprecated_member_use
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

// ignore: deprecated_member_use
class ToastPage
    extends StatelessWidget {
  const ToastPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SToast',
      description:
          'A brief notification overlay that slides in from the top of the screen. '
          '⚠️ Note: SToast is deprecated. Prefer using SSonner for all new toast notifications.\n\n'
          'SToast is still usable for backward compatibility — it supports default and destructive variants.',
      whenToUse: const [
        'For quick top-bar notifications shown with minimal user disruption.',
        'Use SSonner instead for new code — it supports more variants and stacking.',
      ],
      sections: [
        ComponentSection(
          title: 'Default Toast',
          description: 'Shows a standard notification at the top of the screen.',
          demo: SButton(
            onPressed: () {
              // ignore: deprecated_member_use
              SToast.show(description: 'This is a toast message!');
            },
            child: const Text('Show Toast'),
          ),
          code: '''
// Initialize once in your root widget
// ignore: deprecated_member_use
SToast.initialize(Overlay.of(context));

// Show a toast
// ignore: deprecated_member_use
SToast.show(description: 'This is a toast message!');''',
        ),
        ComponentSection(
          title: 'With Title',
          description: 'Add a bold title above the description for more context.',
          demo: SButton(
            variant: SButtonVariant.outline,
            onPressed: () {
              // ignore: deprecated_member_use
              SToast.show(
                title: 'Success!',
                description: 'Your changes have been saved.',
              );
            },
            child: const Text('Show with title'),
          ),
          code: '''
// ignore: deprecated_member_use
SToast.show(
  title: 'Success!',
  description: 'Your changes have been saved.',
);''',
        ),
        ComponentSection(
          title: 'Destructive Variant',
          description: 'Show an error-style notification using `SToastVariant.destructive`.',
          demo: SButton(
            variant: SButtonVariant.destructive,
            onPressed: () {
              // ignore: deprecated_member_use
              SToast.show(
                title: 'Error',
                description: 'Something went wrong. Please try again.',
                variant: SToastVariant.destructive,
              );
            },
            child: const Text('Show error toast'),
          ),
          code: '''
// ignore: deprecated_member_use
SToast.show(
  title: 'Error',
  description: 'Something went wrong.',
  // ignore: deprecated_member_use
  variant: SToastVariant.destructive,
);''',
        ),
        const ComponentSection(
          title: 'Use SSonner Instead',
          description: 'SSonner is the recommended replacement for SToast.',
          demo: _SonnerRecommendation(),
        ),
      ],
    );
  }
}

class _SonnerRecommendation
    extends StatelessWidget {
  const _SonnerRecommendation();

  @override
  Widget build(
      BuildContext
          context) {
    return Container(
      padding:
          const EdgeInsets.all(12),
      decoration:
          BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
      ),
      child:
          Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'SSonner supports success, error, warning, info variants and action buttons — making it the preferred toast system in SDesign.',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

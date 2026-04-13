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
    final l10n = SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SToast',
      description: l10n.toastDesc,
      whenToUse: [
        l10n.toastTip1,
        l10n.toastTip2,
      ],
      sections: [
        ComponentSection(
          title: l10n.toastSectionDefault,
          description: 'Shows a standard notification at the top of the screen.',
          demo: SButton(
            onPressed: () {
              // ignore: deprecated_member_use
              SToast.show(description: l10n.toastLabelMessage);
            },
            child: Text(l10n.toastBtnShow),
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
          title: l10n.toastSectionTitle,
          description: 'Add a bold title above the description for more context.',
          demo: SButton(
            variant: SButtonVariant.outline,
            onPressed: () {
              // ignore: deprecated_member_use
              SToast.show(
                title: l10n.toastLabelSuccess,
                description: l10n.toastLabelSaved,
              );
            },
            child: Text(l10n.toastBtnShowWithTitle),
          ),
          code: '''
// ignore: deprecated_member_use
SToast.show(
  title: 'Success!',
  description: 'Your changes have been saved.',
);''',
        ),
        ComponentSection(
          title: l10n.toastSectionDestructive,
          description: 'Show an error-style notification using `SToastVariant.destructive`.',
          demo: SButton(
            variant: SButtonVariant.destructive,
            onPressed: () {
              // ignore: deprecated_member_use
              SToast.show(
                title: l10n.toastLabelError,
                description: l10n.toastLabelWrong,
                variant: SToastVariant.destructive,
              );
            },
            child: Text(l10n.toastBtnShowError),
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
        ComponentSection(
          title: l10n.toastSectionRecommendation,
          description: 'SSonner is the recommended replacement for SToast.',
          demo: const _SonnerRecommendation(),
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
    final l10n = SLocalizations.ofContext(context);
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
          Expanded(
            child: Text(
              l10n.toastRecommendationText,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

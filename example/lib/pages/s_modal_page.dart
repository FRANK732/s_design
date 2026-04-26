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
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SDialog',
      description:
          l10n.dialogDesc,
      whenToUse: [
        l10n.dialogTip1,
        l10n.dialogTip2,
        l10n.dialogTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.dialogSectionConfirm,
          description: 'A basic confirmation dialog with Cancel and Confirm actions.',
          demo: SButton(
            onPressed: () {
              SDialog.show<void>(
                context: context,
                title: l10n.dialogTitleDelete,
                description: l10n.dialogDescDelete,
                actions: [
                  SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.demoCancel),
                  ),
                  SButton(
                    variant: SButtonVariant.destructive,
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(l10n.demoDelete),
                  ),
                ],
              );
            },
            child: Text(l10n.dialogBtnOpenConfirm),
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
          title: l10n.dialogSectionContent,
          description: 'Use the `content` parameter to show arbitrary widgets inside the dialog.',
          demo: SButton(
            variant: SButtonVariant.outline,
            onPressed: () {
              SDialog.show<void>(
                context: context,
                title: l10n.dialogTitleEditProfile,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SInput(placeholder: l10n.dialogLabelFullName),
                    const SizedBox(height: 12),
                    SInput(placeholder: l10n.dialogLabelEmail, keyboardType: TextInputType.emailAddress),
                  ],
                ),
                actions: [
                  SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.demoCancel),
                  ),
                  SButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.demoSave),
                  ),
                ],
              );
            },
            child: Text(l10n.dialogBtnOpenForm),
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
          title: l10n.dialogSectionInfo,
          description: 'Add an `iconWidget` for visual context at the top.',
          demo: SButton(
            variant: SButtonVariant.outline,
            onPressed: () {
              SDialog.show<void>(
                context: context,
                iconWidget: const Icon(Icons.info_outline, size: 36, color: Colors.blue),
                title: l10n.dialogTitleInfo,
                description: l10n.dialogDescSession,
                actions: [
                  SButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.dialogBtnGotIt),
                  ),
                ],
                actionsAlignment: MainAxisAlignment.center,
              );
            },
            child: Text(l10n.dialogBtnOpenInfo),
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

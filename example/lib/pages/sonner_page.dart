import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SonnerPage
    extends StatelessWidget {
  const SonnerPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SSonner',
      description:
          l10n.sonnerDesc,
      whenToUse: [
        l10n.sonnerTip1,
        l10n.sonnerTip2,
        l10n.sonnerTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.sonnerSectionVariants,
          description: 'Show success, error, warning, or info sonners.',
          demo: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _SonnerBtn(label: l10n.sonnerLabelSuccess, variant: SSonnerVariant.success),
              _SonnerBtn(label: l10n.sonnerLabelError, variant: SSonnerVariant.error),
              _SonnerBtn(label: l10n.sonnerLabelWarning, variant: SSonnerVariant.warning),
              _SonnerBtn(label: l10n.sonnerLabelInfo, variant: SSonnerVariant.info),
            ],
          ),
          code: '''
// Initialize once (e.g. in your root build method)
SSonner.instance.initialize(Overlay.of(context));

// Show a toast
SSonner.instance.show(
  message: 'Changes saved!',
  variant: SSonnerVariant.success,
);''',
        ),
        ComponentSection(
          title: l10n.sonnerSectionConfig,
          description: 'Pass an `SSonnerConfig` for more detailed control including a title.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.show(
                        config: SSonnerConfig(
                          message: l10n.sonnerLabelMsgUploaded,
                          title: l10n.sonnerLabelTitleUpload,
                          variant: SSonnerVariant.success,
                        ),
                      );
                    },
                    child: Text(l10n.sonnerBtnShowWithTitle),
                  )),
          code: '''
SSonner.instance.show(
  config: const SSonnerConfig(
    message: 'File uploaded successfully.',
    title: 'Upload complete',
    variant: SSonnerVariant.success,
  ),
);''',
        ),
        ComponentSection(
          title: l10n.sonnerSectionAction,
          description: 'Add an action widget (e.g. an Undo button) to the notification.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.show(
                        message: l10n.sonnerLabelMsgArchived,
                        action: TextButton(
                          onPressed: () {},
                          child: Text(l10n.demoUndo, style: const TextStyle(fontSize: 12)),
                        ),
                      );
                    },
                    child: Text(l10n.sonnerBtnShowWithAction),
                  )),
          code: '''
SSonner.instance.show(
  message: 'Email archived',
  variant: SSonnerVariant.info,
  action: TextButton(
    onPressed: () { /* restore */ },
    child: const Text('Undo'),
  ),
);''',
        ),
        ComponentSection(
          title: l10n.sonnerSectionPosition,
          description: 'Change the position with `SSonnerPosition.top`.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.show(
                        message: l10n.sonnerLabelMsgTop,
                        position: SSonnerPosition.top,
                      );
                    },
                    child: Text(l10n.sonnerBtnShowAtTop),
                  )),
          code: '''
SSonner.instance.show(
  message: 'This appears at the top',
  variant: SSonnerVariant.info,
  position: SSonnerPosition.top,
);''',
        ),
        ComponentSection(
          title: l10n.sonnerSectionReplace,
          description: 'Use the `replace: true` flag to instantly dismiss all active toasts and display the new one. Useful for throttling or preventing clutter during rapid events.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.show(
                        message: '${l10n.sonnerLabelMsgReplaced} ${DateTime.now().second}s',
                        variant: SSonnerVariant.warning,
                        replace: true,
                      );
                    },
                    child: Text(l10n.sonnerBtnShowReplace),
                  )),
          code: '''
SSonner.show(
  message: 'Replaced existing toasts!',
  variant: SSonnerVariant.warning,
  replace: true, // Instantly clears queue
);''',
        ),
        ComponentSection(
          title: l10n.sonnerSectionShadow,
          description: 'Use the `elevation: 0` property within `SSonnerConfig` to completely remove the drop-shadow for a flatter look.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.show(
                        config: SSonnerConfig(
                          message: l10n.sonnerLabelMsgNoShadow,
                          variant: SSonnerVariant.info,
                          elevation: 0,
                        ),
                      );
                    },
                    child: Text(l10n.sonnerBtnShowFlat),
                  )),
          code: '''
SSonner.show(
  config: const SSonnerConfig(
    message: 'I have no shadow!',
    elevation: 0, // <--- Removes shadow
  ),
);''',
        ),
      ],
    );
  }
}

class _SonnerBtn
    extends StatelessWidget {
  const _SonnerBtn(
      {required this.label,
      required this.variant});
  final String
      label;
  final SSonnerVariant
      variant;

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return SButton(
      variant: variant == SSonnerVariant.error
          ? SButtonVariant.destructive
          : variant == SSonnerVariant.success
              ? SButtonVariant.secondary
              : SButtonVariant.outline,
      onPressed:
          () {
        SSonner.show(message: l10n.sonnerLabelNotify(label), variant: variant);
      },
      child:
          Text(label),
    );
  }
}

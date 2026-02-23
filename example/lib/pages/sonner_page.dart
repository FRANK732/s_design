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
    return ComponentPage(
      name:
          'SSonner',
      description:
          'A toast notification system inspired by the Sonner library. '
          'Shows stacked, auto-dismissing notifications. '
          'Supports success, error, warning, and info variants.',
      whenToUse: const [
        'To provide feedback on async operations (saved, deleted, error).',
        "For non-intrusive notifications that don't block user flow.",
        'When multiple sequential notifications may arrive.',
      ],
      sections: [
        const ComponentSection(
          title: 'Variants',
          description: 'Show success, error, warning, or info sonners.',
          demo: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _SonnerBtn(label: 'Success', variant: SSonnerVariant.success),
              _SonnerBtn(label: 'Error', variant: SSonnerVariant.error),
              _SonnerBtn(label: 'Warning', variant: SSonnerVariant.warning),
              _SonnerBtn(label: 'Info', variant: SSonnerVariant.info),
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
          title: 'Via SSonnerConfig',
          description: 'Pass an `SSonnerConfig` for more detailed control including a title.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.instance.show(
                        config: const SSonnerConfig(
                          message: 'File uploaded successfully.',
                          title: 'Upload complete',
                          variant: SSonnerVariant.success,
                        ),
                      );
                    },
                    child: const Text('Show with title'),
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
          title: 'With Action Button',
          description: 'Add an action widget (e.g. an Undo button) to the notification.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.instance.show(
                        message: 'Email archived',
                        action: TextButton(
                          onPressed: () {},
                          child: const Text('Undo', style: TextStyle(fontSize: 12)),
                        ),
                      );
                    },
                    child: const Text('Show with action'),
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
          title: 'Position: Top',
          description: 'Change the position with `SSonnerPosition.top`.',
          demo: Builder(
              builder: (context) => SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {
                      SSonner.instance.show(
                        message: 'This appears at the top',
                        position: SSonnerPosition.top,
                      );
                    },
                    child: const Text('Show at top'),
                  )),
          code: '''
SSonner.instance.show(
  message: 'This appears at the top',
  variant: SSonnerVariant.info,
  position: SSonnerPosition.top,
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
    return SButton(
      variant:
          SButtonVariant.outline,
      onPressed:
          () {
        SSonner.instance.show(message: '$label notification', variant: variant);
      },
      child:
          Text(label),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SButtonPage
    extends StatefulWidget {
  const SButtonPage(
      {super.key});

  @override
  State<SButtonPage>
      createState() =>
          _SButtonPageState();
}

class _SButtonPageState
    extends State<
        SButtonPage> {
  bool
      _loading =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SButton',
      description:
          'A versatile button component supporting multiple variants, sizes, states, and icons. '
          'SButton follows Ant Design principles — every interaction has a clear visual response.',
      whenToUse: const [
        'Use the default variant for primary actions (e.g. Submit, Save).',
        'Use outline buttons for secondary actions or alternatives.',
        'Use destructive buttons for delete/irreversible actions.',
        'Use ghost or link buttons for low-emphasis inline actions.',
      ],
      sections: [
        ComponentSection(
          title: 'Variants',
          description: 'Button variants control the visual weight and color scheme.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              SButton(onPressed: () {}, child: const Text('Default')),
              SButton(variant: SButtonVariant.outline, onPressed: () {}, child: const Text('Outline')),
              SButton(variant: SButtonVariant.secondary, onPressed: () {}, child: const Text('Secondary')),
              SButton(variant: SButtonVariant.ghost, onPressed: () {}, child: const Text('Ghost')),
              SButton(variant: SButtonVariant.destructive, onPressed: () {}, child: const Text('Destructive')),
              SButton(variant: SButtonVariant.link, onPressed: () {}, child: const Text('Link')),
            ],
          ),
          code: '''
SButton(onPressed: () {}, child: const Text('Default'));
SButton(variant: SButtonVariant.outline, onPressed: () {}, child: const Text('Outline'));
SButton(variant: SButtonVariant.secondary, onPressed: () {}, child: const Text('Secondary'));
SButton(variant: SButtonVariant.ghost, onPressed: () {}, child: const Text('Ghost'));
SButton(variant: SButtonVariant.destructive, onPressed: () {}, child: const Text('Destructive'));
SButton(variant: SButtonVariant.link, onPressed: () {}, child: const Text('Link'));''',
        ),
        ComponentSection(
          title: 'Sizes',
          description: 'Choose between large, medium (default), small, and icon sizes.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SButton(size: SButtonSize.lg, onPressed: () {}, child: const Text('Large')),
              SButton(onPressed: () {}, child: const Text('Default')),
              SButton(size: SButtonSize.sm, onPressed: () {}, child: const Text('Small')),
              SButton(size: SButtonSize.icon, onPressed: () {}, icon: const Icon(Icons.share, size: 16)),
            ],
          ),
          code: '''
SButton(size: SButtonSize.lg, onPressed: () {}, child: const Text('Large'));
SButton(onPressed: () {}, child: const Text('Default'));
SButton(size: SButtonSize.sm, onPressed: () {}, child: const Text('Small'));
SButton(size: SButtonSize.icon, onPressed: () {}, icon: const Icon(Icons.share));''',
        ),
        ComponentSection(
          title: 'With Icons',
          description: 'Add a leading or trailing icon for extra context.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              SButton(
                onPressed: () {},
                leadingIcon: const Icon(Icons.download, size: 16),
                child: const Text('Download'),
              ),
              SButton(
                variant: SButtonVariant.outline,
                onPressed: () {},
                trailingIcon: const Icon(Icons.arrow_forward, size: 16),
                child: const Text('Next'),
              ),
              SButton.icon(icon: const Icon(Icons.share), onPressed: () {}),
            ],
          ),
          code: '''
SButton(
  onPressed: () {},
  leadingIcon: const Icon(Icons.download, size: 16),
  child: const Text('Download'),
);
SButton.icon(icon: const Icon(Icons.share), onPressed: () {});''',
        ),
        ComponentSection(
          title: 'Loading State',
          description: 'Pass `loading: true` to show a spinner and disable the button.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SButton(
                loading: _loading,
                onPressed: () {
                  setState(() => _loading = true);
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) setState(() => _loading = false);
                  });
                },
                child: Text(_loading ? 'Processing...' : 'Click to load'),
              ),
            ],
          ),
          code: '''
SButton(
  loading: isLoading,
  onPressed: () { /* trigger async op */ },
  child: const Text('Submit'),
);''',
        ),
        ComponentSection(
          title: 'Disabled',
          description: 'Set `onPressed: null` to disable a button.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              SButton(onPressed: null, child: const Text('Disabled')),
              SButton(variant: SButtonVariant.outline, onPressed: null, child: const Text('Disabled Outline')),
            ],
          ),
          code: '''
SButton(onPressed: null, child: const Text('Disabled'));''',
        ),
        ComponentSection(
          title: 'Full Width',
          description: 'Use `isFullWidth: true` to stretch the button.',
          demo: SButton(
            isFullWidth: true,
            onPressed: () {},
            child: const Text('Full Width Button'),
          ),
          code: '''
SButton(isFullWidth: true, onPressed: () {}, child: const Text('Full Width Button'));''',
        ),
      ],
    );
  }
}

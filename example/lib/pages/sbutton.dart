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
    final l10n = SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SButton',
      description: l10n.buttonDesc,
      whenToUse: [
        l10n.buttonTip1,
        l10n.buttonTip2,
        l10n.buttonTip3,
        l10n.buttonTip4,
      ],
      sections: [
        ComponentSection(
          title: l10n.demoVariants,
          description: 'Button variants control the visual weight and color scheme.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              SButton(onPressed: () {}, child: Text(l10n.buttonLabelDefault)),
              SButton(variant: SButtonVariant.outline, onPressed: () {}, child: Text(l10n.buttonLabelOutline)),
              SButton(variant: SButtonVariant.secondary, onPressed: () {}, child: Text(l10n.buttonLabelSecondary)),
              SButton(variant: SButtonVariant.ghost, onPressed: () {}, child: Text(l10n.buttonLabelGhost)),
              SButton(variant: SButtonVariant.destructive, onPressed: () {}, child: Text(l10n.buttonLabelDestructive)),
              SButton(variant: SButtonVariant.link, onPressed: () {}, child: Text(l10n.buttonLabelLink)),
            ],
          ),
          code: '''
SButton(onPressed: () {}, child: Text(l10n.buttonLabelDefault));
SButton(variant: SButtonVariant.outline, onPressed: () {}, child: Text(l10n.buttonLabelOutline));
SButton(variant: SButtonVariant.secondary, onPressed: () {}, child: Text(l10n.buttonLabelSecondary));
SButton(variant: SButtonVariant.ghost, onPressed: () {}, child: Text(l10n.buttonLabelGhost));
SButton(variant: SButtonVariant.destructive, onPressed: () {}, child: Text(l10n.buttonLabelDestructive));
SButton(variant: SButtonVariant.link, onPressed: () {}, child: Text(l10n.buttonLabelLink));''',
        ),
        ComponentSection(
          title: l10n.demoSizes,
          description: 'Choose between large, medium (default), small, and icon sizes.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SButton(size: SButtonSize.lg, onPressed: () {}, child: Text(l10n.buttonLabelLarge)),
              SButton(onPressed: () {}, child: Text(l10n.buttonLabelDefault)),
              SButton(size: SButtonSize.sm, onPressed: () {}, child: Text(l10n.buttonLabelSmall)),
              SButton(size: SButtonSize.icon, onPressed: () {}, icon: const Icon(Icons.share, size: 16)),
            ],
          ),
          code: '''
SButton(size: SButtonSize.lg, onPressed: () {}, child: Text(l10n.buttonLabelLarge));
SButton(onPressed: () {}, child: Text(l10n.buttonLabelDefault));
SButton(size: SButtonSize.sm, onPressed: () {}, child: Text(l10n.buttonLabelSmall));
SButton(size: SButtonSize.icon, onPressed: () {}, icon: const Icon(Icons.share));''',
        ),
        ComponentSection(
          title: l10n.demoWithIcons,
          description: 'Add a leading or trailing icon for extra context.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              SButton(
                onPressed: () {},
                leadingIcon: const Icon(Icons.download, size: 16),
                child: Text(l10n.buttonLabelDownload),
              ),
              SButton(
                variant: SButtonVariant.outline,
                onPressed: () {},
                trailingIcon: const Icon(Icons.arrow_forward, size: 16),
                child: Text(l10n.buttonLabelNext),
              ),
              SButton.icon(icon: const Icon(Icons.share), onPressed: () {}),
            ],
          ),
          code: '''
SButton(
  onPressed: () {},
  leadingIcon: const Icon(Icons.download, size: 16),
  child: Text(l10n.buttonLabelDownload),
);
SButton.icon(icon: const Icon(Icons.share), onPressed: () {});''',
        ),
        ComponentSection(
          title: l10n.demoLoadingState,
          description: 'Pass `loading: true` to show a spinner and disable the button.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SButton(
                loading: _loading,
                onPressed: () {
                  setState(() => _loading = true);
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      setState(() => _loading = false);
                    }
                  });
                },
                child: Text(_loading ? l10n.buttonLabelProcessing : l10n.buttonLabelClickToLoad),
              ),
            ],
          ),
          code: '''
SButton(
  loading: isLoading,
  onPressed: () { /* trigger async op */ },
  child: Text(l10n.buttonLabelDefault),
);''',
        ),
        ComponentSection(
          title: l10n.demoDisabled,
          description: 'Set `onPressed: null` to disable a button.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              SButton(onPressed: null, child: Text(l10n.buttonLabelDisabled)),
              SButton(variant: SButtonVariant.outline, onPressed: null, child: Text(l10n.buttonLabelDisabledOutline)),
            ],
          ),
          code: '''
SButton(onPressed: null, child: Text(l10n.buttonLabelDisabled));''',
        ),
        ComponentSection(
          title: l10n.demoFullWidth,
          description: 'Use `isFullWidth: true` to stretch the button.',
          demo: SButton(
            isFullWidth: true,
            onPressed: () {},
            child: Text(l10n.buttonLabelFullWidth),
          ),
          code: '''
SButton(isFullWidth: true, onPressed: () {}, child: Text(l10n.buttonLabelFullWidth));''',
        ),
      ],
    );
  }
}

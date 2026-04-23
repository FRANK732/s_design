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
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SButton',
      description:
          l10n.buttonDesc,
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
                width: double.infinity,
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
        ComponentSection(
          title: 'Selectable Button',
          description: 'Use `SButton.selectable` for toggle buttons. Supports controlled and uncontrolled modes, check icons, custom selected colors, and smooth press animations.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SButton.selectable(
                child: const Text('Notifications'),
                leadingIcon: const Icon(Icons.notifications_outlined, size: 16),
                onSelectionChanged: (_) {},
              ),
              SButton.selectable(
                config: const SButtonSelectableConfig(showCheckIcon: true),
                child: const Text('Starred'),
                leadingIcon: const Icon(Icons.star_outline, size: 16),
                onSelectionChanged: (_) {},
              ),
              // Primary filled selected look
              SButton.selectable(
                variant: SButtonVariant.defaultVariant,
                isSelected: true,
                config: const SButtonSelectableConfig(showCheckIcon: true),
                child: const Text('Active'),
                onSelectionChanged: (_) {},
              ),
              // Disabled selectable
              SButton.selectable(
                state: SButtonState.disabled,
                child: const Text('Disabled'),
                onSelectionChanged: (_) {},
              ),
            ],
          ),
          code: r'''
// Uncontrolled toggle
SButton.selectable(
  child: const Text('Notifications'),
  leadingIcon: const Icon(Icons.notifications_outlined, size: 16),
  onSelectionChanged: (selected) => debugPrint('selected: $selected'),
)

// With check icon
SButton.selectable(
  config: const SButtonSelectableConfig(showCheckIcon: true),
  child: const Text('Starred'),
  onSelectionChanged: (_) {},
)

// Controlled
SButton.selectable(
  isSelected: _bold,
  onSelectionChanged: (v) => setState(() => _bold = v),
  child: const Text('Bold'),
)''',
        ),
        ComponentSection(
          title: 'Select Group',
          description: 'Use `SButtonSelectGroup` for coordinated radio (single) or chip-filter (multi) groups. Items share a config but support per-item overrides.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Single-select (radio)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              const SizedBox(height: 10),
              SButtonSelectGroup.single(
                initialSelection: const {1},
                requiresSelection: true,
                onChanged: (_) {},
                children: const [
                  SButtonSelectGroupItem(label: Text('Day')),
                  SButtonSelectGroupItem(label: Text('Week')),
                  SButtonSelectGroupItem(label: Text('Month')),
                  SButtonSelectGroupItem(label: Text('Year')),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Multi-select', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              const SizedBox(height: 10),
              SButtonSelectGroup.multi(
                initialSelection: const {0, 2},
                config: const SButtonSelectableConfig(showCheckIcon: true),
                onChanged: (_) {},
                children: const [
                  SButtonSelectGroupItem(
                    leadingIcon: Icon(Icons.flutter_dash, size: 14),
                    label: Text('Flutter'),
                  ),
                  SButtonSelectGroupItem(label: Text('Dart')),
                  SButtonSelectGroupItem(label: Text('Firebase')),
                  SButtonSelectGroupItem(
                    label: Text('Disabled'),
                    disabled: true,
                  ),
                ],
              ),
            ],
          ),
          code: '''
// Radio (single-select)
SButtonSelectGroup.single(
  initialSelection: const {1},
  requiresSelection: true,
  onChanged: (indices) => setState(() => _period = indices.first),
  children: [
    SButtonSelectGroupItem(label: const Text('Day')),
    SButtonSelectGroupItem(label: const Text('Week')),
    SButtonSelectGroupItem(label: const Text('Month')),
  ],
)

// Multi-select chip group
SButtonSelectGroup.multi(
  initialSelection: const {0},
  config: const SButtonSelectableConfig(showCheckIcon: true),
  onChanged: (indices) => setState(() => _tags = indices),
  children: [
    SButtonSelectGroupItem(label: const Text('Flutter')),
    SButtonSelectGroupItem(label: const Text('Dart')),
    SButtonSelectGroupItem(label: const Text('Firebase')),
  ],
)''',
        ),
      ],
    );
  }
}

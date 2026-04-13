import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class STooltipPage extends StatelessWidget {
  const STooltipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = SLocalizations.ofContext(context);
    final theme = Theme.of(context);

    return ComponentPage(
      name: 'STooltip',
      description: l10n.tooltipDesc,
      whenToUse: const [
        'A simple text popup to show additional information on hover or click.',
        'When you want to show a tooltip on a button, icon, or link.',
        'When you need flexible placement (12 directions) and auto-flipping support.',
      ],
      sections: [
        ComponentSection(
          title: l10n.tooltipSectionPlacement,
          description: 'The tooltip supports 12 placement orientations and intelligent auto-flipping.',
          demo: const _PlacementDemo(),
          code: '''
STooltip(
  placement: STooltipPlacement.top,
  content: Text('Prompt Text'),
  child: SButton(child: Text('Top')),
)''',
        ),
        ComponentSection(
          title: l10n.tooltipSectionTrigger,
          description: 'Triggers include hover, click, and long press interaction models.',
          demo: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              STooltip(
                content: const Text('This appears on hover'),
                trigger: STooltipTrigger.hover,
                child: SButton(
                  onPressed: () {},
                  child: Text(l10n.tooltipLabelHover),
                ),
              ),
              STooltip(
                content: const Text('This appears on click'),
                trigger: STooltipTrigger.click,
                child: SButton(
                  onPressed: () {},
                  child: Text(l10n.tooltipLabelClick),
                ),
              ),
              STooltip(
                content: const Text('This appears on long press'),
                trigger: STooltipTrigger.longPress,
                child: SButton(
                  onPressed: () {},
                  child: Text(l10n.tooltipLabelLongPress),
                ),
              ),
            ],
          ),
          code: '''
STooltip(
  trigger: STooltipTrigger.hover,
  content: Text('Hover Trigger'),
  child: SButton(child: Text('Hover')),
)

STooltip(
  trigger: STooltipTrigger.click,
  content: Text('Click Trigger'),
  child: SButton(child: Text('Click')),
)''',
        ),
        ComponentSection(
          title: l10n.tooltipSectionColors,
          description: 'Customize background and text colors or use status-based color tokens.',
          demo: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              STooltip(
                content: const Text('Primary Tooltip'),
                color: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
                child: SButton(onPressed: () {}, child: const Text('Primary')),
              ),
              STooltip(
                content: const Text('Success Tooltip'),
                color: Colors.green, // Fixed explicit color for demo
                textColor: Colors.white,
                child: SButton(onPressed: () {}, child: const Text('Success')),
              ),
              STooltip(
                content: const Text('Error Tooltip'),
                color: theme.colorScheme.error,
                textColor: theme.colorScheme.onError,
                child: SButton(onPressed: () {}, child: const Text('Error')),
              ),
            ],
          ),
          code: '''
STooltip(
  color: Colors.blue,
  textColor: Colors.white,
  content: Text('Custom Color'),
  child: SButton(child: Text('Blue Tooltip')),
)''',
        ),
      ],
    );
  }
}

class _PlacementDemo extends StatelessWidget {
  const _PlacementDemo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _box(STooltipPlacement.topLeft, 'TL'),
              const SizedBox(width: 8),
              _box(STooltipPlacement.top, 'Top'),
              const SizedBox(width: 8),
              _box(STooltipPlacement.topRight, 'TR'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  _box(STooltipPlacement.leftTop, 'LT'),
                  const SizedBox(height: 8),
                  _box(STooltipPlacement.left, 'Left'),
                  const SizedBox(height: 8),
                  _box(STooltipPlacement.leftBottom, 'LB'),
                ],
              ),
              const SizedBox(width: 140),
              Column(
                children: [
                  _box(STooltipPlacement.rightTop, 'RT'),
                  const SizedBox(height: 8),
                  _box(STooltipPlacement.right, 'Right'),
                  const SizedBox(height: 8),
                  _box(STooltipPlacement.rightBottom, 'RB'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _box(STooltipPlacement.bottomLeft, 'BL'),
              const SizedBox(width: 8),
              _box(STooltipPlacement.bottom, 'Bottom'),
              const SizedBox(width: 8),
              _box(STooltipPlacement.bottomRight, 'BR'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _box(STooltipPlacement p, String label) {
    return STooltip(
      placement: p,
      content: const Text('Prompt Text'),
      child: Container(
        width: 70,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(label, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}

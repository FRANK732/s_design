import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class ProgressIndicatorPage
    extends StatefulWidget {
  const ProgressIndicatorPage(
      {super.key});

  @override
  State<ProgressIndicatorPage>
      createState() =>
          _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState
    extends State<
        ProgressIndicatorPage> {
  double
      _value =
      0.6;

  @override
  Widget build(
      BuildContext
          context) {
    final primary = Theme.of(context)
        .colorScheme
        .primary;
    return ComponentPage(
      name:
          'SProgressBar',
      description:
          'A linear progress bar for communicating completion. '
          'Supports determinate (0.0–1.0 value), indeterminate, custom colors, '
          'buffer bars, and vertical orientation.',
      whenToUse: const [
        'When uploading, downloading, or processing data with a known duration.',
        'To visualize percentage-based progress in forms, surveys, or onboarding.',
        'For indeterminate loading states where duration is unknown.',
      ],
      sections: [
        ComponentSection(
          title: 'Determinate Bar',
          description: 'Set `value` between 0.0 and 1.0.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SProgressBar(value: _value),
              const SizedBox(height: 12),
              Row(
                children: [
                  SButton(
                    size: SButtonSize.sm,
                    variant: SButtonVariant.outline,
                    onPressed: _value > 0 ? () => setState(() => _value = (_value - 0.1).clamp(0, 1)) : null,
                    child: const Text('- 10%'),
                  ),
                  const SizedBox(width: 8),
                  SButton(
                    size: SButtonSize.sm,
                    variant: SButtonVariant.outline,
                    onPressed: _value < 1 ? () => setState(() => _value = (_value + 0.1).clamp(0, 1)) : null,
                    child: const Text('+ 10%'),
                  ),
                  const SizedBox(width: 12),
                  Text('${(_value * 100).toInt()}%'),
                ],
              ),
            ],
          ),
          code: '''
SProgressBar(value: 0.6); // 60%''',
        ),
        ComponentSection(
          title: 'Indeterminate',
          description: 'Use `indeterminate: true` when completion time is unknown.',
          demo: const SProgressBar(indeterminate: true),
          code: '''
const SProgressBar(indeterminate: true);''',
        ),
        ComponentSection(
          title: 'Custom Color',
          description: 'Override the default progress color.',
          demo: Column(
            children: [
              SProgressBar(value: 0.8, progressColor: Colors.green),
              const SizedBox(height: 8),
              SProgressBar(value: 0.5, progressColor: Colors.orange),
              const SizedBox(height: 8),
              SProgressBar(value: 0.3, progressColor: Colors.red),
            ],
          ),
          code: '''
SProgressBar(value: 0.8, progressColor: Colors.green);
SProgressBar(value: 0.5, progressColor: Colors.orange);
SProgressBar(value: 0.3, progressColor: Colors.red);''',
        ),
        ComponentSection(
          title: 'With Buffer',
          description: 'Show a secondary "buffer" bar (e.g. for video pre-loading).',
          demo: SProgressBar(
            value: 0.4,
            bufferValue: 0.7,
            progressColor: primary,
            bufferColor: primary.withOpacity(0.3),
          ),
          code: '''
SProgressBar(
  value: 0.4,
  bufferValue: 0.7,
  progressColor: theme.colorScheme.primary,
  bufferColor: theme.colorScheme.primary.withOpacity(0.3),
);''',
        ),
        ComponentSection(
          title: 'Custom Height',
          description: 'Control the bar thickness with the `height` parameter.',
          demo: Column(
            children: const [
              SProgressBar(value: 0.5, height: 4),
              SizedBox(height: 8),
              SProgressBar(value: 0.5, height: 8),
              SizedBox(height: 8),
              SProgressBar(value: 0.5, height: 16),
            ],
          ),
          code: '''
SProgressBar(value: 0.5, height: 4);
SProgressBar(value: 0.5, height: 8);
SProgressBar(value: 0.5, height: 16);''',
        ),
      ],
    );
  }
}

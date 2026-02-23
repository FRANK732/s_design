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
          'SProgress.line',
      description:
          'A linear progress bar for communicating completion. '
          'Supports determinate (0.0–100.0 percent), custom colors, '
          'buffer bars, and indeterminate orientation.',
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
              SProgress.line(percent: _value * 100, showInfo: false),
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
SProgress.line(percent: 60.0, showInfo: false); // 60%''',
        ),
        ComponentSection(
          title: 'Indeterminate',
          description: 'Use `indeterminate: true` when completion time is unknown.',
          demo: const SProgress.line(indeterminate: true, showInfo: false),
          code: '''
const SProgress.line(indeterminate: true, showInfo: false);''',
        ),
        ComponentSection(
          title: 'Custom Color',
          description: 'Override the default progress color.',
          demo: Column(
            children: [
              SProgress.line(percent: 80.0, strokeColor: Colors.green, showInfo: false),
              const SizedBox(height: 8),
              SProgress.line(percent: 50.0, strokeColor: Colors.orange, showInfo: false),
              const SizedBox(height: 8),
              SProgress.line(percent: 30.0, strokeColor: Colors.red, showInfo: false),
            ],
          ),
          code: '''
SProgress.line(percent: 80.0, strokeColor: Colors.green, showInfo: false);
SProgress.line(percent: 50.0, strokeColor: Colors.orange, showInfo: false);
SProgress.line(percent: 30.0, strokeColor: Colors.red, showInfo: false);''',
        ),
        ComponentSection(
          title: 'With Buffer',
          description: 'Show a secondary "buffer" bar (e.g. for video pre-loading).',
          demo: SProgress.line(
            percent: 40.0,
            bufferValue: 70.0,
            strokeColor: primary,
            bufferColor: primary.withOpacity(0.3),
            showInfo: false,
          ),
          code: '''
SProgress.line(
  percent: 40.0,
  bufferValue: 70.0,
  strokeColor: theme.colorScheme.primary,
  bufferColor: theme.colorScheme.primary.withOpacity(0.3),
  showInfo: false,
);''',
        ),
        ComponentSection(
          title: 'Custom Height',
          description: 'Control the bar thickness with the `strokeWidth` parameter.',
          demo: const Column(
            children: [
              SProgress.line(percent: 50.0, strokeWidth: 4, showInfo: false),
              SizedBox(height: 8),
              SProgress.line(percent: 50.0, strokeWidth: 8, showInfo: false),
              SizedBox(height: 8),
              SProgress.line(percent: 50.0, strokeWidth: 16, showInfo: false),
            ],
          ),
          code: '''
SProgress.line(percent: 50.0, strokeWidth: 4, showInfo: false);
SProgress.line(percent: 50.0, strokeWidth: 8, showInfo: false);
SProgress.line(percent: 50.0, strokeWidth: 16, showInfo: false);''',
        ),
      ],
    );
  }
}

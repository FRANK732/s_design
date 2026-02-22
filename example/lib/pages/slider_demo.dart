import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SSliderDemoPage
    extends StatefulWidget {
  const SSliderDemoPage(
      {super.key});

  @override
  State<SSliderDemoPage>
      createState() =>
          _SSliderDemoPageState();
}

class _SSliderDemoPageState
    extends State<
        SSliderDemoPage> {
  double
      _basic =
      0.5;
  RangeValues
      _range =
      const RangeValues(0.2,
          0.7);
  double
      _stepped =
      0.4;

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SSlider',
      description:
          'A thumb-based slider for selecting a value or range on a continuous or stepped scale. '
          'Supports single and range variants, marks, vertical orientation, and custom colors.',
      whenToUse: const [
        'For setting a numeric value the user can drag, like volume or brightness.',
        'When choosing a min/max range (e.g. price filter).',
        'For stepped increments (e.g. 0, 25, 50, 75, 100%).',
      ],
      sections: [
        ComponentSection(
          title: 'Basic Single Slider',
          description: 'Use `SSlider.single()` with `value` and `onChanged`.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SSlider.single(value: _basic, onChanged: (v) => setState(() => _basic = v)),
              const SizedBox(height: 8),
              Text('Value: ${(_basic * 100).toInt()}%'),
            ],
          ),
          code: '''
double _value = 0.5;

SSlider.single(
  value: _value,
  onChanged: (v) => setState(() => _value = v),
);''',
        ),
        ComponentSection(
          title: 'Range Slider',
          description: 'Use `SSlider.range()` with `rangeValues` and `onRangeChanged`.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SSlider.range(
                rangeValues: _range,
                onRangeChanged: (r) => setState(() => _range = r),
              ),
              const SizedBox(height: 8),
              Text('Range: ${(_range.start * 100).toInt()}% – ${(_range.end * 100).toInt()}%'),
            ],
          ),
          code: '''
RangeValues _range = const RangeValues(0.2, 0.7);

SSlider.range(
  rangeValues: _range,
  onRangeChanged: (r) => setState(() => _range = r),
);''',
        ),
        ComponentSection(
          title: 'Stepped (Discrete)',
          description: 'Set `divisions` for stepped snapping.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SSlider.single(
                value: _stepped,
                onChanged: (v) => setState(() => _stepped = v),
                divisions: 4,
                max: 1.0,
              ),
              const SizedBox(height: 8),
              Text('Step: ${(_stepped * 100).toInt()}% of 4 steps'),
            ],
          ),
          code: '''
SSlider.single(
  value: _value,
  onChanged: (v) => setState(() => _value = v),
  divisions: 4,
);''',
        ),
        ComponentSection(
          title: 'With Marks',
          description: 'Display custom labels below the track.',
          demo: SSlider.single(
            value: _basic,
            onChanged: (v) => setState(() => _basic = v),
            marks: {
              0.0: const Text('0'),
              0.25: const Text('25'),
              0.5: const Text('50'),
              0.75: const Text('75'),
              1.0: const Text('100'),
            },
          ),
          code: '''
SSlider.single(
  value: _value,
  onChanged: (v) => setState(() => _value = v),
  marks: const {
    0.0: Text('0'), 0.5: Text('50'), 1.0: Text('100'),
  },
);''',
        ),
      ],
    );
  }
}

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
      50.0;
  RangeValues
      _range =
      const RangeValues(20.0,
          70.0);
  double
      _stepped =
      2.0;

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
              SSlider.single(value: _basic, max: 100, onChanged: (v) => setState(() => _basic = v)),
              const SizedBox(height: 8),
              Text('Value: ${_basic.toInt()}%'),
            ],
          ),
          code: '''
double _value = 50.0;

SSlider.single(
  value: _value,
  max: 100,
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
                max: 100,
                onRangeChanged: (r) => setState(() => _range = r),
              ),
              const SizedBox(height: 8),
              Text('Range: ${_range.start.toInt()}% – ${_range.end.toInt()}%'),
            ],
          ),
          code: '''
RangeValues _range = const RangeValues(20.0, 70.0);

SSlider.range(
  rangeValues: _range,
  max: 100,
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
                max: 4,
              ),
              const SizedBox(height: 8),
              Text('Step: ${_stepped.toInt()} of 4'),
            ],
          ),
          code: '''
SSlider.single(
  value: _value,
  onChanged: (v) => setState(() => _value = v),
  divisions: 4,
  max: 4,
);''',
        ),
        ComponentSection(
          title: 'With Marks',
          description: 'Display custom labels below the track.',
          demo: SSlider.single(
            value: _basic,
            onChanged: (v) => setState(() => _basic = v),
            max: 100,
            marks: {
              0.0: const Text('0'),
              25.0: const Text('25'),
              50.0: const Text('50'),
              75.0: const Text('75'),
              100.0: const Text('100'),
            },
          ),
          code: '''
SSlider.single(
  value: _value,
  onChanged: (v) => setState(() => _value = v),
  max: 100,
  marks: const {
    0.0: Text('0'), 50.0: Text('50'), 100.0: Text('100'),
  },
);''',
        ),
      ],
    );
  }
}

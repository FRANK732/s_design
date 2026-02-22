import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class RateDemoPage
    extends StatefulWidget {
  const RateDemoPage(
      {super.key});

  @override
  State<RateDemoPage>
      createState() =>
          _RateDemoPageState();
}

class _RateDemoPageState
    extends State<
        RateDemoPage> {
  double
      _basic =
      3;
  double
      _half =
      3.5;

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SRate',
      description:
          'A star rating component that lets users provide feedback on a numeric scale. '
          'Supports full stars, half stars, custom icons, and read-only display.',
      whenToUse: const [
        'For product, service, or content rating interfaces.',
        'To collect qualitative feedback on a scale.',
        'To display an aggregate rating in a read-only mode.',
      ],
      sections: [
        ComponentSection(
          title: 'Basic Rating',
          description: 'Full star rating with 5 stars by default.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SRate(value: _basic, onChange: (v) => setState(() => _basic = v)),
              const SizedBox(height: 8),
              Text('Current: ${_basic.toInt()} stars'),
            ],
          ),
          code: '''
double _rating = 3;

SRate(
  value: _rating,
  onChange: (v) => setState(() => _rating = v),
);''',
        ),
        ComponentSection(
          title: 'Half Stars',
          description: 'Enable `allowHalf: true` for 0.5 precision.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SRate(value: _half, allowHalf: true, onChange: (v) => setState(() => _half = v)),
              const SizedBox(height: 8),
              Text('Current: $_half stars'),
            ],
          ),
          code: '''
SRate(
  value: _rating,
  allowHalf: true,
  onChange: (v) => setState(() => _rating = v),
);''',
        ),
        ComponentSection(
          title: 'Read-Only Display',
          description: 'Pass `disabled: true` to render a non-interactive rating display.',
          demo: Row(
            children: const [
              SRate(value: 4.5, allowHalf: true, disabled: true),
              SizedBox(width: 8),
              Text('4.5 / 5.0', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          code: '''
const SRate(value: 4.5, allowHalf: true, disabled: true);''',
        ),
        ComponentSection(
          title: 'Custom Star Count',
          description: 'Change the total number of stars with `count`.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SRate(value: 7, count: 10, onChange: (_) {}),
              const SizedBox(height: 4),
              const Text('10-star scale'),
            ],
          ),
          code: '''
SRate(value: 7, count: 10, onChange: (v) => setState(() => _rating = v));''',
        ),
      ],
    );
  }
}

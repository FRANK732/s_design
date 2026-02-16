import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class RatePage
    extends StatefulWidget {
  const RatePage(
      {super.key});

  @override
  State<RatePage>
      createState() =>
          _RatePageState();
}

class _RatePageState
    extends State<
        RatePage> {
  double
      _basicValue =
      2;
  double
      _halfValue =
      2.5;

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('SRate Showcase')),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic Rate',
              SRate(
                value: _basicValue,
                onChange: (val) => setState(() => _basicValue = val),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Half Star',
              SRate(
                value: _halfValue,
                allowHalf: true,
                onChange: (val) => setState(() => _halfValue = val),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Copywriting (Tooltips)',
              SRate(
                defaultValue: 3,
                tooltips: const [
                  'Terrible',
                  'Bad',
                  'Normal',
                  'Good',
                  'Wonderful'
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Read Only',
              const SRate(
                value: 2,
                disabled: true,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Clearable (Tap again to clear)',
              SRate(
                defaultValue: 3,
                allowClear: true,
                onChange: (val) => debugPrint('Cleared value: $val'),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Custom Character (Icon)',
              SRate(
                defaultValue: 2,
                character: const Icon(Icons.favorite),
                style: SRateStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Custom Character (Letter)',
              const SRate(
                defaultValue: 2,
                character: Text('A', style: TextStyle(fontSize: 24)),
                style: SRateStyle(gap: 16),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Custom Style',
              SRate(
                defaultValue: 3,
                style: SRateStyle(
                  color: Colors.purple,
                  unselectedColor: Colors.purple.shade50,
                  size: 32,
                  gap: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String
          title,
      Widget
          child) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

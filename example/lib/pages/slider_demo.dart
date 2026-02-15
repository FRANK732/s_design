import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

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
      _value1 =
      30;
  double
      _value2 =
      50;
  RangeValues
      _rangeValues =
      const RangeValues(20,
          70);

  // Vertical values
  double
      _vValue =
      40;

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(title: const Text('SSlider Demo (Ant Design)')),
      renderBody:
          (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Basic Slider'),
              SSlider.single(
                value: _value1,
                onChanged: (val) => setState(() => _value1 = val),
                max: 100,
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Range Slider'),
              SSlider.range(
                rangeValues: _rangeValues,
                onRangeChanged: (val) => setState(() => _rangeValues = val),
                max: 100,
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Slider with Marks'),
              SSlider.single(
                value: _value2,
                max: 100,
                onChanged: (val) => setState(() => _value2 = val),
                marks: {
                  0: Text('0°C'),
                  26: Text('26°C'),
                  37: Text('37°C'),
                  100: Text('100°C', style: TextStyle(color: Colors.red)),
                },
              ),
              const SizedBox(height: 50),
              _buildSectionTitle('Vertical Slider'),
              Row(
                children: [
                  SizedBox(
                    height: 300,
                    child: SSlider.single(
                      vertical: true,
                      value: _vValue,
                      max: 100,
                      onChanged: (val) => setState(() => _vValue = val),
                      marks: {
                        0: Text('0'),
                        100: Text('100'),
                      },
                    ),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    height: 300,
                    child: SSlider.range(
                      vertical: true,
                      rangeValues: _rangeValues,
                      max: 100,
                      onRangeChanged: (val) => setState(() => _rangeValues = val),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Custom Tooltip'),
              SSlider.single(
                value: _value1,
                max: 100,
                onChanged: (val) => setState(() => _value1 = val),
                label: '${_value1.toInt()}%',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(
      String
          title) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 24),
      child:
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}

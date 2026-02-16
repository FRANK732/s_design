import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class StepsPage
    extends StatefulWidget {
  const StepsPage(
      {super.key});

  @override
  State<StepsPage>
      createState() =>
          _StepsPageState();
}

class _StepsPageState
    extends State<
        StepsPage> {
  int _currentStep =
      1;
  int _verticalCurrentStep =
      1;
  int _errorCurrentStep =
      1;

  final List<SStepItem>
      _items =
      [
    const SStepItem(
      title:
          Text('Finished'),
      description:
          Text('This is a description.'),
    ),
    const SStepItem(
      title:
          Text('In Progress'),
      description:
          Text('This is a description.'),
      subTitle:
          Text('Left 00:00:08'),
    ),
    const SStepItem(
      title:
          Text('Waiting'),
      description:
          Text('This is a description.'),
    ),
  ];

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(
        title: const Text('SSteps Showcase'),
      ),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic Horizontal Steps',
              SSteps(
                current: _currentStep,
                items: const [
                  SStepItem(title: Text('Finished'), description: Text('Description 1')),
                  SStepItem(title: Text('In Progress'), description: Text('Description 2')),
                  SStepItem(title: Text('Waiting'), description: Text('Description 3')),
                ],
                onChange: (index) => setState(() => _currentStep = index),
                responsive: false,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Small Size',
              SSteps(
                size: SStepsSize.small,
                current: _currentStep,
                items: const [
                  SStepItem(title: Text('Finished')),
                  SStepItem(title: Text('In Progress')),
                  SStepItem(title: Text('Waiting')),
                ],
                onChange: (index) => setState(() => _currentStep = index),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Vertical Steps',
              SSteps(
                direction: Axis.vertical,
                current: _verticalCurrentStep,
                items: _items,
                onChange: (index) => setState(() => _verticalCurrentStep = index),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Error Status',
              SSteps(
                current: _errorCurrentStep,
                status: SStepStatus.error,
                items: const [
                  SStepItem(title: Text('Finished'), description: Text('This is a description.')),
                  SStepItem(title: Text('In Process'), description: Text('This is a description.')),
                  SStepItem(title: Text('Waiting'), description: Text('This is a description.')),
                ],
                onChange: (index) => setState(() => _errorCurrentStep = index),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              'Custom Icons',
              SSteps(
                current: _currentStep,
                items: const [
                  SStepItem(
                    title: Text('Login'),
                    icon: Icon(Icons.person),
                  ),
                  SStepItem(
                    title: Text('Verification'),
                    icon: Icon(Icons.security),
                  ),
                  SStepItem(
                    title: Text('Pay'),
                    icon: Icon(Icons.payment),
                  ),
                  SStepItem(
                    title: Text('Done'),
                    icon: Icon(Icons.check_circle),
                  ),
                ],
                onChange: (index) => setState(() => _currentStep = index),
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
                'Controls',
                Row(
                  children: [
                    SButton(
                      onPressed: _currentStep > 0 ? () => setState(() => _currentStep--) : null,
                      child: const Text('Previous'),
                    ),
                    const SizedBox(width: 16),
                    SButton(
                      onPressed: _currentStep < 3 ? () => setState(() => _currentStep++) : null,
                      child: const Text('Next'),
                    ),
                  ],
                ))
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
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          // padding: const EdgeInsets.all(16),
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.grey.shade200),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          child: child,
        ),
      ],
    );
  }
}

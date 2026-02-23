import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

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
  int _current =
      1;

  static const _steps =
      [
    SStepItem(
        title: Text('Order Placed'),
        description: Text('Your order was received')),
    SStepItem(
        title: Text('Processing'),
        description: Text('Being prepared')),
    SStepItem(
        title: Text('Shipped'),
        description: Text('On its way')),
    SStepItem(
        title: Text('Delivered'),
        description: Text('Enjoy!')),
  ];

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SSteps',
      description:
          'A progress steps component that guides users through sequential processes. '
          'Supports horizontal and vertical orientations, clickable steps, and status overrides.',
      whenToUse: const [
        'For multi-step wizards (checkout, onboarding, form completion).',
        'To show progress through a sequence of tasks.',
        'When you want users to understand where they are in a workflow.',
      ],
      sections: [
        ComponentSection(
          title: 'Horizontal Steps',
          description: 'Default horizontal layout with current step highlighted.',
          demo: Column(
            children: [
              SSteps(items: _steps, current: _current),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SButton(
                    size: SButtonSize.sm,
                    variant: SButtonVariant.outline,
                    onPressed: _current > 0 ? () => setState(() => _current--) : null,
                    child: const Text('Previous'),
                  ),
                  const SizedBox(width: 12),
                  SButton(
                    size: SButtonSize.sm,
                    onPressed: _current < _steps.length - 1 ? () => setState(() => _current++) : null,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
          code: '''
const steps = [
  SStepItem(title: Text('Order Placed'), description: Text('Your order was received')),
  SStepItem(title: Text('Processing')),
  SStepItem(title: Text('Shipped')),
  SStepItem(title: Text('Delivered')),
];

SSteps(items: steps, current: 1);''',
        ),
        const ComponentSection(
          title: 'Vertical Steps',
          description: 'Use `direction: Axis.vertical` for a vertical layout.',
          demo: SizedBox(
            height: 200,
            child: SSteps(
              direction: Axis.vertical,
              items: [
                SStepItem(title: Text('Step 1'), description: Text('Create your account')),
                SStepItem(title: Text('Step 2'), description: Text('Set up your profile')),
                SStepItem(title: Text('Step 3'), description: Text('Explore features')),
              ],
              current: 1,
            ),
          ),
          code: '''
SSteps(
  direction: Axis.vertical,
  items: const [
    SStepItem(title: Text('Step 1'), description: Text('Create your account')),
    SStepItem(title: Text('Step 2'), description: Text('Set up your profile')),
    SStepItem(title: Text('Step 3'), description: Text('Explore features')),
  ],
  current: 1,
);''',
        ),
        const ComponentSection(
          title: 'Error Status',
          description: 'Override step status to show errors using `SStepStatus.error`.',
          demo: SSteps(
            items: [
              SStepItem(title: Text('Placed'), status: SStepStatus.finish),
              SStepItem(title: Text('Processing'), status: SStepStatus.error),
              SStepItem(title: Text('Shipped')),
            ],
            current: 1,
          ),
          code: '''
SSteps(
  items: const [
    SStepItem(title: Text('Placed'), status: SStepStatus.finish),
    SStepItem(title: Text('Processing'), status: SStepStatus.error),
    SStepItem(title: Text('Shipped')),
  ],
  current: 1,
);''',
        ),
        ComponentSection(
          title: 'Clickable Steps',
          description: 'Pass `onChange` to make steps interactive.',
          demo: SSteps(
            items: _steps,
            current: _current,
            onChange: (i) => setState(() => _current = i),
          ),
          code: '''
SSteps(
  items: steps,
  current: currentStep,
  onChange: (i) => setState(() => currentStep = i),
);''',
        ),
      ],
    );
  }
}

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

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);

    final steps =
        [
      SStepItem(
          title: Text(l10n.stepsLabelOrderPlaced),
          description: Text(l10n.stepsDescOrderReceived)),
      SStepItem(
          title: Text(l10n.stepsLabelProcessing),
          description: Text(l10n.stepsDescPrepared)),
      SStepItem(
          title: Text(l10n.stepsLabelShipped),
          description: Text(l10n.stepsDescOnWay)),
      SStepItem(
          title: Text(l10n.stepsLabelDelivered),
          description: Text(l10n.stepsDescEnjoy)),
    ];
    return ComponentPage(
      name:
          'SSteps',
      description:
          l10n.stepsDesc,
      whenToUse: [
        l10n.stepsTip1,
        l10n.stepsTip2,
        l10n.stepsTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.stepsSectionHorizontal,
          description: 'Default horizontal layout with current step highlighted.',
          demo: Column(
            children: [
              SSteps(items: steps, current: _current),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SButton(
                    size: SButtonSize.sm,
                    variant: SButtonVariant.outline,
                    onPressed: _current > 0 ? () => setState(() => _current--) : null,
                    child: Text(l10n.stepsBtnPrevious),
                  ),
                  const SizedBox(width: 12),
                  SButton(
                    size: SButtonSize.sm,
                    onPressed: _current < steps.length - 1 ? () => setState(() => _current++) : null,
                    child: Text(l10n.stepsBtnNext),
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
        ComponentSection(
          title: l10n.stepsSectionVertical,
          description: 'Use `direction: Axis.vertical` for a vertical layout.',
          demo: SizedBox(
            height: 200,
            child: SSteps(
              direction: Axis.vertical,
              items: [
                SStepItem(title: Text(l10n.stepsLabelStep1), description: Text(l10n.stepsDescCreateAccount)),
                SStepItem(title: Text(l10n.stepsLabelStep2), description: Text(l10n.stepsDescSetProfile)),
                SStepItem(title: Text(l10n.stepsLabelStep3), description: Text(l10n.stepsDescExplore)),
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
        ComponentSection(
          title: l10n.stepsSectionError,
          description: 'Override step status to show errors using `SStepStatus.error`.',
          demo: SSteps(
            items: [
              SStepItem(title: Text(l10n.stepsLabelPlaced), status: SStepStatus.finish),
              SStepItem(title: Text(l10n.stepsLabelProcessing), status: SStepStatus.error),
              SStepItem(title: Text(l10n.stepsLabelShipped)),
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
          title: l10n.stepsSectionClickable,
          description: 'Pass `onChange` to make steps interactive.',
          demo: SSteps(
            items: steps,
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

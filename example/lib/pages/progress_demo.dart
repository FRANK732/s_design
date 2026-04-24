import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SProgressDemoPage
    extends StatefulWidget {
  const SProgressDemoPage(
      {super.key});

  @override
  State<SProgressDemoPage>
      createState() =>
          _SProgressDemoPageState();
}

class _SProgressDemoPageState
    extends State<
        SProgressDemoPage> {
  double
      _percent =
      65;

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SProgress',
      description:
          l10n.progressDesc,
      whenToUse: [
        l10n.progressTip1,
        l10n.progressTip2,
        l10n.progressTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.progressSectionLine,
          description: 'Use `SProgress.line()` for a horizontal bar.',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SProgress.line(percent: _percent),
              const SizedBox(height: 16),
              Row(
                children: [
                  SButton(
                    size: SButtonSize.sm,
                    variant: SButtonVariant.outline,
                    onPressed: _percent > 0 ? () => setState(() => _percent = (_percent - 10).clamp(0, 100)) : null,
                    child: Text(l10n.progressBtnDecrease),
                  ),
                  const SizedBox(width: 8),
                  SButton(
                    size: SButtonSize.sm,
                    variant: SButtonVariant.outline,
                    onPressed: _percent < 100 ? () => setState(() => _percent = (_percent + 10).clamp(0, 100)) : null,
                    child: Text(l10n.progressBtnIncrease),
                  ),
                  const SizedBox(width: 12),
                  Text('${_percent.toInt()}%'),
                ],
              ),
            ],
          ),
          code: '''
SProgress.line(percent: 65); // 65% progress''',
        ),
        ComponentSection(
          title: l10n.progressSectionCircle,
          description: 'Use `SProgress.circle()` for a circular indicator.',
          demo: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SProgress.circle(percent: _percent, width: 80),
              const SProgress.circle(percent: 100, width: 80, status: SProgressStatus.success),
              const SProgress.circle(percent: 70, width: 80, status: SProgressStatus.exception),
            ],
          ),
          code: '''
SProgress.circle(percent: 65, width: 80);
SProgress.circle(percent: 100, width: 80, status: SProgressStatus.success);
SProgress.circle(percent: 70, width: 80, status: SProgressStatus.exception);''',
        ),
        ComponentSection(
          title: l10n.progressSectionStatus,
          description: 'Apply status colors to indicate outcome on a line bar.',
          demo: const Column(
            children: [
              SProgress.line(percent: 100, status: SProgressStatus.success),
              SizedBox(height: 8),
              SProgress.line(percent: 70, status: SProgressStatus.exception),
              SizedBox(height: 8),
              SProgress.line(percent: 40, status: SProgressStatus.active),
            ],
          ),
          code: '''
SProgress.line(percent: 100, status: SProgressStatus.success);
SProgress.line(percent: 70, status: SProgressStatus.exception);
SProgress.line(percent: 40, status: SProgressStatus.active);''',
        ),
        ComponentSection(
          title: l10n.progressSectionDashboard,
          description: 'Use `SProgress.dashboard()` for an arc gauge with a gap at the bottom.',
          demo: Center(
            child: SProgress.dashboard(percent: _percent, width: 100),
          ),
          code: '''
SProgress.dashboard(percent: 65, width: 100, gapDegree: 75);''',
        ),
      ],
    );
  }
}

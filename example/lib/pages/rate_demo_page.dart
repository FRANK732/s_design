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
    final l10n = SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SRate',
      description: l10n.rateDesc,
      whenToUse: [
        l10n.rateTip1,
        l10n.rateTip2,
        l10n.rateTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.rateSectionBasic,
          description: l10n.rateDescBasic,
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SRate(value: _basic, onChange: (v) => setState(() => _basic = v)),
              const SizedBox(height: 8),
              Text(l10n.rateLabelCurrent(_basic.toInt())),
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
          title: l10n.rateSectionHalf,
          description: l10n.rateDescHalf,
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SRate(value: _half, allowHalf: true, onChange: (v) => setState(() => _half = v)),
              const SizedBox(height: 8),
              Text(l10n.rateLabelCurrent(_half)),
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
          title: l10n.rateSectionReadOnly,
          description: l10n.rateDescReadOnly,
          demo: Row(
            children: [
              const SRate(value: 4.5, allowHalf: true, disabled: true),
              const SizedBox(width: 8),
              Text('4.5 / 5.0', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          code: '''
const SRate(value: 4.5, allowHalf: true, disabled: true);''',
        ),
        ComponentSection(
          title: l10n.rateSectionCustomCount,
          description: l10n.rateDescCustomCount,
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SRate(value: 7, count: 10, onChange: (_) {}),
              const SizedBox(height: 4),
              Text(l10n.rateLabel10Scale),
            ],
          ),
          code: '''
SRate(value: 7, count: 10, onChange: (v) => setState(() => _rating = v));''',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class SCardDemoPage
    extends StatelessWidget {
  const SCardDemoPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SCard',
      description:
          l10n.cardDesc,
      whenToUse: [
        l10n.cardTip1,
        l10n.cardTip2,
        l10n.cardTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.cardSectionBasic,
          description: 'A simple content container with a title.',
          demo: SCard(
            title: l10n.cardLabelTitle,
            body: Text(l10n.cardLabelBasicBody),
          ),
          code: '''
SCard(
  title: 'Card Title',
  body: Text('Card content goes here.'),
);''',
        ),
        ComponentSection(
          title: l10n.cardSectionHeader,
          description: 'Add an action widget to the trailing slot of the header.',
          demo: SCard(
            title: l10n.cardLabelStats,
            headerTrailing: IconButton(icon: const Icon(Icons.more_horiz, size: 20), onPressed: () {}),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Stat(label: l10n.cardLabelUsers, value: '12,830'),
                _Stat(label: l10n.cardLabelRevenue, value: r'$4,291'),
                _Stat(label: l10n.cardLabelOrders, value: '1,043'),
              ],
            ),
          ),
          code: '''
SCard(
  title: 'Monthly Stats',
  headerTrailing: IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
  body: /* your content */,
);''',
        ),
        ComponentSection(
          title: l10n.cardSectionInteractivity,
          description: 'Pass `onTap` to make the card interactive.',
          demo: SCard(
            title: l10n.cardLabelClickMe,
            hoverable: true,
            onTap: () {},
            body: Text(l10n.cardLabelClickableBody),
          ),
          code: '''
SCard(
  title: 'Click Me',
  hoverable: true,
  onTap: () { /* navigate */ },
  body: const Text('Clickable card.'),
);''',
        ),
        ComponentSection(
          title: l10n.cardSectionVariants,
          description: 'Cards support elevated, filled, outlined, frosted, and borderless variants.',
          demo: Column(
            children: [
              SCard(title: l10n.cardLabelElevated, body: Text(l10n.cardLabelShadow)),
              const SizedBox(height: 10),
              SCard(title: l10n.cardLabelOutlined, body: Text(l10n.cardLabelBorder), variant: SCardVariant.outlined),
              const SizedBox(height: 10),
              SCard(title: l10n.cardLabelFilled, body: Text(l10n.cardLabelSurface), variant: SCardVariant.filled),
            ],
          ),
          code: '''
const SCard(title: 'Elevated', body: Text('...'), variant: SCardVariant.elevated);
const SCard(title: 'Outlined', body: Text('...'), variant: SCardVariant.outlined);
const SCard(title: 'Filled', body: Text('...'), variant: SCardVariant.filled);''',
        ),
        ComponentSection(
          title: l10n.cardSectionGrid,
          description: 'Arrange cards in a responsive grid.',
          demo: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2,
            children: List.generate(
                4,
                (i) => SCard(
                      title: l10n.cardLabelItem(i + 1),
                      onTap: () {},
                      body: Text(l10n.cardLabelItem(i + 1)),
                    )),
          ),
          code: r'''
GridView.count(
  crossAxisCount: 2,
  children: List.generate(4, (i) => SCard(
    title: 'Item ${i + 1}',
    onTap: () {},
    body: Text('Content ${i + 1}'),
  )),
);''',
        ),
      ],
    );
  }
}

class _Stat
    extends StatelessWidget {
  const _Stat(
      {required this.label,
      required this.value});
  final String
      label,
      value;

  @override
  Widget build(
      BuildContext
          context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), fontSize: 12)),
      ],
    );
  }
}

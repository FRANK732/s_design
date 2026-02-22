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
    return ComponentPage(
      name:
          'SCard',
      description:
          'A flexible surface container that groups related content and actions. '
          'Supports hover effects, custom headers, footers, cover images, and clickable interactions.',
      whenToUse: const [
        'To display grouped content such as user profiles, articles, or products.',
        'As the primary surface in list or grid layouts.',
        'For dashboard widgets, statistics displays, or settings panels.',
      ],
      sections: [
        ComponentSection(
          title: 'Basic Card',
          description: 'A simple content container with a title.',
          demo: const SCard(
            title: 'Card Title',
            body: Text('This is a basic card. It can contain any widget — text, images, buttons, or entire layouts.'),
          ),
          code: '''
const SCard(
  title: 'Card Title',
  body: Text('Card content goes here.'),
);''',
        ),
        ComponentSection(
          title: 'Card with Header Trailing',
          description: 'Add an action widget to the trailing slot of the header.',
          demo: SCard(
            title: 'Monthly Stats',
            headerTrailing: IconButton(icon: const Icon(Icons.more_horiz, size: 20), onPressed: () {}),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _Stat(label: 'Users', value: '12,830'),
                _Stat(label: 'Revenue', value: r'$4,291'),
                _Stat(label: 'Orders', value: '1,043'),
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
          title: 'Hoverable / Clickable',
          description: 'Pass `onTap` to make the card interactive.',
          demo: SCard(
            title: 'Click Me',
            hoverable: true,
            onTap: () {},
            body: const Text('This card is clickable. Hover over it to see the effect.'),
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
          title: 'Variants',
          description: 'Cards support elevated, filled, outlined, frosted, and borderless variants.',
          demo: Column(
            children: const [
              SCard(title: 'Elevated (default)', body: Text('Shadow card'), variant: SCardVariant.elevated),
              SizedBox(height: 10),
              SCard(title: 'Outlined', body: Text('Border card'), variant: SCardVariant.outlined),
              SizedBox(height: 10),
              SCard(title: 'Filled', body: Text('Surface-fill card'), variant: SCardVariant.filled),
            ],
          ),
          code: '''
const SCard(title: 'Elevated', body: Text('...'), variant: SCardVariant.elevated);
const SCard(title: 'Outlined', body: Text('...'), variant: SCardVariant.outlined);
const SCard(title: 'Filled', body: Text('...'), variant: SCardVariant.filled);''',
        ),
        ComponentSection(
          title: 'Card Grid',
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
                      title: 'Item ${i + 1}',
                      onTap: () {},
                      body: Text('Card ${i + 1}'),
                    )),
          ),
          code: '''
GridView.count(
  crossAxisCount: 2,
  children: List.generate(4, (i) => SCard(
    title: 'Item \${i + 1}',
    onTap: () {},
    body: Text('Content \${i + 1}'),
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

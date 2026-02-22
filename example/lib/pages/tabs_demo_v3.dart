import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class TabsDemoV3Page
    extends StatelessWidget {
  const TabsDemoV3Page(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'STabs',
      description:
          'A tab navigation component for switching between multiple views or content sections. '
          'Supports line, card and editable tab types, plus top/bottom/left/right positions.',
      whenToUse: const [
        'When you need to partition content into related, peer-level sections.',
        'For content-heavy screens like product detail pages or profile views.',
        'When left/right sidebar navigation supplements a main view.',
      ],
      sections: [
        ComponentSection(
          title: 'Basic Tabs',
          description: 'Pass `items: List<STabItem>` — each item defines a tab label and its content.',
          demo: SizedBox(
            height: 160,
            child: STabs(
              items: [
                STabItem(label: 'Overview', content: const Center(child: Text('Overview content'))),
                STabItem(label: 'Details', content: const Center(child: Text('Details content'))),
                STabItem(label: 'Reviews', content: const Center(child: Text('Reviews content'))),
              ],
            ),
          ),
          code: '''
STabs(
  items: [
    STabItem(label: 'Overview', content: const Text('Overview content')),
    STabItem(label: 'Details', content: const Text('Details content')),
    STabItem(label: 'Reviews', content: const Text('Reviews content')),
  ],
);''',
        ),
        ComponentSection(
          title: 'Tabs with Icons',
          description: 'Use the `icon` field on `STabItem` to add icons to tab labels.',
          demo: SizedBox(
            height: 160,
            child: STabs(
              items: [
                STabItem(label: 'Home', icon: const Icon(Icons.home_outlined, size: 16), content: const Center(child: Text('Home'))),
                STabItem(label: 'Search', icon: const Icon(Icons.search_outlined, size: 16), content: const Center(child: Text('Search'))),
                STabItem(label: 'Profile', icon: const Icon(Icons.person_outline, size: 16), content: const Center(child: Text('Profile'))),
              ],
            ),
          ),
          code: '''
STabs(
  items: [
    STabItem(label: 'Home', icon: const Icon(Icons.home_outlined, size: 16), content: ...,),
    STabItem(label: 'Search', icon: const Icon(Icons.search_outlined, size: 16), content: ...,),
  ],
);''',
        ),
        ComponentSection(
          title: 'Card Type',
          description: 'Use `type: STabType.card` for a card-style tab bar.',
          demo: SizedBox(
            height: 160,
            child: STabs(
              type: STabType.card,
              items: [
                STabItem(label: 'Card A', content: const Center(child: Text('Card A content'))),
                STabItem(label: 'Card B', content: const Center(child: Text('Card B content'))),
                STabItem(label: 'Card C', content: const Center(child: Text('Card C content'))),
              ],
            ),
          ),
          code: '''
STabs(
  type: STabType.card,
  items: [
    STabItem(label: 'Card A', content: ...),
    STabItem(label: 'Card B', content: ...),
  ],
);''',
        ),
      ],
    );
  }
}

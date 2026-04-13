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
    final l10n = SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'STabs',
      description: l10n.tabsDesc,
      whenToUse: [
        l10n.tabsTip1,
        l10n.tabsTip2,
        l10n.tabsTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.tabsSectionBasic,
          description: 'Pass `items: List<STabItem>` — each item defines a tab label and its content.',
          demo: SizedBox(
            height: 160,
            child: STabs(
              items: [
                STabItem(label: l10n.tabsLabelOverview, content: Center(child: Text(l10n.tabsContentOverview))),
                STabItem(label: l10n.tabsLabelDetails, content: Center(child: Text(l10n.tabsContentDetails))),
                STabItem(label: l10n.tabsLabelReviews, content: Center(child: Text(l10n.tabsContentReviews))),
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
          title: l10n.tabsSectionIcons,
          description: 'Use the `icon` field on `STabItem` to add icons to tab labels.',
          demo: SizedBox(
            height: 160,
            child: STabs(
              items: [
                STabItem(label: l10n.tabsLabelHome, icon: const Icon(Icons.home_outlined, size: 16), content: Center(child: Text(l10n.tabsLabelHome))),
                STabItem(label: l10n.tabsLabelSearch, icon: const Icon(Icons.search_outlined, size: 16), content: Center(child: Text(l10n.tabsLabelSearch))),
                STabItem(label: l10n.tabsLabelProfile, icon: const Icon(Icons.person_outline, size: 16), content: Center(child: Text(l10n.tabsLabelProfile))),
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
          title: l10n.tabsSectionCard,
          description: 'Use `type: STabType.card` for a card-style tab bar.',
          demo: SizedBox(
            height: 160,
            child: STabs(
              type: STabType.card,
              items: [
                STabItem(label: l10n.tabsLabelCardA, content: Center(child: Text(l10n.tabsContentCardA))),
                STabItem(label: l10n.tabsLabelCardB, content: Center(child: Text(l10n.tabsContentCardB))),
                STabItem(label: l10n.tabsLabelCardC, content: Center(child: Text(l10n.tabsContentCardC))),
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

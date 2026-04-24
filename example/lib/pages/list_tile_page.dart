import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class ListTilePage
    extends StatefulWidget {
  const ListTilePage(
      {super.key});

  @override
  State<ListTilePage>
      createState() =>
          _ListTilePageState();
}

class _ListTilePageState
    extends State<
        ListTilePage> {
  String
      _selected =
      '';

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return ComponentPage(
      name:
          'SListTile',
      description:
          l10n.listTileDesc,
      whenToUse: [
        l10n.listTileTip1,
        l10n.listTileTip2,
        l10n.listTileTip3,
      ],
      sections: [
        ComponentSection(
          title: l10n.listTileSectionBasic,
          description: 'A title + subtitle + leading icon combination.',
          demo: SListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: Text(l10n.listTileLabelName),
            subtitle: Text(l10n.listTileLabelRole),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          code: '''
SListTile(
  leading: const Icon(Icons.account_circle_outlined),
  title: const Text('John Doe'),
  subtitle: const Text('Software Engineer'),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {},
);''',
        ),
        ComponentSection(
          title: l10n.listTileSectionGrouped,
          description: 'Group list tiles visually using `SListTileGroup`.',
          demo: SListTileGroup(
            children: [
              SListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: Text(l10n.listTileLabelNotifications),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              SListTile(
                leading: const Icon(Icons.lock_outline),
                title: Text(l10n.listTileLabelPrivacy),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              SListTile(
                leading: const Icon(Icons.language_outlined),
                title: Text(l10n.listTileLabelLanguage),
                trailing: Text(l10n.langEn),
                onTap: () {},
              ),
            ],
          ),
          code: '''
SListTileGroup(
  children: [
    SListTile(
      leading: const Icon(Icons.notifications_outlined),
      title: const Text('Notifications'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
    SListTile(
      leading: const Icon(Icons.lock_outline),
      title: const Text('Privacy'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
  ],
);''',
        ),
        ComponentSection(
          title: l10n.listTileSectionSelectable,
          description: 'Track which tile is selected by comparing with item identity.',
          demo: Column(
            children: [
              l10n.listTileLabelInbox,
              l10n.listTileLabelSent,
              l10n.listTileLabelDrafts,
              l10n.listTileLabelSpam,
            ].map((label) {
              final isSelected = _selected == label;
              return SListTile(
                leading: Icon(
                  label == l10n.listTileLabelInbox
                      ? Icons.inbox
                      : label == l10n.listTileLabelSent
                          ? Icons.send
                          : label == l10n.listTileLabelDrafts
                              ? Icons.drafts
                              : Icons.report_gmailerrorred,
                  color: isSelected ? Theme.of(context).colorScheme.primary : null,
                ),
                title: Text(
                  label,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Theme.of(context).colorScheme.primary : null,
                  ),
                ),
                selected: isSelected,
                onTap: () => setState(() => _selected = label),
              );
            }).toList(),
          ),
          code: '''
SListTile(
  leading: const Icon(Icons.inbox),
  title: const Text('Inbox'),
  selected: _selected == 'Inbox',
  onTap: () => setState(() => _selected = 'Inbox'),
);''',
        ),
      ],
    );
  }
}

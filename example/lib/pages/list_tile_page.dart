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
    return ComponentPage(
      name:
          'SListTile',
      description:
          'A list tile component for displaying rows of content with consistent leading icons, '
          'title, subtitle, and trailing widgets. Supports grouped and standalone layouts.',
      whenToUse: const [
        'To build list-based navigation menus or settings screens.',
        'To display structured data rows with consistent formatting.',
        'When items need a leading icon and an optional trailing action.',
      ],
      sections: [
        ComponentSection(
          title: 'Basic List Tile',
          description: 'A title + subtitle + leading icon combination.',
          demo: SListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('John Doe'),
            subtitle: const Text('Software Engineer'),
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
          title: 'Grouped List',
          description: 'Group list tiles visually using `SListTileGroup`.',
          demo: SListTileGroup(
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
              SListTile(
                leading: const Icon(Icons.language_outlined),
                title: const Text('Language'),
                trailing: const Text('English'),
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
          title: 'Selectable Tiles',
          description: 'Track which tile is selected by comparing with item identity.',
          demo: Column(
            children: [
              'Inbox',
              'Sent',
              'Drafts',
              'Spam'
            ].map((label) {
              final isSelected = _selected == label;
              return SListTile(
                leading: Icon(
                  label == 'Inbox'
                      ? Icons.inbox
                      : label == 'Sent'
                          ? Icons.send
                          : label == 'Drafts'
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

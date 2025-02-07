import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class ListTilePage extends StatefulWidget {
  const ListTilePage({super.key});

  @override
  State<ListTilePage> createState() => _ListTilePageState();
}

class _ListTilePageState extends State<ListTilePage> {
  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: AppBar(
        title: const Text('STextTile Showcase'),
      ),
      renderBody: ((context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SListTile(
              title: 'Tile with Leading Icon',
              leading: const Icon(Icons.star),
              onTap: () {
                debugPrint('Tile with Leading Icon tapped');
              },
            ),
            const SizedBox(height: 16),
            SListTile(
              title: 'Tile with Subtitle',
              subtitle: const Text('This is a subtitle'),
              onTap: () {
                debugPrint('Tile with Subtitle tapped');
              },
            ),
            const SizedBox(height: 16),
            SListTile(
              title: 'Tile with Trailing Icon',
              trailing: const Icon(Icons.check_circle),
              onTap: () {
                debugPrint('Tile with Trailing Icon tapped');
              },
            ),
            const SizedBox(height: 16),
            SListTile(
              title: 'Tile with Leading, Subtitle, and Trailing',
              leading: const Icon(Icons.person),
              subtitle: const Text('Subtitle here'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                debugPrint('Complex Tile tapped');
              },
            ),
            const SizedBox(height: 16),
            const SListTile(
              title: 'Tile with No Action',
            ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/code_snippet.dart';

/// Welcome/overview page shown when the app first opens.
class HomeOverviewPage
    extends StatelessWidget {
  const HomeOverviewPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    return ListView(
      padding:
          const EdgeInsets.all(32),
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SDesign',
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Component Gallery',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.55),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'SDesign is a responsive Flutter UI component library inspired by modern design systems, '
          'built for mobile-first experiences. Browse the component pages in the left sidebar '
          'to see live demos, usage variants, and ready-to-copy code snippets.',
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.7, color: theme.colorScheme.onSurface.withOpacity(0.75)),
        ),
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 24),
        Text('Quick Start', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        const CodeSnippet(
          code: '''
import 'package:s_design/s_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SApp(
      title: 'My App',
      theme: SThemeData.light(),
      darkTheme: SThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}''',
        ),
        const SizedBox(height: 32),
        Text('Component Categories', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _CategoryChip(label: 'Inputs', icon: Icons.input, count: 9),
            _CategoryChip(label: 'Display', icon: Icons.dashboard, count: 4),
            _CategoryChip(label: 'Feedback', icon: Icons.notifications_active, count: 6),
            _CategoryChip(label: 'Layout', icon: Icons.view_quilt, count: 4),
            _CategoryChip(label: 'Overlays', icon: Icons.layers, count: 1),
          ],
        ),
        const SizedBox(height: 32),
        Text('Links', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        _LinkTile(
          icon: Icons.code,
          title: 'pub.dev package',
          subtitle: 'pub.dev/packages/s_design',
          onTap: () {},
        ),
        _LinkTile(
          icon: Icons.hub,
          title: 'GitHub Repository',
          subtitle: 'github.com/FRANK732/s_design',
          onTap: () {},
        ),
      ],
    );
  }
}

class _CategoryChip
    extends StatelessWidget {
  const _CategoryChip(
      {required this.label,
      required this.icon,
      required this.count});
  final String
      label;
  final IconData
      icon;
  final int
      count;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration:
          BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child:
          Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkTile
    extends StatelessWidget {
  const _LinkTile(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});
  final IconData
      icon;
  final String
      title;
  final String
      subtitle;
  final VoidCallback
      onTap;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    return ListTile(
      contentPadding:
          EdgeInsets.zero,
      leading:
          Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: theme.colorScheme.onPrimaryContainer, size: 20),
      ),
      title:
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle:
          Text(subtitle, style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.55), fontSize: 12)),
      trailing:
          const Icon(Icons.open_in_new, size: 16),
      onTap:
          onTap,
    );
  }
}

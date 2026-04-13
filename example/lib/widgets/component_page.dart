import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'code_snippet.dart';

/// The standard scaffold for all component detail pages.
/// Provides a consistent layout with title, description, and variant sections.
class ComponentPage
    extends StatelessWidget {
  const ComponentPage({
    super.key,
    required this.name,
    required this.description,
    this.whenToUse,
    required this.sections,
  });

  final String
      name;
  final String
      description;
  final List<String>?
      whenToUse;
  final List<ComponentSection>
      sections;

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
        // Title
        Text(name, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        // Description
        Text(description, style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.75))),
        if (whenToUse != null && whenToUse!.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(SLocalizations.ofContext(context).demoWhenToUse, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.primary)),
          const SizedBox(height: 8),
          ...whenToUse!.map(
            (tip) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(tip, style: theme.textTheme.bodyMedium)),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 24),
        // Sections
        ...sections.map((s) => _SectionWidget(section: s)),
      ],
    );
  }
}

class _SectionWidget
    extends StatefulWidget {
  const _SectionWidget(
      {required this.section});
  final ComponentSection
      section;

  @override
  State<_SectionWidget>
      createState() =>
          _SectionWidgetState();
}

class _SectionWidgetState
    extends State<
        _SectionWidget> {
  bool
      _showCode =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    final s =
        widget.section;
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 40),
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(s.title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          if (s.description != null) Text(s.description!, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.65))),
          const SizedBox(height: 16),
          // Demo card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
            ),
            child: s.demo,
          ),
          // Code toggle
          if (s.code != null) ...[
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () => setState(() => _showCode = !_showCode),
              icon: Icon(_showCode ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 16),
              label: Text(_showCode ? SLocalizations.ofContext(context).demoHideCode : SLocalizations.ofContext(context).demoShowCode, style: const TextStyle(fontSize: 13)),
              style: TextButton.styleFrom(padding: EdgeInsets.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            ),
            if (_showCode) ...[
              const SizedBox(height: 8),
              CodeSnippet(code: s.code!),
            ],
          ],
        ],
      ),
    );
  }
}

/// Represents one variant/sample section in a component page.
class ComponentSection {
  const ComponentSection({
    required this.title,
    this.description,
    required this.demo,
    this.code,
  });

  final String
      title;
  final String?
      description;
  final Widget
      demo;
  final String?
      code;
}

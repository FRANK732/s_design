import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class DropdownMenuPage
    extends StatefulWidget {
  const DropdownMenuPage(
      {super.key});

  @override
  State<DropdownMenuPage>
      createState() =>
          _DropdownMenuPageState();
}

class _DropdownMenuPageState
    extends State<
        DropdownMenuPage> {
  bool
      _controlled =
      false;

  SMenu _buildActions() =>
      SMenu(
        children: [
          SMenuItem(
            icon: const Icon(Icons.edit_outlined, size: 16),
            child: const Text('Edit'),
            onTap: () {},
          ),
          SMenuItem(
            icon: const Icon(Icons.copy_outlined, size: 16),
            child: const Text('Duplicate'),
            onTap: () {},
          ),
          const SMenuDivider(),
          SMenuItem(
            icon: const Icon(Icons.delete_outline, size: 16),
            danger: true,
            onTap: () {},
            child: const Text('Delete'),
          ),
        ],
      );

  @override
  Widget build(
      BuildContext
          context) {
    return ComponentPage(
      name:
          'SDropdown',
      description:
          'A generic overlay wrapper to display menus or actions floating over '
          'any element.',
      whenToUse: const [
        'When you need a context-action menu triggered on hover, click, or right-click.',
        "When you want actions that don't submit form data (use SSelect for data entry).",
        'When you need split-button groups or cascading sub-menus.',
      ],
      sections: [
        // ── Hover ────────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Hover Trigger',
          description: 'Menu opens when the user hovers the child.',
          demo: Center(
            child: SDropdown(
              overlay: _buildActions(),
              child: const Text(
                'Hover over me',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          code: '''
SDropdown(
  trigger: const [SDropdownTrigger.hover],
  placement: SDropdownPlacement.bottomLeft,
  overlay: SMenu(
    children: [
      SMenuItem(child: const Text('Edit'), onTap: () {}),
      SMenuItem(child: const Text('Delete'), danger: true, onTap: () {}),
    ],
  ),
  child: const Text('Hover over me'),
)''',
        ),

        // ── Click ────────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Click Trigger',
          description: 'Menu opens when the user clicks the button.',
          demo: Center(
            child: SDropdown(
              trigger: const [
                SDropdownTrigger.click
              ],
              placement: SDropdownPlacement.bottomCenter,
              overlay: SMenu(
                children: [
                  SMenuItem(
                    icon: const Icon(Icons.person_outline, size: 16),
                    child: const Text('Profile'),
                    onTap: () {},
                  ),
                  SMenuItem(
                    icon: const Icon(Icons.settings_outlined, size: 16),
                    child: const Text('Settings'),
                    onTap: () {},
                  ),
                  const SMenuDivider(),
                  SMenuItem(
                    icon: const Icon(Icons.logout, size: 16),
                    danger: true,
                    onTap: () {},
                    child: const Text('Logout'),
                  ),
                ],
              ),
              child: SButton(
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Actions'),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 16),
                  ],
                ),
              ),
            ),
          ),
          code: '''
SDropdown(
  trigger: const [SDropdownTrigger.click],
  overlay: SMenu(children: [...]),
  child: SButton(child: const Text('Actions'), onPressed: () {}),
)''',
        ),

        // ── Context Menu ─────────────────────────────────────────────────────
        ComponentSection(
          title: 'Context Menu (Right-Click)',
          description: 'Right-clicking (or long-pressing on mobile) the area opens the menu.',
          demo: Center(
            child: SDropdown(
              trigger: const [
                SDropdownTrigger.contextMenu
              ],
              overlay: SMenu(
                children: [
                  SMenuItem(child: const Text('Copy'), onTap: () {}),
                  SMenuItem(child: const Text('Cut'), onTap: () {}),
                  SMenuItem(disabled: true, onTap: () {}, child: const Text('Paste')),
                  const SMenuDivider(),
                  SMenuItem(child: const Text('Select All'), onTap: () {}),
                ],
              ),
              child: Container(
                width: 240,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.12),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text('Right-click / Long-press here'),
              ),
            ),
          ),
          code: '''
SDropdown(
  trigger: const [SDropdownTrigger.contextMenu],
  overlay: SMenu(children: [...]),
  child: Container(...),
)''',
        ),

        // ── Placements ───────────────────────────────────────────────────────
        ComponentSection(
          title: 'Placement Options',
          description: 'Control which edge the menu aligns to.',
          demo: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              for (final entry in <(
                SDropdownPlacement,
                String
              )>[
                (
                  SDropdownPlacement.topLeft,
                  'Top Left'
                ),
                (
                  SDropdownPlacement.topCenter,
                  'Top Center'
                ),
                (
                  SDropdownPlacement.topRight,
                  'Top Right'
                ),
                (
                  SDropdownPlacement.bottomLeft,
                  'Bottom Left'
                ),
                (
                  SDropdownPlacement.bottomCenter,
                  'Bottom Center'
                ),
                (
                  SDropdownPlacement.bottomRight,
                  'Bottom Right'
                ),
              ])
                SDropdown(
                  trigger: const [
                    SDropdownTrigger.click
                  ],
                  placement: entry.$1,
                  overlay: SMenu(
                    children: [
                      SMenuItem(child: const Text('Item 1'), onTap: () {}),
                      SMenuItem(child: const Text('Item 2'), onTap: () {}),
                    ],
                  ),
                  child: SButton(
                    variant: SButtonVariant.outline,
                    onPressed: () {},
                    child: Text(entry.$2, style: const TextStyle(fontSize: 12)),
                  ),
                ),
            ],
          ),
          code: '''
SDropdown(
  placement: SDropdownPlacement.topRight,
  overlay: SMenu(...),
  child: SButton(child: const Text('Top Right')),
)''',
        ),

        // ── Disabled ─────────────────────────────────────────────────────────
        ComponentSection(
          title: 'Disabled State',
          description: 'Set `disabled: true` to prevent the dropdown from opening.',
          demo: Center(
            child: SDropdown(
              disabled: true,
              overlay: _buildActions(),
              child: const SButton(
                onPressed: null,
                child: Text('Disabled Dropdown'),
              ),
            ),
          ),
          code: '''
SDropdown(
  disabled: true,
  overlay: SMenu(children: [...]),
  child: SButton(child: const Text('Disabled'), onPressed: null),
)''',
        ),

        // ── Controlled ───────────────────────────────────────────────────────
        ComponentSection(
          title: 'Controlled Open State',
          description: 'Pass `open` and `onOpenChange` to fully control visibility from outside.',
          demo: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Force open: '),
                  Switch(
                    value: _controlled,
                    onChanged: (v) => setState(() => _controlled = v),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SDropdown(
                open: _controlled,
                onOpenChange: (v) => setState(() => _controlled = v),
                overlay: _buildActions(),
                child: SButton(
                  onPressed: () => setState(() => _controlled = !_controlled),
                  child: const Text('Controlled Button'),
                ),
              ),
            ],
          ),
          code: '''
bool _open = false;

SDropdown(
  open: _open,
  onOpenChange: (v) => setState(() => _open = v),
  overlay: SMenu(...),
  child: SButton(
    onPressed: () => setState(() => _open = !_open),
    child: const Text('Controlled'),
  ),
)''',
        ),

        // ── Sub-Menus (Cascading) ─────────────────────────────────────────
        ComponentSection(
          title: 'Cascading Sub-Menus',
          description: 'Use `SSubMenu` inside any `SMenu` to nest popup menus. '
              'Hovering the row opens a child menu to its right (auto-flips left if near edge).',
          demo: Center(
            child: SDropdown(
              trigger: const [
                SDropdownTrigger.click
              ],
              overlay: SMenu(
                children: [
                  SMenuItem(child: const Text('New File'), onTap: () {}),
                  SSubMenu(
                    title: const Text('Open Recent'),
                    icon: const Icon(Icons.history, size: 16),
                    children: [
                      SMenuItem(child: const Text('project_v1.dart'), onTap: () {}),
                      SMenuItem(child: const Text('main.dart'), onTap: () {}),
                      SMenuItem(child: const Text('pubspec.yaml'), onTap: () {}),
                    ],
                  ),
                  SSubMenu(
                    title: const Text('Export As'),
                    icon: const Icon(Icons.upload_outlined, size: 16),
                    children: [
                      SMenuItem(child: const Text('PDF'), onTap: () {}),
                      SMenuItem(child: const Text('PNG'), onTap: () {}),
                      SMenuItem(child: const Text('SVG'), onTap: () {}),
                      SSubMenu(
                        title: const Text('More formats'),
                        children: [
                          SMenuItem(child: const Text('WEBP'), onTap: () {}),
                          SMenuItem(child: const Text('AVIF'), onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                  const SMenuDivider(),
                  SMenuItem(
                    danger: true,
                    onTap: () {
                      SSonner.show(message: 'Successfully deleted', variant: SSonnerVariant.success);
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
              child: SButton(
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('File'),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 16),
                  ],
                ),
              ),
            ),
          ),
          code: '''
SDropdown(
  overlay: SMenu(
    children: [
      SMenuItem(child: const Text('New File'), onTap: () {}),
      SSubMenu(
        title: const Text('Open Recent'),
        icon: const Icon(Icons.history),
        children: [
          SMenuItem(child: const Text('main.dart'), onTap: () {}),
        ],
      ),
    ],
  ),
  child: SButton(child: const Text('File'), onPressed: () {}),
)''',
        ),

        // ── Dropdown Button (Split) ───────────────────────────────────────
        ComponentSection(
          title: 'Split Button (SDropdownButton)',
          description: 'Use `SDropdownButton` to pair a primary action with a dropdown '
              'of secondary actions.',
          demo: Center(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                SDropdownButton(
                  onMainPressed: () {},
                  overlay: SMenu(
                    children: [
                      SMenuItem(child: const Text('Save Draft'), onTap: () {}),
                      SMenuItem(child: const Text('Schedule'), onTap: () {}),
                      const SMenuDivider(),
                      SMenuItem(danger: true, onTap: () {}, child: const Text('Discard')),
                    ],
                  ),
                  child: const Text('Publish'),
                ),
                SDropdownButton(
                  variant: SButtonVariant.outline,
                  onMainPressed: () {},
                  overlay: SMenu(
                    children: [
                      SMenuItem(child: const Text('Download ZIP'), onTap: () {}),
                      SMenuItem(child: const Text('Download TAR'), onTap: () {}),
                    ],
                  ),
                  child: const Text('Download'),
                ),
              ],
            ),
          ),
          code: '''
SDropdownButton(
  onMainPressed: () {},
  overlay: SMenu(
    children: [
      SMenuItem(child: const Text('Save Draft'), onTap: () {}),
      SMenuItem(child: const Text('Discard'), danger: true, onTap: () {}),
    ],
  ),
  child: const Text('Publish'),
)''',
        ),

        // ── Arrows and Extra Styles ──────────────────────────────────────
        ComponentSection(
          title: 'Arrows and Item States',
          description: 'Set `arrow: true` to show a geometric pointer. '
              'Menus also support `selected` and `loading` states.',
          demo: Center(
            child: SDropdown(
              arrow: true,
              placement: SDropdownPlacement.bottomCenter,
              overlay: SMenu(
                children: [
                  const SMenuItem(
                    icon: Icon(Icons.check_circle_outline, size: 16),
                    selected: true,
                    child: Text('Selected Item'),
                  ),
                  const SMenuItem(
                    loading: true,
                    child: Text('Loading State'),
                  ),
                  const SMenuDivider(),
                  SMenuItem(
                    icon: const Icon(Icons.refresh, size: 16),
                    onTap: () {},
                    child: const Text('Regular Item'),
                  ),
                ],
              ),
              child: SButton(
                onPressed: () {},
                child: const Text('Arrow & States'),
              ),
            ),
          ),
          code: '''
SDropdown(
  arrow: true,
  overlay: SMenu(
    children: [
      SMenuItem(selected: true, child: Text('Selected')),
      SMenuItem(loading: true, child: Text('Loading')),
    ],
  ),
  child: SButton(child: Text('Arrow & States')),
)''',
        ),
      ],
    );
  }
}

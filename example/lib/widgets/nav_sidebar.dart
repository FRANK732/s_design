import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 's_design_logo.dart';

/// Model for a single navigable item in the sidebar.
class NavItem {
  const NavItem(
      {required this.id,
      required this.label,
      required this.icon,
      required this.page});
  final String
      id;
  final String
      label;
  final IconData
      icon;
  final Widget
      page;
}

/// Model for a collapsible group in the sidebar.
class NavGroup {
  const NavGroup(
      {required this.title,
      required this.items});
  final String
      title;
  final List<NavItem>
      items;
}

/// The left sidebar navigation panel.
class NavSidebar
    extends StatefulWidget {
  const NavSidebar({
    super.key,
    required this.groups,
    required this.homeItem,
    required this.selected,
    required this.onSelected,
    required this.searchQuery,
    required this.onSearchChanged,
  });

  final List<NavGroup>
      groups;
  final NavItem
      homeItem;
  final NavItem
      selected;
  final ValueChanged<NavItem>
      onSelected;
  final String
      searchQuery;
  final ValueChanged<String>
      onSearchChanged;

  @override
  State<NavSidebar>
      createState() =>
          _NavSidebarState();
}

class _NavSidebarState
    extends State<
        NavSidebar> {
  final Set<String>
      _expanded =
      {};

  @override
  void
      initState() {
    super
        .initState();
    // Expand all groups by default
    for (final g
        in widget.groups) {
      _expanded.add(g.title);
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    final isDark =
        theme.brightness == Brightness.dark;

    return Container(
      width:
          240,
      color: isDark
          ? const Color(0xFF1C1C1C)
          : const Color(0xFFF5F5F5),
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo header
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const SDesignLogo(
              size: 28,
              withText: true,
            ),
          ),
          // Search box
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: TextField(
              onChanged: widget.onSearchChanged,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                    hintText: SLocalizations.ofContext(context).searchComponents,
                hintStyle: const TextStyle(fontSize: 13),
                prefixIcon: const Icon(Icons.search, size: 18),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.white,
              ),
            ),
          ),
          // Nav items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                // Home item
                if (_matchesSearch(widget.homeItem.label))
                  _NavItemTile(
                    item: widget.homeItem,
                    isSelected: widget.selected.id == widget.homeItem.id,
                    onTap: () => widget.onSelected(widget.homeItem),
                  ),
                // Groups
                ...widget.groups.map((group) {
                  final visibleItems = group.items.where((i) => _matchesSearch(i.label)).toList();
                  if (visibleItems.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  final isExpanded = _expanded.contains(group.title);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Group header
                      InkWell(
                        onTap: () => setState(() {
                          if (isExpanded) {
                            _expanded.remove(group.title);
                          } else {
                            _expanded.add(group.title);
                          }
                        }),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  group.title.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.8,
                                    color: theme.colorScheme.onSurface.withOpacity(0.45),
                                  ),
                                ),
                              ),
                              Icon(
                                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                size: 14,
                                color: theme.colorScheme.onSurface.withOpacity(0.4),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isExpanded || widget.searchQuery.isNotEmpty)
                        ...visibleItems.map(
                          (item) => _NavItemTile(
                            item: item,
                            isSelected: widget.selected.id == item.id,
                            onTap: () => widget.onSelected(item),
                          ),
                        ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _matchesSearch(
      String
          label) {
    if (widget
        .searchQuery
        .isEmpty) {
      return true;
    }
    return label
        .toLowerCase()
        .contains(widget.searchQuery.toLowerCase());
  }
}

class _NavItemTile
    extends StatelessWidget {
  const _NavItemTile(
      {required this.item,
      required this.isSelected,
      required this.onTap});
  final NavItem
      item;
  final bool
      isSelected;
  final VoidCallback
      onTap;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    return Material(
      color:
          Colors.transparent,
      child:
          InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? theme.colorScheme.primary.withOpacity(0.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: 18,
                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
              ),
              if (isSelected)
                Container(
                  width: 3,
                  height: 16,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

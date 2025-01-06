import 'package:flutter/material.dart';

/// Represents an item in the SSelect widget.
class SSelectItem<T> {
  final T value;
  final String label;
  final bool disabled;

  SSelectItem({
    required this.value,
    required this.label,
    this.disabled = false,
  });
}

/// The content of the SSelect dropdown.
class SSelectContent<T> extends StatefulWidget {
  final List<SSelectItem<T>> items;
  final T? selectedValue;
  final ValueChanged<T?> onItemSelected;
  final bool isMultiSelect;
  final double dropdownMaxHeight;

  const SSelectContent({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onItemSelected,
    this.isMultiSelect = false,
    this.dropdownMaxHeight = 300.0,
  });

  @override
  _SSelectContentState<T> createState() => _SSelectContentState<T>();
}

class _SSelectContentState<T> extends State<SSelectContent<T>> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<SSelectItem<T>> _filteredItems = [];
  List<T> _multiSelectedValues = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_filterItems);
    if (widget.isMultiSelect && widget.selectedValue != null) {
      _multiSelectedValues = [widget.selectedValue!];
    }
  }

  void _filterItems() {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.label
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _onItemTap(SSelectItem<T> item) {
    if (widget.isMultiSelect) {
      setState(() {
        if (_multiSelectedValues.contains(item.value)) {
          _multiSelectedValues.remove(item.value);
        } else {
          _multiSelectedValues.add(item.value);
        }
      });
      widget.onItemSelected(_multiSelectedValues.isNotEmpty
          ? _multiSelectedValues.last
          : null as T);
    } else {
      if (!item.disabled) {
        widget.onItemSelected(item.value);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildItem(SSelectItem<T> item) {
    final isSelected = widget.isMultiSelect
        ? _multiSelectedValues.contains(item.value)
        : widget.selectedValue == item.value;
    return ListTile(
      enabled: !item.disabled,
      leading: isSelected
          ? (widget.isMultiSelect
          ? Icon(Icons.check_box, color: Theme.of(context).primaryColor)
          : Icon(Icons.check, color: Theme.of(context).primaryColor))
          : (widget.isMultiSelect
          ? Icon(Icons.check_box_outline_blank)
          : const SizedBox(width: 24)),
      title: Text(
        item.label,
        style: item.disabled
            ? TextStyle(color: Theme.of(context).disabledColor)
            : null,
      ),
      onTap: item.disabled ? null : () => _onItemTap(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.dropdownMaxHeight,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Search input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Dropdown items
          Expanded(
            child: _filteredItems.isNotEmpty
                ? Scrollbar(
              controller: _scrollController,
              child: ListView.separated(
                controller: _scrollController,
                itemCount: _filteredItems.length,
                separatorBuilder: (context, index) =>
                const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return _buildItem(item);
                },
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No options found.',
                style: TextStyle(
                    color: Theme.of(context).disabledColor,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

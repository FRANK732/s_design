import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../../s_design.dart';
import 's_select_item.dart';

class SSelectMenu<
        T>
    extends StatefulWidget {
  const SSelectMenu({
    super.key,
    required this.items,
    this.singleValue,
    this.multiValues,
    this.onSingleSelect,
    this.onMultiSelect,
    this.isMultiSelect =
        false,
    this.dropdownMaxHeight =
        300.0,
    this.searchPlaceholder =
        'Search...',
    this.onSearch,
    this.isAsync =
        false,
  }) : assert(
          isMultiSelect ? onMultiSelect != null && multiValues != null : onSingleSelect != null,
          'Provide onMultiSelect/multiValues for multi-select, or onSingleSelect for single-select.',
        );

  final List<SSelectItem<T>>
      items;
  final T?
      singleValue;
  final List<T>?
      multiValues;
  final ValueChanged<T>?
      onSingleSelect;
  final ValueChanged<List<T>>?
      onMultiSelect;
  final bool
      isMultiSelect;
  final double
      dropdownMaxHeight;
  final String
      searchPlaceholder;

  /// Callback for searching items. If [isAsync] is true, this should handle remote fetching.
  final FutureOr<List<SSelectItem<T>>>
          Function(String query)?
      onSearch;

  /// Whether the menu is in async mode.
  final bool
      isAsync;

  @override
  State<
      SSelectMenu<
          T>> createState() =>
      _SSelectMenuState<T>();
}

class _SSelectMenuState<
        T>
    extends State<
        SSelectMenu<T>> {
  final TextEditingController
      _searchController =
      TextEditingController();
  List<SSelectItem<T>>
      _filteredItems =
      [];
  bool
      _isLoading =
      false;
  Timer?
      _debounceTimer;

  @override
  void
      initState() {
    super
        .initState();
    _filteredItems =
        widget.items;
    _searchController
        .addListener(_onSearchChanged);
  }

  @override
  void didUpdateWidget(
      covariant SSelectMenu<T>
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (!widget.isAsync &&
        widget.items != oldWidget.items) {
      _filterItems();
    }
  }

  void
      _onSearchChanged() {
    if (_debounceTimer?.isActive ??
        false)
      _debounceTimer?.cancel();
    _debounceTimer = Timer(
        const Duration(milliseconds: 300),
        () {
      _filterItems();
    });
  }

  Future<void>
      _filterItems() async {
    final String
        query =
        _searchController.text;

    if (widget.isAsync &&
        widget.onSearch != null) {
      setState(() =>
          _isLoading = true);
      try {
        final List<SSelectItem<T>> results = await widget.onSearch!(query);
        if (mounted) {
          setState(() {
            _filteredItems = results;
            _isLoading = false;
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    } else {
      final String
          lowerQuery =
          query.toLowerCase();
      setState(() {
        if (lowerQuery.isEmpty) {
          _filteredItems = widget.items;
        } else {
          _filteredItems = widget.items.where((SSelectItem<T> item) {
            return item.label.toLowerCase().contains(lowerQuery);
          }).toList();
        }
      });
    }
  }

  void _onItemTap(
      SSelectItem<T>
          item) {
    if (item
        .disabled)
      return;

    if (widget
        .isMultiSelect) {
      final List<T>
          currentValues =
          List<T>.from(widget.multiValues ?? <T>[]);
      if (currentValues.contains(item.value)) {
        currentValues.remove(item.value);
      } else {
        currentValues.add(item.value);
      }
      widget.onMultiSelect?.call(currentValues);
    } else {
      widget.onSingleSelect?.call(item.value);
    }
  }

  Widget _buildItem(
      SSelectItem<T>
          item) {
    final bool isSelected = widget.isMultiSelect
        ? (widget.multiValues?.contains(item.value) ?? false)
        : item.value == widget.singleValue;

    final sTheme =
        STheme.of(context);
    final Color
        primaryColor =
        sTheme.colorToken.primary;
    final Color
        disabledColor =
        sTheme.colorToken.textSecondary.withOpacity(0.5);

    return InkWell(
      onTap: item.disabled
          ? null
          : () => _onItemTap(item),
      child:
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            if (widget.isMultiSelect)
              Icon(
                isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                color: item.disabled ? disabledColor : (isSelected ? primaryColor : sTheme.colorToken.textPrimary.withOpacity(0.5)),
                size: 20,
              )
            else
              SizedBox(
                width: 20,
                child: isSelected ? Icon(Icons.check, color: primaryColor, size: 20) : null,
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: sTheme.typographyToken.bodyMedium.copyWith(
                      color: item.disabled ? disabledColor : sTheme.colorToken.textPrimary,
                      fontWeight: isSelected ? FontWeight.w600 : null,
                    ),
                  ),
                  if (item.subtitle != null)
                    Text(
                      item.subtitle!,
                      style: sTheme.typographyToken.bodySmall.copyWith(
                        color: disabledColor,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void
      dispose() {
    _searchController
        .dispose();
    _debounceTimer
        ?.cancel();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final sTheme =
        STheme.of(context);
    return Container(
      constraints:
          BoxConstraints(maxHeight: widget.dropdownMaxHeight),
      decoration:
          BoxDecoration(
        color: sTheme.colorToken.surface,
        borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
      ),
      child:
          Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: widget.searchPlaceholder,
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(DesignConstants.borderRadiusSmall),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: sTheme.colorToken.background,
              ),
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: _isLoading && _filteredItems.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : _filteredItems.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'No options found',
                            style: sTheme.typographyToken.bodySmall.copyWith(color: sTheme.colorToken.textSecondary),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filteredItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildItem(_filteredItems[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

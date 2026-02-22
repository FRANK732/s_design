import 'package:flutter/material.dart';

import '../../../../../../s_design.dart';
import '../s_select_style_helper.dart';

class SSelectTrigger<
        T>
    extends StatefulWidget {
  const SSelectTrigger({
    super.key,
    required this.values,
    required this.items,
    required this.onPressed,
    required this.mode,
    this.placeholder,
    this.disabled =
        false,
    this.loading =
        false,
    this.allowClear =
        false,
    this.onClear,
    this.size =
        SSelectSize.middle,
    this.status =
        SSelectStatus.none,
    this.variant =
        SSelectVariant.outlined,
    this.showSearch =
        false,
    this.onSearch,
    this.searchValue,
    this.focusNode,
    this.maxTagCount,
    this.suffixIcon,
    this.prefix,
    this.onItemRemove,
    this.onInputTap,
  });

  final List<T>
      values;
  final List<SSelectItem<T>>
      items;
  final VoidCallback?
      onPressed;
  final SSelectMode
      mode;
  final String?
      placeholder;
  final bool
      disabled;
  final bool
      loading;
  final bool
      allowClear;
  final VoidCallback?
      onClear;
  final SSelectSize
      size;
  final SSelectStatus
      status;
  final SSelectVariant
      variant;
  final bool
      showSearch;
  final ValueChanged<String>?
      onSearch;
  final String?
      searchValue;
  final FocusNode?
      focusNode;
  final int?
      maxTagCount;
  final Widget?
      suffixIcon;
  final Widget?
      prefix;
  final ValueChanged<T>?
      onItemRemove;
  final VoidCallback?
      onInputTap;

  @override
  State<
      SSelectTrigger<
          T>> createState() =>
      _SSelectTriggerState<T>();
}

class _SSelectTriggerState<
        T>
    extends State<
        SSelectTrigger<T>> {
  bool
      _isHovering =
      false;
  late TextEditingController
      _searchController;

  @override
  void
      initState() {
    super
        .initState();
    _searchController =
        TextEditingController(text: widget.searchValue);
  }

  @override
  void didUpdateWidget(
      SSelectTrigger<T>
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.searchValue != oldWidget.searchValue &&
        widget.searchValue != _searchController.text) {
      _searchController.text =
          widget.searchValue ?? '';
    }
  }

  @override
  void
      dispose() {
    _searchController
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final sTheme =
        STheme.of(context);
    final isFocused =
        widget.focusNode?.hasFocus ?? false;
    final borderColor =
        SSelectStyleHelper.getBorderColor(
      status:
          widget.status,
      isFocused:
          isFocused,
      variant:
          widget.variant,
      theme:
          sTheme,
    );
    final backgroundColor =
        SSelectStyleHelper.getBackgroundColor(
      variant:
          widget.variant,
      disabled:
          widget.disabled,
      theme:
          sTheme,
    );
    final height =
        SSelectStyleHelper.getHeight(widget.size);
    final padding =
        SSelectStyleHelper.getItemPadding(widget.size);
    final textStyle =
        SSelectStyleHelper.getTriggerTextStyle(
      size:
          widget.size,
      disabled:
          widget.disabled,
      theme:
          sTheme,
    );

    return MouseRegion(
      onEnter: (_) =>
          setState(() => _isHovering = true),
      onExit: (_) =>
          setState(() => _isHovering = false),
      child:
          InkWell(
        onTap: widget.disabled
            ? null
            : () {
                widget.onPressed?.call();
                // Ensure focus for search when clicked
                if (widget.showSearch && widget.focusNode != null && !widget.focusNode!.hasFocus) {
                  widget.focusNode!.requestFocus();
                }
              },
        borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          height: widget.mode == SSelectMode.multiple || widget.mode == SSelectMode.tags ? null : height,
          constraints: BoxConstraints(minHeight: height),
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: widget.variant == SSelectVariant.borderless ? null : Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(DesignConstants.borderRadiusMedium),
            boxShadow: isFocused && widget.variant == SSelectVariant.outlined
                ? [
                    BoxShadow(
                      color: sTheme.colorToken.primary.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 0,
                      offset: Offset.zero,
                    )
                  ]
                : [],
          ),
          child: Row(
            children: [
              if (widget.prefix != null) ...[
                widget.prefix!,
                const SizedBox(width: 8),
              ],
              Expanded(
                child: _buildContent(sTheme, textStyle),
              ),
              const SizedBox(width: 8),
              _buildSuffix(sTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
      SThemeData
          theme,
      TextStyle
          textStyle) {
    if (widget.mode == SSelectMode.multiple ||
        widget.mode == SSelectMode.tags) {
      return _buildWrap(textStyle);
    }

    // Single Selection Mode
    if (widget
        .values
        .isEmpty) {
      if (widget.showSearch &&
          widget.focusNode?.hasFocus == true) {
        return _buildSearchInput(textStyle);
      }
      return Text(
        widget.placeholder ?? '',
        style: textStyle.copyWith(color: theme.colorToken.textSecondary.withOpacity(0.7)),
        overflow: TextOverflow.ellipsis,
      );
    }

    if (widget.showSearch &&
        widget.focusNode?.hasFocus == true) {
      // For single select, when searching, we show the input.
      // Ideally, the selected value should be hidden or shown as placeholder if the search is empty.
      // Behavior: If search is empty, show selected value? Or just show input?
      // The selected value is hidden while searching, but if search is empty, the placeholder is the selected value label (opacity reduced).
      // For simplicity: Just show the input.
      return _buildSearchInput(textStyle);
    }

    final selectedItem = widget
        .items
        .firstWhere(
      (item) =>
          item.value ==
          widget.values.first,
      orElse: () =>
          SSelectItem(value: widget.values.first, label: widget.values.first.toString()),
    );

    return Text(
      selectedItem.label,
      style:
          textStyle,
      overflow:
          TextOverflow.ellipsis,
    );
  }

  Widget _buildSearchInput(
      TextStyle
          textStyle) {
    final sTheme =
        STheme.of(context);
    return TextField(
      controller:
          _searchController,
      focusNode:
          widget.focusNode,
      style:
          textStyle,
      cursorColor:
          sTheme.colorToken.primary,
      onChanged:
          widget.onSearch,
      decoration:
          const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      maxLines:
          1,
    );
  }

  Widget _buildWrap(
      TextStyle
          textStyle) {
    final List<Widget>
        children =
        [];

    // Add selected items
    for (var value
        in widget.values) {
      final item =
          widget.items.firstWhere(
        (i) => i.value == value,
        orElse: () => SSelectItem(value: value, label: value.toString()),
      );
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: STheme.of(context).colorToken.divider.withOpacity(0.5),
            borderRadius: BorderRadius.circular(DesignConstants.borderRadiusSmall),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.label,
                style: const TextStyle(fontSize: 12),
              ),
              if (!widget.disabled) ...[
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    widget.onItemRemove?.call(value);
                  },
                  child: Icon(Icons.close, size: 10, color: STheme.of(context).colorToken.textSecondary),
                ),
              ]
            ],
          ),
        ),
      );
    }

    // Add search input at the end
    if (widget.showSearch &&
        !widget.disabled) {
      children.add(
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 4, maxWidth: double.infinity),
          child: IntrinsicWidth(
            child: TextField(
              controller: _searchController,
              focusNode: widget.focusNode,
              style: textStyle,
              cursorColor: STheme.of(context).colorToken.primary,
              onChanged: widget.onSearch,
              onTap: widget.onInputTap,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              maxLines: 1,
              minLines: 1,
            ),
          ),
        ),
      );
    }

    // If no values and no search (or search empty/not focused), show placeholder
    if (widget.values.isEmpty &&
        (!widget.showSearch || (widget.searchValue?.isEmpty ?? true) && !(widget.focusNode?.hasFocus ?? false))) {
      return Text(
        widget.placeholder ?? '',
        style: textStyle.copyWith(color: STheme.of(context).colorToken.textSecondary.withOpacity(0.7)),
        overflow: TextOverflow.ellipsis,
      );
    }

    return Wrap(
      spacing:
          4,
      runSpacing:
          4,
      crossAxisAlignment:
          WrapCrossAlignment.center,
      children:
          children,
    );
  }

  Widget _buildSuffix(
      SThemeData
          theme) {
    if (widget
        .loading) {
      return SizedBox(
        width: 12,
        height: 12,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: theme.colorToken.primary,
        ),
      );
    }

    if (widget.allowClear &&
        widget.values.isNotEmpty &&
        !widget.disabled &&
        _isHovering) {
      return InkWell(
        onTap: widget.onClear,
        child: Icon(
          Icons.cancel,
          size: 14,
          color: theme.colorToken.textSecondary.withOpacity(0.5),
        ),
      );
    }

    if (widget
        .showSearch) {
      return Icon(
        Icons.search,
        size: 16,
        color: theme.colorToken.textSecondary.withOpacity(0.5),
      );
    }

    return widget.suffixIcon ??
        Icon(
          Icons.keyboard_arrow_down,
          size: 16,
          color: theme.colorToken.textSecondary.withOpacity(0.5),
        );
  }
}

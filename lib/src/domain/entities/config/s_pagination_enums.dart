/// Pagination size variants.
enum SPaginationSize {
  /// Default (normal) size.
  normal,

  /// Small/compact size.
  small,

  /// Large size.
  large,
}

/// Horizontal alignment of the pagination widget.
enum SPaginationAlign {
  /// Left-aligned.
  start,

  /// Center-aligned.
  center,

  /// Right-aligned.
  end,
}

/// Item type passed to [SPagination.itemRender].
enum SPaginationItemType {
  /// Previous page button.
  prev,

  /// A numbered page button.
  page,

  /// Next page button.
  next,

  /// Jump-backward ellipsis button.
  jumpPrev,

  /// Jump-forward ellipsis button.
  jumpNext,
}

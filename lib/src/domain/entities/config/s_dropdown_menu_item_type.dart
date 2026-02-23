/// Enumeration for Dropdown Menu Item Types
enum SDropdownMenuItemType {
  normal,
  searchable,
  multiSelect,
}

enum SDropdownMenuPosition {
  bottom,
  top,
  left,
  right,
}

class STriggerContainerSize {
  const STriggerContainerSize._(
      this.height,
      this.width);

  factory STriggerContainerSize.custom(
      double
          height,
      double
          width) {
    return STriggerContainerSize._(
        height,
        width);
  }
  final double
      height;
  final double
      width;

  static const STriggerContainerSize
      sm =
      STriggerContainerSize._(30,
          100);
  static const STriggerContainerSize
      md =
      STriggerContainerSize._(50,
          150);
  static const STriggerContainerSize
      lg =
      STriggerContainerSize._(60,
          200);
}

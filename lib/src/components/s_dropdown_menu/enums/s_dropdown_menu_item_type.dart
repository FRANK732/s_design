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
  const STriggerContainerSize._(this.height, this.width);

  factory STriggerContainerSize.custom(double height, double width) {
    return STriggerContainerSize._(height, width);
  }
  final double height;
  final double width;

  static const sm = STriggerContainerSize._(30, 100);
  static const md = STriggerContainerSize._(50, 150);
  static const lg = STriggerContainerSize._(60, 200);
}

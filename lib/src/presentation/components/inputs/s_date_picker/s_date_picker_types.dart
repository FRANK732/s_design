enum SDatePickerMode {
  date,
  week,
  month,
  year,
  quarter,
  decade, // Internal use mainly
}

class SDatePickerPreset<
    T> {
  final String
      label;
  final T
      value;

  const SDatePickerPreset(
      {required this.label,
      required this.value});
}

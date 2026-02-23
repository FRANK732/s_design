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

  const SDatePickerPreset(
      {required this.label,
      required this.value});
  final String
      label;
  final T
      value;
}

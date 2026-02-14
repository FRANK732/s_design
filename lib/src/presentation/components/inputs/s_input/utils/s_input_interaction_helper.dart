import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SInputInteractionHelper {
  static Future<void>
      handleDatePicker({
    required BuildContext
        context,
    required TextEditingController
        controller,
    required ValueChanged<String>?
        onChanged,
    required DateTime
        initialDate,
    required String?
        dateFormat,
  }) async {
    final DateTime?
        pickedDate =
        await showDatePicker(
      context:
          context,
      initialDate:
          initialDate,
      firstDate:
          DateTime(1900),
      lastDate:
          DateTime.now().add(const Duration(days: 365 * 100)),
    );

    if (pickedDate !=
        null) {
      final String pickedDateStr = dateFormat != null
          ? DateFormat(dateFormat).format(pickedDate)
          : '${pickedDate.day.toString().padLeft(2, '0')}-'
              '${pickedDate.month.toString().padLeft(2, '0')}-'
              '${pickedDate.year}';

      controller.text =
          pickedDateStr;

      if (onChanged !=
          null) {
        onChanged(pickedDateStr);
      }
    }
  }

  static void
      handleSearchClear({
    required TextEditingController?
        controller,
    required ValueChanged<String>?
        onChanged,
  }) {
    controller
        ?.clear();
    if (onChanged !=
        null) {
      onChanged('');
    }
  }
}

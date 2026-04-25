import 'package:flutter/material.dart';

class GlobalFunc {
  GlobalFunc._();

  static Future<void> pickDate({required final BuildContext context, required final DateTime? selectedDate, required final Function(DateTime dateTime) onDateSelected}) {
    return showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((selectedDate) {
      if (selectedDate != null) {
        onDateSelected(selectedDate);
      }
    });
  }

  static String getFileName(String filePath) {
    return filePath.split('/').last;
  }
}
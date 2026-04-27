import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalFunc {
  GlobalFunc._();

  static const Uuid _uuid = Uuid();

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

  static String generateRandomId() {
    return _uuid.v4();
  }

  static Future<String> getBuildVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "v${packageInfo.version}";
  }
}
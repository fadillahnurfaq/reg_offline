
class ModelParser {
  ModelParser._();

  static int? intFromJson(final dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String) {
      return int.tryParse(value);
    } else if (value is double) {
      return value.toInt();
    } else {
      return null;
    }
  }

  static double? doubleFromJson(final dynamic value) {
    if (value is double) {
      return value;
    } else if (value is String) {
      return double.tryParse(value);
    } else if (value is int) {
      return value.toDouble();
    } else {
      return null;
    }
  }

  static bool? boolFromJson(final dynamic value) {
    if (value is bool) {
      return value;
    } else if (value is String) {
      return bool.tryParse(value);
    } else {
      return null;
    }
  }
}
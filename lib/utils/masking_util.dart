class MaskingUtil {
  MaskingUtil._();

  static String mask({
    required String value,
    int visibleStart = 3,
    int visibleEnd = 3,
    String maskChar = '*',
  }) {
    if (value.isEmpty) return value;

    final length = value.length;

    /// kalau terlalu pendek, jangan dipaksakan
    if (length <= visibleStart + visibleEnd) {
      if (length <= 2) return value; // terlalu pendek, tampilkan aja

      final start = value.substring(0, visibleStart.clamp(0, length));
      final end = value.substring(length - visibleEnd.clamp(0, length));

      final maskedLength = length - (start.length + end.length);
      if (maskedLength <= 0) return value;

      return start + (maskChar * maskedLength) + end;
    }

    final start = value.substring(0, visibleStart);
    final end = value.substring(length - visibleEnd);
    final maskedLength = length - (visibleStart + visibleEnd);

    return start + (maskChar * maskedLength) + end;
  }
}
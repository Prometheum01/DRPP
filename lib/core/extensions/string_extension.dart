extension StringExtension on String {
  String? get divideAuthority {
    for (int index = 8; index < length; index++) {
      this[index];
      if (this[index] == '/') {
        return substring(8, index);
      }
    }
    return null;
  }

  String? get divideParams {
    for (int index = 8; index < length; index++) {
      this[index];
      if (this[index] == '/') {
        return substring(index, length);
      }
    }
    return null;
  }
}

class StringUtils {
  static String getMoneyFormattedString(String value) {
    return '$value ₽';
  }

  static String getShortMoneyString(int value) {
    if (value < 1000) return '$value';

    final shortValue = value ~/ 1000;
    return '$shortValue т';
  }
}

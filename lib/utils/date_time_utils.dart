import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getMonthName(int monthNumber) {
    return DateTime(DateTime.now().year, monthNumber).monthName;
  }
}

extension DateTimeHelper on DateTime {
  String get formattedDate {
    return '$day.$month.$year';
  }

  String get monthName {
    return DateFormat('MMM').format(this);
  }
}

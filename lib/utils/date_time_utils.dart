import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static void initFormatLocale() {
    initializeDateFormatting();
    Intl.defaultLocale = 'ru';
  }

  static String getMonthName(int monthNumber) {
    return DateTime(DateTime.now().year, monthNumber).monthName;
  }
}

extension DateTimeHelper on DateTime {
  String get formattedDate {
    return '$day.$month.$year';
  }

  String get monthName {
    return DateFormat('MMMM').format(this);
  }
}

import 'package:intl/intl.dart';

class DateFormatter {
  static String getFormattedDateTime(DateTime dateTime) {
    return DateFormat('hh:mm a , dd MMMM yyyy').format(dateTime);
  }

  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }

  static String getFormattedTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }
}

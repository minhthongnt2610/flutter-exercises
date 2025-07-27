import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String displayDateString({
    String format = 'hh mm',
  }) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }
}

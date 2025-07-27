import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime get startOfWeek {
    return subtract(Duration(days: weekday - 1));
  }

  DateTime get endOfWeek {
    return add(Duration(days: 7 - weekday));
  }

  DateTime get nextWeek {
    return add(const Duration(days: 7));
  }

  DateTime get previousWeek {
    return subtract(const Duration(days: 7));
  }

  List<DateTime> get daysPerWeek {
    final firstDay = startOfWeek;
    return List.generate(7, (index) => firstDay.add(Duration(days: index)));
  }

  String displayDatesOfString({
    String format = 'dd MMM',
  }) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }

  String displayDaysOfString() {
    return DateFormat('dd').format(this);
  }

  String displayWeekDaysOfString() {
    return DateFormat('E').format(this);
  }
}

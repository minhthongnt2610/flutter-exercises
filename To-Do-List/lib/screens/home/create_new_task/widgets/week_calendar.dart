import 'package:flutter/material.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/calendar_item.dart';

class WeekCalendar extends StatelessWidget {
  const WeekCalendar({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onSelected,
  });
  final DateTime? selectedDate;
  final List<DateTime> dates;
  final ValueChanged<DateTime> onSelected;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 58 / 70,
      ),
      itemCount: dates.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CalendarItem(
          date: dates[index],
          isSelected: DateUtils.isSameDay(dates[index], selectedDate),
          onSelected: () {
            onSelected.call(dates[index]);
          },
        );
      },
    );
  }
}

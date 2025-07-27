import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_icons.dart';
import 'package:lesson_5/extensions/date_time_extension.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/week_calendar.dart';

import '../../../../constants/app_colors.dart';

class SetDate extends StatefulWidget {
  const SetDate({
    super.key,
    required this.date,
    required this.selectedDate,
    required this.onDateChanged,
  });
  final DateTime date;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<SetDate> createState() => _setDate();
}

class _setDate extends State<SetDate> {
  DateTime _date = DateTime.now();
  List<DateTime> _dates = [];
  DateTime? _selectedDate;
  final _initalPage = 520;
  late PageController _pageController;
  late int _currentPage;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initalPage);
    _date = widget.date;
    _dates = [_date.previousWeek, _date, _date.nextWeek];
    _currentPage = _initalPage;
    _selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          /// Khoảng cách theo chiều dọc
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentPage--;
                  _pageController.animateToPage(
                    _currentPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: SizedBox(
                width: 44,
                height: 44,
                child: Center(
                  child: Image.asset(
                    AppIcons.leftArrow,
                    height: 17,
                    // height: 8.48,
                  ),
                ),
              ),
            ),
            Text(
              '${_date.startOfWeek.displayDatesOfString()} - ${_date.endOfWeek.displayDatesOfString()}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: AppColors.hexBA83DE,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentPage++;
                  _pageController.animateToPage(
                    _currentPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: SizedBox(
                width: 44,
                height: 44,
                child: Center(
                  child: Image.asset(
                    AppIcons.rightArrow,
                    height: 17,
                    // height: 8.48,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return WeekCalendar(
                dates: _dates[index % _dates.length].daysPerWeek,
                selectedDate: _selectedDate,
                onSelected: (date) {
                  setState(() {
                    widget.onDateChanged.call(date);
                    _selectedDate = date;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _onPageChanged(int index) {
    final page = index % _dates.length;
    if (page == 0) {
      setState(() {
        _date = _dates[0];
        _dates[2] = _date.previousWeek;
        _dates[1] = _date.nextWeek;
        _currentPage = index;
      });
    } else if (page == 2) {
      setState(() {
        _date = _dates[2];
        _dates[0] = _date.nextWeek;
        _dates[1] = _date.previousWeek;
        _currentPage = index;
      });
    } else if (page == 1) {
      setState(() {
        _date = _dates[1];
        _dates[0] = _date.previousWeek;
        _dates[2] = _date.nextWeek;
        _currentPage = index;
      });
    }
  }
}

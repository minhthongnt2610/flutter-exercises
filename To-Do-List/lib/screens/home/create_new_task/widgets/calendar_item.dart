import 'package:flutter/material.dart';
import 'package:lesson_5/extensions/date_time_extension.dart';

import '../../../../constants/app_colors.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onSelected,
  });
  final DateTime date;
  final bool isSelected;
  final VoidCallback onSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected.call();
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 3,
            child: Container(
              width: 58,
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? AppColors.hexBA83DE : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date.displayWeekDaysOfString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelected
                          ? AppColors.hexBA83DE
                          : Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    date.displayDaysOfString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: isSelected
                          ? AppColors.hexBA83DE
                          : Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              bottom: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: AppColors.hexBA83DE,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

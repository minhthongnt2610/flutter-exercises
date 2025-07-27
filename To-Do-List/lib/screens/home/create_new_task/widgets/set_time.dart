import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lesson_5/constants/app_icons.dart';

import '../../../../constants/app_colors.dart';

class SetTime extends StatefulWidget {
  const SetTime({
    super.key,
    required this.title,
    required this.time,
    required this.onChanged,
  });
  final String title;
  final TimeOfDay time;
  final ValueChanged<TimeOfDay> onChanged;
  @override
  State<StatefulWidget> createState() => _setTime();
}

class _setTime extends State<SetTime> {
  final timeInput = TextEditingController();
  @override
  void initState() {
    timeInput.text = formatTimeOfDay(widget.time);
    super.initState();
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    final format = DateFormat.jm();
    return format.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: timeInput,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
          readOnly: true,
          onTap: () async {
            final setTime = await showTimePicker(
              context: context,
              initialTime: widget.time,
            );
            if (setTime != null) {
              widget.onChanged.call(setTime);
              timeInput.text = formatTimeOfDay(setTime);
            }
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
            prefixIcon: SizedBox(
              width: 44,
              child: Center(
                child: Image.asset(
                  AppIcons.clock,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.hex181818,
          ),
        ),
      ],
    );
  }
}

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputDateTimeField extends StatelessWidget
{
  const InputDateTimeField({
    super.key,
    required this.selectedDate,
    required this.onChanged
  });
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onChanged;
  @override
  Widget build(BuildContext context)
  {
    return DateTimeField(
      decoration: const InputDecoration(
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        helperText: 'MM/DD/YYYY',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        filled: true,
        fillColor: Colors.white24,

      ),
      value: selectedDate,
      dateFormat: DateFormat.yMd(),
      mode: DateTimeFieldPickerMode.date,
      initialPickerDateTime: DateTime(2001, 11, 20),
      onChanged: onChanged,
    );
  }
}
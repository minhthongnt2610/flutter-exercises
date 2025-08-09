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
                labelText: 'Enter Date',
                labelStyle: TextStyle(
                    color: Colors.white30,
                    fontSize: 16,
                ),
                helperText: 'YYYY/MM/DD',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white12,
            ),
            value: selectedDate,
            dateFormat: DateFormat.yMd(),
            mode: DateTimeFieldPickerMode.date,
            initialPickerDateTime: DateTime(2001, 11, 20),
            onChanged: onChanged,
        );
    }
}


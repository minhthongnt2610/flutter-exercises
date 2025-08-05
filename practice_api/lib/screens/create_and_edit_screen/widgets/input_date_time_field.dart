import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class InputDateTimeField extends StatefulWidget
{
    const InputDateTimeField({
        super.key,
        required this.selectedDate
    });
    final DateTime? selectedDate;
    @override
    State<InputDateTimeField> createState() => _InputDateTimeFieldState();
}

class _InputDateTimeFieldState extends State<InputDateTimeField>
{
    DateTime? selectedDate;
    @override
    void initState() 
    {
        super.initState();
        selectedDate = widget.selectedDate;
    }
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
            onChanged: (DateTime? value)
            {
                setState(()
                    {
                        selectedDate = value;
                    }
                );
            },
        );
    }
}

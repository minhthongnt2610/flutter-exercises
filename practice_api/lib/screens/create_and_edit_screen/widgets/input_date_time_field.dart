import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';
class InputDateTimeField extends StatefulWidget {
  const InputDateTimeField({super.key});

  @override
  State<InputDateTimeField> createState() => _InputDateTimeFieldState();
}

class _InputDateTimeFieldState extends State<InputDateTimeField> {
  FriendModel? friendModel;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      decoration: const InputDecoration(
        labelText: 'Enter Date',
        helperText: 'YYYY/MM/DD',
        border: OutlineInputBorder(),
      ),
      value: friendModel?.birthdate,
      dateFormat: DateFormat.yMd(),
      mode: DateTimeFieldPickerMode.date,
      initialPickerDateTime: DateTime(2001,11,20),
      onChanged: (DateTime? value) {
        setState(() {
          friendModel?.birthdate = value!;
        });
      },
    );
  }
}

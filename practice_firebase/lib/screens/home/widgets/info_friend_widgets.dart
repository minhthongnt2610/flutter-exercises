import 'package:flutter/material.dart';

class InfoFriendWidgets extends StatelessWidget {
  const InfoFriendWidgets({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 16, color: Colors.black));
  }
}

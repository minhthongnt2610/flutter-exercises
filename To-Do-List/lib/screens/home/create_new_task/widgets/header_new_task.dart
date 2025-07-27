import 'package:flutter/material.dart';

class HeaderNewTask extends StatelessWidget {
  const HeaderNewTask({
    super.key,
    required this.title,
    required this.opacity,
    required this.fontSize,
  });

  final String title;
  final double opacity;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white.withOpacity(opacity),
        ),
      ),
    );
  }
}

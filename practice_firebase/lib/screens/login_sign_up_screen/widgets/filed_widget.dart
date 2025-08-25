import 'package:flutter/material.dart';

class FiledWidget extends StatelessWidget {
  const FiledWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.isPassword,
  });
  final String labelText;
  final String hintText;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),

      ),
      style: TextStyle(color: Colors.white),
    );
  }
}

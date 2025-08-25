import 'package:flutter/material.dart';
class FiledWidget extends StatefulWidget {
  const FiledWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.isPassword,
    required this.suffixIcon,
  });
  final String labelText;
  final String hintText;
  final bool isPassword;
  final Widget suffixIcon;
  @override
  State<FiledWidget> createState() => _FiledWidgetState();
}

class _FiledWidgetState extends State<FiledWidget> {

    @override
    Widget build(BuildContext context) {
      return TextFormField(
        cursorColor: Colors.white,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),

        ),
        style: TextStyle(color: Colors.white),
      );
    }
  }


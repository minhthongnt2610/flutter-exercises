import 'package:flutter/material.dart';

class FiledWidget extends StatefulWidget {
  FiledWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    required this.suffixIcon,
    required this.onChange,
    required this.validator,
  });
  final String labelText;
  final String hintText;
  final bool isPassword;
  final Widget suffixIcon;
  final ValueChanged<String> onChange;
  final FormFieldValidator<String> validator;

  @override
  State<FiledWidget> createState() => _FiledWidgetState();
}

class _FiledWidgetState extends State<FiledWidget> {
  bool _isPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChange,
      cursorColor: Colors.white,
      obscureText: widget.isPassword ? !_isPassword : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isPassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPassword = !_isPassword;
            });
          },
        )
            : widget.suffixIcon,
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

import 'package:flutter/material.dart';

class FieldWidget extends StatefulWidget {
  FieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    required this.suffixIcon,
    required this.onChange,
    required this.validator,
    required this.controller,  this.initialValue,
  });
  final String? initialValue;
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final Widget? suffixIcon;
  final ValueChanged<String> onChange;
  final FormFieldValidator<String> validator;

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  bool _isPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
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

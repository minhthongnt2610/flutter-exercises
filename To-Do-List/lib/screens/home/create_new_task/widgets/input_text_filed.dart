import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';

class InputTextFiled extends StatefulWidget {
  const InputTextFiled({
    super.key,
    required this.hint,
    required this.maxLines,
    required this.onChanged,
  });
  final String hint;
  final int maxLines;
  final ValueChanged<String> onChanged;
  @override
  State<InputTextFiled> createState() => _inputTextFiledState();
}

class _inputTextFiledState extends State<InputTextFiled> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: _controller,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.hex181818,
        ),
      ),
    );
  }
}

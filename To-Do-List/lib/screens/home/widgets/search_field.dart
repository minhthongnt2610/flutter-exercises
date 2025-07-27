import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/constants/app_icons.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    required this.hintText,
    required this.onChanged,
    super.key,
  });
  final String hintText;
  final ValueChanged<String> onChanged;
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 16,
        ),
        prefixIcon: SizedBox(
          width: 50,
          child: Center(
            child: Image.asset(
              AppIcons.search,
              width: 19.17,
              height: 19.17,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: AppColors.hex181818,
      ),
      onChanged: widget.onChanged,
    );
  }
}

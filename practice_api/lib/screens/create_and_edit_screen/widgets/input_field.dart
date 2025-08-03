import 'package:flutter/material.dart';

class InputField extends StatefulWidget
{
    const InputField({
        super.key,
        required this.hintText, 
        required this.onChanged,
        required this.maxLines, 
        required this.initialValue,
    });
    final String hintText;
    final ValueChanged<String> onChanged;
    final int maxLines;
    final String? initialValue;

    @override
    State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField>
{
    late TextEditingController _controller;
    @override
    void initState()
    {
        super.initState();
        _controller = TextEditingController(text: widget.initialValue);
    }

    @override
    Widget build(BuildContext context)
    {
        return TextFormField(
            controller: _controller,
            style:
            const TextStyle(
                color: Colors.white54,
                fontSize: 16,
            ),
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                    color: Colors.white30,
                    fontSize: 16,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white12,
            ),

            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
            initialValue: widget.initialValue,
        );
    }
}

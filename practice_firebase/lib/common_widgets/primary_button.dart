import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.isColor,
    required this.onPressed,
  });

  final String title;
  final bool isColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Container(
      width: double.infinity,
      height: 58 * height / 928,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54, width: 3),
        borderRadius: BorderRadius.circular(10),
        color: isColor == true ? Colors.white : Colors.transparent,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
          mouseCursor: null,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: isColor == true ? Colors.blueGrey : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

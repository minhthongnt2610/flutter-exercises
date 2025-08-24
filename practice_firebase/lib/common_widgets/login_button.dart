import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.title, required this.isColor});

  final String title;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    return Container(
      width: 368 * width / 428,
      height: 58 * height / 928,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54, width: 3),
        borderRadius: BorderRadius.circular(10),
        color: isColor == true ? Colors.white : Colors.transparent,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          mouseCursor: null,
        ),
        onPressed: () {},
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

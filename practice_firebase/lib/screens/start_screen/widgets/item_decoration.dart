import 'package:flutter/material.dart';

import '../../../common_widgets/login_button.dart';

class ItemDecoration extends StatelessWidget {
  const ItemDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    return Container(
      padding: EdgeInsets.all(25),
      width: 428 * width / 428,
      height: 928 * height / 928,
      child: Column(
        children: [
          SizedBox(height: 150 * height / 928),
          Container(
            width: 420 * width / 428,
            height: 120 * height / 928,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                'ThongNT',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15 * height / 928),
          Text(
            'Welcome to my list friend',
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Where you will get in touch with other friends like you',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 140 * height / 928),
          LoginButton(title: 'Login', isColor: true),
          SizedBox(height: 20 * height / 928),
          LoginButton(title: 'Sign Up', isColor: false),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/sign_up_screen/sign_up_screen.dart';

import '../../../common_widgets/primary_button.dart';
import '../../login_screen/login_screen.dart';

class ItemDecoration extends StatelessWidget {
  const ItemDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    return Container(
      padding: EdgeInsets.all(25),
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        child: Column(
          children: [
            SizedBox(height: 150 * height / 928),
            Container(
              width: 270 * width / 428,
              height: 80 * height / 928,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'Scorpion',
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
                fontSize: 45,
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
            PrimaryButton(
              title: 'Login',
              isColor: true,
              onPressed: () {
                Navigator.pushNamed(context, Login.routeName);
              },
            ),
            SizedBox(height: 20 * height / 928),
            PrimaryButton(
              title: 'Sign Up',
              isColor: false,
              onPressed: () {
                Navigator.pushNamed(context, SignUp.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

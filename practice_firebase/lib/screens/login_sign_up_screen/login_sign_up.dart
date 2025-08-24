import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/login_sign_up_screen/widgets/filed_widget.dart';

import '../../contants/app_colors.dart';


class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.hex53A6D8, AppColor.hexBCE6FF],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 150 * height / 928),
              Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10 * height / 928),
              FiledWidget(
                labelText: 'Email address',
                hintText: 'Enter your email',
              ),
              SizedBox(height: 10 * height / 928),
              FiledWidget(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

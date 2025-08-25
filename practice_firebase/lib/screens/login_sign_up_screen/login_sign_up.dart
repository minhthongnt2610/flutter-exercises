import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/login_sign_up_screen/widgets/filed_widget.dart';

import '../../common_widgets/login_button.dart';
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.hex1F4F70, AppColor.hex8FC9F0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 150 * height / 928),
              Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Scorpion to see you!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30 * height / 928),
              FiledWidget(
                labelText: 'Email address',
                hintText: 'Enter your email',
                isPassword: false,
                suffixIcon: Icon(Icons.email, color: Colors.white),
              ),
              SizedBox(height: 20 * height / 928),
              FiledWidget(
                labelText: 'Password',
                hintText: 'Enter your password',
                isPassword: true,
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20 * height / 928),
              LoginButton(title: 'Login', isColor: true),
              SizedBox(height: 40 * height / 928),
              Text(
                "--------------- Or Login with ---------------",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

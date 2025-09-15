import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/login_screen/widgets/filed_widget.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/social_button.dart';
import '../../contants/app_colors.dart';
import '../sign_up_screen/sign_up_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = '/login_sign_up';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
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
            child: SingleChildScrollView(
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
                    onChange: (String value) {},
                  ),
                  SizedBox(height: 20 * height / 928),
                  FiledWidget(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    isPassword: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    onChange: (String value) {

                    },
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
                  PrimaryButton(
                    title: 'Login',
                    isColor: true,
                    onPressed: () {},
                  ),
                  SizedBox(height: 40 * height / 928),
                  Text(
                    "-------------------- Or Login with --------------------",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 60 * height / 928),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialButton(onPressed: () {}, icon: null, isIcon: false),
                      SocialButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 30,
                        ),
                        isIcon: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 120 * height / 928),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUp.routeName);
                        },
                        child: Text(
                          "Sign up now.",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

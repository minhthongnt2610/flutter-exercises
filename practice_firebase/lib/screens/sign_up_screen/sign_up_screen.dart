import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/auth_email_service.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/social_button.dart';
import '../../contants/app_colors.dart';
import '../../data/data_sources/remote/firebase/auth_service.dart';
import '../../providers/sign_up_provider.dart';
import '../login_screen/login_screen.dart';
import '../login_screen/widgets/filed_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (_) => SignUpProvider(),
     child: SignUpBody(),
   );
  }
}
class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "To get started now!",
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
                    onChange: (String value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 20 * height / 928),
                  FiledWidget(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    isPassword: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    onChange: (String value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: 20 * height / 928),
                  FiledWidget(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm password',
                    isPassword: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    onChange: (String value) {
                      _confirmPassword = value;

                    },
                  ),
                  SizedBox(height: 50 * height / 928),
                  PrimaryButton(
                    title: 'Sign up',
                    isColor: true,
                    onPressed: () {
                      if(_password != _confirmPassword){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password not match'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      else{
                        _authEmailService.signUpWithEmailAndPassword(email: _email!, password: _password!);
                        debugPrint('Password match');
                        debugPrint(_email);
                        debugPrint(_password);
                      }
                    },
                  ),
                  SizedBox(height: 40 * height / 928),
                  Text(
                    "-------------------- Or Sign Up with --------------------",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 20 * height / 928),
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
                  SizedBox(height: 100 * height / 928),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Login.routeName);
                        },
                        child: Text(
                          "Login Now.",
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

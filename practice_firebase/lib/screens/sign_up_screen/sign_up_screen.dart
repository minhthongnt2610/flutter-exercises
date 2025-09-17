import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/info_dialog.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/social_button.dart';
import '../../contants/app_colors.dart';
import '../../providers/sign_up_provider.dart';
import '../login_screen/login_screen.dart';
import '../login_screen/widgets/filed_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String routeName = '/sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
    final signUpProvider = context.watch<SignUpProvider>();
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
                    onChange: (value) => signUpProvider.setEmail(value),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                    },
                  ),
                  SizedBox(height: 20 * height / 928),
                  FiledWidget(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    isPassword: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    onChange: (value) => signUpProvider.setPassword(value),
                    validator: (String? value) {},
                  ),
                  SizedBox(height: 20 * height / 928),
                  FiledWidget(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm password',
                    isPassword: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    onChange: (value) =>
                        signUpProvider.setConfirmPassword(value),
                    validator: (String? value) {},
                  ),
                  SizedBox(height: 50 * height / 928),
                  PrimaryButton(
                    title: 'Sign up',
                    isColor: true,
                    onPressed: () async {
                      final error = await signUpProvider.signUp();
                      if (error != null) {
                        _showErrorDialog(context: context, error: error);
                      } else {
                        debugPrint('Sign up success');
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

  void _showErrorDialog({
    required BuildContext context,
    required String error,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return InfoDialog(
          title: "Error",
          content: error,
          confirmButtonTitle: "OK",
          onConfirm: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

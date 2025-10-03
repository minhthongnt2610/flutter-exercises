import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/create_profile_screen/create_profile_screen.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/info_dialog.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/social_button.dart';
import '../../contains/app_colors.dart';
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
  SignUpBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  ///Khi user nhấn Sign up, hàm _formKey.currentState!.validate() sẽ gọi validator của tất cả FiledWidget

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    final signUpProvider = context.watch<SignUpProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 150 * height / 928),
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
                    SizedBox(height: 30 * height / 928),

                    // Email
                    FieldWidget(
                      labelText: 'Email address',
                      hintText: 'Enter your email',
                      isPassword: false,
                      suffixIcon: const Icon(Icons.email, color: Colors.white),
                      onChange: (value) => signUpProvider.setEmail(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    SizedBox(height: 20 * height / 928),

                    // Password
                    FieldWidget(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      isPassword: true,
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      onChange: (value) => signUpProvider.setPassword(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        final specialCharRegex = RegExp(
                          r'[!@#$%^&*/(),.?":{}|<>]',
                        );
                        if (!specialCharRegex.hasMatch(value)) {
                          return 'Password must contain a special character';
                        }
                        return null;
                      },
                      controller: passwordController,
                    ),
                    SizedBox(height: 20 * height / 928),

                    // Confirm password
                    FieldWidget(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm password',
                      isPassword: true,
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      onChange: (value) =>
                          signUpProvider.setConfirmPassword(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != signUpProvider.password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                    ),
                    SizedBox(height: 50 * height / 928),

                    // Sign up button
                    PrimaryButton(
                      title: 'Sign up',
                      isColor: true,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // tất cả field hợp lệ
                          final error = await signUpProvider.signUp();
                          Navigator.pushNamed(context, CreateProfileScreen.routeName);
                          if (error != null) {
                            _showErrorDialog(context: context, error: error);
                          } else {
                            debugPrint('Sign up success');
                          }
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
                        SocialButton(
                          onPressed: () {},
                          icon: null,
                          isIcon: false,
                        ),
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
                            Navigator.pushNamed(context, LoginScreen.routeName);
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
          onConfirm: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}

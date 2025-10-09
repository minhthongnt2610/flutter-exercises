import 'package:flutter/material.dart';
import 'package:practice_firebase/providers/login_provider.dart';
import 'package:practice_firebase/screens/home/home_screen.dart';
import 'package:practice_firebase/screens/login_screen/widgets/filed_widget.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/social_button.dart';
import '../../contains/app_colors.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    final LoginProvider loginProvider = Provider.of<LoginProvider>(context);
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
              child: Form(
                key: _formKey,
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
                    FieldWidget(
                      labelText: 'Email address',
                      hintText: 'Enter your email',
                      isPassword: false,
                      suffixIcon: Icon(Icons.email, color: Colors.white),
                      onChange: (value) => loginProvider.setEmail(value),
                      validator: (String? value) {
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
                    FieldWidget(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      isPassword: true,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      onChange: (value) => loginProvider.setPassword(value),
                      validator: (String? value) {
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await loginProvider.login();
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        }
                      },
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
      ),
    );
  }
}

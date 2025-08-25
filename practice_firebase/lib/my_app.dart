import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/login_sign_up_screen/login_sign_up.dart';
import 'package:practice_firebase/screens/start_screen/start_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice_Firebase',
      debugShowCheckedModeBanner: false,
      home: const LoginSignUp(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/%C4%91etail_screen/detail_screen.dart';
import 'package:practice_firebase/screens/home/home_screen.dart';
import 'package:practice_firebase/screens/login_sign_up_screen/login_sign_up.dart';
import 'package:practice_firebase/screens/sign_up_screen/sign_up.dart';
import 'package:practice_firebase/screens/start_screen/start_screen.dart';

import 'animations/screen_transitions/slide_transition_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice_Firebase',
      debugShowCheckedModeBanner: false,
      // home: DetailScreen(),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case StartScreen.routeName:
            return MaterialPageRoute(builder: (context) => const StartScreen());
          case LoginSignUp.routeName:
            return SlideTransitionPage(page: const LoginSignUp());
          case SignUp.routeName:
            return SlideTransitionPage(page: const SignUp());
          case HomeScreen.routeName:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case DetailScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const DetailScreen(),
            );
        }
        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/%C4%91etail_screen/detail_screen.dart';
import 'package:practice_firebase/screens/home/home_screen.dart';
import 'package:practice_firebase/screens/login_screen/login_screen.dart';
import 'package:practice_firebase/screens/sign_up_screen/sign_up_screen.dart';
import 'package:practice_firebase/screens/start_screen/start_screen.dart';

import 'animations/screen_transitions/slide_transition_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice_Firebase',
      debugShowCheckedModeBanner: false,
      home: Login(),
      // initialRoute: StartScreen.routeName,
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case StartScreen.routeName:
      //       return MaterialPageRoute(builder: (context) => const StartScreen());
      //     case Login.routeName:
      //       return SlideTransitionPage(page: const Login());
      //     case SignUp.routeName:
      //       return SlideTransitionPage(page: const SignUp());
      //     case HomeScreen.routeName:
      //       return MaterialPageRoute(builder: (context) => const HomeScreen());
      //     case DetailScreen.routeName:
      //       return MaterialPageRoute(
      //         builder: (context) => const DetailScreen(),
      //       );
      //   }
      //   return null;
      // },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/create_profile_screen/create_profile_screen.dart';
import 'package:practice_firebase/screens/detail_screen/models/new_friend_screen_argument.dart';
import 'package:provider/provider.dart';

import 'package:practice_firebase/providers/user_provider.dart';
import 'package:practice_firebase/screens/detail_screen/detail_screen.dart';
import 'package:practice_firebase/screens/avatar_selection_screen/avatar_selection_screen.dart';
import 'package:practice_firebase/screens/forgot_password/forgot_password_screen.dart';
import 'package:practice_firebase/screens/home/home_screen.dart';
import 'package:practice_firebase/screens/login_screen/login_screen.dart';
import 'package:practice_firebase/screens/profire/profile_screen.dart';
import 'package:practice_firebase/screens/sign_up_screen/sign_up_screen.dart';
import 'package:practice_firebase/screens/start_screen/start_screen.dart';

import 'animations/screen_transitions/slide_transition_page.dart';
import 'data/data_sources/remote/firebase/auths/auth_email_service.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _authEmailService = AuthEmailService();
  @override
  Widget build(BuildContext context) {
    final isUserLoggedIn = _authEmailService.isSignedIn();
    final isUpdateProfile = _authEmailService.isUpdateProfile();
    final initialRoute = isUserLoggedIn
        ? isUpdateProfile
              ? HomeScreen.routeName
              : CreateProfileScreen.routeName
        : StartScreen.routeName;
    return ChangeNotifierProvider(
      create: (_) => UserProvider(AuthEmailService()),
      child: MaterialApp(
        title: 'Practice_Firebase',
        debugShowCheckedModeBanner: false,
        initialRoute: ForgotPasswordScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case StartScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const StartScreen(),
              );
            case LoginScreen.routeName:
              return SlideTransitionPage(page: const LoginScreen());
            case SignUp.routeName:
              return SlideTransitionPage(page: const SignUp());
            case HomeScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
            case DetailScreen.routeName:
              final arguments = settings.arguments as NewFriendScreenArgument;
              return MaterialPageRoute(
                builder: (context) => DetailScreen(argument: arguments),
              );
            case ForgotPasswordScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen(),
              );
            case ProfileScreen.routeName:
              return MaterialPageRoute(builder: (context) => ProfileScreen());
            case AvatarSelectionScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => AvatarSelectionScreen(),
              );
            case CreateProfileScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => CreateProfileScreen(),
              );
            }
          return null;
        },
      ),
    );
  }
}

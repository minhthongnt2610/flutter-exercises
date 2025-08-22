import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/data/models/friend_model.dart';
import 'package:sqlite_flutter_project/screens/detail_screen/detail_screen.dart';
import 'package:sqlite_flutter_project/screens/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case DetailScreen.routeName:
            final friendModel = settings.arguments as FriendModel?;
            return MaterialPageRoute(
              builder: (context) => DetailScreen(friendModel: friendModel),
            );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

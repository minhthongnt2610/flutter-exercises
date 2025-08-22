import 'package:flutter/material.dart';
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
          // case CreateAndEditScreen.routeName:
          //   final friendModel = settings.arguments as FriendModel?;
          //   return MaterialPageRoute(
          //     builder: (context) => CreateAndEditScreen(friendModel: friendModel),
          //   );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

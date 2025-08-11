import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/create_and_edit_screen.dart';
import 'package:practice_api/screens/list_friend_screen/list_friend_screen.dart';
import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Practice',
      initialRoute: ListFriendScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ListFriendScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const ListFriendScreen(),
            );
          case CreateAndEditScreen.routeName:
            final friendModel = settings.arguments as FriendModel?;
            return MaterialPageRoute(
              builder: (context) => CreateAndEditScreen(friendModel: friendModel),
            );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/create_and_edit_screen.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/input_date_time_field.dart';
import 'package:practice_api/screens/demo_screen.dart';
import 'package:practice_api/screens/list_friend_screen/list_friend_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Practice',
      // initialRoute: ListFriendScreen.routeName,
      home: ListFriendScreen(),
      debugShowCheckedModeBanner: false,
      darkTheme:  ThemeData.dark(),
    );
  }
}


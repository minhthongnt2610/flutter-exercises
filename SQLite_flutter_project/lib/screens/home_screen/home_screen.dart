import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/screens/detail_screen/detail_screen.dart';
import 'package:sqlite_flutter_project/screens/home_screen/widgets/friend_element.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FriendElement(onTap: () {}),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(DetailScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

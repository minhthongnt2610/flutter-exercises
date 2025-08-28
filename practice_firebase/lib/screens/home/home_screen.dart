import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/home/widgets/friend_elements.dart';

import '../../contants/app_colors.dart';
import '../../models/friend_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Home your friends",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
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
          padding: const EdgeInsets.only(top: kToolbarHeight + 0),
          child: ListView(
            children: [
              FriendElement(
                friend: FriendModel(id: 1, name: 'name', birthdate: DateTime.now(), email: 'email'),
                onTap: () {},
              ),
              FriendElement(
                friend: FriendModel(id: 2, name: 'other', birthdate: DateTime.now(), email: 'other@email'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

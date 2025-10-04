import 'package:flutter/material.dart';
import 'package:practice_firebase/contains/app_Images.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UserProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Home your friends",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.white38,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(22.5)),
              child: Image.asset(AppImages.avatar, width: 45, height: 45),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
  String greet(String name){
    var hour = DateTime.now().hour;
    var greeting = '';
    if(hour < 12){
        greeting = 'Good morning ☀️';
    }
    if(hour < 18){
      greeting = 'Good afternoon 🌤️';
    }
    else{
      greeting = 'Good evening 🌃';
    }
      return '$greeting,\n$name 🖐️';
  }

}

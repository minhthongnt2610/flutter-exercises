import 'package:flutter/material.dart';
import 'package:practice_firebase/contains/app_Images.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/home/widgets/friend_elements.dart';
import 'package:provider/provider.dart';

import '../../contants/app_colors.dart';
import '../../models/friend_model.dart';
import '../../providers/user_provider.dart';
import '../profire/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UserProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Home your friends",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              final selectedAvatar = await Navigator.pushNamed(
                context,
                ProfileScreen.routeName,
              );

              if (selectedAvatar is File) {
                profileProvider.setAvatarFile(selectedAvatar);
              }
              if (selectedAvatar is String) {
                profileProvider.setAvatarUrl(selectedAvatar);
              }
            },
            icon: CircleAvatar(
              radius: 25,
              backgroundImage: profileProvider.avatarFile != null
                  ? FileImage(profileProvider.avatarFile!)
                  : (profileProvider.avatarUrl != null
                            ? NetworkImage(profileProvider.avatarUrl!)
                            : const AssetImage("assets/icon/icon.png"))
                        as ImageProvider,
            ),
          ),
        ],
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
          padding: const EdgeInsets.only(top: kToolbarHeight + 65),
          child: ListView(
            children: [
              FriendElement(
                friend: FriendModel(
                  id: 1,
                  name: 'name',
                  birthdate: DateTime.now(),
                  email: 'email',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/detail_screen');
                },
              ),
              FriendElement(
                friend: FriendModel(
                  id: 2,
                  name: 'other',
                  birthdate: DateTime.now(),
                  email: 'other@email',
                ),
                onTap: () {},
              ),
              // 👉 Bạn có thể thêm nhiều FriendElement khác ở đây
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: thêm logic add friend
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
   HomeScreenBody({super.key});


  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UserProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Home your friends",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final selectedAvatar = await Navigator.pushNamed(context, ProfileScreen.routeName);
              if (selectedAvatar is File) {
                profileProvider.setAvatarFile(selectedAvatar);
              }
              if (selectedAvatar is String) {
                profileProvider.setAvatarUrl(selectedAvatar);
              }
            },
            icon: Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profileProvider.avatarFile != null
                    ? FileImage(profileProvider.avatarFile!)
                as ImageProvider
                    : (profileProvider.avatarUrl != null
                    ? NetworkImage(profileProvider.avatarUrl!)
                as ImageProvider
                    : AssetImage("assets/icon/icon.png")),
              ),
            ),
          ),
        ],
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
          padding: const EdgeInsets.only(top: kToolbarHeight + 65),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail_screen');
            },
            child: ListView(
              children: [
                FriendElement(
                  friend: FriendModel(
                    id: 1,
                    name: 'name',
                    birthdate: DateTime.now(),
                    email: 'email',
                  ),
                  onTap: () {},
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
                FriendElement(
                  friend: FriendModel(
                    id: 2,
                    name: 'other',
                    birthdate: DateTime.now(),
                    email: 'other@email',
                  ),
                  onTap: () {},
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
                FriendElement(
                  friend: FriendModel(
                    id: 2,
                    name: 'other',
                    birthdate: DateTime.now(),
                    email: 'other@email',
                  ),
                  onTap: () {},
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
                FriendElement(
                  friend: FriendModel(
                    id: 2,
                    name: 'other',
                    birthdate: DateTime.now(),
                    email: 'other@email',
                  ),
                  onTap: () {},
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
                FriendElement(
                  friend: FriendModel(
                    id: 2,
                    name: 'other',
                    birthdate: DateTime.now(),
                    email: 'other@email',
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
}}

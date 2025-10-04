import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';
import '../../profire/profile_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UserProvider>();

    return AppBar(
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          greet(profileProvider.nameUser ?? 'Anonymous'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 100,
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
    );
  }

  String greet(String name) {
    var hour = DateTime.now().hour;
    var greeting = '';
    if (hour < 12) {
      greeting = 'Good morning ☀️';
    }
    if (hour < 18) {
      greeting = 'Good afternoon 🌤️';
    } else {
      greeting = 'Good evening 🌃';
    }
    return '$greeting,\n$name 🖐️';
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

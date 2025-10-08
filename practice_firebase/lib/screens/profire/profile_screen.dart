import 'dart:io';
import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/auths/auth_email_service.dart';
import 'package:practice_firebase/screens/start_screen/start_screen.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/primary_button.dart';
import '../../contains/app_colors.dart';
import '../../providers/user_provider.dart';
import '../avatar_selection_screen/avatar_selection_screen.dart';

///không cần ChangeNotifierProvider
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UserProvider>();
    final _auth = AuthEmailService();
    int height = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Profile",
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                GestureDetector(
                  onTap: () async {
                    final selectedAvatar = await Navigator.pushNamed(
                      context,
                      AvatarSelectionScreen.routeName,
                    );

                    if (selectedAvatar is File) {
                      profileProvider.setAvatarFile(selectedAvatar);
                    }
                    if (selectedAvatar is String) {
                      profileProvider.setAvatarUrl(selectedAvatar);
                    }
                    Navigator.pop(context, selectedAvatar);
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                    profileProvider.avatarFile != null
                        ? FileImage(profileProvider.avatarFile!)
                        : (profileProvider.avatarUrl != null
                                  ? NetworkImage(profileProvider.avatarUrl!)
                                  : const AssetImage("assets/icon/icon.png"))
                              as ImageProvider,
                  ),
                ),

                SizedBox(height: 20 * height / 928),

                // Name
                Text(
                  profileProvider.nameUser ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Email
                Text(
                  profileProvider.emailUser ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),

                SizedBox(height: 40 * height / 928),

                // Sign Out Button
                PrimaryButton(
                  title: 'Sign Out',
                  isColor: true,
                  onPressed: () async {
                    final login = await _showLoginDialog(context);
                    if (login == true) {
                      await _auth.signOut();
                    }
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        StartScreen.routeName,
                        (route) => false,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showLoginDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login'),
          content: const Text('Are you sure you want to log out this account?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Log out'),
            ),
          ],
        );
      },
    );
  }
}

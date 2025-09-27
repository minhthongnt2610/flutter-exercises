import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practice_firebase/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/primary_button.dart';
import '../../contants/app_colors.dart';
import '../avatar_selection_screen/avatar_selection_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: ProfileScreenBody(),
    );
  }
}

class ProfileScreenBody extends StatelessWidget {
   ProfileScreenBody({super.key});

  String _name = "Nguyễn Minh Thông"; // Example name
  String _email = "example@email.com"; // Example email
  String? _avatarUrl;
  File? _avatarFile;
  void _signOut() {
    // TODO: Add your sign-out logic here
  }

  @override
  Widget build(BuildContext context) {
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
                    if (selectedAvatar != null) {
                      setState(() {
                        if (selectedAvatar is String) {
                          _avatarUrl = selectedAvatar;
                          _avatarFile = null;
                        }
                        if (selectedAvatar is File) {
                          _avatarFile = selectedAvatar;
                          _avatarUrl = null;
                        }
                      });
                    }

                    /// trả về màn hình Home_screen
                    Navigator.pop(context, _avatarUrl ?? _avatarFile);
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _avatarFile != null
                        ? FileImage(_avatarFile!) as ImageProvider
                        : (_avatarUrl != null
                        ? NetworkImage(_avatarUrl!) as ImageProvider
                        : AssetImage("assets/icon/icon.png")),
                  ), // Replace with your asset
                ),

                SizedBox(height: 20 * height / 928),

                // Name
                Text(
                  _name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Email
                Text(
                  _email,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),

                SizedBox(height: 40 * height / 928),

                // Sign Out Button
                PrimaryButton(
                  title: 'Sign Out',
                  isColor: true,
                  onPressed: _signOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

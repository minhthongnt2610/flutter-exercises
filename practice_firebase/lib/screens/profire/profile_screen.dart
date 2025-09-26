import 'package:flutter/material.dart';

import '../../common_widgets/primary_button.dart';
import '../../contants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Nguyễn Minh Thông"; // Example name
  String email = "example@email.com"; // Example email

  void _signOut() {
    // TODO: Add your sign-out logic here
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Signed out successfully")));
  }

  @override
  Widget build(BuildContext context) {
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
                   onTap: () {
                     // TODO: Add your avatar tap logic here
                   },
                   child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      "assets/icon/icon.png",
                    ), // Replace with your asset
                                   ),
                 ),
                const SizedBox(height: 20),

                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Email
                Text(
                  email,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),

                const SizedBox(height: 40),

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
}

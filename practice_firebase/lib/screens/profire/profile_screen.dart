import 'package:flutter/material.dart';

import '../../common_widgets/primary_button.dart';
import '../../contants/app_colors.dart';
import '../avatar_selection_screen/avatar_selection_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = "Nguyễn Minh Thông"; // Example name
  String _email = "example@email.com"; // Example email
  late String _avatarUrl;

  void _signOut() {
    // TODO: Add your sign-out logic here
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Signed out successfully")));
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
                    final selectedAvatar = await Navigator.pushNamed(context,
                    AvatarSelectionScreen.routeName);
                    if(selectedAvatar != null){
                      setState(() {
                        _avatarUrl = selectedAvatar.toString();
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      "assets/icon/icon.png",
                    ), // Replace with your asset
                  ),
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
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practice_firebase/common_widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../../contains/app_colors.dart';
import '../../providers/user_provider.dart';
import '../avatar_selection_screen/avatar_selection_screen.dart';
import '../login_screen/widgets/filed_widget.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});
  static const routeName = '/create-profile';

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    final profileProvider = context.watch<UserProvider>();

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.hex1F4F70, AppColor.hex8FC9F0],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Profile",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 40),

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
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,

                          backgroundImage: profileProvider.avatarFile != null
                              ? FileImage(profileProvider.avatarFile!)
                              : (profileProvider.avatarUrl != null
                                        ? NetworkImage(
                                            profileProvider.avatarUrl!,
                                          )
                                        : const AssetImage(
                                            "assets/icon/icon.png",
                                          ))
                                    as ImageProvider,
                        ),
                      ),
                      const SizedBox(height: 30),

                      FieldWidget(
                        labelText: 'Enter your name',
                        hintText: '',

                        suffixIcon: null,
                        onChange: (String value) {},
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        }, controller: TextEditingController(),
                      ),

                      SizedBox(height: 20 * height / 928),

                      PrimaryButton(
                        title: 'Create Profile',
                        isColor: true,
                        onPressed: () async {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

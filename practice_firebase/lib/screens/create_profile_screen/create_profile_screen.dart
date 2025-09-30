import 'package:flutter/material.dart';
import 'package:practice_firebase/common_widgets/input_field.dart';
import 'package:practice_firebase/common_widgets/primary_button.dart';

import '../../contains/app_colors.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _createProfile() {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      // TODO: Xử lý logic tạo profile (lưu vào DB hoặc Firebase)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Profile created for $name')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Vui lòng nhập tên')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create Profile",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Avatar Placeholder
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 60, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 30),

                  // TextField nhập tên

                 InputField(
                      hintText: "Enter your name",
                      onChanged: (value) {},
                      maxLines: 1,
                      initialValue: null,
                    ),

                  const SizedBox(height: 20),

                  // Button khởi tạo
                  PrimaryButton(
                    title: 'Create Profile',
                    isColor: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/local/image_picker_service.dart';
import '../../contains/app_colors.dart';

class AvatarSelectionScreen extends StatelessWidget {
  static const String routeName = '/avatar_selection';

  final List<String> avatars = [
    "https://i.pravatar.cc/150?img=1",
    "https://i.pravatar.cc/150?img=2",
    "https://i.pravatar.cc/150?img=3",
    "https://i.pravatar.cc/150?img=4",
    "https://i.pravatar.cc/150?img=5",
    "https://i.pravatar.cc/150?img=6",
    "https://i.pravatar.cc/150?img=7",
    "https://i.pravatar.cc/150?img=8",
    "https://i.pravatar.cc/150?img=9",
    "https://i.pravatar.cc/150?img=10",
    "https://i.pravatar.cc/150?img=11",
    "https://i.pravatar.cc/150?img=12",
  ];

  AvatarSelectionScreen({super.key});

  final ImagePickerService _picker = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Choose Avatar",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 avatars per row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: avatars.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Return the selected avatar to previous screen
                  Navigator.pop(context, avatars[index]);
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(avatars[index]),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _picker.showImageSourceActionSheet(context),
        backgroundColor: Colors.white,
        child: const Icon(Icons.photo_library, color: Colors.blue),
      ),
    );
  }
}

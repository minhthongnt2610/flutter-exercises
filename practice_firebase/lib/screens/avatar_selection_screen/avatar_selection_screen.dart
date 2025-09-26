import 'package:flutter/material.dart';

class AvatarSelectionScreen extends StatelessWidget {
  final List<String> avatars = [
    "https://i.pravatar.cc/150?img=1",
    "https://i.pravatar.cc/150?img=2",
    "https://i.pravatar.cc/150?img=3",
    "https://i.pravatar.cc/150?img=4",
    "https://i.pravatar.cc/150?img=5",
    "https://i.pravatar.cc/150?img=6",
    "https://i.pravatar.cc/150?img=7",
    "https://i.pravatar.cc/150?img=8",
  ];

  AvatarSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Avatar"),
        centerTitle: true,
      ),
      body: Padding(
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
    );
  }
}

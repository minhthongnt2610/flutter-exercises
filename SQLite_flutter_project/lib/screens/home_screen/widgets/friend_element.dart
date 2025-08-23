import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/data/models/friend_model.dart';
import 'package:sqlite_flutter_project/screens/home_screen/widgets/infor_friend_widget.dart';

class FriendElement extends StatelessWidget {
  const FriendElement({super.key, required this.onTap, required this.friend});

  final FriendModel friend;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 850 * width / 868,
          height: 100 * height / 868,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InfoFriendWidgets(title: 'Full name'),
                    SizedBox(
                      width: 15,
                      child: Text(' :', style: TextStyle(color: Colors.white)),
                    ),
                    InfoFriendWidgets(title: friend.name),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoFriendWidgets(title: 'Phone'),
                    SizedBox(
                      width: 15,
                      child: Text(' :', style: TextStyle(color: Colors.white)),
                    ),
                    InfoFriendWidgets(title: friend.phone),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoFriendWidgets(title: 'Email'),
                    SizedBox(
                      width: 15,
                      child: Text(' :', style: TextStyle(color: Colors.white)),
                    ),
                    InfoFriendWidgets(title: friend.email),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../models/friend_model.dart';
import '../../đetail_screen/detail_screen.dart';
import 'info_friend_widgets.dart';

class FriendElement extends StatelessWidget {
  const FriendElement({super.key, required this.friend, required this.onTap});
  final FriendModel friend;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName);
        },
        child: Container(
          width: size.width * 0.95,
          height: size.height * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white54,
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
                      child: Text(' :', style: TextStyle(color: Colors.black)),
                    ),
                    InfoFriendWidgets(title: friend.name),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoFriendWidgets(title: 'Birthday'),
                    SizedBox(
                      width: 15,
                      child: Text(' :', style: TextStyle(color: Colors.black)),
                    ),
                    InfoFriendWidgets(title: friend.displayDate),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoFriendWidgets(title: 'Email'),
                    SizedBox(
                      width: 15,
                      child: Text(' :', style: TextStyle(color: Colors.black)),
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

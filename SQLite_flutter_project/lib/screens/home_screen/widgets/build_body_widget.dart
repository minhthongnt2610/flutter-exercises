import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_project/data/data_sources/local/db/db_controller.dart';
import 'package:sqlite_flutter_project/data/models/db/db_friend_model.dart';
import 'package:sqlite_flutter_project/screens/detail_screen/detail_screen.dart';
import 'package:sqlite_flutter_project/screens/home_screen/widgets/friend_element.dart';

class BuildBodyWidget extends StatelessWidget {
  const BuildBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DbController>(context, listen: true);
    if (controller.friendList.isEmpty) {
      return Center(
        child: Text('No friends found', style: TextStyle(color: Colors.white)),
      );
    } else {
      return ListView.builder(
        itemCount: controller.friendList.length,
        itemBuilder: (context, index) {
          final friend = controller.friendList[index].toFriendModel();
          return FriendElement(
            friend: friend,
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                DetailScreen.routeName,
                arguments: friend,
              );
              if (result == true) {
                await controller.fetchFriend();
              }
            },
          );
        },
      );
    }
  }
}

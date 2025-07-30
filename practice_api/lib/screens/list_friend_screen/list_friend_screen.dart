import 'package:flutter/material.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_element.dart';

class ListFriendScreen extends StatelessWidget {
  const ListFriendScreen({super.key});
  static const routeName = '/list-friend';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Friend'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const FriendElement(),
      ),
    );
  }
}

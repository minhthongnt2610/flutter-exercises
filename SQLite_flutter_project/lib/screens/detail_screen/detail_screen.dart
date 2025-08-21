import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/data/models/friend_model.dart';
import 'package:sqlite_flutter_project/screens/detail_screen/widgets/build_detail_body_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, this.friendModel});

  // static const routeName = "/detail";
  final FriendModel? friendModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: const Text(
          'Create and Edit',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF212121),
      ),
      body: BuildDetailBodyWidget(friendModel: friendModel),
    );
  }
}

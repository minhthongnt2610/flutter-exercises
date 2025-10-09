import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/detail_screen/models/new_friend_screen_argument.dart';
import 'package:practice_firebase/screens/detail_screen/widgets/build_detail_body_widgets.dart';

import '../../contains/app_colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.argument});
  static const String routeName = '/detail_screen';
  final NewFriendScreenArgument argument;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColor.hex1F4F70, AppColor.hex8FC9F0],
                ),
              ),
            ),
            BuildDetailBodyWidget(argument: argument),
          ],
        ),
      ),
    );
  }
}

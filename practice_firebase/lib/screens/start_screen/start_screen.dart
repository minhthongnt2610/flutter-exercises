import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/start_screen/widgets/item_decoration.dart';

import '../../contains/app_colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  static const String routeName = '/start_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          ItemDecoration(),
        ],
      ),
    );
  }
}

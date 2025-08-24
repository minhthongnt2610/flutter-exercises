import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/start_screen/widgets/item_decoration.dart';

import '../../contants/app_colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
                colors: [AppColor.hex53A6D8, AppColor.hexBCE6FF],
              ),
            ),
          ),
          ItemDecoration(),
        ],
      ),
    );
  }
}

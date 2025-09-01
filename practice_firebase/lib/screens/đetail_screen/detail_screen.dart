import 'package:flutter/material.dart';
import 'package:practice_firebase/screens/%C4%91etail_screen/widgets/build_detail_body_widgets.dart';

import '../../contants/app_colors.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

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
          BuildDetailBodyWidget(),
        ],
      ),
    );
  }
}

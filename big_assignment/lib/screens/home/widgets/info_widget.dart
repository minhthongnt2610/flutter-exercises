import 'package:flutter/material.dart';

import '../../../../../data/models/tiktok_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.tiktokModel,
  });
  final TiktokModel tiktokModel;
  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Container(
        alignment: Alignment.bottomLeft,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tiktokModel.name,
                style: TextStyle(
                  fontSize: 17 * height / 868,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'proxima nova',
                  color: Colors.white,
                ),
              ),
              Text(
                tiktokModel.description,
                style: TextStyle(
                  fontSize: 15 * height / 868,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'proxima nova',
                  color: Colors.white,
                ),
              ),
              Text(
                tiktokModel.nameMusic,
                style: TextStyle(
                  fontSize: 15 * height / 868,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'proxima nova',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
